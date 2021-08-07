#!/bin/bash

echo 'Generating python3 requirements'
pip freeze > ~/.yadr/system/requirements.txt

echo 'Generating nodejs packages'
npm list -g --depth=0 --json > ~/.yadr/system/package.json

echo 'Generating brewfile'
rm Brewfile && brew bundle dump

