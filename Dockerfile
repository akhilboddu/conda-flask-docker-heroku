FROM continuumio/miniconda3

# Copy all local files into the image.
COPY . .

RUN conda list -e > environment.yml

ADD environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml

RUN echo "source activate flask-app" > ~/.bashrc
ENV PATH /opt/conda/envs/flask-app/bin:$PATH

EXPOSE 5000

CMD [ "python", "api.py" ]


