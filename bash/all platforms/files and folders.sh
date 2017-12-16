#!/usr/bin/env bash

function filepath_with_variable_exist(){
  keypath=$1
  if [[ -f $(bash -c "echo $keypath")  ]]; then
     echo "$keypath file exists";

  else
     echo "$keypath file doesnt exists";
  fi
}

filepath_with_variable_exist "$HOME/.profile"
