#!/usr/bin/env bash
# set-consoleblank.sh
# Script to set consoleblank timeout in GRUB
# Inteded for console-only systems

GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

echo
echo -e "${BLUE}========================================${RESET}"
echo -e "${BLUE}  Set consoleblank Timeout in GRUB${RESET}"
echo -e "${BLUE}========================================${RESET}"
echo

# default timeout 67s, can be changed with arg (-- <seconds>)
TIMEOUT=${1:-67}

GRUB_FILE="/etc/default/grub"
BACKUP_FILE="/etc/default/grub.bak.$(date +%F-%H%M%S)"

echo -e "${BLUE}[*] Backing up $GRUB_FILE to $BACKUP_FILE${RESET}"
cp "$GRUB_FILE" "$BACKUP_FILE" || { echo -e "${RED}[!] Backup failed!${RESET}"; exit 1; }

echo -e "${BLUE}[*] Updating GRUB_CMDLINE_LINUX_DEFAULT...${RESET}"
if grep -q "consoleblank=" "$GRUB_FILE"; then
    sed -i "s/consoleblank=[0-9]\+/consoleblank=$TIMEOUT/" "$GRUB_FILE"
else
    sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"\(.*\)\"/GRUB_CMDLINE_LINUX_DEFAULT=\"\1 consoleblank=$TIMEOUT\"/" "$GRUB_FILE"
fi

echo -e "${BLUE}[*] Running update-grub...${RESET}"
update-grub

echo -e "${GREEN}[✓] Done. consoleblank=$TIMEOUT has been set.${RESET}"
echo
echo -e "${YELLOW}[!] Please reboot for changes to take effect.${RESET}"
echo