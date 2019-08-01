https://kubernetes.github.io/ingress-nginx/deploy/#provider-specific-steps

1. Make sure you executed the mandatory generic script.

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
```

2. Execute the provider specific script to enable the service.

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml
```

Notes:

See running.
```
kubectl get pods -n ingress-nginx
```

Stop.
```
kubectl delete https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
```
