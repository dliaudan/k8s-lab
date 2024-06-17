# How to download 

helm repo add bitnami https://charts.bitnami.com/bitnami --kubeconfig=<kubeconfig/path>
helm repo update --kubeconfig=<kubeconfig/path>

# How to install

helm install my-kafka bitnami/kafka --kubeconfig=<kubeconfig/path>

# How to verify

kubectl --kubeconfig=<kubeconfig/path> get all -l app.kubernetes.io/name=kafka

--kubeconfig=C:\Users\delam\AppData\Roaming\Lens\kubeconfigs\ac5cbc07-9286-4644-9626-d5406a6c0c4b