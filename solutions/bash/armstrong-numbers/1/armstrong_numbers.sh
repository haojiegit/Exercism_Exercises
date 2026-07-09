#!/usr/bin/env bash

power="${#1}"
sum=0

for (( i = 0; i < power; i++ )); do
    digit="${1:i:1}"
    (( sum += digit ** power ))
done

if (( sum == $1 )); then
    echo "true"
else
    echo "false"
fi