.PHONY: clean
build:
	podman build -t init-memory-issa-base . 
run:
	podman run --name init-memory-issa-base --pids-limit 100000 --network none init-memory-issa-base
interative:
	podman run --name inter-memory-issa-base -it init-memory-issa-base /bin/bash
clean:
	podman container rm init-memory-issa-base
commit:
	podman commit init-memory-issa-base memory-issa-base

