# gisDocker

separate repo to build a docker image that has the conda 3 and jupyter environments installed and the basic GIS packages some basic volume / port stuff

# When to use this image

As you can see the image is quite large. This is the result of having a full conda root environment as well as several other pyhton GIS environments. This solution is therefore suitable for a cloud deployment. You can run this locally but your GIS analysis will benefit from suffient disk storage, plenty of CPU and RAM.  

This is work in progress. In the next coupl of weeks I will start working with the different python environments and install additional packages allong the way.  

Wishlist:
* parallel processing 
* sub processing 
* pickle 

Current overview of environments 
| Name in Jupyter  | Name in conda        | Python version | Eeath Engine | GDAL | GeoPandas | ArcGIS API |
| ------------- |:-------------:| -----:|---:|---:|---:|---:|
| Python 27    | python27 | python 2.7.13 | 1 |1| 0|0|
| Python 35   | pyhton35      |  3.5 |0|1|1|0|
| Python 36 | python36      |   3.6 |0|0|0|0|
| Python 36arc | python36arc |  3.6 |0 |0 |0| 1|
| Python 3 | root   | 3.6 |0 |0 |0| 0|






trigger