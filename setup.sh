#!/bin/sh
# Run this file using sh setup.sh.

# Variables
WORKING_DIR=`pwd`

# Overwrites the rails scaffold templates. It changes the headings 
# from being <h1> tags to <h3> tags for better SEO since the header 
# and nav links will use <h1> and <h2>
#
# SCAFFOLD=scaffold/
# RAILS_SCAFFOLD_TEMPLATES=/usr/lib/ruby/gems/1.8/gems/railties-3.0.2/lib/rails/generators/erb/scaffold/templates/
# cp ${WORKING_DIR}/${SCAFFOLD}* ${RAILS_SCAFFOLD_TEMPLATES}

# Create a symbolic link so the command can be run by typing 'launch'
ln -s  ${WORKING_DIR}/launch.sh /usr/local/bin/launch
chmod 777 /usr/local/bin/launch
