FROM ubuntu:24.04
RUN mkdir -p memory-issa
RUN mkdir -p memory-issa/setup
RUN mkdir -p memory-issa/source


RUN apt-get update && apt-get install -y tree \
    unzip \
    ## base R and command line text editors and tools 
    r-base \
    r-base-dev \
    cmake \
    neovim \
    tmux \
    curl \
    ## libraries required for installing R packages needed 
    ## for running memory issa simulation and analysis
    libuv1-dev \
    libudunits2-dev  \
    libssl-dev \
    libabsl-dev \
    gdal-bin \
    libgdal-dev \
    python3-gdal \
    libgmp-dev \
    libmpfr-dev \
    libgsl-dev \
    libgdal-dev \
    libcurl4-openssl-dev  \
    libssl-dev  \
    libfontconfig1-dev  \
    libxml2-dev  \
    libharfbuzz-dev  \
    libfribidi-dev  \
    libfreetype6-dev  \
    libpng-dev  \
    libtiff5-dev  \
    libjpeg-dev \
    # remove apt cache
    && rm -rf /var/lib/cache/apt/archive/* \
    && rm -rf /var/lib/apt/lists/*  

COPY packages.R /memory-issa/setup/packages.R
RUN Rscript /memory-issa/setup/packages.R


