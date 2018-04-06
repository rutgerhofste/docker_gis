FROM rutgerhofste/default_conda_envs:local01
MAINTAINER Rutger Hofste <rutgerhofste@gmail.com>

# Make Conda Forge Highest Priority
RUN conda config --add channels conda-forge
RUN conda config --append channels esri

# GDAL 1.1.x system intall

# GDAL 2.2.x for python
RUN conda install --name python27 gdal -y
RUN conda install --name python35 gdal -y

COPY requirementsPython.txt .
COPY requirementsPython27.txt .
COPY requirementsPython35.txt .
# COPY requirementsPython36.txt .
# COPY requirementsPython36arc.txt .

RUN conda install --file requirementsPython.txt
RUN conda install --name python27 --file requirementsPython27.txt
RUN conda install --name python35 --file requirementsPython35.txt
# RUN conda install --name python36 --file requirementsPython36.txt
# RUN conda install --name python36arc --file requirementsPython36arc.txt

# Cloud Stuff
# RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-165.0.0-linux-x86_64.tar.gz -P /opt/
# RUN tar xvf /opt/google-cloud-sdk-165.0.0-linux-x86_64.tar.gz --directory /opt/
# executables at: /opt/google-cloud-sdk/bin
# ENV PATH /opt/google-cloud-sdk/bin:$PATH
# If this doesn't work, use: PATH=$PATH:/opt/google-cloud-sdk/bin in terminal

# RUN [ "/bin/bash", "-c", "source activate python27 && pip install earthengine-api" ]

# make command line tool accessible to root python (note that the path for cli will be part of root env)
# RUN pip install google-api-python-client
# RUN pip install earthengine-api

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

# Tests
COPY tests/test_python27.py /
RUN [ "/opt/anaconda3/envs/python27/bin/python", "./test_python27.py" ]

COPY tests/test_python35.py /
RUN [ "/opt/anaconda3/envs/python35/bin/python", "./test_python35.py" ]