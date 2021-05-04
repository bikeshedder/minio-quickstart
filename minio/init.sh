#!/bin/bash

set -e

cd $(dirname $(readlink -f $0))

echo $MINIO_ROOT_PASSWORD |
    mc alias set minio http://minio:9000/ \
    $MINIO_ROOT_USER

echo $MINIO_CONSOLE_PASSWORD |
    mc admin user add minio/ \
    $MINIO_CONSOLE_USER

for policy_file in policies/*.json; do
    policy_name=$(basename $policy_file .json)
    mc admin policy add minio/ $policy_name $policy_file
done

mc admin policy set minio consoleAdmin user=console
