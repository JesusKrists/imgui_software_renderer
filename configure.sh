#!/bin/bash
# This scripts sets up a new project ready to build and run.
set -eu

if [ ! -d ".git" ]; then
	git init .
	echo "/build/*" >> .gitignore
	echo "*.bin" >> .gitignore
fi

if [ ! -d "third_party" ]; then
	mkdir -p "third_party"
	pushd "third_party"

	# git submodule add https://github.com/cbeck88/visit_struct.git
	# git submodule add https://github.com/emilk/emath.git
	git submodule add https://github.com/emilk/emilib.git
	# git submodule add https://github.com/nothings/stb.git
	git submodule add https://github.com/ocornut/imgui.git

	pushd imgui
		git checkout tags/v1.60
	popd

	popd
fi

git submodule update --init --recursive

if [ ! -d "src" ]; then
	mkdir -p "src"
	touch "src/libs.cpp" # TODO: get from some gist
	touch "src/main.cpp" # TODO: get from some gist
fi

# TODO: get build.sh from some gist
