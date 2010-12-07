Launch
======

Author
------

Scott Willett - scottwillett@exemail.com.au

Description
-----------

Launch is a Ruby on Rails app template creator. It lets you create public files, a main layout (application.html.erb), and a Gemfile to quickly create a new rails app for a showoff prototype, for faster development, or for automatically doing tedious tasks when creating a new rails app (eg: adding authentication, bundling gems, creating a common model or scaffold).<br /> Runs good on Ubuntu, haven't tested on any other platforms.
Please email me if you have any suggestions, want to contribute etc. Keep in mind I only started working on this on 06/12 for 4 hours and have never created a bash script before.

Usage
-----
<pre>
This app is setup ideally for Ubuntu. Place the 'launch' directory in your home folder. Feel free to place the folder elsewhere, but you will 
have to update setup.sh and launch.sh to point to the right directories.

sh setup.sh

Uncomment the appropriate code to replace the rails scaffold template.
This command will create a symbolic link and  allow the command below 
to be used.
</pre>
<pre>
launch App_Name Template

App_Name = The name of the new rails app you wish to create
Template = Name of the launch template to use. If the param isn't specified, 
the 'default' template is used.
</pre>
<pre>
eg: launch MyRailsApp
    launch MyRailsApp simple_template

launch snapshot Template

This command will recursively copy all files and folders in a directory to 
the launch tempate directory within the folder specified with Template.
</pre>

ToDo
----

- Improve documentation, it's not very helpful at the moment
- Update the help command text
- Workout how to get github pretty README markups happening
- Check if it works on a Mac
- Perhaps port the program to ruby, or as a gem/rails plugin
- Create some templates to provide quick examples
- If this plugin is popular, create a website to host launch templates by other people
- Have an 'describe' file in each template so when 'launch template describe' is run it will echo information on the layout in the case where there are a heap load of templates and you forget the purpose of a template
- Get rails to auto create common variables you will use (eg: title, header) if it's useful
