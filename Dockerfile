FROM jupyter/scipy-notebook:da2c5a4d00fa

RUN conda install -n root git

COPY environment.yml /home/jovyan/environment.yml

RUN conda env update -n root --file /home/jovyan/environment.yml && \
    conda clean -tipsy

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter nbextension install rise --py --sys-prefix
RUN jupyter nbextension enable rise --py --sys-prefix
RUN jupyter nbextension enable ipywebrtc --py --sys-prefix

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN jupyter nbconvert --execute readme.ipynb