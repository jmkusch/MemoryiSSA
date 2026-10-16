Rscript -e "targets::tar_make()" && \
zip -r graphics.zip graphics/ -x ".DS_*" "._DS_*"
