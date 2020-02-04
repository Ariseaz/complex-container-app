docker build -t adenijiazeez/multi-client:latest -t adenijiazeez/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t adenijiazeez/multi-server:latest -t adenijiazeez/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t adenijiazeez/multi-worker:latest -t adenijiazeez/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push adenijiazeez/multi-client:latest
docker push adenijiazeez/multi-server:latest
docker push adenijiazeez/multi-worker:latest

docker push adenijiazeez/multi-client:$SHA
docker push adenijiazeez/multi-server:$SHA
docker push adenijiazeez/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=adenijiazeez/multi-server:$SHA
kubectl set image deployments/client-deployment client=adenijiazeez/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=adenijiazeez/multi-worker:$SHA