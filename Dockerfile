FROM jupyter/base-notebook:da2c5a4d00fa
COPY environment.yml /home/jovyan/environment.yml
RUN conda env update -n root --file /home/jovyan/environment.yml && \
    conda clean -tipsy
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
