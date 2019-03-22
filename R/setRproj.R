#' Title
#' funtion to set up a R project
#' @param fd_name
#' working folder/project name of the project
#' @return
#' .Rproj and folder structure of the project
#' @export
#'
#' @import
#' devtools
#' purrr
#' @examples
#' \dontrun{
#' setProj("/Users/newfolder")
#' }

setRproj <- function(fd_name)
{
  # step 1: create the main folder, sub-folders, and readme.txt under each folder
  fd_list <- list( "f0" = fd_name,
                   "f1" = paste(fd_name,"data",sep = "/"),
                   "f2" = paste(fd_name,"data/raw",sep = "/"),
                   "f3" = paste(fd_name,"data/proc",sep = "/"),
                   "f4" = paste(fd_name,"output",sep = "/"),
                   "f5" = paste(fd_name,"output/plots",sep = "/"),
                   "f6" = paste(fd_name,"output/tables",sep = "/"),
                   "f7" = paste(fd_name,"docs",sep = "/"))

  purrr::map(fd_list,dir.create)
  purrr::map(paste(fd_list,"readme.txt",sep = "/"),file.create)

  # step 2: create .Rproj file from devtools package, and make a copy with the subfolder name
  path <- file.path(fd_name, paste0(gsub(".*/","",fd_name), ".Rproj"))
  template_path <- system.file("templates/template.Rproj",
                               package = "devtools")
  file.copy(template_path, path)

  # step 3: setup initial rmd files
  fd_from <- paste(path.package("ezsetup"),"rmarkdown/templates/report/skeleton",sep="/")
  list_of_files <- list.files(fd_from, ".Rmd")
  file.copy(file.path(fd_from,list_of_files), fd_name)
}


