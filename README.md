# GoDocker

Build and run a Go project in the smallest containers. This is the example of
a tiny web server using the `net/http` package from the standard library.   

Go produces tiny and independent binaries that can be run on bare metal, we can
use that to use the smallest container image in production called scratch. For
this to, a two-step build process is necessary.

## Thanks and inspiration

Inspiration comes mostly from
[this article](https://blog.codeship.com/building-minimal-docker-containers-for-go-applications/)
of the Codeship blog and [this other one](https://www.iron.io/an-easier-way-to-create-tiny-golang-docker-images/)
from the iron.io blog.
GoDocker took elements from both but with several points in mind:
* No local go installation required (full process happening in containers)
* More operations described in Dockerfiles rather than in docker run huge one-liners

## How do I run this?

You need Docker installed on your machine and... that's it.
**Build the project:**  
```
chmod +x build.sh
./build.sh
```

The build script builds the image *application-builder* and compiles
the go project inside the container. At this point, a `application` file appeared
in the project directory.

**Launch the server inside a container**  
```
docker build --rm -f Dockerfile.scratch . --tag app-runner
docker run --rm --name="tinydocker" app-runner
```

Find the container's local address at the "IPAddress" key when running `inspect`:  
```
docker inspect tinydocker
```
(Hint, it is usually 172.17.0.2 if no other container is running).

Go to the address http://<IPAddress>:8080 to test the result.
