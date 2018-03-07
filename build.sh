#!/bin/bash
set -x
set -e

app=hipchat
container=$(buildah from --name $app ubuntu:16.04)

buildah copy $container ./build.yml /build.yml
buildah copy $container ./bootstrap.sh /usr/local/bin/bootstrap.sh
buildah run $container -- /bin/bash -c /usr/local/bin/bootstrap.sh
buildah config $container --author "Mike Oliver <mike@mklvr.io>" \
        --user 1000:1000 \
        --label RUN="docker run -v /tmp/.X11-unix:/tmp/.X11-unix -v \$HOME/Downloads:/home/user/Downloads:z -v \$HOME/.config/Atlassian:/home/user/.config/Atlassian:Z -e DISPLAY=unix\$DISPLAY --rm --user 1000 --device /dev/snd  --device /dev/dri/card0 --name hipchat IMAGE hipchat4"
buildah commit $container $USER/$app
buildah rm $container
