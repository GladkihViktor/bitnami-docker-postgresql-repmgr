#!/bin/bash
 
USERS=("GuestDb:Guest261181!@" "user2:password2" "user3:password3")
IFS=',' read -ra my_array <<< "$ADDED_USERS"

for user in "${my_array[@]}"; do
    user_info=(${user//:/ })
    pg_md5 -m --config-file="/opt/bitnami/pgpool/conf/pgpool.conf" -u "${user_info[0]}" "${user_info[1]}"
done