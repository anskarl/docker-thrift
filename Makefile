THRIFT_VERSION ?= 0.10.0

TAG=anskarl/thrift:$(THRIFT_VERSION)

CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

image:
	@echo "Creating docker image with tag $(TAG)"
	docker build --build-arg ARG_THRIFT_VERSION=$(THRIFT_VERSION) -t $(TAG) -f $(CURRENT_DIR)/Dockerfile .

clean:	
	@echo "Deleting docker image tagged as $(TAG)"
	docker rmi $(TAG)

push: image
	@echo "Pushing docker image $(TAG) to Docker Hub registry"
	docker push $(TAG)
