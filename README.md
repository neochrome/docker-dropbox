# Dockerized dropbox

## First time device connection
First time the container must be connected to your dropbox account which is done by
following an url that is output in the log for the container.

## Host/device name
In order to set the name of the device when connecting with your dropbox accout, you
can specify the hostname of the container like this:
```
$ docker run ... --hostname my-device-name ...
```

## Specific versions of dropboxd
Select versions of `dropboxd` are available as tags, e.g: `neochrome/dropbox:8.4.21-1`.
The latest version built is available as `neochrome/dropbox:latest`.
*Please note that this isn't necessarily the latest available dropbox version.*
These versions won't auto-update to the latest dropbox version.

### Persisting data and settings
Containers launched from this range of images will write settings and data to `/dropbox` inside.
In order to persist those settings volumes may be used.

## Auto-updating dropboxd
`neochrome/dropbox:autoupdate` is an image that supports dropboxd's auto-updating
mechanism. Since the container exits when the daemon is updated, it might be desirable
to launch the container with a restart policy in place.

### Persisting data and settings
`/dropbox` is exposed as a volume and will contain both data as well as settings.
In order to track the volume one might want to create a data-container:
```
$ docker create --name dropbox-data neochrome/dropbox:autoupdate
```
and then use it when starting the daemon:
```
$ docker run --rm -it --volumes-from dropbox-data neochrome/dropbox:autoupdate
```
