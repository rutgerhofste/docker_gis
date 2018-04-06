FROM rutgerhofste/default_conda_envs:local01
MAINTAINER Rutger Hofste <rutgerhofste@gmail.com>

# Make Conda Forge Highest Priority
RUN conda config --add channels conda-forge

# GDAL
RUN apt-get install python-gdal -y
# and the command line toold e.g. gdal_rasterize
RUN apt-get install gdal-bin

RUN conda install --name python27 gdal -y
RUN conda install --name python35 gdal -y

# install regular packages (main conda channel)
# ADD requirementsPython27.txt .
# ADD requirementsPython35.txt .
# ADD requirementsPython36.txt .
# ADD requirementsPython36arc.txt .

# RUN conda install --name python27 --file requirementsPython27.txt
# RUN conda install --name python35 --file requirementsPython35.txt
# RUN conda install --name python36 --file requirementsPython36.txt
# RUN conda install --name python36arc --file requirementsPython36arc.txt


# use source so the cli will be available when you activate the python27 environment
# RUN [ "/bin/bash", "-c", "source activate python27 && pip install google-api-python-client" ] 
# RUN [ "/bin/bash", "-c", "source activate python27 && pip install earthengine-api" ]

# make command line tool accessible to root python (note that the path for cli will be part of root env)
# RUN pip install google-api-python-client
# RUN pip install earthengine-api


# install packages from conda forge channel 
# RUN conda install --name python27 -c conda-forge retrying -y
# RUN conda install --name python27 -c conda-forge geoalchemy2 -y

# RUN conda install --name python35 -c conda-forge geopandas -y
# RUN conda install --name python35 -c conda-forge rasterio -y
# RUN conda install --name python35 -c conda-forge geoalchemy2 

# install packages from other channels
# RUN conda install --name python36arc -c esri arcgis -y
# RUN conda install -c esri arcgis -y
# RUN jupyter nbextension enable arcgis --py --sys-prefix

# RUN conda install --name python27 -c scitools shapely -y



# Reinstall core jupyter and conda extension. better be safe than sorry 
# RUN conda install jupyter -y
# RUN conda install nb_conda -y
# RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension






# RUN conda clean -yt

# added later, Google cloud SDK
# RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-165.0.0-linux-x86_64.tar.gz -P /opt/
# RUN tar xvf /opt/google-cloud-sdk-165.0.0-linux-x86_64.tar.gz --directory /opt/
# executables at: /opt/google-cloud-sdk/bin
# ENV PATH /opt/google-cloud-sdk/bin:$PATH
# If this doesn't work, use: PATH=$PATH:/opt/google-cloud-sdk/bin in terminal

# RUN conda install --name python35 -c ioos folium -y
# RUN conda install --name python27 -c conda-forge ipyleaflet 

# added later, added jupyterlab
# RUN conda install -c conda-forge jupyterlab -y


