.PHONY: clean

build:
	podman build --no-cache -t memory-issa-short-term-memory-analysis . 
run:
	podman run --name analysis-short-term-memory memory-issa-short-term-memory-analysis 
interactive:
	podman run --name analysis-short-term-memory -it memory-issa-short-term-memory-analysis /bin/bash
clean:
	podman container rm analysis-short-term-memory
extract:
	podman cp analysis-short-term-memory:/memory-issa/source/memory_issa/graphics_short_term.zip  . 
export_contatiner:
	podman container export -o short-term analysis-short-term-memory
