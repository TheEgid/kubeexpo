
# DATADIR=\/opt/backup/


	# @echo "Free HDD space: `df -h /home|tail -n1|awk '{print $4}'`";

#http://192.168.1.71/branch_pizza
#http://192.168.1.71/branch_soup

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



