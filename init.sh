#!/bin/bash

log () {
  echo "${1}"
}

log "Fetching setup_environment.sh"
curl -s https://gist.githubusercontent.com/suppaduppax/e7084b1a7b538c08b95a43b03d7430f7/raw/a15e6fcf399130626b4745ca5df28ef37726bfc8/setup_environment.sh > setup_environment.sh
chmod +x setup_environment.sh

directories=(
  "inventory" 
  "inventory/group_vars/all" 
  "inventory/host_vars/" 
  "roles/" 
  "collections/" 
)

files=(
  "inventory/group_vars/all/vars.yml"
)

log "Creating directories..."
for dir in "${directories[@]}"; do
  log "  ${dir}"
  mkdir "${dir}" -p
done

log "Creating files..."
for file in "${files[@]}"; do
  log "  ${file}"
  mkdir "${file}" -p
done
