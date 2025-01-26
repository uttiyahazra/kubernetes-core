#### Illustration of Kubernetes Rolling Update Deployment Strategy

Rolling Update is Kubernetes default deployment strategy which ensures the application pods are updated gradually and by incrementally replacing the old pods which causes minimal or almost no downtime.

In order to illustrate the same, we have applied a kubernetes deployment (manifest is part of repository) with the following command:

```bash
$ kubectl apply -f k8s-rolling-update.yaml -n kube-core
deployment.apps/k8s-rolling-update-deployment created
```

Afterwards, we checked the deployed pod's status as follows:

```bash
$ kubectl get po -n kube-core
NAME                                             READY   STATUS    RESTARTS   AGE
k8s-rolling-update-deployment-75fd849485-2znhq   1/1     Running   0          46s
k8s-rolling-update-deployment-75fd849485-c9xsc   1/1     Running   0          46s
k8s-rolling-update-deployment-75fd849485-jzgrl   1/1     Running   0          46s
```
In any iteration of this illustration, the following command can be used to determine the correct container image version in the pods:

```bash
kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}'
```

Now, we have patched the deployment's image to latest version to exemplify the sequence of events that take place in course of rolling update deployment:

```bash
kubectl set image deployment/k8s-rolling-update-deployment k8s-rolling-update-app-container=nginx:latest -n kube-core
deployment.apps/k8s-rolling-update-deployment image updated
```
With the above command execution, immediately the shell script _pod-status-check.sh_ was executed to closely monitor the events associated with rolling update, which shows the status of pods with an interval of 1 seconds, the statuses can be visualized as below:

```bash
NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9x4vv   1/1     Running             0          32s
k8s-rolling-update-deployment-6754f968c6-dgbz5   1/1     Terminating         0          32s
k8s-rolling-update-deployment-6754f968c6-r29kr   1/1     Running             0          31s
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   0/1     ContainerCreating   0          2s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   0/1     Pending             0          1s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   0/1     Pending             0          1s

NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9x4vv   1/1     Running             0          33s
k8s-rolling-update-deployment-6754f968c6-r29kr   1/1     Running             0          32s
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   0/1     ContainerCreating   0          3s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   0/1     ContainerCreating   0          2s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   0/1     Pending             0          2s

NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9x4vv   1/1     Running             0          35s
k8s-rolling-update-deployment-6754f968c6-r29kr   1/1     Running             0          34s
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   0/1     ContainerCreating   0          5s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   0/1     ContainerCreating   0          4s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   0/1     Pending             0          4s

NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9x4vv   1/1     Running             0          36s
k8s-rolling-update-deployment-6754f968c6-r29kr   1/1     Terminating         0          35s
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   1/1     Running             0          6s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   0/1     ContainerCreating   0          5s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   0/1     Pending             0          5s

NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9x4vv   1/1     Terminating         0          37s
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   1/1     Running             0          7s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   1/1     Running             0          6s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   0/1     ContainerCreating   0          6s

NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9x4vv   0/1     Terminating         0          39s
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   1/1     Running             0          9s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   1/1     Running             0          8s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   0/1     ContainerCreating   0          8s

NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   1/1     Running             0          10s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   1/1     Running             0          9s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   0/1     ContainerCreating   0          9s

NAME                                             READY   STATUS    RESTARTS   AGE
k8s-rolling-update-deployment-6f9f9f7b5f-9lr47   1/1     Running   0          11s
k8s-rolling-update-deployment-6f9f9f7b5f-kxbz2   1/1     Running   0          10s
k8s-rolling-update-deployment-6f9f9f7b5f-pns44   1/1     Running   0          10s
```
Upon closer inspection of above rolling update it can be noticed, the additional number of pods which was created during update process equals to _maxSurge_ paramater and the maximum unavailable number of pods in this case equals to _maxUnavailable_ parameter as defined in deployment manifest.

Now, optionally the following command can be executed to rollback the deployment to its previous image version and if the above shell script is simaultaneously executed, the same occurrence of events can again be noticed:

```bash
kubectl rollout undo  deployment/k8s-rolling-update-deployment -n kube-core 
deployment.apps/k8s-rolling-update-deployment rolled back
```