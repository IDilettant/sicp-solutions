FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

RUN apt-get update && \
  && apt-get install -y curl git make rlwrap \
  && rm -rf /var/lib/apt/lists/*

# Java 17
RUN apt-get update && \
  apt-get install -y openjdk-17-jdk && \
  rm -rf /var/lib/apt/lists/*

# Clojure CLI
RUN curl -L https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh \
  -o /tmp/linux-install.sh && \
  chmod +x /tmp/linux-install.sh && \
  /tmp/linux-install.sh && \
  rm /tmp/linux-install.sh

ENV PATH="/usr/local/bin:${PATH}"

USER vscode
WORKDIR /workspaces/sicp-solutions
