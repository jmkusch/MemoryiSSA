FROM memory-issa-base:latest

WORKDIR /memory-issa/source/memory_issa 
COPY _targets.R .

COPY ./R/calc_rss_by_year.R ./R/calc_rss_by_year.R
COPY ./R/indiv_estimates_by_year.R ./R/indiv_estimates_by_year.R
COPY ./R/memory_model_long_term_by_year.R ./R/memory_model_long_term_by_year.R
COPY ./R/model_check_by_year.R ./R/model_check_by_year.R
COPY ./R/plot_boxplot_horiz_by_year.R ./R/plot_boxplot_horiz_by_year.R
COPY ./R/plot_rss_by_year.R ./R/plot_rss_by_year.R
COPY ./R/population_mean_estimates_by_year.R ./R/population_mean_estimates_by_year.R
COPY ./R/predict_h1_forest_long_term_by_year.R ./R/predict_h1_forest_long_term_by_year.R
COPY ./R/predict_h1_fusion_long_term_by_year.R ./R/predict_h1_fusion_long_term_by_year.R
COPY ./R/predict_h1_memory_long_term_by_year.R ./R/predict_h1_memory_long_term_by_year.R
COPY ./R/predict_h1_nitrogen_long_term_by_year.R ./R/predict_h1_nitrogen_long_term_by_year.R
COPY ./R/predict_h2_long_term_by_year.R ./R/predict_h2_long_term_by_year.R
COPY ./R/prepare_model_by_year.R ./R/prepare_model_by_year.R
COPY ./R/save_rss_plot_by_year.R ./R/save_rss_plot_by_year.R
COPY ./R/sum_plot_by_years.R ./R/sum_plot_by_years.R

COPY run_analysis.sh .
RUN chmod +x run_analysis.sh

CMD ["/bin/bash", "run_analysis.sh"]

