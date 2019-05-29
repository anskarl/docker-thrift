[Apache Thrift](https://thrift.apache.org/) with Java support in a [Docker](https://www.docker.com/) container.

### How to run Thrift from CLI

You can add to the `PATH` the `thrift` Bash script of this repository, for example to print the version:

```
$ thrift -version

Thrift version 0.12.0
```

To change the version of the `thrift`:
```
$ THRIFT_VERSION=0.9.3 thrift -version

Thrift version 0.9.3
```

Alternatively you can manually execute the following:

```
THRIFT_VERSION=0.10.0 docker run --rm  -v $PWD:$PWD --workdir $PWD anskarl/thrift:$THRIFT_VERSION -version
```

### Published images in Docker Hub

All published images can be found in [Docker Hub](https://hub.docker.com/r/anskarl/thrift/tags):

  - 0.12.0: `docker pull anskarl/thrift:0.12.0` or `docker pull anskarl/thrift:latest`
  - 0.11.0: `docker pull anskarl/thrift:0.11.0`
  - 0.10.0: `docker pull anskarl/thrift:0.10.0`
  - 0.9.3: `docker pull anskarl/thrift:0.9.3`

### How to build an image

To build image for Thrift, for example version 0.9.3:

```
make THRIFT_VERSION=0.9.3 image
```

You can specify any THRIFT_VERSION you desire to build.


...enjoy :)