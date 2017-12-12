#!/usr/bin/env bash

while getopts "e:l:t:w:" OPTION
do
  case $OPTION in

    e)
      env=$OPTARG
      echo "env=$env"
      ;;
    l)
      log=$OPTARG
      echo "log=$log"
      ;;
    t)
      timeout=$OPTARG
      echo "timeout=$timeout"
      ;;
    w)
      working_dir=$OPTARG
      echo "working_dir=$working_dir"
      ;;
    *)
      echo "illegal agrument"
      exit 1
      ;;
  esac
done
