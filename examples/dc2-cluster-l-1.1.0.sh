#
# collection of variables to define apigee hybrid topology and configuration
#
#  cloud: GCP
#  cluster: two node-pools, multi-zonal
#  
#
# usage:
#    source <env-conf-file>

#
# Hybrid release configuration
#

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $BASEDIR/dc-all.sh

#
# Project
#

export REGION=asia-east1
#

#
# Runtime
#
export CLUSTER_CONFIG=dc2-cluster.json

export CLUSTER=dc2-cluster
export CLUSTER_ZONE=asia-east1-b
export CLUSTER_LOCATIONS='"asia-east1-a","asia-east1-b","asia-east1-c"'
export CONTEXT=dc2-cluster


#------------------------------------------------------------

#
export RUNTIME_CONFIG=$HYBRID_HOME/dc2-runtime.yaml

#------------------------------------------------------------
