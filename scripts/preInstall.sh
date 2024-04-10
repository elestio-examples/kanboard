#set env vars
set -o allexport; source .env; set +o allexport;

sed -i "s~PASSWORD_TO_CHANGE~${ADMIN_PASSWORD}~g" ./Mysql.php
