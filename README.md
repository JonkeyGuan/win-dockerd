# windows-host-process-containers

docker buildx create --name img-builder --use --driver docker-container --driver-opt image=moby/buildkit

docker buildx build --platform windows/amd64 --build-arg DOCKERVERSION=20.10.9 --push --pull -t jonkeyguan/win-dockerd:20.10.9 .
