FROM ubuntu:latest
MAINTAINER Labhesh Ramchandani "labheshr@gmail.com"
RUN apt-get update -y && apt-get install -y curl && apt-get install -y bzip2

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
RUN bash Miniconda-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda


RUN conda install -y \
    flask

# Setup application
COPY hellodocker.py /
ENTRYPOINT ["/miniconda/bin/python", "/hellodocker.py"]
EXPOSE 5000