FROM ubuntu:22.04

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER=${NB_USER}
ENV HOME=/home/${NB_USER}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl git make rlwrap python3 python3-pip openjdk-17-jdk-headless \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh \
    && chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh

RUN pip3 install --no-cache-dir jupyterlab

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER ${NB_USER}
WORKDIR ${HOME}

RUN clojure -Sdeps '{:deps {io.github.clojupyter/clojupyter {:mvn/version "0.3.5"}} \
    :mvn/repos {"central" {:url "https://repo1.maven.org/maven2/"} \
    "clojars" {:url "https://repo.clojars.org"}}}' \
    -m clojupyter.cmdline install

COPY . ${HOME}
