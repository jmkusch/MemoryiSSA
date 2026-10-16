.PHONY: clean

build:
	podman build --no-cache -t memory-issa-long-term-forest-and-memory-analysis . 
run:
	podman run --name analysis-long-term-forest-and-memory memory-issa-long-term-forest-and-memory-analysis 
clean:
	podman container rm analysis-long-term-forest-and-memory
extract:
	podman cp analysis-long-term-forest-and-memory:/memory-issa/source/memory_issa/graphics.zip .
export_container:
	podman cp analysis-long-term-forest-and-memory:/memory-issa/source/results.zip .
