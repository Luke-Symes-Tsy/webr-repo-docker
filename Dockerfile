ARG WEBR_VERSION=v0.1.1
FROM georgestagg/webr-build:${WEBR_VERSION}

# Setup Node, Emscripten & webR
ENV PATH /opt/emsdk:/opt/emsdk/upstream/emscripten:$PATH
ENV EMSDK /opt/emsdk
ENV NVM_DIR /opt/nvm
ENV WEBR_ROOT /opt/webr

# Install system packages for building host R packages
COPY ppm/ppm-setup-linux-jammy.sh /root/ppm-setup-linux-jammy.sh
RUN chmod +x /root/ppm-setup-linux-jammy.sh
RUN apt update && /root/ppm-setup-linux-jammy.sh && apt clean

# Set CRAN repo
COPY <<EOF /root/.Rprofile
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cran.rstudio.com"
  options(repos = r)
  options(host_binary_repo =
    "https://packagemanager.posit.co/cran/__linux__/jammy/latest"
  )
  options(HTTPUserAgent = sprintf(
    "R/%s R (%s)",
    getRversion(),
    paste(
      getRversion(),
      R.version["platform"],
      R.version["arch"],
      R.version["os"]
    )
  ))
})
EOF

# Install support packages
RUN ${WEBR_ROOT}/host/R-$(cat ${WEBR_ROOT}/R/R-VERSION)/bin/R \
  -e 'install.packages(c("rlang", "pkgdepends", "zip", "pak"), \
  repos=options("host_binary_repo"))'

# Install patched Matrix package
RUN ${WEBR_ROOT}/host/R-$(cat ${WEBR_ROOT}/R/R-VERSION)/bin/R \
  -e 'pak::pkg_install("r-wasm/Matrix@webr-0.2.0")'

# Download webr-repo
ARG WEBR_REPO_VERSION=main
ADD "https://api.github.com/repos/r-wasm/webr-repo/commits?sha=${WEBR_REPO_VERSION}&per_page=1" latest_commit
RUN git clone --depth 1 --branch ${WEBR_REPO_VERSION} \
  https://github.com/r-wasm/webr-repo.git /opt/webr-repo

# Build packages
CMD . ${NVM_DIR}/nvm.sh \
  && export EM_NODE_JS=${NVM_BIN}/node \
  && export R_HOST="${WEBR_ROOT}/host/R-$(cat ${WEBR_ROOT}/R/R-VERSION)" \
  && cd /opt/webr-repo \
  && make WEBR_ROOT=${WEBR_ROOT} R_HOST=${R_HOST}

