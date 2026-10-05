# Build the public resume. Every input and output is intended for public sharing.
required <- c("rmarkdown", "pagedown", "glue", "dplyr", "tidyr", "purrr")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) stop("Install missing packages: ", paste(missing, collapse = ", "))
rmarkdown::render("ati_resume.Rmd", output_file = "ati_resume.html",
  output_options = list(css = c('resume', 'css/application_fonts.css', 'css/styles_html.css', 'css/custom_resume.css'), self_contained = TRUE),
  params = list(doctype = "HTML"))
file.copy("ati_resume.html", "index.html", overwrite = TRUE)
rmarkdown::render("ati_resume.Rmd", output_file = "ati_resume_print.html",
  output_options = list(css = c('resume', 'css/application_fonts.css', 'css/styles_pdf.css', 'css/custom_resume.css'), self_contained = TRUE),
  params = list(doctype = "PDF"))
pagedown::chrome_print("ati_resume_print.html", output = "ati_resume.pdf", timeout = 120)
