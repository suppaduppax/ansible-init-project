#!/bin/bash
echo "fuhhh"

wget https://gist.githubusercontent.com/suppaduppax/e7084b1a7b538c08b95a43b03d7430f7/raw/a15e6fcf399130626b4745ca5df28ef37726bfc8/setup_environment.sh
chmod +x setup_environment.sh

directories=(
  "inventory"
  "inventory/group_vars/all"
  "inventory/host_vars/"
  "roles/"
  "collections/"
)

for dir in "${directories}"; do
  mkdir "${dir}" -p
done


