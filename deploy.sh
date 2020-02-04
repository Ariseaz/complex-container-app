docker build -t adenijiazeez/multi-client -f ./client/Dockerfile ./client
docker build -t adenijiazeez/multi-server -f ./server/Dockerfile ./server
docker build -t adenijiazeez/multi-worker -f ./worker/Dockerfile ./worker

docker push adenijiazeez/multi-client
docker push adenijiazeez/multi-server
docker push adenijiazeez/multi-worker

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=adenijiazeez/multi-server