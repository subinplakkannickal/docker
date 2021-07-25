# poky

This repository is to maintain the docker file for building yocto

## Usage
### Build image

    docker build -t poky:1.0 --build-arg USERNAME=<username> --build-arg PUID=1000 --build-arg PGID=1000 .

### Run container

    docker run -it --name poky-one -v <absolute path of yocto>:/home/<username>/yocto poky:1.0


