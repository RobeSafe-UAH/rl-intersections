#!/bin/bash

# Carlos Gómez Huélamo - April 2021
# Script to configure the remote repositories (GitHub and Server) of a local RobeSafe GIT repository 

flag=0

# 1. Change GitHub remote repository from "origin" to robesafe_github

	remotes_list=$(git remote)
	for remote in $remotes_list
	do
		if [[ "$remote" == "origin" ]]; then
			git remote rename origin robesafe_github
		elif [[ "$remote" == "robesafe_server" ]]; then
			flag=1
		fi
	done

# 2. Add a new remote repository (RobeSafe server)

	if [ $flag = 0 ]; then
		dirname=$(pwd)
		current_folder="${dirname%"${dirname##*[!/]}"}" # extglob-free multi-trailing-/ trim
		current_folder="${current_folder##*/}"          # remove everything before the last /

		robesafe_server_root="ssh://www.robesafe.uah.es/home/git/techs4agecar/"

		if [[ "$current_folder" == *"layer" ]]; then
			str1="layers/techs4agecar_"
			layer_name=$(echo $current_folder | sed 's/.*t4ac_//; s/_layer.*//')
			str2="_layer.git"
			
			robesafe_server_repository=$robesafe_server_root$str1$layer_name$str2
			git remote add robesafe_server $robesafe_server_repository	
		else
			repository="modules/$current_folder"
			robesafe_server_repository=$robesafe_server_root$repository
			git remote add robesafe_server $robesafe_server_repository
		fi
	fi







