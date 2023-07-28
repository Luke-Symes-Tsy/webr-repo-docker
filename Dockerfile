ARG WEBR_VERSION=v0.1.1
FROM georgestagg/webr-build:${WEBR_VERSION}

# Setup Node, Emscripten & webR
ENV PATH /opt/emsdk:/opt/emsdk/upstream/emscripten:$PATH
ENV EMSDK /opt/emsdk
ENV NVM_DIR /opt/nvm
ENV WEBR_ROOT /opt/webr

# Set CRAN repo
COPY <<EOF /root/.Rprofile
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cran.rstudio.com"
  options(repos = r)
})
EOF

# Install support packages
RUN ${WEBR_ROOT}/host/R-$(cat ${WEBR_ROOT}/R/R-VERSION)/bin/R \
  -e 'install.packages(c("rlang", "pkgdepends", "zip", "pak"))'

# Install patched Matrix package
RUN ${WEBR_ROOT}/host/R-$(cat ${WEBR_ROOT}/R/R-VERSION)/bin/R \
  -e 'pak::pkg_install("r-wasm/Matrix@webr")'

# Download webr-repo
ARG WEBR_REPO_VERSION=main
RUN git clone --depth 1 --branch ${WEBR_REPO_VERSION} \
  https://github.com/r-wasm/webr-repo.git /opt/webr-repo

# Build packages
CMD . ${NVM_DIR}/nvm.sh \
  && export EM_NODE_JS=${NVM_BIN}/node \
  && export R_HOST="${WEBR_ROOT}/host/R-$(cat ${WEBR_ROOT}/R/R-VERSION)" \
  && cd /opt/webr-repo \
  && make WEBR_ROOT=${WEBR_ROOT} R_HOST=${R_HOST}

