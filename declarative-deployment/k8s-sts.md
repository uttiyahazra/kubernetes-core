#### Illustration of Kubernetes StatefulSet tenets

A StatefulSet in Kubernetes is a workload API object used to manage stateful applications, which guarantees about the ordering and uniqueness of pods, making it ideal for applications that require stable network identities, persistent storage, or ordered deployment and scaling.

##### Ordered Deployment and Scaling

We have created the Headless Service _k8s-sts-service_ as pre-requisite of the StatefulSet _k8s-sts-statefulset_. Afterwards the StatefulSet was created with below command:

```bash
$ kubectl apply -f k8s-sts.yaml -n kube-core
statefulset.apps/k8s-sts-statefulset configured
```
In order to monitor the ordered creation of pods in ordinal order, we executed the bash script parallel to the creation of StatefulSet which illustrated the ordered creation as follows:

```bash
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   0/1     ContainerCreating   0          1s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   0/1     ContainerCreating   0          3s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   0/1     ContainerCreating   0          4s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   0/1     ContainerCreating   0          5s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   0/1     Running   0          6s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   0/1     Running   0          8s
...
...
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          31s
k8s-sts-statefulset-1   0/1     Pending   0          1s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          32s
k8s-sts-statefulset-1   0/1     ContainerCreating   0          2s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          34s
k8s-sts-statefulset-1   0/1     ContainerCreating   0          4s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          35s
k8s-sts-statefulset-1   0/1     ContainerCreating   0          5s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          36s
k8s-sts-statefulset-1   0/1     ContainerCreating   0          6s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          37s
k8s-sts-statefulset-1   0/1     Running   0          7s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          39s
k8s-sts-statefulset-1   0/1     Running   0          9s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          40s
k8s-sts-statefulset-1   0/1     Running   0          10s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          41s
k8s-sts-statefulset-1   1/1     Running   0          11s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          43s
k8s-sts-statefulset-1   1/1     Running   0          13s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          44s
k8s-sts-statefulset-1   1/1     Running   0          14s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          45s
k8s-sts-statefulset-1   1/1     Running   0          15s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          46s
k8s-sts-statefulset-1   1/1     Running   0          16s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          48s
k8s-sts-statefulset-1   1/1     Running   0          18s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          50s
k8s-sts-statefulset-1   1/1     Running   0          20s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          51s
k8s-sts-statefulset-1   1/1     Running   0          21s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          52s
k8s-sts-statefulset-1   1/1     Running   0          22s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          54s
k8s-sts-statefulset-1   1/1     Running   0          24s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          55s
k8s-sts-statefulset-1   1/1     Running   0          25s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          56s
k8s-sts-statefulset-1   1/1     Running   0          26s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          57s
k8s-sts-statefulset-1   1/1     Running   0          27s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          59s
k8s-sts-statefulset-1   1/1     Running   0          29s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          60s
k8s-sts-statefulset-1   1/1     Running   0          30s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          61s
k8s-sts-statefulset-1   1/1     Running             0          31s
k8s-sts-statefulset-2   0/1     ContainerCreating   0          1s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          62s
k8s-sts-statefulset-1   1/1     Running             0          32s
k8s-sts-statefulset-2   0/1     ContainerCreating   0          2s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          64s
k8s-sts-statefulset-1   1/1     Running             0          34s
k8s-sts-statefulset-2   0/1     ContainerCreating   0          4s
NAME                    READY   STATUS              RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running             0          65s
k8s-sts-statefulset-1   1/1     Running             0          35s
k8s-sts-statefulset-2   0/1     ContainerCreating   0          5s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          66s
k8s-sts-statefulset-1   1/1     Running   0          36s
k8s-sts-statefulset-2   0/1     Running   0          6s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          68s
k8s-sts-statefulset-1   1/1     Running   0          38s
k8s-sts-statefulset-2   0/1     Running   0          8s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          69s
k8s-sts-statefulset-1   1/1     Running   0          39s
k8s-sts-statefulset-2   0/1     Running   0          9s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          70s
k8s-sts-statefulset-1   1/1     Running   0          40s
k8s-sts-statefulset-2   0/1     Running   0          10s
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          71s
k8s-sts-statefulset-1   1/1     Running   0          41s
k8s-sts-statefulset-2   1/1     Running   0          11s
```
In this illustrations, as we specified _replicas: 3_ and didn"t expressly specified a custom _.spec.ordinals.start_ , the pods are understandably created from 0 to 2. It can be observed from above sequential creation of pods that until the predecessor pod was up & running the creation of next pod wasn't proceeded with as the default pod management policy was _OrderedReady_ and not expressly defined as _Parallel_ in StatefulSet manifest.

