# Docker Xeyes

These Docker images provide a minimal setup to test GUI X11-Forwarding inside Docker containers using the `xeyes` application.

## Usage

You can run these Docker containers using the following commands:

### Alpine / ± 13.9MB

```bash
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ferri/xeyes:alpine
```

### Ubuntu / ± 97.9MB

```bash
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ferri/xeyes:ubuntu
```

---

## Prerequisites

- Verify that `echo $DISPLAY` from your host terminal does not return an empty result.
- Check if your local user is whitelisted by running `xhost`:

```bash
xhost
access control enabled, only authorized clients can connect
SI:localuser:[YOUR-USER]
...
```

If your user is not listed, you can whitelist it by running `xhost +SI:localuser:[YOUR-USER]`.
