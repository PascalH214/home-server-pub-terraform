[all]
%{ for name, host in vms ~}
%{ if !host.ansible_exclude ~}
${name} ansible_host=${host.address}
%{ endif ~}
%{ endfor ~}

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/home/ubuntu/.ssh/id_ed25519
ansible_become_password={{ become_password }}
