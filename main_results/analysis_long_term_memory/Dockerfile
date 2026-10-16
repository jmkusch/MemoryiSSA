FROM memory-issa-base:latest

WORKDIR /memory-issa/source/memory_issa
COPY _targets.R .
COPY prepare_model.R ./R/prepare_model.R
COPY run_analysis.sh .
RUN chmod +x run_analysis.sh

CMD ["/bin/bash", "run_analysis.sh"]
