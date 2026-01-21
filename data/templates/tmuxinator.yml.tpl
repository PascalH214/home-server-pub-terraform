name: hs
windows:
  - root:
      layout: even-horizontal
      panes:
        - clear
        - yazi
  - packer:
      layout: even-horizontal
      root: packer
      panes:
        - nvim .
        - clear
  - terraform:
      layout: even-horizontal
      root: terraform
      panes:
        - nvim .
        - clear
  - ansible:
      layout: even-horizontal
      root: ansible
      panes:
        - nvim .
        - clear
%{ for name, host in vms ~}
  - ssh-${name}:
      layout: even-horizontal
      panes:
        - clear && ssh ${proxmox_vm_username}@${host.address}
%{ endfor ~}
