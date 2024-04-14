[allservers]
%{ for server_info in ociservers ~}
%{ if !server_info.is_oracle_bastion ~}
${server_info.all_details} ansible_python_interpreter=/usr/bin/python3 ansible_ssh_common_args="-o ProxyJump=ubuntu@${ocibastionpubip[0]} -o ServerAliveInterval=30 -o ServerAliveCountMax=10"
%{ endif ~}
%{ endfor ~}
%{ for server_info in azservers ~}
${server_info.all_details} ansible_python_interpreter=/usr/bin/python3 ansible_ssh_common_args="-o ProxyJump=ubuntu@${ocibastionpubip[0]} -o ServerAliveInterval=30 -o ServerAliveCountMax=10"
%{ endfor ~} 

[bastion]
%{ for server_info in ociservers ~}
%{ if server_info.is_oracle_bastion ~}
${server_info.all_details} ansible_python_interpreter=/usr/bin/python3 ansible_ssh_common_args="-o ServerAliveInterval=30 -o ServerAliveCountMax=10"
%{ endif ~}
%{ endfor ~}

