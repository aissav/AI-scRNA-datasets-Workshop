FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update

ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

COPY . /AI-scRNA-datasets-Workshop

WORKDIR AI-scRNA-datasets-Workshop

RUN conda env create -f workshop_dependencies.yml
RUN conda run -n workshop conda env update -f workshop_dependencies2.yml
RUN conda run -n workshop Rscript -e "devtools::install_github('theislab/kBET',force=TRUE)"
RUN conda run -n workshop Rscript -e "devtools::install_github('immunogenomics/lisi')"

RUN conda install -c conda-forge nb_conda -y
WORKDIR /AI-scRNA-datasets-Workshop

ENTRYPOINT ["jupyter", "notebook","--ip=*","--allow-root"]
