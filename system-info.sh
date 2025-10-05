#!/usr/bin/env bash
# returns basic system and hardware information for proxmox host

# system 
echo -e "\nSystem Information:\n"

hostnamectl

# cpu 
echo -e "\nCPU:\n"

grep "model name" /proc/cpuinfo | head -1
nproc

# memory 
echo -e "\nMemory:\n"

free -h

lsblk

# gpu
echo -e "\nGPU:\n"

lspci | grep -E "VGA|3D|Display"

# motherboard
echo -e "\Motherboard:\n"

dmidecode -t baseboard
