#!/bin/bash

#exit on error
set -e

# UI Colors
function ui_set_yellow {
    printf $'\033[0;33m'
}

function ui_set_green {
    printf $'\033[0;32m'
}

function ui_set_red {
    printf $'\033[0;31m'
}

function ui_reset_colors {
    printf "\e[0m"
}

# Set versions to build
if [ $# -eq 0 ]; then
    # Set versions
    versions=(
        ubuntu
        alpine
    )
else
    versions=$1
fi

name="ferri/xeyes"

function build() {
    ui_set_yellow && echo "⚡️ Running build for $name:${1}" && ui_reset_colors

    # Use "docker build"
    docker build \
        -t "$name:${1}" \
        -f Dockerfile-"${1}" \
        .

    ui_set_green && echo "✅ Build completed for $name:${1}" && ui_reset_colors
}

function build_versions {
    for version in ${versions[@]}; do
        build ${version[$i]}
    done
}

build_versions
