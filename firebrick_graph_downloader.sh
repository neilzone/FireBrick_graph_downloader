#!/bin/bash

declare -a GRAPHNAMES

GRAPHNAMES=( "ExampleGraph1" "ExampleGraph2" "ExampleGraphN" ) #Put a list here of the names of the graphs you want to download. These are the names used by your FireBrick. Put each one in quotation marks.

for GRAPHNAME in "${GRAPHNAMES[@]}"
do

GRAPHIMAGE=$GRAPHNAME".svg"

WORKINGDIR="/var/graphs/firebrick.example.com" #Replace this with the path to which you want the images downloaded. This is the working directory, not the web server path, but you could use the same if you wanted.

BRICKPATH="https://firebrick.example.com/cqm/svg" #Replace "firebrick.example.com" with the URL of your FireBrick. Leave the "/cqm/svg", as this makes sure you grab graph images.

FIREBRICKCURL_USER="firebrick_user" #Replace "firebrick_user" with the name of the user account on your FireBrick.
FIREBRICKCURL_PASSWORD="password-goes-here" #Replace "password-goes-here" with the password for the user account you have specified above.
WEBSERVERPATH="/var/www/graphs.example.com/public_html" #Replace this with the path to your webserver directory (i.e. where you want the graphs images to be hosted)

CQMMERGE=/var/graphs/CQMmerge/cqmmerge #Replace this with the path to your installation of cqmmerge


DOWNLOADPATH=$WORKINGDIR/$GRAPHIMAGE

echo "DOWNLOADPATH is $DOWNLOADPATH"

CURRENT=$WORKINGDIR/$GRAPHNAME"_current.svg"
OLD=$WORKINGDIR/$GRAPHNAME"_old.svg"


if test -f "$CURRENT"; then
	mv $CURRENT $OLD
fi


curl "$BRICKPATH/$GRAPHIMAGE" --user "$FIREBRICKCURL_USER:$FIREBRICKCURL_PASSWORD" --output $DOWNLOADPATH


if test -f "$CURRENT"; then
	$CQMMERGE $OLD $DOWNLOADPATH > $CURRENT
else
	mv $DOWNLOADPATH $CURRENT
fi


cp $CURRENT $WEBSERVERPATH/$GRAPHIMAGE

if test -f "$OLD"; then
	rm $OLD
fi

done
