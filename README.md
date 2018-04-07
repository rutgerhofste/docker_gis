# Docker GIS

test change on Macbook

heavy weight docker image for python and command line based geospatial analysis. The docker image is tailored to cloud usage on Amazon EC2 instances, Google Compute engines etc.  

The docker image is stacked to minimize build time and dependencies. The full stack contains:

1. [docker_gis](https://github.com/rutgerhofste/docker_gis)
1. [docker_python_envs](https://github.com/rutgerhofste/docker_python_envs)
1. [docker_conda_jupyter](https://github.com/rutgerhofste/docker_conda_jupyter)

All images are hosted on [docker hub](https://hub.docker.com/u/rutgerhofste/)

# Getting Started

1. Get docker up and running on your cloud instance.  
2. `docker run --name docker_gis -it -p 8888:8888 rutgerhofste/docker_gis:stable bash`  
3. Launch the Jupyter Notebook Server. Instructions can be found [here](https://github.com/rutgerhofste/Aqueduct30Docker)  

See the section: Cloud Based solution.  

# When to use this image?

As you can see the image is quite large. This is the result of having a full conda root environment as well as several other pyhton GIS environments. This solution is therefore suitable for a cloud deployment. You can run this locally but your GIS analysis will benefit from suffient disk storage, plenty of CPU and RAM.  

This is work in progress. In the next couple of weeks I will start working with the different python environments and install additional packages allong the way.  

# When not to use this image?  
This is work in progress. I did not hardcode any version numbers yet so things might break when packages get updated. Also, this is a heavyweight solution. You can probably get far more efficient images online. 

# Wishlist:
* parallel processing 
* sub processing 
* pickle 

# Building From Source
`docker build rutgerhofste/gisdocker:localxx .`  
`docker tag rutgerhofste/gisdocker:localxx rutgerhofste/gisdocker:stable`  
`docker push rutgerhofste/gisdocker:localxx`  

TODO:  
* create stable tag and develop tag
* add more packages

Current overview of environments

| Name in Jupyter  | Name in conda   | Python version | Eeath Engine | GDAL | GeoPandas | ArcGIS API |
| ------------- |:-------------:| -----:|---:|---:|---:|---:|
| Python 27    | python27 | python 2.7.13 | 1 |1| 0|0|
| Python 35   | pyhton35      |  3.5 |0|1|1|0|
| Python 36 | python36      |   3.6 |0|0|0|0|
| Python 36arc | python36arc |  3.6 |0 |0 |0| 1|
| Python 3 | root   | 3.6 |0 |0 |0| 0|
