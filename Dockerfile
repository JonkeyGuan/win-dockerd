FROM --platform=$BUILDPLATFORM curlimages/curl:7.80.0 AS build
ARG DOCKERVERSION
USER root
RUN curl -Lo docker.zip https://download.docker.com/win/static/stable/x86_64/docker-$DOCKERVERSION.zip; \
    unzip docker.zip

FROM mcr.microsoft.com/oss/kubernetes/windows-host-process-containers-base-image:v1.0.0
WORKDIR /docker
ENTRYPOINT ["dockerd.exe"]
COPY --from=build /docker /docker
