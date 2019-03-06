# ezsetup
development of ezsetup package

1. development : * run a check before commit *
whenever a change has made to the source code, please run a "check" before committing.
A package has to be error and warning free, it's ok if there are notes remaining after checking.
To run a check : click Build tab on the Enviroment HIstory panel > click Check . 

2. installation : * need to turn the repo to public *
library(devtools)
install_github("e-noverre/ezsetup")

3. update : * reinstall the single one instead of update all *
update.packages() is the standard way to update ALL of packages. 
The simpliest way to update this package is reinstall it.

4. test run : 
library(ezsetup)
setRproj("/Documents/NameYourFolder")
