# mlops-dockerize-deploy-flask-to-k8s-with-helm

from https://www.youtube.com/watch?v=SdTzwYmsgoU&t=3790s

1. Installing Python 3.x
2. Creating Python Virtual Env

```bash
python -m venv venv
venv\Scripts\activate
pip install Flask
```

3. Installing Python VS Code Extension
4. Sample Flask Application
5. Jinja templating for dynamic web pages
6. Using Pip to freeze python dependencies

```bash
pip freeze > requirement.txt
```

7. Building the docker images using Dockerfile

```bash
docker build -t webapp:1.0 .
docker run -it -p 5000:5000  webapp:1.0
```

8. Writing Docker compose file

```bash
docker compose build
docker-compose up -d
docker-compose down
```

9. Writing Kubernetes Manifest files for the application

```
kubectl apply -f .\deployment.yml
kubectl get pod
kubectl apply -f .\service.yml
kubectl get service
```

### Exploring Your App

Pods are running in an isolated, private network - so we need to proxy access to them so we can debug and interact with them. To do this, we'll use the kubectl proxy command to run a proxy in a second terminal window.

```bash
kubectl proxy
```

```bash
# The url is the route to the API of the Pod.
curl http://localhost:8001/api/v1/namespaces/default/pods/python-webapp-5cc9947b56-vj76f/proxy/
# View the container logs
kubectl logs python-webapp-5cc9947b56-vj76f
# Step 4 Executing command on the container
kubectl exec python-webapp-5cc9947b56-4j7m6 -- env
kubectl exec -ti python-webapp-5cc9947b56-4j7m6 -- sh
apk add --update curl
curl localhost:5000
```

### Expose App

kubectl port-forward service/web-service 8000:5000
minikube service web-service --url

10. Creating Helm Chart

```bash
helm create webapp
helm template webapp
helm install web webapp/
helm list
kubectl port-forward service/web-webapp 5050:5000
minikube service web-webapp --url
helm uninstall web
```
