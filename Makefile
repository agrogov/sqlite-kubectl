default: docker_build

DOCKER_IMAGE ?= morgulio/sqlite-kubectl
DOCKER_TAG ?= `git rev-parse --abbrev-ref HEAD`

# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
KUBE_VERSION = "1.19.3"

docker_build:
	@docker buildx build \
	  --build-arg KUBE_VERSION=$(KUBE_VERSION) \
	  -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	  
docker_push:
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
