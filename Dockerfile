FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl git make rlwrap python3 python3-pip openjdk-17-jdk \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://download.clojure.org/install/linux-install-1.11.1.1413.sh && \
    chmod +x linux-install-1.11.1.1413.sh && \
    ./linux-install-1.11.1.1413.sh && \
    rm linux-install-1.11.1.1413.sh

RUN clojure -P && \
    clojure -Ttools install io.github.clojupyter/clojupyter \
    '{:git/tag "v0.3.5"}' :as clojupyter && \
    clojure -Tclojupyter install

RUN pip3 install --no-cache-dir jupyterlab

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER=${NB_USER}
ENV HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

USER ${NB_USER}
WORKDIR ${HOME}
