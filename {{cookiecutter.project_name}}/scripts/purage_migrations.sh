#!/usr/bin/env bash

CURRENT_PATH=$(pwd)
PROJECT_NAME="{{cookiecutter.project_name}}"

echo "$CURRENT_PATH"

BASE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "$BASE_PATH"

cd $BASE_PATH
cd ../$PROJECT_NAME

echo $(pwd)

for app in $(ls)
do
  if [ -d $app/migrations ]; then
    cd $app/migrations
    ls | grep -P "^(.*)_initial.py" | xargs -d"\n" rm
    cd ../..
  fi
done

cd $CURRENT_PATH