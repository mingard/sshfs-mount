#!/bin/bash
path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
for file in $path/config/*
do
        if [ $file = $path'/config/'$2'.mount' ];
        then
            source $file
            dir="$mountDir"'/'"$mountName"
            if [ $1 = 'unmount' ];
            then
                umount "$dir"
            elif [ $1 = 'mount' ];
            then 
                ssh-add "$pem"
                mkdir "$dir"
                sshfs -o reconnect "$username"@"$hostName":/"$remoteRootDir"  "$dir" -oauto_cache,reconnect,defer_permissions,negative_vncache,noappledouble,volname="$mountName"
                echo "Connected to " $hostName
            fi
        fi
done
