# spinnaker development

## Overview

Scripting out most of the path to development on the moving parts for spinnaker.

After following the [`Setup`](#setup), the necessary repositories will be available in `spinnaker-development/repos/*`

## Setup

- Install kubectl 
  - https://kubernetes.io/docs/tasks/tools/install-kubectl/
- Install minikube 
  - https://kubernetes.io/docs/tasks/tools/install-minikube/
- Install helm 
  - https://docs.helm.sh/using_helm/#installing-helm
- Start local kubernetes cluster 
  - `minikube start --memory 4096 --cpus 4`
  - `helm init`
- Configure and deploy Spinnaker to cluster
  - `curl -Lo values.yaml https://raw.githubusercontent.com/kubernetes/charts/master/stable/spinnaker/values.yaml`
  - `helm install -n kubelive stable/spinnaker -f values.yaml --timeout 600 --namespace spinnaker`
  - New terminal: 
    - `export DECK_POD=$(kubectl get pods --namespace spinnaker -l "component=deck,app=kubelive-spinnaker" -o jsonpath="{.items[0].metadata.name}")`
    - `kubectl port-forward --namespace spinnaker $DECK_POD 9000`
    - Browser: Open `http://127.0.0.1:9000`
  - New terminal: 
    - `export JENKSINS_POD=$(kubectl get pods --namespace spinnaker -l "component=kubelive-jenkins-master" -o jsonpath="{.items[0].metadata.name}")`
    - `kubectl port-forward --namespace spinnaker $JENKSINS_POD 8080`
    - Browser: Open `http://127.0.0.1:8080`

## Links

- [`Setup - Local via Docker`](https://www.spinnaker.io/setup/install/halyard/#docker)
- [`Setup - Local git config`](https://www.spinnaker.io/setup/install/environment/#local-git)
- https://thenewstack.io/getting-started-spinnaker-kubernetes/
- [`Life of a bake`](https://www.spinnaker.io/reference/architecture/loab/)
- [`Life of a deployment`](https://www.spinnaker.io/reference/architecture/load/)
