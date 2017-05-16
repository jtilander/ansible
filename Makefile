IMAGENAME?=jtilander/ansible
TAG?=latest

ifeq (run,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: image push clean run debug

image:
	docker build -t $(IMAGENAME):$(TAG) .
	docker images $(IMAGENAME):$(TAG)

push: image
	docker push $(IMAGENAME):$(TAG)

clean:
	docker rmi `docker images -q $(IMAGENAME):$(TAG)`

run:
	command docker run --rm -it $(IMAGENAME):$(TAG) ansible $(RUN_ARGS)

debug:
	command docker run --rm -it $(IMAGENAME):$(TAG) bash
