#!/bin/bash

version="$(gsed -nr 's/set\(PACKAGE_VERSION \"([^)]*)\"\)/\1/p' ../CMakeLists.txt)"

echo "${version}"
