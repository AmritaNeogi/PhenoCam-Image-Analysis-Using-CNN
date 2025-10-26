# Phenology image anaysis: Visual Feature Stability Modeling

Developed by Linh Ta, Bryan Heidorn, Jessica Guo, and David LeBauer

This repo contains scripts to process Phenocam canopy and ground images in order to better predict phenological processes (green up, brown down) for the EFI phenology competition. 


# Setting Up

## Prerequisite:
You should have Anaconda or Miniconda installed, which should also include Python3. 

### Setting up the environment

Regardless of how you run the program, the scripts contained in this repository will require a few library to get set up. In here I will instruct you how to set up an environment in the running folder, so that the setting here does not affect your other project.

#### Make a new env in the current folder (optional)

Navigate to the folder containing the code, type
    ```conda create -p ./env python=3.7```

It will create a Conda environment named env in the current folder. 

Then anytime you want to use that environment, you can head into the folder and run
    ```conda activate ./env```
    
To deactivate the environment, type
    ```conda deactivate```
    
Then we should attach that environment to the Jupyter Notebook. 

We will do it by installing ipykernel, type
    ```pip3 install --user ipykernel```
    OR
    ```python3 -m pip install virtualenv```
    
Then to attach the environment to Jupyter Notebook, run
    ```python3 -m ipykernel install --user --name=env```
    
Everytime you want to run the notebook in the environment we set up, just click Kernel->Change Kernel-> Kernel Name
    
#### Install Package

We need to install many package, run
    ```conda install numpy```
    ```conda install pandas```
    ```conda install matplotlib```
    ```conda install scipy```
    ```conda install scikit-image```
    ```pip install -U scikit-learn```
    ```pip install opencv-python```
    ```conda install jupyter notebook`
