# Purpose
This container is to run all the base components necessary to perform 
analysis afterwards 

# Building
Build this image after issa-base image has been compiled.

To do this, open a terminal and enter
`podman build -t init-memory-issa-base . `
or 
`make build`


# Running
After building is complete, run the memory issa image by typing

`podman run --name init-memory-issa-base --pids-limit 100000 --network none init-memory-issa-base`
or 
`make run`

To build in interactive mode run
`podman run --name inter-memory-issa-base -it init-memory-issa-base /bin/bash`
or
`make interative`

# Commit image
After the container has stopped running, create a new image using the results of this container run.

To make the new image type
`podman commit init-memory-issa-base memory-issa-base`
or 
`make commit`

Now the container in the main results can be compiled and ran. 
