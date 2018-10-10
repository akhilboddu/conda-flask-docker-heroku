FROM continuumio/miniconda3

# Copy all local files into the image.
COPY . .

RUN echo "conda env export > environment.yml" > ~/.bashrc

ADD environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml

RUN echo "source activate flask-app" > ~/.bashrc
ENV PATH /opt/conda/envs/flask-app/bin:$PATH

# For dynamic ports for heroku
CMD gunicorn api:app --bind 0.0.0.0:$PORT --reload


