# Remote Linux Triage Collection Using OSquery

Remotely collect linux live forensics artifacts.

## Description

Ansible Playbook that uses OSquery to collect linux live forensics artifacts from a remote machine.

## Getting Started
### Sample Output
![Single File per machine - zipped TXT/CSV/JSON output](https://github.com/anelshaer/Remote-Linux-Triage-Collection-using-OSquery/blob/main/screenshots/zipped_mutiple_machines_triage_results.png?raw=true)
![Complete Execution Logs](https://github.com/anelshaer/Remote-Linux-Triage-Collection-using-OSquery/blob/main/screenshots/execution_logs.png?raw=true)
![Listing of all results returned from a sample machine](https://github.com/anelshaer/Remote-Linux-Triage-Collection-using-OSquery/blob/main/screenshots/unzipped_single_machine_triage_results.png?raw=true)

### Demo Environment

To be able to see this in action

1. Clone this repository
```bash
git clone https://github.com/anelshaer/Remote-Linux-Triage-Collection-using-OSquery.git
cd dev/
```
2. [Install Docker] (https://docs.docker.com/get-docker/)
3. Build Docker images for IR/Control node, 2 target machines.
```bash
sudo docker build -t ansible-control -f Dockerfile.ansible .
sudo docker build -t ansible-osquery-c7 -f Dockerfile.centos .
sudo docker build -t ansible-osquery-u1604 -f Dockerfile.ubuntu .
```
4. Run docker-compose 
```bash
docker-compose up --abort-on-container-exit
```

5. Find the collection artifacts located under a new directory named `playbooks/triage_results`
### Dependencies

* Ansible - should be installed on the IR machine
* OSquery - One condition is required
  1. OSquery Package installed on the remote machines.
  2. OSqueri exists locally on the IR machine.
    * Pushed to the remote during the execution.
    * Cleaned from the remote after the execution

### Installing

* [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
* [Download and Install OSquery](https://osquery.io/downloads/official/5.3.0).

### Executing program

* Clone the repository
* Change Directory to `playbooks`
* The current `Inventory/hosts` meant to be used with the demo environment, add/change hosts as needed.
* OSqueryi has to be located at `files/bin/osqueryi`

* Run the playbook you may use one of these commands depending on the needed output format:
```bash
'Run Remote Collection with TXT output'
ansible-playbook -i Inventory/hosts  remote_linux_triage_collection.yaml
```

```bash
echo 'Run Remote Collection with JSON output'
ansible-playbook -i Inventory/hosts -kK remote_linux_triage_collection.yaml --extra-vars '{"json_logs": true}'
```

```bash
echo 'Run Remote Collection with CSV output'
ansible-playbook -i Inventory/hosts -kK remote_linux_triage_collection.yaml --extra-vars '{"csv_logs": true}'
```

Note: you may need to use these options
- ask for connection password `-k, --ask-pass` 
- ask for privilege escalation password `-K, --ask-become-pass`
- See below Example

```bash
ansible-playbook -i Inventory/hosts -kK remote_linux_triage_collection.yaml
```
* Find the collection artifacts located under a new directory named `playbooks/triage_results`

## Help / contribution

Please file an issue on GitHub or contact me directly.

## Authors

[@Ahmed Elshaer](https://www.linkedin.com/in/anelshaer)

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

