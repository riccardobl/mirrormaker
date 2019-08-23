FROM ubuntu:18.04

RUN apt-get update\
&&apt-get upgrade -y \
&&apt-get install -y httrack busybox git-lfs

ADD mirror.sh /mirror.sh
RUN chmod +x /mirror.sh

RUN groupadd --gid 1000 nonroot 
RUN useradd --uid 1000 -r --gid 1000 nonroot 

RUN mkdir -p /mirror && chown 1000:1000 /mirror
RUN mkdir -p /home/nonroot/
RUN touch /home/nonroot/.gitconfig
RUN chown 1000:1000  /home/nonroot/


USER nonroot

env GIT_REPO="https://github.com/riccardobl/test"
env GIT_BRANCH="master"
env URL="https://hub.jmonkeyengine.org/"
env FILTERS="+https://jme-hub-cdn-jmonkeyengineor.netdna-ssl.com/* -*.rss "
env USER_AGENT="Googlebot"
env GIT_ARGS=""
env HTTRACK_ARGS=""
env GIT_USER_EMAIL="noreply@robot.frk.wf"
env GIT_USER_NAME="MirroMaker"

ENTRYPOINT ["/mirror.sh"]