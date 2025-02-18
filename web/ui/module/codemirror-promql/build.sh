#!/bin/bash

# Copyright 2021 The Prometheus Authors
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

# build the lib (both ES2015 and CommonJS)
tsc --module ES2015 --target ES2015 --outDir lib/esm
tsc --module commonjs --target es5 --outDir lib/cjs --downlevelIteration

# Finally, copy some useful files into the distribution folder for documentation purposes.
cp ./README.md ./lib/README.md
cp ./CHANGELOG.md ./lib/CHANGELOG.md
cp ./package.json ./lib/package.json

if [ -f "./LICENSE" ]; then
  cp ./LICENSE ./lib/LICENSE
fi
