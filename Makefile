
# DATADIR=\/opt/backup/


	# @echo "Free HDD space: `df -h /home|tail -n1|awk '{print $4}'`";

#http://192.168.1.71/path_pizza
#http://192.168.1.71/path_soup
#http://192.168.1.71/path_omelet


dockercreate: SHELL:=/bin/bash
dockercreate:
	@docker build ./Node -t cloud.canister.io:5000/theegid/sample
	@docker push cloud.canister.io:5000/theegid/sample


all: SHELL:=/bin/bash
all: run info


run: SHELL:=/bin/bash
run:
	@echo "Start! `date +%F--%H-%M`";	
	@kubectl apply -f ./Application;
	@sleep 1;
	@echo "Finished!";


info: SHELL:=/bin/bash
info:
	@kubectl get svc,deploy,ingress,rs,po; 



