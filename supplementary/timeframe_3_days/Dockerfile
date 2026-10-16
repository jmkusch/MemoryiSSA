FROM issa-base:latest
COPY memory_issa.zip /memory-issa/setup

## cd into memory-issa/source dir before unziping 
WORKDIR /memory-issa/setup
RUN unzip /memory-issa/setup/memory_issa.zip && mv /memory-issa/setup/memory_issa /memory-issa/source

## cd into our newly unzipped directory
WORKDIR /memory-issa/source/memory_issa 
COPY run_analysis.sh .
RUN chmod +x run_analysis.sh

CMD ["/bin/bash", "run_analysis.sh"]
