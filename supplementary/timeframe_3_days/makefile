.PHONY: clean

build:
	podman build --no-cache -t memory-issa-3-day-memory-analysis . 
run:
	podman run --name analysis-3-day-memory memory-issa-3-day-memory-analysis 
clean:
	podman container rm analysis-3-day-memory
extract:
	podman cp analysis-3-day-memory:/memory-issa/source/memory_issa/graphics_short_term_3_days.zip  . 
