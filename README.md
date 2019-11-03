mbentley/discord
================

docker image for discord
based off of alpine:latest

To pull this image:
`docker pull mbentley/discord`

On macOS, you need to run XQuartz and use `socat` to make the X11 display available on the network:

```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```

Running on macOS:

```
docker run --rm \
  -u $(id -u):$(id -g) \
  -v ~/.config:/.config \
  -e DISPLAY=<ip-of-your-box>:0 \
  mbentley/discord
```

Running in X11:

Allow connections to the X session:
```
xhost +SI:localuser:$(whoami)
```

```
docker run -d --name discord \
  -u $(id -u):$(id -g) \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/.config:/.config \
  -e DISPLAY=unix$DISPLAY \
  mbentley/discord
```
