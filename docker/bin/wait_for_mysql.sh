#!/bin/bash
# wait_for_mysql.sh

set -e

cmd="$@"
host="$DB_HOST"
user="$DB_USERNAME"
export MYSQL_PWD="$DB_PASSWORD"

until mysql -u$user -h$host -e 'SELECT 1' &> /dev/null; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"

exec $cmd
