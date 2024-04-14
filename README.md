# Ansible Controller Setup

This repository contains Ansible scripts for setting up CiCd and management of infra deployed through the following repos :
- https://github.com/Moody-san/terraform-multicloud-infra
- https://github.com/Moody-san/ansible-k8s-deployment

## Prerequisites

Before you begin, ensure you have the following:

- Ansible
  
## Installation

Clone the repository to your Ansible Controller machine:

```bash
git clone https://github.com/Moody-san/ansible-controller-setup.git
cd ansible-controller-setup
ansible-playbook playbook -i inventoryfile
