
all: build apply start


build:
# @rm -f ./backend/.env
# @echo $(NEXT_PUBLIC_DB_NAME_DEV);
# @cat .env > ./backend/.env
	minikube image build -t node-probe ./Application;
	minikube image ls


apply:
	kubectl create secret generic my-db-secret --from-env-file=.env --dry-run=client -o yaml | kubectl apply -f -
	kubectl apply -f ./kube-entities.yaml


start:
	sudo service nginx start;
	./nginx.fresh.sh


restart:
	kubectl replace --force -f ./kube-entities.yaml


stop:
	sudo service nginx stop


logs:
	kubectl logs --selector app=first-app --v=3
#tail -f /var/log/nginx/access.log
#tail -f /var/log/nginx/error.log
#kubectl logs postgresql-db-0


healthz:
	kubectl describe pods first-ap


delete:
	minikube delete --all;
	# kubectl delete all,ingress --all

# ifneq (,$(wildcard ./.env))
#     include .env
#     export
# endif

# createsecret: SHELL:= /bin/zsh
# createsecret:
# 	@/var/lib/snapd/snap/bin/microk8s.kubectl create secret docker-registry docker-credentials \
# 	--docker-username=$(DOCKER_USERNAME1) \
# 	--docker-password=$(DOCKER_PASSWORD1) \
# 	--docker-email=$(DOCKER_EMAIL1) \
# 	--docker-server=$(DOCKER_SERVER1);

# 	minikube tunnel --bind-address='0.0.0.0'

# stop:
# 	sudo kill -9 $(sudo ps aux | grep 'minikube tunnel --bind-address' | awk '{print $2}')
