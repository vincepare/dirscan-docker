# DirScan docker image
This docker image let you use [DirScan](https://github.com/vincepare/DirScan) on the docker host without having to install PHP on it.

You need to mount the host filesystem root on `/hostfs` inside the container to let DirScan browse it.  
If you intend to use relative path arguments, you need to tell `dirscan` about your current working directory by setting the `DIRSCAN_PWD` environnement variable.

On the container, `dirscan` runs inside a chrooted environnement to make everything (symlinks dereferencing, user names, group names and all that stuff) transparent.

### Example
```bash
docker run -i --rm -v "/":"/hostfs:ro" -v "/tmp/.dirscan":"/hostfs/tmp/.dirscan" -e "DIRSCAN_PWD=$(pwd)" vincepare/dirscan --full --same-device /tmp > "tmp.dirscan.txt"
```
