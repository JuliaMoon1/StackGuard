#!/bin/bash

# Check if fail2ban is already installed, update and install fail2ban
if dpkg -l | grep -qw fail2ban; then
    echo "fail2ban is already installed."
else
    # Update and install fail2ban if not already installed
    sudo apt-get update && sudo apt install fail2ban -y
fi

# Copy the default configuration to create a customizable configuration
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Fetch the server's primary IP address
SERVER_IP=$(hostname -I | awk '{print $1}')

# Backup the jail.local file before editing
sudo cp /etc/fail2ban/jail.local /etc/fail2ban/jail.local.backup

# Add the server's IP to the ignoreip list, preserving existing entries
sudo sed -i "/^ignoreip = / s/$/ $SERVER_IP/" /etc/fail2ban/jail.local

# Optional: Use nano or another text editor if manual editing is needed
# sudo nano /etc/fail2ban/jail.local

# Restart fail2ban to apply changes
sudo systemctl restart fail2ban