Similarly, a downscaling to 0 was issued for the StatefulSet and the ordered termination was observed as follows:

```bash
$ kubectl scale statefulset k8s-sts-statefulset --replicas=0 -n kube-core
statefulset.apps/k8s-sts-statefulset scaled
```

At an event of downscaling, the termination of pods are in reverse ordinal order and until the successor pod is completely terminated, the predeceddor pod termination isn't initiated for default pod management policy:

```bash
NAME                    READY   STATUS    RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running   0          2m21s
k8s-sts-statefulset-1   1/1     Running   0          111s
k8s-sts-statefulset-2   1/1     Running   0          81s
NAME                    READY   STATUS        RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running       0          2m22s
k8s-sts-statefulset-1   1/1     Running       0          112s
k8s-sts-statefulset-2   1/1     Terminating   0          82s
NAME                    READY   STATUS        RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running       0          2m23s
k8s-sts-statefulset-1   1/1     Running       0          113s
k8s-sts-statefulset-2   0/1     Terminating   0          83s
NAME                    READY   STATUS        RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running       0          2m25s
k8s-sts-statefulset-1   1/1     Terminating   0          115s
NAME                    READY   STATUS        RESTARTS   AGE
k8s-sts-statefulset-0   1/1     Running       0          2m26s
k8s-sts-statefulset-1   0/1     Terminating   0          116s
NAME                    READY   STATUS        RESTARTS   AGE
k8s-sts-statefulset-0   0/1     Terminating   0          2m27s
```

##### Rolling Update

In order to illustrate the Rolling Update feature, we first observed the Pod status with old container image version by executing following command:

```bash
kubectl get pods -n kube-core  -o custom-columns='POD NAME:.metadata.name,NAMESPACE:.metadata.namespace,IMAGES:.spec.containers[*].image,STATUS:.status.phase'

POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.21   Running
```

In order to observe the rolling update events, we then patched the container image version to a newer version using following command:

```bash
kubectl patch statefulset k8s-sts-statefulset --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"registry.k8s.io/nginx-slim:0.24"}]'
```
We observed the subsequent rolling updates of respective Pods which followed a reverse oridnal order as follows:

```bash
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.21   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.21   Succeeded
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.21   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.24   Pending
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
POD NAME                NAMESPACE   IMAGES                            STATUS
k8s-sts-statefulset-0   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-1   kube-core   registry.k8s.io/nginx-slim:0.24   Running
k8s-sts-statefulset-2   kube-core   registry.k8s.io/nginx-slim:0.24   Running
```
###### Important Considerations

Please note that, in our StatefulSet manifest, the _minReadySeconds: 10_ is configured which implies that during the rolling update after the Pod becomes ready, the K8s willa dd additional 10 Seconds to mark the Pod as fully available and proceeding to the preceeding pod to enforce the RollingUpdate. The _podManagementPolicy_ with _OrderedReady_ renders this behaviour perfectly, whereas the _Parallel_ value with paralleled partitioned rolling update is not verified in current course.

It is also worth noticing that, we have the value _maxUnavailable: 2_ set in current example which allows the rolling upgrade to be effective to at most 1 Pod simultaneously.
