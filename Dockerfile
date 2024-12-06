FROM rocker/r-ubuntu:22.04

RUN apt-get update -y && apt-get install -y python3 python3-pip default-jre

RUN R -q -e 'install.packages(c("e1071", "ggplot2"))'

RUN pip3 install jupyter

ENV PATH=${PATH}:/monopogen/src:/monopogen/apps

ADD . /monopogen

RUN pip3 install -r /monopogen/requirements.txt

WORKDIR /monopogen

RUN pip install -e .

WORKDIR /

