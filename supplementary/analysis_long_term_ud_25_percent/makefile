.PHONY: clean
build:
	podman build --no-cache -t memory-issa-long-term-memory-analysis-25-hr . 
run:
	podman run --name analysis-long-term-memory-25-hr -it memory-issa-long-term-memory-analysis-25-hr /bin/bash
	# podman run --name analysis-long-term-memory-25-hr memory-issa-long-term-memory-analysis-25-hr 
clean:
	podman container rm analysis-long-term-memory-25-hr
extract:
	podman cp analysis-long-term-memory-25-hr:/memory-issa/source/memory_issa/graphics_yr_2025_long_term_25_hr_.zip .

