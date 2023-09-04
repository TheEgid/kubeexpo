#!/bin/bash

source_config="./nginx.conf"
nginx_config_dir="/etc/nginx"

backup_config="$nginx_config_dir/nginx.conf.backup"

minikube_ip=$(minikube ip)

if [ ! -f "$source_config" ]; then
    echo "Ошибка: Исходный файл конфигурации Nginx не найден."
    exit 1
fi

sudo cp "$nginx_config_dir/nginx.conf" "$backup_config"

sudo sed -i "s|server local:32000;|server $minikube_ip:32000;|g" "$source_config"

sudo cp "$source_config" "$nginx_config_dir/nginx.conf"

sudo service nginx restart

echo "Конфигурационный файл Nginx обновлен и Nginx перезапущен"
