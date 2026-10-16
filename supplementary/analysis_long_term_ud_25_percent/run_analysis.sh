Rscript -e "targets::tar_make()" && \
zip -r graphics_long_term_25_hr.zip graphics/ -x ".DS_*" "._DS_*"
