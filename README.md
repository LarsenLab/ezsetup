# ezsetup
development of ezsetup package

1. development : **run a check before commit**
<br> whenever a change has made to the source code, please run a "check" before committing.
<br> A package has to be error and warning free, it's ok if there are notes remaining after checking.
<br> To run a check : click Build tab on the Enviroment HIstory panel > click Check . 

2. installation : **need to turn the repo to public**
<br> library(devtools)
<br> **install_github("LarsenLab/ezsetup")**

3. update : ** reinstall the single one instead of update all **
<br> update.packages() is the standard way to update ALL of packages. 
<br> The simpliest way to update this package is reinstall it.

4. test run : 
<br> **library(ezsetup)**
<br> **setRproj("~/Documents/SC_project", "singlecell")**


