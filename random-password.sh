#!/bin/bash

chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890
for i in {1..32} ; do
    echo -n "${chars:RANDOM%${#chars}:1}"
done
echo
