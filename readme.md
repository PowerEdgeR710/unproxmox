# UnProxmox: The Best Proxmox Uninstaller

This script is designed to completely remove Proxmox VE (Virtual Environment) and all associated packages from your system, turning it into a basic Debian installation. 

## WARNING

**Before running this script, you MUST manually remove all Virtual Machines (VMs), Containers (CTs), and Users** from your Proxmox system. This script does not handle the removal of VMs, CTs, users, or disks. Please ensure these are backed up or deleted beforehand. 

### What the script does:
- Removes Proxmox VE and all associated packages.
- Converts your system into a regular Debian install.
- Installs the default Debian Linux kernel.
- Cleans up Proxmox repositories.
  
### What the script does **not** do:
- It will **not** remove any VMs, CTs, or users.
- It will **not** handle disk formatting, so please make sure to format any disks after backup.

## Prerequisites

Make sure you have the following before running the script:
1. **Backup** all important data, especially VMs, CTs, and users.
2. **Remove** any VMs, CTs, and users from your Proxmox system manually.
3. **Format** the disks if necessary (to use them with Debian).

## How to Use

1. Run the script:
    ```bash

    ```

## Final Steps

Once the script has completed, you will need to:
1. Reboot your system to apply the changes.

## Optional steps:
1. Join the Proxmox Discord community: [discord.gg/proxmox](https://discord.gg/proxmox)
2. Star the GitHub repository for updates and contributions!
