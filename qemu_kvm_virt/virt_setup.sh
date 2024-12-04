#!/bin/bash

# Update package information
echo "Updating package information..."
sudo apt update

# Upgrade system packages
echo "Upgrading system packages..."
sudo apt upgrade -y

# Install required virtualization packages
echo "Installing required virtualization packages..."
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

# Add the current user to the libvirt group
echo "Adding the current user to the libvirt group..."
sudo adduser $USER libvirt

# Add the current user to the kvm group
echo "Adding the current user to the kvm group..."
sudo adduser $USER kvm

# Start the libvirtd service
echo "Starting the libvirtd service..."
sudo systemctl start libvirtd

# Enable the libvirtd service to start on boot
echo "Enabling the libvirtd service to start on boot..."
sudo systemctl enable libvirtd

echo "All tasks completed! Remember to log out and log back in for group membership changes to take effect."
