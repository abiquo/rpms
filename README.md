# Package generation using Docker

## Objectives

From now on the spec files that create the RPM are set as a platform submodule, this way they will be tagged, branched, etc with the rest of the source code. Also, any required static file for the RPM create will be stored in this repository.


## Specfiles details

### Version and Release

As the spec code and modifications are tagged along with the Abiquo code, now rpm version number can be passed as a environment variable. This way there's no need to modify the spec for hotfixes that do not require package structure modification.

```
Version:  %{getenv:ABIQUO_VERSION}
Release:  %{getenv:ABIQUO_RELEASE}%{?dist}%{?buildstamp}
```

### Sources

All source files has been changed to they point to relative paths from the jenkins output directory. e.g:

```
master
  |
  +- specs
  |    |
  |    +- abiquo-am.spec { source: ../../am.war}
  |    +- ...
  +- am.war
  +_ ...
```

This way all sources are contained on the same repository and we can do isolated builds.

## Integration with Jenkins build jobs.

Jenkins postbuild script has been changed so it will copy the specs directory as a folder on with the rest of the compilation targets, scripts, etc.

[prepare_release_36.sh](https://github.com/abiquo/tools/blob/master/jenkins/scripts/prepare-release-36.sh)


## Jenkins RPM build jobs.

Build jobs on jenkins only require three parameters:

* `WARDIR`, this would be the directory name used as input for the RPM build process.
* `ABIQUO_VERSION`, version of Abiquo 3.6.1, 3.8.master, etc. It will generate packages on the form ```abiquo-package-$ABIQUO_VERSION-$ABIQUO_RELEASE.el6.noarch.rpm```
* `FULL_BUILD`, there is no need to include most of packages on the daily build, as their code will not change from one release to another.By setting this option you cna restrict the number of generated packages. Those would include tomcat, metapackages, etc. 
* `ABIQUO_RELEASE` this param cannot be modified within the jenkins job, we get the jenkins build number by default to build the package.

### Build RPM Script

The jenkins build job will launch a simple shell script that will interate on the package list and launch the RPM build inside a docker container

[build_rpms_docker.sh](https://github.com/abiquo/tools/blob/master/jenkins/scripts/build_rpms_docker.sh)

This script is also in charge of repository update and creation.

### Docker builds

RPM are generated inside a Centos6 docker container with the rpmbuild tools, basically the branch directory with the compiled wars is mounted on the container, alongside with the environment variables that set up version and release.

```
docker run --rm -v /opt/releases/$WARDIR:/opt/releases  -e "ABIQUO_VERSION=$ABIQUO_VERSION" -e "ABIQUO_RELEASE=$BUILD_NUMBER"  -e "SPEC_FILE=$pkg" rpmbuild
```

You can see the [Dockerfile](https://github.com/abiquo/tools/blob/master/jenkins/Docker/Dockerfile) includes the [script](https://github.com/abiquo/tools/blob/master/jenkins/Docker/build-rpm.sh) that build the package and move the results to the output directory.