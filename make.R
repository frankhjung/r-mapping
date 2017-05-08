#!/usr/bin/env R

# Render R markdown (Rmd) to PDF.
# Usage:
#   R -q -f make.R --args readme.Rmd
#   R -q --slave --vanilla --file=make.R --args readme.Rmd

# load packages
require(rmarkdown)

# require a parameter naming file to render
if (length(args) == 0) {
    stop("Error: missing file operand", call. = TRUE)
} else {
    # read report to render from command line
    for (rmd in commandArgs(trailingOnly = TRUE)) {
        # render Rmd to PDF
        if ( grepl("\\.Rmd$", rmd) && file.exists(rmd)) {
            render(rmd, pdf_document())
        } else {
            print(paste("Ignoring: ", rmd))
        }
    }
}
