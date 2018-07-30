# A Java Upper function to build locally and run with riff 0.1.0 built on the Knative project.

## Set up riff for Knative on Minikube

See [Getting started running on Minikube](https://projectriff.io/docs/getting-started-with-knative-riff-on-minikube/)

## Try a Java function

Check out the project [local-java-upper](https://github.com/trisberg/local-java-upper) and change to the directory you checked it out to.

> To avoid having to push images to DockerHub or another registry you can set your local Docker environment to point to the Minikube one and then use a `dev.local` prefix on the image. As long as the image has a tag and that prefix the Knative serving logic will use the image that is already present on disk in the Minikube Docker daemon environment.

1. Build the function Docker container
    ```bash
    eval $(minikube docker-env)
    mvn clean package
    docker build -t dev.local/upper:0.0.1 .
    ```
1. Create the riff function:
    ```bash
    riff service create upper --image dev.local/upper:0.0.1
    ```

1. See the Knative resources that were created:
    ```bash
    kubectl get service.serving.knative.dev,svc,pod,configurations,revisions,routes,virtualservices
    ```

1. Test the function:
    ```bash
    riff service invoke upper -- -w"\n" -H "Content-Type: text/plain" -d "hello riff and knative"
    ```

1. Finally, delete the function:
    ```bash
    riff service delete upper
    ```
