# Adapted from Catherine Kim's pagedown resume helper functions.
library(dplyr)
library(tidyr)
library(purrr)
library(glue)

# Original grouped HTML skills styling, recoloured to neutral grey.
build_skill_bars <- function(skill_data, section_title) {
  groups <- skill_data %>%
    filter(section == section_title, !is.na(skill), nzchar(skill)) %>%
    group_by(group, group_order) %>%
    summarise(skills = paste(skill, collapse = " · "), .groups = "drop") %>%
    arrange(group_order)
  if (!nrow(groups)) return(invisible(NULL))
  groups %>%
    mutate(html = glue::glue(
      '<div style="margin-bottom:5px;">',
      '<div style="font-size:0.6rem;font-weight:600;text-transform:uppercase;',
      'letter-spacing:0.06em;color:#555555;margin-bottom:1px;">{group}</div>',
      '<div style="font-size:0.68rem;color:#333333;line-height:1.4;">{skills}</div>',
      '</div>'
    )) %>%
    pull(html) %>% paste(collapse = "\n") %>% cat()
  invisible(NULL)
}

# Emit the same heading/institution/location/date/bullet structure as the template.
print_section <- function(position_data, section_id) {
  entries <- position_data %>%
    filter(section == section_id, include == TRUE) %>%
    mutate(.sort_end = ifelse(end == "Present", Inf, suppressWarnings(as.numeric(end)))) %>%
    arrange(desc(.sort_end))
  if (!nrow(entries)) return(invisible(NULL))
  description_cols <- grep('^description_', names(entries), value = TRUE)
  for (i in seq_len(nrow(entries))) {
    row <- entries[i, ]
    timeline <- if (is.na(row$start) || !nzchar(as.character(row$start)) || row$start == row$end) {
      as.character(row$end)
    } else {
      glue::glue('{row$end} - {row$start}')
    }
    descriptions <- unlist(row[description_cols], use.names = FALSE)
    descriptions <- descriptions[!is.na(descriptions) & nzchar(trimws(descriptions))]
    cat(glue::glue('### {row$title}\n\n{row$institution}\n\n{row$loc}\n\n{timeline}'), '\n\n', sep = '')
    if (length(descriptions)) cat(paste('-', descriptions, collapse = '\n'), '\n\n', sep = '')
    cat('\n')
  }
  invisible(NULL)
}
