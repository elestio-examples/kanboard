#set env vars
set -o allexport; source .env; set +o allexport;

echo "BEFORE"
sleep 30s;
sed -i "s~PASSWORD_TO_CHANGE~${ADMIN_PASSWORD}~g" ./Mysql.php
echo "AFTER"
sleep 30s;