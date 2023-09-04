
all: build apply start


build:
	minikube image build -t node-probe ./Application;
	minikube image ls


apply:
	kubectl apply -f ./kube-entities.yaml


start:
	sudo service nginx start;
	./nginx.fresh.sh


stop:
	sudo service nginx stop


get_ip:
	minikube ip


view_logs:
	kubectl logs --selector app=first-app --v=3
		#tail -f /var/log/nginx/access.log
		#tail -f /var/log/nginx/error.log

healthz:
	kubectl describe pods first-ap


delete:
	minikube delete --all;
	# kubectl delete all,ingress --all



# 	minikube tunnel --bind-address='0.0.0.0'

# stop:
# 	sudo kill -9 $(sudo ps aux | grep 'minikube tunnel --bind-address' | awk '{print $2}')
