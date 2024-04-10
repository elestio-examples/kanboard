#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."

sleep 30s;

curl 172.17.0.1:37770

echo "${ADMIN_PASSWORD}" | docker-compose exec -T db mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "USE kanboard; UPDATE users SET email='${ADMIN_EMAIL}' WHERE username='admin';"

docker-compose down;

rm -rf ./Mysql.php

sed -i "s~- ./Mysql.php:/var/www/app/app/Schema/Mysql.php~~g" ./docker-compose.yml

docker-compose up -d;

sleep 20s;