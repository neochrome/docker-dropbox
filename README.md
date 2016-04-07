# Dockerized dropbox

## Persisting data and settings
Containers launched from this image will write settings and data to `/dropbox` inside.
In order to persist those settings volumes may be used.

## First time device connection
First time the container must be connected to your dropbox account which is done by
following an url that is output in the log for the container.

## Host/device name
In order to set the name of the device when connecting with your dropbox accout, you
can specify the hostname of the container like this:
```
$ docker run ... --hostname my-device-name ...
```
