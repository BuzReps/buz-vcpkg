#!/usr/bin/env bash

${VCPKG_ROOT}/vcpkg x-add-version --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions $1

