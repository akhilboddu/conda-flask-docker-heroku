FROM continuumio/miniconda3

RUN conda list -e > environment.yml

ADD environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml

RUN echo "source activate flask-app" > ~/.bashrc
ENV PATH /opt/conda/envs/flask-app/bin:$PATH

CMD python api.py

EXPOSE 5000
