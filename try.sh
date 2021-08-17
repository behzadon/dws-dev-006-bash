#!/bin/bash

ARGS=$(getopt -a --options n:i: --long "name:,id:" -- "$@")

eval set -- "$ARGS"

while true; do
  case "$1" in
    -n)
      n="$2"
      shift 2;;
    -i)
      i="$2"
      shift 2;;
    --)
        shift
        break
        ;;
  esac
done

if [ -z "$n" ]; then
    if [[ -z "${TRY_NUMBER}" ]]; then
        n=12
    else
        n="${TRY_NUMBER}"
    fi
fi

if [ -z "$i" ]; then
    if [[ -z "${TRY_INTERVAL}" ]]; then
        i=5
    else
        i="${TRY_INTERVAL}"
    fi
fi

if [ -z "$1" ];then
    echo -e  "\nNo argument supplied!\n"
    exit 0
fi

NUM=$n

until $1
do
  sleep $i
  ((NUM--))

  if [ $NUM -eq 0 ];then
      1>&2 echo -e "\nCommand was not successful after $n tries in $((n*i)) seconds.\n"
    exit 1
  fi
done  
echo -e "\nSuccess!\n"

