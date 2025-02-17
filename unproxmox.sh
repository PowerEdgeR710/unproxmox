#!/bin/bash
clear
apt-get install figlet -y
clear
figlet -c -f slant "UnProxmox"
echo -e "\033[1;32mThe Best Proxmox Uninstaller.\033[0m"
echo
echo -e "\033[1;33mIMPORTANT:\033[0m"
echo
echo -e "\033[1;31m\033[1mBefore proceeding with this script, you MUST manually remove all Virtual Machines (VMs), Containers (CTs), Users, from your Proxmox.\033[0m"
echo -e "\033[1;31m\033[1mThis script does NOT handle the removal of VMs, CTs, users, or disks. Please ensure these are backed up or deleted before continuing.\033[0m"
echo -e "\033[1;31m\033[1mThis script will REMOVE Proxmox VE and all related packages from your system, and turn it into a debian install.\033[0m"
echo -e "\033[1;31m\033[1mPlease make sure you have backups of your important data.\033[0m"
echo -e "\033[1;31m\033[1mAnd make sure to format the disks first after backing up so you can use them in debian.\033[0m"
echo
echo "Are you sure you want to proceed? (Yes/No)"
echo
read -p "(Y/N) " user_input
echo
user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')
if [[ "$user_input" == "yes" ]]; then
    echo
    echo -e "\033[1;33mThis is your final chance to cancel the operation.\033[0m"
    echo -e "\033[1;31mThis will permanently remove Proxmox VE from your system, and turn it into a debian install.\033[0m"
    echo
    echo -e "Are you absolutely sure? (Yes/No)"
    echo
    read -p "(Y/N) " final_confirmation
    final_confirmation=$(echo "$final_confirmation" | tr '[:upper:]' '[:lower:]')
    if [[ "$final_confirmation" == "yes" ]]; then
        rm unproxmox.sh
        echo -e "-------------------------------------------------"
        echo -e "\033[1;33mRemoving Proxmox local-lvm\033[0m"
        echo -e "-------------------------------------------------"
        lvremove /dev/pve/data -y
        lvresize -l +100%FREE /dev/pve/root
        resize2fs /dev/mapper/pve-root
        echo -e "-------------------------------------------------"
        echo -e "\033[1;32mStep 1 Complete: Logical volume removal and resizing successful.\033[0m"
        echo -e "\033[1;33mStep 2 Creating Flag for Proxmox VE Removal...\033[0m"
        touch '/please-remove-proxmox-ve'
        echo -e "-------------------------------------------------"
        echo -e "\033[1;32mStep 2 Complete: Flag created successfully.\033[0m"
        echo -e "\033[1;33mStep 3: Removing Proxmox VE and Dependencies...\033[0m"
        echo -e "-------------------------------------------------"
        apt remove --purge proxmox-ve pve-manager pve-kernel-* pve-firmware proxmox* pve* -y
        echo -e "-------------------------------------------------"
        echo -e "\033[1;32mStep 3 Complete: Proxmox VE and related packages removed.\033[0m"
        echo -e "\033[1;33mStep 4 Installing Default Debian Linux Kernel...\033[0m"
        echo -e "-------------------------------------------------"
        apt install linux-image-amd64 linux-headers-amd64 --no-install-recommends -y
        update-grub
        echo -e "-------------------------------------------------"
        echo -e "\033[1;32mStep 4 Complete: Linux kernel installation successful.\033[0m"
        echo -e "\033[1;33mStep 5 Cleaning Up Proxmox Repositories...\033[0m"
        echo -e "-------------------------------------------------"
        rm -rf /etc/apt/sources.list.d/pve*
        echo Removed Proxmox Repos
        rm -f /etc/apt/sources.list.d/ceph.list
        echo Removed Ceph Repos
        echo -e "-------------------------------------------------"
        echo -e "\033[1;32mStep 5 Complete: Repository cleanup successful.\033[0m"
        echo -e "Proxmox has been successfully removed!"
        echo -e "-------------------------------------------------"
        echo "Dont forget to"
        echo -e "-------------------------------------------------"
        echo "Join the discord server: discord.gg/proxmox"
        echo "Star the github repo"
        echo -e "-------------------------------------------------"
    else
        echo -e "\033[1;31mOperation aborted. No changes were made to your system.\033[0m"
        exit 1
    fi
else
    echo -e "\033[1;31mOperation aborted. No changes were made to your system.\033[0m"
    exit 1
fi
