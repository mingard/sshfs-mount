#!/bin/zsh

# sysinfo_page - A script to mount a remote instance using SSHFS
SOURCE=${(%):-%N}
cpath=$( cd "$(dirname "${SOURCE}")" ; pwd -P )

for file in $cpath/config/*
do
        if [ $file = $cpath'/config/'$2'.mount' ];
        then
            source $file
            dir="$mountDir"'/'"$mountName"
            if [ -z "${port}" ]; then 
                PORT=22
            else 
                PORT=$port
            fi
                echo $PORT
            if [ $1 = 'unmount' ];
            then
                umount "$dir"
            elif [ $1 = 'mount' ];
            then 
                ssh-add "$pem"
                mkdir "$dir"
                sshfs -o reconnect "$username"@"$hostName":/"$remoteRootDir" "$dir" -p $PORT -oauto_cache,reconnect,defer_permissions,negative_vncache,noappledouble,volname="$mountName"
                echo "Connected to " $hostName
            fi
            if [ $3 ];
            then
                if [ $3 = "connect" ];
                then
                    ssh -p $PORT $username"@"$hostName
                fi
            fi
        fi
done
