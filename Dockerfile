FROM tensorflow/tensorflow:2.0.0-py3-jupyter
MAINTAINER oliver duerr <oliver.duerr@zhaw.ch>

RUN pip3 --no-cache-dir install \
        ipykernel \
        matplotlib \
        pandas \
        h5py \
        scikit-image \
        seaborn \ 
        sklearn \
        tensorflow-probability==0.8.0\
        tqdm

# For toc in notebook
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN pip3 install jupyter_nbextensions_configurator

# Clean
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/*

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/notebooks"
COPY notebooks /notebooks

COPY run_jupyter_2.sh /
COPY run_jlab.sh /

CMD ["/run_jupyter_2.sh"]
