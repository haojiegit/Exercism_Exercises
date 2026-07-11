#!/usr/bin/env bash

declare -A allergens=([eggs]=1 [peanuts]=2 [shellfish]=4 [strawberries]=8 [tomatoes]=16 [chocolate]=32 [pollen]=64 [cats]=128)

allergens_ordering=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

usage () {
    echo "usage: allergies.sh <digit> {list | allergic_to <item>}"
    exit 1
}

#checking number of arguments
if (( $# != 2 && $# != 3 )); then
    usage
fi

#checking argument 1 and 2 fit required format
if [[ ! $1 =~ ^[[:digit:]]+$ || ( "$2" != "list" && "$2" != "allergic_to") ]]; then
    usage
fi

if [[ "$2" == "list" && "$3" ]]; then
    usage
fi

if [[ "$2" == "allergic_to" && ! "$3" ]]; then
    usage
fi

declare -a output_items
mask=$(( $1 & 255 ))

if [[ "$2" == "list" ]]; then
    for allergen in "${allergens_ordering[@]}"; do
        if (( ${allergens[${allergen}]} & mask )); then
            output_items+=("$allergen")
        fi
    done
    echo "${output_items[@]}"
    exit
fi

if [[ "$2" == "allergic_to" ]]; then
    target_allergen="$3"
    target_allergen_value="${allergens[${target_allergen}]:-0}"
    if ((  target_allergen_value & mask )); then
            echo "true"
    else
            echo "false"
	fi
fi  