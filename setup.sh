#!/bin/sh
# Run this file using sh setup.sh.

# Variables
WORKING_DIR=`pwd`

# Create a symbolic link so the command can be run by typing 'launch'
ln -s ${WORKING_DIR}/launch.sh /usr/local/bin/launch
chmod 777 /usr/local/bin/launch
