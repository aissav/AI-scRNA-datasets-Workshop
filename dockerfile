FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y python3
RUN apt install -y build-essential
RUN apt-get -y install libcurl4-openssl-dev libssl-dev libxml2-dev libgmp-dev libglpk-dev
RUN apt-get install -y libcairo2-dev

ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH
RUN conda install mamba -n base -c conda-forge -y


RUN mamba install -c conda-forge r==4.0.0 -y

RUN conda init bash

RUN apt-get install git -y
RUN git clone https://github.com/aissav/AI-scRNA-datasets-Workshop.git
WORKDIR AI-scRNA-datasets-Workshop
RUN bash envs/create_conda_environments.sh -r 4.0

RUN conda install -n scib-pipeline-R4.0 notebook
RUN conda run -n scib-R4.0 Rscript -e "devtools::install_github('theislab/kBET',force=TRUE)"
RUN conda run -n scib-pipeline-R4.0 pip install umap-learn[plot]
RUN conda run -n scib-pipeline-R4.0 pip install louvain
RUN conda run -n scib-pipeline-R4.0 pip install holoviews

RUN conda install -n scib-R4.0 notebook
RUN conda install -c conda-forge nb_conda -y


WORKDIR /opt/conda/envs/scib-pipeline-R4.0/lib
RUN mv R older_R
RUN mkdir R
WORKDIR /opt/conda/envs/scib-R4.0/lib
RUN cp -R R/* /opt/conda/envs/scib-pipeline-R4.0/lib/R
WORKDIR /AI-scRNA-datasets-Workshop

ENTRYPOINT ["jupyter", "notebook","--ip=*","--allow-root"]
