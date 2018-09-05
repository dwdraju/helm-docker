# Docker for executing helm - Built for CI/CD

### Usage

##### Local
```
docker run --rm -v ~/.kube/config:/root/.kube/config dwdraju/helm-docker helm ls
```

##### Gitlab CI/CD
```
get-pods:
  stage: helm-view
  image: dwdraju/helm-docker
  script:
    - echo $KUBE_CONFIG | base64 -d > ${HOME}/.kube/config
    - helm ls
```
