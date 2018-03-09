atomic-hipchat
==============

Introduction
------------
Fedora Atomic Workstation (See: http://www.projectatomic.io/docs/fedora-atomic-workstation/) currently doesn't support installing RPMs that dump files into '/opt'. This includes hipchat. These repository helps  

    
Usage
-----
Requirements: buildah (https://github.com/projectatomic/buildah), ansible (https://github.com/ansible/ansible)

``` 
user@localhost$ sudo ansible-playbook build.yml
```

This will create a local container image ready to run hipchat. From here, you can push it to you're image repository. By default, we push it to the locally running docker instance, but we can push with buildah with:
```
user@localhost$ sudo buildah push docker.io/mklvr/hipchat docker-daemon:mklvr/hipchat:latest
```

To run the container from your Fedora Atomic Workstation:
```
user@localhost$ atomic run docker.io/mklvr/hipchat:latest
```

Known Issues
------------
1. Can't open links. There's no browser installed in the container, you'll need to just copy the link to your browser window.
