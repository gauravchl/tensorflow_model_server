FROM ubuntu:16.04

LABEL maintainer="Gaurav Chikhale"

RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        git \
        python-dev \
        python-pip \
        python-numpy && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

# Install tensorflow model server
RUN echo "deb [arch=amd64] http://storage.googleapis.com/tensorflow-serving-apt stable tensorflow-model-server tensorflow-model-server-universal" | tee /etc/apt/sources.list.d/tensorflow-serving.list

RUN curl https://storage.googleapis.com/tensorflow-serving-apt/tensorflow-serving.release.pub.gpg | apt-key add -
RUN apt-get update && apt-get install tensorflow-model-server

CMD tensorflow_model_server --port=9000 --model_name=$MODEL_NAME --model_base_path=/model
