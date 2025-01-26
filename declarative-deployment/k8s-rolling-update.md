```bash
$ kubectl apply -f k8s-rolling-update.yaml -n kube-core
deployment.apps/k8s-rolling-update-deployment created

$ kubectl get po -n kube-core
NAME                                             READY   STATUS    RESTARTS   AGE
k8s-rolling-update-deployment-75fd849485-2znhq   1/1     Running   0          46s
k8s-rolling-update-deployment-75fd849485-c9xsc   1/1     Running   0          46s
k8s-rolling-update-deployment-75fd849485-jzgrl   1/1     Running   0          46s

kubectl set image deployment/k8s-rolling-update-deployment k8s-rolling-update-app-container=nginx:latest -n kube-core
deployment.apps/k8s-rolling-update-deployment image updated



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


 kubectl rollout undo  deployment/k8s-rolling-update-deployment -n kube-core 
deployment.apps/k8s-rolling-update-deployment rolled back

NAME                                             READY   STATUS        RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   0/1     Pending       0          0s
k8s-rolling-update-deployment-6754f968c6-p66hl   0/1     Pending       0          0s
k8s-rolling-update-deployment-6f9f9f7b5f-ms6bq   1/1     Running       0          3m16s
k8s-rolling-update-deployment-6f9f9f7b5f-sgtp8   1/1     Terminating   0          3m15s
k8s-rolling-update-deployment-6f9f9f7b5f-w4pj8   1/1     Running       0          3m16s
NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   0/1     Pending             0          2s
k8s-rolling-update-deployment-6754f968c6-j9vzq   0/1     Pending             0          1s
k8s-rolling-update-deployment-6754f968c6-p66hl   0/1     ContainerCreating   0          2s
k8s-rolling-update-deployment-6f9f9f7b5f-ms6bq   1/1     Running             0          3m18s
k8s-rolling-update-deployment-6f9f9f7b5f-sgtp8   1/1     Terminating         0          3m17s
k8s-rolling-update-deployment-6f9f9f7b5f-w4pj8   1/1     Running             0          3m18s
NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   0/1     Pending             0          3s
k8s-rolling-update-deployment-6754f968c6-j9vzq   0/1     ContainerCreating   0          2s
k8s-rolling-update-deployment-6754f968c6-p66hl   0/1     ContainerCreating   0          3s
k8s-rolling-update-deployment-6f9f9f7b5f-ms6bq   1/1     Running             0          3m19s
k8s-rolling-update-deployment-6f9f9f7b5f-sgtp8   0/1     Terminating         0          3m18s
k8s-rolling-update-deployment-6f9f9f7b5f-w4pj8   1/1     Running             0          3m19s
NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   0/1     Pending             0          5s
k8s-rolling-update-deployment-6754f968c6-j9vzq   0/1     ContainerCreating   0          4s
k8s-rolling-update-deployment-6754f968c6-p66hl   0/1     ContainerCreating   0          5s
k8s-rolling-update-deployment-6f9f9f7b5f-ms6bq   1/1     Running             0          3m21s
k8s-rolling-update-deployment-6f9f9f7b5f-sgtp8   0/1     Terminating         0          3m20s
k8s-rolling-update-deployment-6f9f9f7b5f-w4pj8   1/1     Running             0          3m21s
NAME                                             READY   STATUS        RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   0/1     Pending       0          6s
k8s-rolling-update-deployment-6754f968c6-j9vzq   1/1     Running       0          5s
k8s-rolling-update-deployment-6754f968c6-p66hl   1/1     Running       0          6s
k8s-rolling-update-deployment-6f9f9f7b5f-ms6bq   1/1     Terminating   0          3m22s
k8s-rolling-update-deployment-6f9f9f7b5f-w4pj8   1/1     Terminating   0          3m22s
NAME                                             READY   STATUS        RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   0/1     Pending       0          7s
k8s-rolling-update-deployment-6754f968c6-j9vzq   1/1     Running       0          6s
k8s-rolling-update-deployment-6754f968c6-p66hl   1/1     Running       0          7s
k8s-rolling-update-deployment-6f9f9f7b5f-ms6bq   0/1     Terminating   0          3m23s
k8s-rolling-update-deployment-6f9f9f7b5f-w4pj8   0/1     Terminating   0          3m23s
NAME                                             READY   STATUS              RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   0/1     ContainerCreating   0          9s
k8s-rolling-update-deployment-6754f968c6-j9vzq   1/1     Running             0          8s
k8s-rolling-update-deployment-6754f968c6-p66hl   1/1     Running             0          9s
NAME                                             READY   STATUS    RESTARTS   AGE
k8s-rolling-update-deployment-6754f968c6-9xnpd   1/1     Running   0          10s
k8s-rolling-update-deployment-6754f968c6-j9vzq   1/1     Running   0          9s
k8s-rolling-update-deployment-6754f968c6-p66hl   1/1     Running   0          10s

```