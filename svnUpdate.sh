#!/bin/bash

usage()
{
	cat <<EOF

	OPTIONS:
   
EOF
}

rootPath=/var/www/downloads
dashboardFolder=cdb #new_20160218
svnRepoURL=http://xxx.xxx.xxx.xxx/svn/octopus-web/src/trunk/dashboard

# loop thru all the directories inside given rootPath
for dir in /$rootPath/*/
do
    dir=${dir%*/}

    repoDirectory=${dir##*/}

    repoPath=$rootPath/$repoDirectory/$dashboardFolder

    if [ -d "$repoPath" ]; then

	    cd $repoPath

	    # check whether the SVN URL are in required repo
	    repoUrlCheck=$(svn info $svnRepoURL | grep '^URL')
	   
	    if [ -d '.svn' ] && [ repoUrlCheck==$svnRepoURL ]; then
				echo "Updating project:$repoDirectory, Proj Path: $repoPath"
				svn update
				echo "Done"
		else
			echo "Failed!"
		fi

		cd ..
	fi
done