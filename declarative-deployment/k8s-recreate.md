#### Illustration of Kubernetes Recreate Deployment Strategy

Recreate is Kubernetes deployment strategy which terminates all application pods at once and creates the new pods all at once without ensuring availability of pods.

In order to illustrate the same, we have applied a kubernetes deployment (manifest is part of repository) with the following command:

```bash
$ kubectl apply -f k8s-recreate.yaml -n kube-core
deployment.apps/k8s-recreate-deployment created
```

Afterwards, we checked the deployed pod's status as follows:

```bash
$ kubectl get po -n kube-core
NAME                                       READY   STATUS    RESTARTS   AGE
k8s-recreate-deployment-864d9589ff-7smjc   1/1     Running   0          98s
k8s-recreate-deployment-864d9589ff-csdpz   1/1     Running   0          98s
k8s-recreate-deployment-864d9589ff-k7xnj   1/1     Running   0          98s
```
In any iteration of this illustration, the following command can be used to determine the correct container image version in the pods:

```bash
kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}'
```

Now, we have patched the deployment's image to latest version to exemplify the sequence of events that take place in course of rolling update deployment:

```bash
kubectl set image deployment/k8s-recreate-deployment k8s-recreate-app-container=nginx:latest -n kube-core
deployment.apps/k8s-recreate-deployment image updated
```
With the above command execution, immediately the shell script _pod-status-check.sh_ was executed to closely monitor the events associated with rolling update, which shows the status of pods with an interval of 1 seconds, the statuses can be visualized as below:

```bash
NAME                                       READY   STATUS        RESTARTS   AGE
k8s-recreate-deployment-6fb8f76cc7-6952n   1/1     Terminating   0          71s
k8s-recreate-deployment-6fb8f76cc7-t4x8p   1/1     Terminating   0          71s
k8s-recreate-deployment-6fb8f76cc7-xqnbp   1/1     Terminating   0          71s
NAME                                       READY   STATUS        RESTARTS   AGE
k8s-recreate-deployment-6fb8f76cc7-6952n   1/1     Terminating   0          72s
k8s-recreate-deployment-6fb8f76cc7-t4x8p   1/1     Terminating   0          72s
k8s-recreate-deployment-6fb8f76cc7-xqnbp   1/1     Terminating   0          72s
NAME                                       READY   STATUS        RESTARTS   AGE
k8s-recreate-deployment-6fb8f76cc7-6952n   0/1     Terminating   0          74s
k8s-recreate-deployment-6fb8f76cc7-xqnbp   0/1     Terminating   0          74s
NAME                                       READY   STATUS    RESTARTS   AGE
k8s-recreate-deployment-864d9589ff-7smjc   0/1     Pending   0          0s
k8s-recreate-deployment-864d9589ff-csdpz   0/1     Pending   0          0s
k8s-recreate-deployment-864d9589ff-k7xnj   0/1     Pending   0          0s
NAME                                       READY   STATUS              RESTARTS   AGE
k8s-recreate-deployment-864d9589ff-7smjc   0/1     ContainerCreating   0          1s
k8s-recreate-deployment-864d9589ff-csdpz   0/1     ContainerCreating   0          1s
k8s-recreate-deployment-864d9589ff-k7xnj   0/1     ContainerCreating   0          1s
NAME                                       READY   STATUS              RESTARTS   AGE
k8s-recreate-deployment-864d9589ff-7smjc   0/1     ContainerCreating   0          3s
k8s-recreate-deployment-864d9589ff-csdpz   0/1     ContainerCreating   0          3s
k8s-recreate-deployment-864d9589ff-k7xnj   0/1     ContainerCreating   0          3s
NAME                                       READY   STATUS              RESTARTS   AGE
k8s-recreate-deployment-864d9589ff-7smjc   1/1     Running             0          4s
k8s-recreate-deployment-864d9589ff-csdpz   0/1     ContainerCreating   0          4s
k8s-recreate-deployment-864d9589ff-k7xnj   0/1     ContainerCreating   0          4s
NAME                                       READY   STATUS    RESTARTS   AGE
k8s-recreate-deployment-864d9589ff-7smjc   1/1     Running   0          5s
k8s-recreate-deployment-864d9589ff-csdpz   1/1     Running   0          5s
k8s-recreate-deployment-864d9589ff-k7xnj   1/1     Running   0          5s
```
As it can be noticed, the pods are terminated at once and created all at once without ensuring orderly termination and creation thus guaranteeing no minimum availability.

Now, optionally the following command can be executed to rollback the deployment to its previous image version and if the above shell script is simaultaneously executed, the same occurrence of events can again be noticed:

```bash
kubectl rollout undo  deployment/k8s-rolling-update-deployment -n kube-core 
deployment.apps/k8s-rolling-update-deployment rolled back
```