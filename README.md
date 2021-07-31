# poky

This repository is to maintain the docker file for building yocto

## Usage
### Build image

    docker build -t poky:1.0 --build-arg USERNAME=<username> --build-arg PASSWORD=<password> .

### Run container

    docker run -it \
        --name poky-one \
        --device /dev/net/tun:/dev/net/tun \
        --env DISPLAY=$DISPLAY \
        --hostname yocto \
        --volume /<absolute path of yocto>:/home/<username>/yocto \
        --cap-add NET_ADMIN \ 
        --network "host" \
        poky:1.0

