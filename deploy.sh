#!/bin/sh

docker build -t rhys117/multi-client:latest -t rhys117/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t rhys117/multi-server:latest -t rhys117/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t rhys117/multi-worker:latest -t rhys117/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push rhys117/multi-client:latest
docker push rhys117/multi-server:latest
docker push rhys117/multi-worker:latest

docker push rhys117/multi-client:$SHA
docker push rhys117/multi-server:$SHA
docker push rhys117/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=rhys117/multi-server:$SHA
kubectl set image deployments/client-deployment client=rhys117/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=rhys117/multi-worker:$SHA
