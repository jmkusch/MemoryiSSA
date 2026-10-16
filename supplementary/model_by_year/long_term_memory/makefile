.PHONY: clean

build:
	podman build --no-cache -t memory-issa-long-term-memory-by-year-analysis . 
run:
	podman run --name analysis-long-term-memory-by-year memory-issa-long-term-memory-by-year-analysis 
clean:
	podman container rm analysis-long-term-memory-by-year
extract:
	podman cp analysis-long-term-memory-by-year:/memory-issa/source/memory_issa/graphics_long_term_by_year.zip .
export_container:
	podman container export -o long-term-by-year.tar analysis-long-term-memory-by-year

