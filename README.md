[![dockerhub](https://img.shields.io/docker/cloud/build/riccardoblb/mirrormaker?style=for-the-badge)](https://hub.docker.com/r/riccardoblb/mirrormaker)
# MirrorMaker 

Just a docker image built around httrack used to mirror a website into a git repo.



Usage
```bash
docker run --rm -d  -p8888:8080 --name=mirrormaker \
-eGIT_REPO="https://user:password@github.com/riccardobl/test" \
-eURL="https://****/" \
-eFILTERS="" \
riccardoblb/mirrormaker
```
