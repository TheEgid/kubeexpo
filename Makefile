
all: build apply start


build:
# rm -f ./.env
# cat ./Application/.env > ./.env
# echo $(NEXT_PUBLIC_DB_NAME_DEV);
	kubectl create secret generic my-db-secret --from-env-file=./Application/.env --dry-run=client -o yaml | kubectl apply -f -
	minikube image build -t node-js-app-container ./Application;
	minikube image build -t postgres-db-container ./Postgres;
	minikube image ls


apply:
	kubectl create secret generic my-db-secret --from-env-file=./Application/.env --dry-run=client -o yaml | kubectl apply -f -
	kubectl apply -f ./kube-entities.yaml


start:
	sudo service nginx start;
	./nginx.fresh.sh


restart:
	kubectl replace --force -f ./kube-entities.yaml


stop:
	sudo service nginx stop


logs:
	kubectl logs --selector app=node-js-app --v=3
#tail -f /var/log/nginx/access.log
#tail -f /var/log/nginx/error.log
#kubectl logs postgresql-db-0


healthz:
	kubectl describe pods node-js-app


delete:
	minikube delete --all;
	# kubectl delete all,ingress --all


k9s:
	k9s


# 	minikube tunnel --bind-address='0.0.0.0'

# stop:
# 	sudo kill -9 $(sudo ps aux | grep 'minikube tunnel --bind-address' | awk '{print $2}')
