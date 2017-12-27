## tensorflow_model_server

Dockerized tensorflow_model_server

**Pull Image**

```
docker pull gauravchl/tensorflow_model_server
```

**Run Container**

```
docker run -d \
  --name tensorflow_model_server \
  -v ${PATH_TO_SAVED_MODEL}:/model \
  -e MODEL_NAME=${MODEL_NAME} \
  -p 9000:9000 \
  gauravchl/tensorflow_model_server
```
 - Above command will start docker container named 'tensorflow_model_server' and will be accessed from port 9000

 - Run following command to show the logs: `docker logs -f tensorflow_model_server`


 - Make sure to replace `${PATH_TO_SAVED_MODEL}` and `${MODEL_NAME}` with your own data, Example:

  ```
  docker run -d \
    --name tensorflow_model_server \
    -v /Users/om/imagenet-model/:/model \
    -e MODEL_NAME=imagenet \
    -p 9000:9000 \
    gauravchl/tensorflow_model_server
  ```

**Stop Container**

```
docker stop tensorflow_model_server
```

**Remove Container**

```
docker rm tensorflow_model_server
```

**Build Image**

```
# Build locally from tensorflow_model_server/
docker build -t gauravchl/tensorflow_model_server .

# Build from repo
docker build github.com/gauravchl/tensorflow_model_server
```
