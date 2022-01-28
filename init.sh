#!/bin/bash

log () {
  echo "${1}"
}

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

log "Fetching files..."

log "  ansible.cfg"
curl -s "https://raw.githubusercontent.com/suppaduppax/ansible-init-project/main/ansible.cfg" > ansible.cfg

log "  hosts.vmware.yml"
curl -s "https://raw.githubusercontent.com/suppaduppax/ansible-init-project/main/inventory/hosts.vmware.yml" > inventory/hosts.vmware.yml

log "  galaxy_requirements.yml"
curl -s "https://raw.githubusercontent.com/suppaduppax/ansible-init-project/main/galaxy_requirements.yml" > galaxy_requirements.yml

log "  pip_requirements.yml"
curl -s "https://raw.githubusercontent.com/suppaduppax/ansible-init-project/main/pip_requirements.txt" > pip_requirements.txt

log "  setup_environment.sh"
curl -s https://gist.githubusercontent.com/suppaduppax/e7084b1a7b538c08b95a43b03d7430f7/raw/a15e6fcf399130626b4745ca5df28ef37726bfc8/setup_environment.sh > setup_environment.sh
chmod +x setup_environment.sh

log "Running setup_environment.sh..."
source setup_environment.sh
