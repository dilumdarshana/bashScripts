#!/bin/bash


usage()
{
	cat <<EOF

	OPTIONS:
    --username <USER>       SVN username to use for svn info
    --password <PASS>       SVN password for the given user
EOF
}

rootPat=/var/www/downloads
dashboardFolder=cdb
SVN_USERNAME=$1
SVN_PASSWORD=$2

for dir in /$rootPat/*/
do
    dir=${dir%*/}

    repoDirectory=${dir##*/}

    repoPath=$rootPat/$repoDirectory/$dashboardFolder

    cd $repoPath

    if [ -d '.svn' ]
		then
			echo "Updating project:$repoDirectory, Proj Path: $repoPath"
			svn update
			echo "Done."		
	fi

	cd ..

    #svn update --username $SVN_USERNAME --password $SVN_PASSWORD
done