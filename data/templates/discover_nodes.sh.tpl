#!/bin/bash
%{ for name, host in vms ~}
ssh-keygen -f ${known_hosts} -R ${host.address}
ssh-keyscan -H ${host.address} >> ${known_hosts}
%{ endfor ~}
