# fr0zen_jpt

Small JupyterLab infrastructure for experiments with ML-Based projects

#

## Basic usage:

- ``` make pull ``` - pull latest version of the **fr0zen_jpt** image

- ``` make up ``` - run JupyterLab server into Docker container

# 

## Run the container properly:

- provide your ***$DOCKER_NETWORK***
- check the ***$PORT*** for running
- provide ***$DATA_DIR*** with your data directory **(opt)**
- provide ***$MODEL_DIR*** with your models directory **(opt)**

#

## Additional notes:

- [Inner Install](src/inner_install.ipynb) notebook for adding all kind of packages (to system or pip)