## install this first on new installs
# older version of gsl needed for ctmm 
install.packages('https://cran.r-project.org/src/contrib/Archive/gsl/gsl_2.1-8.tar.gz', repos=NULL, type='source')
# required for qs install from source
install.packages(c('BH',
                   'RApiSerialize',
                   'RcppParallel',
                   'remotes',
                   'targets', 
                   'tarchetypes',
                   'spatsoc'), 
                 Ncpus=(parallel::detectCores() - 1))

## older version of stringfish needed for qs to be installed
install.packages('https://cran.r-project.org/src/contrib/00Archive/stringfish/stringfish_0.16.0.tar.gz', repos=NULL, type='source')
#
## install qs has been archive
install.packages('https://cran.r-project.org/src/contrib/Archive/qs/qs_0.27.3.tar.gz', repos=NULL, type='source')

#
install.packages(c('Matrix',
                   'renv',
                   'lme4',
                   'ctmm', 
                   'amt',
                   'ggthemes',
                   'distanceto',
                   'betareg', 
                   'broom.mixed', 
                   'viridis',
                   'osmdata', 
                   'neonUtilities',
                   'BiocManager',
                   'conflicted',
                   'visNetwork',
                   'ggplot2',
                   'ggbreak',
                   'patchwork',
                   'qs2',
                   'tidyterra',
                   'sf'),
                 Ncpus=(parallel::detectCores() - 1))



## rhd5 is in biocmanager
BiocManager::install('rhdf5')

# custom Rccp and Deriv version needed for glmmTMB
install.packages('https://cran.r-project.org/src/contrib/Archive/Rcpp/Rcpp_1.0.10.tar.gz', repos=NULL, type='source')
install.packages('https://cran.r-project.org/src/contrib/Archive/Deriv/Deriv_4.1.3.tar.gz', repos=NULL, type='source')


install.packages(c('TMB', 'glmmTMB'), 
type = 'source', 
Ncpus=(parallel::detectCores() - 1))



libs <-  c("data.table", "qs", "targets", "tarchetypes", "parallel", "visNetwork", "renv","lme4", "amt", "ggthemes", "distanceto", "glmmTMB")
lapply(libs, library, character.only = TRUE)
