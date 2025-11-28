FROM simplect/clojupyter:0.2.2

USER root

RUN python3 -m pip install --no-cache-dir notebook jupyterlab

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV NB_USER=${NB_USER}
ENV NB_UID=${NB_UID}
ENV HOME=/home/${NB_USER}

WORKDIR ${HOME}

RUN mkdir -p ${HOME}/sicp-solutions

COPY . ${HOME}/sicp-solutions

RUN chown -R ${NB_UID} ${HOME}/sicp-solutions

USER ${NB_USER}
WORKDIR ${HOME}/sicp-solutions
