Rscript -e "targets::tar_make()" && \
zip -r graphics_long_term.zip graphics/ -x ".DS_*" "._DS_*"
