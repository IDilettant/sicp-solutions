FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl git make rlwrap python3 python3-pip openjdk-21-jdk \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh \
    && chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh

RUN pip3 install --no-cache-dir jupyterlab

RUN clojure -Ttools install io.github.clojupyter/clojupyter '{:git/tag "v0.3.5"}' :as clojupyter \
    && clojure -Tclojupyter install

WORKDIR /home/jovyan/work
