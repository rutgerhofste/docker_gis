FROM rutgerhofste/docker_python_envs:latest
MAINTAINER Rutger Hofste <rutgerhofste@gmail.com>


# ##########################  Python ##########################################
# Make Conda Forge Highest Priority
RUN conda config --add channels conda-forge
RUN conda config --append channels esri

COPY requirementsPython.txt .
COPY requirementsPython27.txt .
COPY requirementsPython35.txt .
COPY requirementsPython36.txt .
COPY requirementsPython36arc.txt .

RUN conda install --file requirementsPython.txt
RUN conda install --name python27 --file requirementsPython27.txt
RUN conda install --name python35 --file requirementsPython35.txt
RUN conda install --name python36 --file requirementsPython36.txt
RUN conda install --name python36arc --file requirementsPython36arc.txt

# Make command line tool accessible to root python (note that the path for cli will be part of root env)
RUN pip install earthengine-api
RUN [ "/bin/bash", "-c", "source activate python27 && pip install earthengine-api" ]
RUN [ "/bin/bash", "-c", "source activate python35 && pip install earthengine-api" ]


# ##########################  Command Line ####################################
# Google-cloud-sdk (https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu)
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk -y


# RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-165.0.0-linux-x86_64.tar.gz -P /opt/
# RUN tar xvf /opt/google-cloud-sdk-165.0.0-linux-x86_64.tar.gz --directory /opt/
# ENV PATH /opt/google-cloud-sdk/bin:$PATH
# Executables at: /opt/google-cloud-sdk/bin
# If this doesn't work, use: PATH=$PATH:/opt/google-cloud-sdk/bin in terminal

# Reinstall core jupyter and conda extension. better be safe than sorry 
# RUN conda install jupyter -y
# RUN conda install nb_conda -y
RUN jupyter nbextension enable arcgis --py --sys-prefix

# ##########################  GDAL ############################################
# !!! WARNING There is an incompatibility of netCDF4 and GDAL. Do not install netCDF4 after GDAL!!!
# GDAL 1.1.x system intall

# GDAL 2.2.4 for python
RUN conda install --name python27 gdal -y
RUN conda install --name python35 gdal -y


# ##########################  Tests ###########################################
COPY tests/test_python27.py /
RUN [ "/opt/anaconda3/envs/python27/bin/python", "-u", "./test_python27.py" ]

COPY tests/test_python35.py /
RUN [ "/opt/anaconda3/envs/python35/bin/python", "-u", "./test_python35.py" ]


# Todo

# Since there is a conflict of netcdf4 and gdal, is it necessary to install netCDF4 separately ?
# Posted question here: https://github.com/Unidata/netcdf4-python/issues/790#issuecomment-379318057
