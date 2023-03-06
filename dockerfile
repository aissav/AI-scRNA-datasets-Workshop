FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt install -y build-essential

ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

RUN conda install -c conda-forge r==4.0.0 -y


RUN apt-get install git -y
RUN git clone https://github.com/aissav/AI-scRNA-datasets-Workshop.git

WORKDIR AI-scRNA-datasets-Workshop
RUN conda  env create -f workshop_dependencies.yml
RUN conda run -n workshop Rscript -e "devtools::install_github('theislab/kBET',force=TRUE)"
RUN conda run -n workshop Rscript -e "devtools::install_github('immunogenomics/lisi')"


RUN conda install -c conda-forge nb_conda -y
WORKDIR /AI-scRNA-datasets-Workshop

ENTRYPOINT ["jupyter", "notebook","--ip=*","--allow-root"]
