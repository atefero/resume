# Ati Rostami — Resume

Public resume of a Research Data Scientist with a PhD in applied mathematics from Queensland University of Technology. Experience includes mathematical modelling, Bayesian inference, machine learning, data analysis and university teaching.

[View resume](index.html) · [Download PDF](ati_resume.pdf) · [LinkedIn](https://www.linkedin.com/in/ati-rostami/) · [GitHub](https://github.com/atefero)

## Public contact

Please connect with me through LinkedIn. This repository intentionally omits my phone number, email address and citizenship information. It contains a general resume and no job-specific cover letters or recruiter details.

## Files

- `ati_resume.Rmd`: resume content, summary and public contact links.
- `data/position_data.csv`: experience and education.
- `data/skill_data.csv`: skills.
- `helper_functions.R`: functions that format entries and skills.
- `css/`: fonts and layout styles.
- `ati_resume.pdf`: public PDF.
- `ati_resume.html`: public HTML.
- `index.html`: the same HTML for GitHub Pages.
- `ati_resume_print.html`: HTML used for PDF printing.
- `update_resume.R`: rebuild script.

## Editing and rebuilding

Open `ati_resume.Rproj` in RStudio. Install packages once:

```r
install.packages(c("rmarkdown", "pagedown", "glue", "dplyr", "tidyr", "purrr"))
```

Then rebuild:

```r
source("update_resume.R")
```

Chrome or Chromium is required to generate the PDF. Review rebuilt output before sharing. The supplied PDF has been browser-rendered and visually checked. The R scripts have not been executed in the preparation environment.

## Uploading to GitHub

1. Create a new repository, such as `resume`, on your GitHub account.
2. Extract the ZIP and upload the contents of `ati-public-resume` to the repository root, including `index.html`, `README.md`, the PDF, and the `data` and `css` folders. Upload the files, not the ZIP itself.
3. If using the website, choose **Add file → Upload files**, drag in the extracted contents, and commit.
4. To display the resume as a webpage, use **Settings → Pages → Deploy from a branch**, select `main` and `/ (root)`, and save. With a repository named `resume`, the expected address is `https://atefero.github.io/resume/` after GitHub finishes publishing.

If uploading to an existing repository that previously contained your phone number or email, deleting them from the latest files does not remove them from earlier commits. This package is intended for a fresh repository.

## Acknowledgements

The resume template was adapted from [Catherine Kim's pagedown resume](https://github.com/seaCatKim/resume). Thank you, Catherine, for the template and inspiration. Her README credits Mathew Leary's resume project and [Nick Strayer's CV article](http://nickstrayer.me/cv/).

Built with [R](https://www.r-project.org/), [R Markdown](https://rmarkdown.rstudio.com/), [pagedown](https://pagedown.rbind.io/) and [Paged.js](https://pagedjs.org/).

## Reuse of the template

No reuse licence was found in Catherine's supplied project, and GitHub did not identify one in her repository when checked on 5 October 2026. If permission to publish an adapted copy has not already been granted, confirm it with Catherine before publishing the adapted source. Attribution is included, but no new licence has been applied to her template. Third-party packages and embedded resources retain their respective licences.
