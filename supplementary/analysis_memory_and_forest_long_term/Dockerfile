FROM memory-issa-base:latest


WORKDIR /memory-issa/source/memory_issa

COPY _targets.R .
COPY prepare_model.R ./R/prepare_model.R
COPY save_rss_plot.R ./R/save_rss_plot.R
COPY predict_h1_memory_long_term.R ./R/predict_h1_memory_long_term.R
COPY predict_h1_forest_long_term.R ./R/predict_h1_forest_long_term.R
COPY predict_h2_long_term.R ./R/predict_h2_long_term.R
COPY save_rss_plot.R ./R/save_rss_plot.R
COPY long_term_memory_model.R ./R/long_term_memory_model.R
COPY run_analysis.sh .
RUN chmod +x run_analysis.sh

CMD ["/bin/bash", "run_analysis.sh"]
