# webr-repo-docker
A Dockerfile used to create an image with everything needed to build a webR repo from a list of packages.

# Create a webR repo

1. Build the docker image using the command `docker build . --no-cache`.

    a. A specific version of webR can be set by adding the argument `--build-arg WEBR_VERSION=version`. The default value is `v0.1.1`.

    b. A specific branch of the of `r-wasm/webr-repo` git repository can be set by adding the argument `--build-arg WEBR_REPO_VERSION=branch-or-tag-name`. The default value is `main`.

2. Once complete, make note of the resulting image ID or `docker tag` it.

3. Run the docker image to build the webR repo. Be sure to setup volumes so that the repository files are written to the host filesystem, rather than the container:

```
docker run --rm -it -v $(pwd)/repo:/opt/webr-repo/repo -v $(pwd)/lib:/opt/webr-repo/lib tag-or-image-id
```

4. If you'd like to use a custom list of packages, create a file `repo-packages` containing the list, one package name per line, then map the file to the docker container by adding,

```
-v $(pwd)/repo-packages:/opt/webr-repo/repo-packages
```

to the volume arguments of the above `docker run` command.
