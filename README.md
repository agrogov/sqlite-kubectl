# sqlite-kubectl
Alpine based docker image with SQLite3 and kubectl

## Run

Example to just run kubectl on entry:
`docker run --rm morgulio/sqlite-kubectl kubectl`
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

Example to just run sqlite3 on entry:
`docker run --rm morgulio/sqlite-kubectl -v ./db_file.db:/root/db_file.db sqlite3 /root/db_file.db`

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:
`docker run -it -v ~/.kube:/root/.kube morgulio/sqlite-kubectl`
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube).

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:
`docker run -it -v ~/.kube:/root/.kube morgulio/sqlite-kubectl`

## Build

For doing a manual local build of the image:
`make docker_build`
