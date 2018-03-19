#!/bin/bash -v

# This script runs on instances with a node_type tag of "tools"
# It sets the roles that determine what software is installed
# on this instance by platform-salt scripts


# The pnda_env-<cluster_name>.sh script generated by the CLI should
# be run prior to running this script to define various environment
# variables

set -e

cat >> /etc/salt/grains <<EOF
roles:
  - kafka_manager
  - platform_testing_general
  - logserver
  - kibana_dashboard
EOF

if [ "x$PNDA_METRICS" == "xYES" ]; then
  cat >> /etc/salt/grains <<EOF
  - influxdb
  - jetty
  - telegraf
EOF
fi

service salt-master restart
