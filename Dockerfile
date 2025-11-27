FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl git make rlwrap python3 python3-pip openjdk-17-jdk \
    sudo ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER=${NB_USER}
ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh \
    && chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh

RUN pip3 install --no-cache-dir jupyterlab

RUN clojure -Ttools install \
    io.github.clojupyter/clojupyter \
    '{:git/tag "v0.3.5"}' :as clojupyter \
    && clojure -Tclojupyter install

USER ${NB_USER}
WORKDIR ${HOME}

ENV PATH="${HOME}/.local/bin:${PATH}"
