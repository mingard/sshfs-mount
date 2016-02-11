# sshfs-mount
A quick way to mount and unmount volumes with SSHFS

##Install
1. Install [SSHFS and Fuse](http://osxfuse.github.io/)
2. Create a config .mount file in the config folder, making sure that the local directory you specify exists and is writable

#Run

1. To mount, navigate to the root of the mount app. Run `. mount.sh mount {configFileName}`
2. To unmount, do exactly the same, but substitute `mount` for `unmount`

#Using an alias on OSX

1. `[sudo] pico /etc/bashrc`
2. add   ```MOUNT_DIR="/path/to/mount/mount.sh"
MOUNT=". /path/to/mount/mount.sh mount"
UNMOUNT=". /path/to/mount/mount.sh unmount"```
3. Now in terminal you no longer need to `cd` to the directory first. Simply run `$MOUNT {configFileName}` or `$UNMOUNT {configFileName}` e.g. `$MOUNT my-site`.

Special thanks to [@jean-luc](https://github.com/jean-luc) and [@nivlaps](https://github.com/nivlaps) for debugging

