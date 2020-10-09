# FireBrick_graph_downloader
Downloads graphs from your FireBrick, merges them together, and moves them to your web server

# Requirements
* A web server
* A FireBrick, with a user account which you can access from the IP address from which you will be running this script, and which has at least read access to the web interface
* [CQMmerge](https://github.com/revk/CQMmerge) installed (for which you'll probably need some dev libraries installed on your machine; read the error codes from the make process

# How to use it

* Download the script to where you want to run it
* Read it through, and replace the variables with the settings which make sense for you
* Run it using bash (not sh)
* When you're happy, set it up as a cronjob
