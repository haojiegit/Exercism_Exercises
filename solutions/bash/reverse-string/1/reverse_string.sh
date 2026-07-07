#!/usr/bin/env bash

length_of_string="${#1}"

new_string=""

for (( i = length_of_string - 1; i >= 0; i-- )); do
    new_string+="${1:i:1}"
done

echo "${new_string}"
