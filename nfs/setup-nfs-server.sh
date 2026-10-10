#!/usr/bin/env bash
# NFS server on a dedicated VM, used as shared storage for live migration and HA.
# Then in Proxmox: Datacenter > Storage > Add > NFS
#   ID: nfs-shared | Export: /srv/nfs/proxmox | Content: Disk image, ISO, VZDump backup | Nodes: all
set -euo pipefail

EXPORT_DIR=/srv/nfs/proxmox
CLUSTER_NET=192.168.100.0/24

apt-get update && apt-get install -y nfs-kernel-server
mkdir -p "$EXPORT_DIR"
chown nobody:nogroup "$EXPORT_DIR"

echo "$EXPORT_DIR $CLUSTER_NET(rw,sync,no_subtree_check,no_root_squash)" > /etc/exports

exportfs -ra
systemctl enable --now nfs-kernel-server

exportfs -v
showmount -e localhost
