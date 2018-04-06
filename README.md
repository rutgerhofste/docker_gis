# gisDocker

separate repo to build a docker image that has the conda 3 and jupyter environments installed and the basic GIS packages some basic volume / port stuff

# how to run a jupyter notebook with this image?

run this container: `docker run --name gisdocker -it -p 8888:8888 rutgerhofste/gisdocker:stable bash`  


while in active development, this image will not launch a Jupyter notebook server by itself. You have to manually trigger this behaviour by launching a container from this image and run the jupyter command there. Instructions can be found [here](https://github.com/rutgerhofste/Aqueduct30Docker)  

See the section: Cloud Based solution.  

# When to use this image?

As you can see the image is quite large. This is the result of having a full conda root environment as well as several other pyhton GIS environments. This solution is therefore suitable for a cloud deployment. You can run this locally but your GIS analysis will benefit from suffient disk storage, plenty of CPU and RAM.  

This is work in progress. In the next couple of weeks I will start working with the different python environments and install additional packages allong the way.  

# when not to use this image?  
This is work in progress. I did not hardcode any version numbers yet so things might break when packages get updated. Also, this is a heavyweight solution. You can probably get far more efficient images online. 

Wishlist:
* parallel processing 
* sub processing 
* pickle 

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






trigger