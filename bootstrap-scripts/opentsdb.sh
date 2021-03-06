#!/bin/bash -v

# This script runs on instances with a node_type tag of "opentsdb"
# It sets the roles that determine what software is installed
# on this instance by platform-salt scripts


# The pnda_env-<cluster_name>.sh script generated by the CLI should
# be run prior to running this script to define various environment
# variables

# Parameters:
#  $1 - node index for this opentsdb node - node 0 gets a grafana.

set -e

cat >> /etc/salt/grains <<EOF
roles:
  - opentsdb
EOF
if [ $1 = 0 ]; then
cat >> /etc/salt/grains <<EOF
  - grafana
EOF
fi
