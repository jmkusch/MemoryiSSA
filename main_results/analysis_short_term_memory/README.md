
# Purpose
This container runs analysis for short term memory

# Building
Build this image after issa-base image has been compiled.

To do this we will run in the terminal
`podman build --no-cache -t memory-issa-short-term-memory-analysis . `
or 
`make build`


# Running
After building is complete, run the analysis image by typing

`podman run --name analysis-short-term-memory memory-issa-short-term-memory-analysis `
or 
`make run`

To build in interactive mode run
`podman run --name analysis-short-term-memory -it memory-issa-short-term-memory-analysis /bin/bash`
or
`make interative`

# Extract Graphics
After the container has stopped running, extract the results by entering 

`podman cp analysis-short-term-memory:/memory-issa/source/memory_issa/graphics_short_term.zip .`
or 
`make extract`


