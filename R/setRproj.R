
#setRproj("/Users/xzhan50/Documents/data_wk/joan/zhang/test")

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
#' @examples
#' \dontrun{
#' setProj("/Users/newfolder")
#' }

setRproj <- function(fd_name)
{
  # step 1 : creat the director if it doesn't exist
  if(!dir.exists(fd_name)){
    dir.create(fd_name,recursive = TRUE)
  }

  # step 2: create .Rproj file from devtools package, and make a copy with the subfolder name
  path <- file.path(fd_name, paste0(gsub(".*/","",fd_name), ".Rproj"))
  template_path <- system.file("templates/template.Rproj",
                               package = "devtools")
  file.copy(template_path, path)

  # step 3: setup folder structure
  file.create(paste(fd_name,"readme.txt",sep="/"))

  dir.create(paste(fd_name,"data",sep = "/"))
  file.create(paste(paste(fd_name,"data",sep = "/"),"readme.txt",sep="/"))

  dir.create(paste(fd_name,"data/raw",sep = "/"))
  file.create(paste(paste(fd_name,"data/raw",sep = "/"),"readme.txt",sep="/"))

  dir.create(paste(fd_name,"output",sep = "/"))
  file.create(paste(paste(fd_name,"output",sep = "/"),"readme.txt",sep="/"))

  dir.create(paste(fd_name,"docs",sep = "/"))
  file.create(paste(paste(fd_name,"docs",sep = "/"),"readme.txt",sep="/"))

  # step 4: setup initial rmd files
  fd_from <- paste(path.package("ezsetup"),"rmarkdown/templates/report/skeleton",sep="/")
  list_of_files <- list.files(fd_from, ".Rmd")
  file.copy(file.path(fd_from,list_of_files), fd_name)
}


