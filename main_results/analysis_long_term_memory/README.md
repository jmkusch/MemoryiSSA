
# Purpose
This container runs analysis for long term memory

# Building
Build this image after issa-base image has been compiled.

To do this we will run in the terminal
`podman build --no-cache -t memory-issa-long-term-memory-analysis . `
or 
`make build`


# Running
After building is complete, run the analysis image by typing

`podman run --name analysis-long-term-memory memory-issa-long-term-memory-analysis `
or 
`make run`

To build in interactive mode run
`podman run --name analysis-long-term-memory -it memory-issa-long-term-memory-analysis /bin/bash`
or
`make interative`

# Extract Graphics
After the container has stopped running, extract the results by entering 

`podman cp analysis-long-term-memory:/memory-issa/source/memory_issa/graphics_long_term.zip .`
or 
`make extract`


