FROM rutgerhofste/condajupyterdocker:latest
MAINTAINER Rutger Hofste <rutgerhofste@gmail.com>

RUN apt-get update && \
	apt-get -y install \
	dialog \
	apt-utils \
	libffi-dev \
	libssl-dev  

# Root environment /Users/rutgerhofste/GitHub/gisDocker/Dockerfile

RUN conda install -c conda-forge awscli

# Create python virtualenv in Conda
RUN conda create -n python27 python=2.7 jupyter -y



# Conda Channel 
ADD requirementsPython27.txt .
RUN conda install --name python27 --file requirementsPython27.txt


COPY test_python27.py /
RUN [ "/opt/anaconda3/envs/python27/bin/python", "./test_python27.py" ]
