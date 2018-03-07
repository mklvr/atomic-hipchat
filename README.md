atomic-hipchat
==============

Introduction
------------
Fedora Atomic Workstation (See: http://www.projectatomic.io/docs/fedora-atomic-workstation/) currently doesn't support installing RPMs that dump files into '/opt'. This includes hipchat. This repository can be used to build a container image for hipchat to be run with 'atomic'.

    
Usage
-----
Requirements: buildah (https://github.com/projectatomic/buildah)

``` 
user@localhost$ sudo ./build.sh
```

This will create a local container image ready to run hipchat. From here, you can push it to you're image repository. To push it to a locally running docker instance run:
```
user@localhost$ sudo buildah push docker.io/$USER/hipchat docker-daemon:$USER/hipchat:latest
```

To run the container from your Fedora Atomic Workstation:
```
user@localhost$ atomic run docker.io/$USER/hipchat:latest
```

Known Issues
------------
1. Can't open links. There's no browser installed in the container, you'll need to just copy the link to your browser window.
