# FireBrick Graph Downloader
This simple bash script grabs graphs from your FireBrick, merges them with previous versions of the graph (if available), and moves them to your web server.

The aim is to give you persistent graphing, rather than the ephemeral graphing on the FireBrick itself, where the graphs are wiped on reboot of the FireBrick.

# Requirements
* A web server
* Probably a Linux machine, with bash and curl
* A FireBrick, with a user account which you can access from the IP address from which you will be running this script, and which has at least read access to the web interface. Since this script stores the password in plaintext, it would make sensible to create a specific user only for this script, make it a "read only" account, and lock down the account so that it can be accessed only from the IP address of the machine running the script.
* [CQMmerge](https://github.com/revk/CQMmerge) installed (for which you'll probably need some dev libraries installed on your machine; read the error codes from the make process

# How to use it

* Download the script to where you want to run it
* Read it through, and replace the variables with the settings which make sense for you
* Run it using bash (not sh)
* When you're happy, set it up as a cronjob
