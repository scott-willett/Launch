Launch
======

Launch is a Ruby on Rails (3.0) app template creator written in bash shell. 

It allows you to create a snapshot of files in a RoR app and create a template to create RoR apps.
It features:
- Auto downloading and bundling of Gems
- Writing your own custom commands for each template
- A 'global' template to avoid redundancy
- Snapshot a rails application and use it as a template any time you want

Runs good on Ubuntu, haven't tested on any other platforms.
Please email me if you have any suggestions, want to contribute etc. Keep in mind I only started working on this on 06/12 for 4 hours and have never created a bash script before.

Version
-------

V0.3 - 09/12/2010

Author
------

Scott Willett - scottwillett@exemail.com.au

Usage
-----
<pre>
This app is setup ideally for Ubuntu. Place the 'launch' directory in your home folder. Feel free to place the folder elsewhere, but you will 
have to update setup.sh and launch.sh to point to the right directories.

sh setup.sh
</pre>
<pre>
Uncomment the appropriate code to replace the rails scaffold template.
This command will create a symbolic link and  allow the command below 
to be used.
launch App_Name Template

App_Name = The name of the new rails app you wish to create
Template = Name of the launch template to use. If the param isn't specified, 
the 'default' template is used.
eg: launch MyRailsApp
    launch MyRailsApp simple_template
</pre>
<pre>
launch snapshot Template

This command will recursively copy all files and folders in a directory to 
the launch tempate directory within the folder specified with Template.
</pre>

ToDo
----

- Improve documentation, it's not very helpful at the moment
- Check if it works on a Mac
- Perhaps port the program to ruby, or as a gem/rails plugin
- Create some templates to provide quick examples
- If this plugin is popular, create a website to host launch templates by other people
- Have an 'describe' file in each template so when 'launch template describe' is run it will echo information on the layout in the case where there are a heap load of templates and you forget the purpose of a template
- Get rails to auto create common variables you will use (eg: title, header) if it's useful
- Auto setup a github repository?
