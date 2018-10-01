# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "jeancorreia@mylab.jcc"

RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
 && tar xzvf docker-18.06.1-ce.tgz \
 && mv docker/docker /usr/local/bin \
 && rm -r docker docker-18.06.1-ce.tgz

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
