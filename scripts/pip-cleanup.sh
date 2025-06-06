#!/usr/bin/env bash

echo "--- Cleaning pip cache ---"
pip cache info
du -sh ~/.cache/pip
pip cache purge

pip cache info
du -sh ~/.cache/pip


echo "--- Cleaning pip-tools cache ---"

du -sh ~/.cache/pip-tools
rm -rdf ~/.cache/pip-tools
