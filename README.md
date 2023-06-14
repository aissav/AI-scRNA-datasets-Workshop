Workshop on the analysis and integration of scRNA-seq datasets
-----------

You can find the precomputed results for all the methods that we will cover during the workshop in [`Google Drive`](https://drive.google.com/drive/folders/1TFwVlZegi5HTeQhOhh8JzgJI9Rf7ugId)

Workshop environment can be created using two options: Conda environment or Docker image.
* Both options appropriate for macOS, Linux, and Windows machines. However, if there is an issue in one of the options, the other option can be tried.
* The Conda environment option may be more preferable for macOS and Linux, while the Docker image option may be better suited for Windows to avoid potential conflicts with pre-installed packages.
## Prerequisites
* To create a Conda environment, Anaconda must be installed. [`install Anaconda`](https://docs.anaconda.com/anaconda/install/)
* To create a Docker image, Docker must be installed. [`install Docker`](https://docs.docker.com/get-docker/)
* Additionally, you must download this repository.
  
## Option 1: Create the Conda environment
  
*Navigate to the folder where the repository was downloaded using the command line or Conda prompt and run the following commands.*

```
cd envs
conda  env create -f workshop_dependencies.yml
conda activate workshop
conda env update -f workshop_dependencies2.yml
Rscript -e "devtools::install_github('immunogenomics/lisi')"
Rscript -e "devtools::install_github('theislab/kBET')"
```
  
## Run the Conda environment
  
*A Conda environment has been created with the name "workshop", so you can start using the environment.*
```
cd ../
conda  activate workshop
jupyter notebook
```
## Option 2: Build the Docker image
  
Building the Docker image may take up to an hour due to the installation of all required packages.

To build the Docker image, simply run the following command on the command line.


> Navigate to the folder where the repository was downloaded using the command line.
```
cd envs
docker build -t ai-scrna-workshop .
```
## Run the Docker image
> By default, the Docker image runs Jupyter Notebook on port 8888. If you want to use a different port, such as 1000, you can specify it by changing 8888:8888 to 1000:8888.
```
docker run -p 8888:8888 ai-scrna-workshop
```

> To run Jupyter Notebook with your local files, run the following command.
```
docker run -p 8888:8888 -v path/to/your/local/files:/AI-scRNA-datasets-Workshop ai-scrna-workshop
```
> Example
```
docker run -p 8888:8888 -v C:\Users\home:/AI-scRNA-datasets-Workshop ai-scrna-workshop
```

## Funding
H.K, C.E, A.H, O.D and B.O.E are supported by the 1001 project (121E491) funded by the Scientific and Technological Research Council of Turkey [121491 to H.K. and C.E.].
