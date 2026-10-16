.PHONY: clean
build:
	podman build --no-cache -t memory-issa-long-term-memory-analysis . 
run:
	podman run --name analysis-long-term-memory memory-issa-long-term-memory-analysis 
interactive:
	podman run --name analysis-long-term-memory -it memory-issa-long-term-memory-analysis /bin/bash
clean:
	podman container rm analysis-long-term-memory
extract:
	podman cp analysis-long-term-memory:/memory-issa/source/memory_issa/graphics_long_term.zip .
export_container:
	podman container export -o long-term.tar analysis-long-term-memory
