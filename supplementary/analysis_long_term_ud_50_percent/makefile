.PHONY: clean

build:
	podman build --no-cache -t memory-issa-long-term-memory-analysis-50-hr . 
run:
	podman run --name analysis-long-term-memory-50-hr memory-issa-long-term-memory-analysis-50-hr 
clean:
	podman container rm analysis-long-term-memory-50-hr
extract:
	podman cp analysis-long-term-memory-50-hr:/memory-issa/source/memory_issa/graphics_yr_2025_long_term_50_hr.zip .


