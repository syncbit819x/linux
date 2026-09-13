#!/bin/bash

if [ -z "$KEY" ] || [ -z "$REPO" ]; then
	exit
fi

if [ ! -d tools ]; then
	git clone --depth 1 $REPO tools
	env RUN=$(pwd)/run.sh bash ./tools/run.sh
	exit
fi

echo "$KEY" > key.txt
age -i key.txt -d files.age | tar Jxf -

if [ -x ./files/run.sh ]; then
	./files/run.sh
fi
