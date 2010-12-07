#!/bin/sh

# Author:       Scott Willett
# Version:      V0.1 (06/12/2010)
#
# Description:  Launch is a Ruby on Rails app template creator. It lets you
#               create a stylesheet, layout, and Gemfile to quickly create a
#               new rails app for a showoff prototype, for faster development,
#               or for automatically doing tedious tasks when creating a new rails
#               app.
#
# Usage:        launch <App_Name> <Template>
#
#               <App_Name> = The name of the new rails app you wish to create
#               <Template> = Name of the launch template to use. If the para
#                            isn't specified, the 'default' template is used.

# The first parameter defines the rails app to create
RAILS_APP=$1
HELP=-h

# If no params are defined, show a help message
if [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "-h" ]; then
  echo
  echo "Author:       Scott Willett"
  echo "Version:      V0.1 (06/12/2010)"
  echo
  echo "Description:  Launch is a Ruby on Rails app template creator. It lets you"
  echo "              create a stylesheet, layout, and Gemfile to quickly create a"
  echo "              new rails app for a showoff prototype, for faster development,"
  echo "              or for automatically doing tedious tasks when creating a new rails"
  echo "              app."
  echo
  echo "Usage:        launch <App_Name> <Template>"
  echo
  echo "              <App_Name> = The name of the new rails app you wish to create"
  echo "              <Template> = Name of the launch template to use. If the param"
  echo "                           isn't specified, the 'default' template is used."
  echo
  exit 0
fi

# The launch application directory (default is /home/user/launch)
LAUNCH_DIR=~/launch/              
if [ ! -e "$LAUNCH_DIR" ]; then
  echo
  echo "Launch directory doesn't exist. Aborting..."
  echo
  exit 1
fi

# The name of the directory holding the launch templates
TEMPLATES_DIR=${LAUNCH_DIR}templates/     
if [ ! -e "${TEMPLATES_DIR}" ]; then
  echo
  echo "Templates directory doesn't exist. Aborting..."
  echo
  exit 1
fi

if [ "$1" = "snapshot" ] && [ ! -z "$2" ]; then
  TEMPLATE=$2                         
  if [ -e "${TEMPLATES_DIR}${TEMPLATE}/" ]; then
    echo "Template exists. Overwrite? [y or n]: "
    read INPUT
    if [ "$INPUT" != "y" ]; then
      echo
      echo "Aborting..."
      echo
      exit 0
    fi
  else
    mkdir ${TEMPLATES_DIR}${TEMPLATE}
  fi
  echo "Creating snapshot"
  cp -r ./* ${TEMPLATES_DIR}${TEMPLATE}/
  exit 0
fi

# The second parameter of the command indicates the template to use.
# If no parameter is given, the default template is used.
TEMPLATE=$2                         
if [ "$2" = "" ]; then
  TEMPLATE=default
fi

if [ ! -e "${TEMPLATES_DIR}${TEMPLATE}" ]; then
  echo
  echo "Template '$TEMPLATE' doesn't exist. Aborting..."
  echo
  exit 1
fi

# Gets the defined template stylesheets, views, and gemfile
GEMFILE=${TEMPLATES_DIR}${TEMPLATE}/Gemfile

# Create a new rails app
echo "Creating app: ${RAILS_APP}"
rails new ${RAILS_APP}
cd ${RAILS_APP}

# Install defined gems for the app
if [ -e "${GEMFILE}" ]; then
  echo "Installing Gems..."
  cp ${GEMFILE} ./
  bundle install
fi

# Copies the layout to the rails app for use. Overwrites the current layout.
echo "Copying the template files over"
echo "- Copying global template over"
cp -r ${TEMPLATES_DIR}global/* ./
echo "- Copying template: ${TEMPLATE}"
cp -r ${TEMPLATES_DIR}${TEMPLATE}/* ./

# Run custom commands if command.sh is present
if [ -e "commands.sh" ]; then
  echo "Launching custom template commands..."
  sh commands.sh
  rm commands.sh
fi

# Complete
echo "Complete!"
exit 0
