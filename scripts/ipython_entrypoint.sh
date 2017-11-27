#!/bin/bash

#Issue: this will only work if we have a root password
service ssh start

# jupyter notebook --no-browser --ip=127.0.0.1 --allow-root
jupyter notebook --no-browser --ip=nb-server --allow-root \
   --NotebookApp.token='' --NotebookApp.password='' \
   --NotebookApp.notebook_dir='/var/tmp/notebooks'


#to connect to running notebook do:
#  %connect_info
#in the running notebook
# shelled into this container do
#  jupyter console --existing
