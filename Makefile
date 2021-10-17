
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# DATADIR=\/opt/backup/

# @echo "Free HDD space: `df -h /home|tail -n1|awk '{print $4}'`";

#http://192.168.1.71/path_pizza
#http://192.168.1.71/path_soup
#http://192.168.1.71/path_omelet
#http://192.168.1.71/path_apple


createsecret: SHELL:=/bin/bash
createsecret:
	@kubectl create secret docker-registry docker-credentials \
	--docker-username=$(DOCKER_USERNAME1) \
	--docker-password=$(DOCKER_PASSWORD1) \
	--docker-email=$(DOCKER_EMAIL1) \
	--docker-server=$(DOCKER_SERVER1);


dockercreate: SHELL:=/bin/bash
dockercreate:
	@docker build ./Node -t cloud.canister.io:5000/theegid/sample;
	@docker push cloud.canister.io:5000/theegid/sample;


all: SHELL:=/bin/bash
all: run info


run: SHELL:=/bin/bash
run:
	@echo "Start! `date +%F--%H-%M`";

	@sudo mkdir -p /opt/MOUNTPOINT/path_apple/;
	@sudo sh -c "echo '<!DOCTYPE html><H1> Hello from K8 storage</H1>' > /opt/MOUNTPOINT/path_apple/index.html";

	@sleep 1;
	@kubectl apply -f ./Application;

	@echo "Finished!";


info: SHELL:=/bin/bash
info:
	@kubectl get svc,deploy,ingress,rs,po; 


clear: SHELL:=/bin/bash
clear:
	@kubectl delete -f ./Application;

