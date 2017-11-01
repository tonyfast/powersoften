FROM jupyter/scipy-notebook:da2c5a4d00fa

# handle non-project deps
RUN conda install -n root git

# ARG ANTLR_VERSION=4.7
# RUN wget http://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar

COPY environment.yml /home/jovyan/environment.yml

RUN conda env update -n root --file /home/jovyan/environment.yml && \
    conda clean -tipsy

RUN set -ex && \
  jupyter nbextension install rise --py --sys-prefix && \
  jupyter nbextension enable rise --py --sys-prefix && \
  jupyter nbextension enable ipywebrtc --py --sys-prefix

# do this to get the toolchain
RUN jupyter lab build

COPY ./labextensions/* /home/jovyan/labextensions/

RUN set -ex && \
  jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build && \
  jupyter labextension install file:///home/jovyan/labextensions/jupyter-webrtc-jupyterlab-0.1.0.tgz && \
  jupyter labextension list

# ensure some running environment stuff
# ENV CLASSPATH=".:/${HOME}/antlr-${ANTLR_VERSION}-complete.jar:${CLASSPATH}"
# RUN git clone https://github.com/augustt198/latex2sympy --depth=1
# RUN touch /opt/conda/bin/antlr4 && \
#   chmod 755 /opt/conda/bin/antlr4 && \
#   echo "#!/bin/bash\njava -jar ${HOME}/antlr-${ANTLR_VERSION}-complete.jar \"\$@\"" \
#     >> /opt/conda/bin/antlr4
# RUN more /opt/conda/bin/antlr4
# RUN cd latex2sympy && \
#    antlr4 PS.g4 -o gen

# copy and reown the files
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}


# finally, prepare our stuff
RUN python setup.py develop
