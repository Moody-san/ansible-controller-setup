# Ansible Controller Setup
This repository contains Ansible scripts for setting up CiCd and management of infra deployed through the following repos :
- [terraform multi cloud](https://github.com/Moody-san/terraform-multicloud-infra)
- [ansible kubernetes playbooks ](https://github.com/Moody-san/ansible-k8s-deployment)

## Prerequisites

- **Infra provisioned through IAC**: Deployed infrastructure using [terraform multi cloud iac](https://github.com/Moody-san/terraform-multicloud-infra) (as it contains a module to automatically update inventory for ansible scripts given that ansible repo and terraform repo are in the same directories). 
- **Software Requirements**: Ensure Ansible cli is installed.

## Installation
Clone the repository to your machine:
```bash
git clone https://github.com/Moody-san/ansible-controller-setup.git
cd ansible-controller-setup
```
## Usage
```bash
ansible-playbook acceptfingerprint.yml -i inventory --forks 1  #use this to add server to knownhosts
ansible-playbook setupiptablerules.yml -i inventory #ansible scripts sometimes get disconnected from oracle servers without this , though flushing rules like this not recommended 
ansible-playbook installjenkins.yml -i inventory
ansible-playbook installargocd.yml -i inventory
ansible-playbook installcertificate.yml -i inventory #requires ssl folder to be present for more information refer to terraform repo 
ansible-playbook registercluster.yml -i inventory -e "control_node=oraclemaster" -e "clustername=oraclecluster"
ansible-playbook updateroutes.yml -i inventory -e "control_node=oraclemaster"  #istio mesh virtual service routes 
ansible-playbook updatesecrets.yml -i inventory -e "control_node=oraclemaster" #k8s secrets
ansible-playbook enablemonitoring.yml -i inventory -e "control_node=oraclemaster" 
```
## Configuration
update secrets and routes in copy yaml task and then apply to update existing values.

## Additional Resources
- **MariaDB Cluster Setup**: For setting up a MariaDB cluster with Kubernetes-based failover, visit [ansible-galeracluster-deployment](https://github.com/Moody-san/ansible-galeracluster-deployment)

## Notes
- To get argo cd initial password run this command :
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
## Demo


https://github.com/Moody-san/ansible-controller-setup/assets/87976665/643f6024-7fd7-4a92-a862-ddcc94989485

