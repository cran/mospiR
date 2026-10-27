## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment  = "#>",
  eval     = nchar(Sys.getenv("MOSPI_KEY")) > 0
)
api_key <- Sys.getenv("MOSPI_KEY")
options(cli.progress_show_after = Inf)

## ----install, eval=FALSE------------------------------------------------------
# # CRAN
# install.packages("mospiR")
# 
# # Development version
# remotes::install_github("saketkc/mospiR")

## ----key-env------------------------------------------------------------------
# library(mospiR)
# api_key <- Sys.getenv("MOSPI_KEY")

## ----list-all-----------------------------------------------------------------
# datasets <- list_datasets(api_key)
# cat("Total datasets:", nrow(datasets), "\n")
# head(datasets[, c("idno", "title")], 6)

## ----search-------------------------------------------------------------------
# plfs <- list_datasets(api_key, query = "labour force")
# plfs[, c("idno", "title")]

## ----list-files---------------------------------------------------------------
# files <- list_files("DDI-IND-NSO-ASI-2019-20", api_key)
# files[, c("name", "size")]

## ----download-file, eval=FALSE------------------------------------------------
# path <- download_file(
#   dataset_id  = "DDI-IND-NSO-ASI-2019-20",
#   file_name   = "ASI_DATA_2019_20_CSV.zip",
#   folder_path = "data/asi-2019-20",
#   api_key     = api_key
# )

## ----download-dataset, eval=FALSE---------------------------------------------
# paths <- download_dataset(
#   dataset_id  = "DDI-IND-NSO-ASI-2019-20",
#   folder_path = "data/asi-2019-20",
#   api_key     = api_key
# )
# length(paths)

## ----download-missing---------------------------------------------------------
# result <- download_file(
#   "DDI-IND-NSO-ASI-2019-20", "nonexistent.csv",
#   tempdir(), api_key,
#   .files_cache = files
# )

## ----hces-find----------------------------------------------------------------
# hces_all <- list_datasets(api_key, query = "consumer expenditure")
# cat("Matching datasets:", nrow(hces_all), "\n")
# hces_all[, c("idno", "title")]

## ----hces-download, eval=FALSE------------------------------------------------
# for (id in hces_all$idno) {
#   download_dataset(id, file.path("data", "hces", id), api_key)
# }

