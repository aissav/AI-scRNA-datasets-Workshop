# AI-scRNA-datasets-Workshop
Workshop on the analysis and integration of scRNA-seq datasets

## Build the Docker image

You can simply build docker image by running following command on command line.




All the enviroment will be installed including scripts and data on the docker image. 


> Go to folder where repository downloaded on command line


```
docker build -t AI-scrna .
```



## Run the Docker image

>Docker image will run jupyter notebook on port 8888. To change the port with such as 1000, use 1000:8888 insted of 8888:8888.


```
docker run -p 8888:8888 AI-scrna 
```


> To run the jupyter notebook on your local files, run the following command.


```
docker run -p 8888:8888 -v path/to/your/local/files:/AI-scRNA-datasets-Workshop AI-scrna 
```


>Ex:


```
docker run -p 8888:8888 -v C:\Users\home:/AI-scRNA-datasets-Workshop AI-scrna 

```
