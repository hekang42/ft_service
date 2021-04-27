minikube start --driver=vitualbox
eval $(minikube -p minikube docker-env)

MINIKUBE_IP=$(minikube ip)
sed "s/MINIKUBE_IP/$MINIKUBE_IP/g" ./srcs/metallb/config_format.yaml > ./srcs/metallb/config.yaml

echo "metalLB start"
minikube addons enable metallb
kubectl apply -f metallb-config.yaml
