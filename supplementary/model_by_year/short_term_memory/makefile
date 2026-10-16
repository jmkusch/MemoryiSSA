.PHONY: clean

build:
	podman build --no-cache -t memory-issa-short-term-memory-by-year-analysis . 
run:
	podman run --name analysis-short-term-memory-by-year memory-issa-short-term-memory-by-year-analysis 
clean:
	podman container rm analysis-short-term-memory-by-year
extract:
	podman cp analysis-short-term-memory-by-year:/memory-issa/source/memory_issa/graphics_short_term_by_year.zip  . 
