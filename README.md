# AI-scRNA-datasets-Workshop
Workshop on the analysis and integration of scRNA-seq datasets

Workshop environment can be created using two options: Conda environment and Docker image.
* Both options appropriate for mac and windows machines. However, in case of issue in any option, it can be tried with the other option.
* Conda env image is more preferable for macos and linux. Docker image can be better suited for windows to avoid pre-installed package conflicts.
## Prerequisites
* Anaconda must be installed to create Conda environment. [`install Anaconda`](https://docs.anaconda.com/anaconda/install/)
* Docker must be installed to create Docker image. [`install Docker`](https://docs.docker.com/get-docker/)
* Also, this repository must be downloaded.
  
## Create the Conda environment
  
*Go to folder where repository downloaded on the command line or conda prompt and run the following commands line by line.*

```
conda  env create -f workshop_dependencies.yml
conda activate workshop
Rscript -e "devtools::install_github('immunogenomics/lisi')"
Rscript -e "devtools::install_github('theislab/kBET')"
```
  
## Run the Conda environment
  
*Conda environment created as workshop so, we can start using environment by activating.*
```
conda  activate workshop
jupyter notebook
```
## Build the Docker image
  
Building the docker image may take an hour due to installation of the all packages.

You can simply build docker image by running following command on command line.


> Go to folder where repository downloaded on the command line.
```
docker build -t ai-scrna-workshop .
```
## Run the Docker image

> Docker image will run jupyter notebook on port 8888. To change the port with such as 1000, use 1000:8888 insted of 8888:8888.
```
docker run -p 8888:8888 ai-scrna-workshop
```
> To run the jupyter notebook on your local files, run the following command.
```
docker run -p 8888:8888 -v path/to/your/local/files:/AI-scRNA-datasets-Workshop ai-scrna-workshop
```
> Example
```
docker run -p 8888:8888 -v C:\Users\home:/AI-scRNA-datasets-Workshop ai-scrna-workshop
```
