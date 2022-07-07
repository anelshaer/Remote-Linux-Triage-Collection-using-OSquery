#!/bin/sh
echo 'Run Remote Collection with TXT output'
ansible-playbook -i Inventory/hosts  remote_linux_triage_collection.yaml

echo 'Run Remote Collection with JSON output'
ansible-playbook -i Inventory/hosts  remote_linux_triage_collection.yaml --extra-vars '{"json_logs": true}'

echo 'Run Remote Collection with CSV output'
ansible-playbook -i Inventory/hosts  remote_linux_triage_collection.yaml --extra-vars '{"csv_logs": true}'
