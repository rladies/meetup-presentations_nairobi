## 01-rmd-simple

- R Markdown overview
- Outline
- Chunk labels

## 02-visual-editor

- Add citation to tidyverse - DOI: 10.21105/joss.01686
- Add a table for month -> season

## 03-chunk-opts

- Add global chunk option

{r include = FALSE}
knitr::opts_chunk$set(
  fig.retina = 3,
  out.width = "70%",
  fig.width = 6,
  fig.asp = 0.618
)

- Turn off all code

{r include = FALSE}
knitr::opts_chunk$set(
  fig.retina = 3,
  out.width = "70%",
  fig.width = 6,
  fig.asp = 0.618,
  echo = FALSE
)

## 04-outputs

- output: html_document
    toc: true
    toc_float: true
- output: tufte::tufte_html
  - fig.margin = TRUE

## 05-theme

- Use thematic

yaml: 

  html_document:
    theme:
      bg: "#4f6f8e"
      fg: "#ffffe0"
      primary: "#573314"

chunk:

```{r setup, include = FALSE}
thematic::thematic_rmd()
```

## 06-xaringan

---
title: "Rainfall in Amboseli, Kenya"
author: "Mine Çetinkaya-Rundel"
date: '`r Sys.Date()`'
output:
  xaringan::moon_reader:
    css: xaringan-themer.css
    nature:
      slideNumberFormat: "%current%"
      highlightStyle: solarized-light
      highlightLines: true
      ratio: 16:9
      countIncrementalSlides: true
---

```{r setup, include=FALSE}
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(
  fig.width = 8, fig.asp = 0.618, fig.retina = 3, dpi = 300,
  out.width = "90%",
  cache = FALSE,
  echo = TRUE,
  message = FALSE, 
  warning = FALSE,
  hiline = TRUE
)
```

```{r include=FALSE, warning=FALSE}
# color palette
library(ramboseli)
library(tidyverse)
amboseli_palette <- data.frame(matrix(amboseli_palettes$div_earthsky[[5]], nrow = 1))
names(amboseli_palette) <- c("darkblue", "lightblue", "cream", "lightbrown", "darkbrown")
```

```{r xaringan-themer, include=FALSE, warning=FALSE}
library(xaringanthemer)
style_duo_accent(
  primary_color = amboseli_palette$darkblue,
  secondary_color = amboseli_palette$lightblue,
  inverse_header_color = amboseli_palette$cream,
  black_color = amboseli_palette$darkbrown,
  header_font_google = google_font("Atkinson Hyperlegible"),
  text_font_google   = google_font("Atkinson Hyperlegible", "300", "300i"),
  code_font_google   = google_font("Source Code Pro"),
  title_slide_background_color = "#FFFFFF",
  title_slide_background_image = "images/amboseli-bg.jpeg",
  title_slide_background_size = "cover",
  title_slide_text_color = "#FFFFFF",
  base_font_size = "24px"
  )
```

xaringanExtra::use_panelset()
library(countdown)

.panelset[
```{r panelset = c(output = "Plot", source = "Code"), fig.show = "hold"}
...
```
]