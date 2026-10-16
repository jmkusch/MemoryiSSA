# MemoryiSSA

Based on the iSSA guild targets workflow: https://issa-guild.github.io/book/index.html

Code and data for submission to Proceedings of the Royal Society B: Biological Sciences. The integrated step selection analyses are all contained within the targets() workflow, based on the _targets.R file in the main directory, and the functions contained within /R.

Note that we are unable to publicly share the raw GPS locations for this caribou population due to their status within Canada. We have provided data that corresponds to the main_results folder of code. 

init_memory_issa_10_years_winter_base contains all the extraction processes for the GPS collars, forest habitat, and Cladonia stoichiometric map 

issa_base_image contains all dependencies to run the analysis

main_results contains the short-term and long-term iSSA models

supplementary contains all models found within the supplementary materials

Each folder contains a read_me file and a make file to build a run podman containers
