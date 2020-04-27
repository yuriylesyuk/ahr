#
# collection of variables to define apigee hybrid topology and configuration
#
#  cloud: GCP
#  cluster: two node-pools, multi-zonal
#  
#
# usage:
#    source <env-conf-file>


BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $BASEDIR/dc-all.sh


export REGION=us-east1
#

#
# Cluster
#
export CLUSTER_CONFIG=dc1-cluster.json

export CLUSTER=dc1-cluster
export CLUSTER_ZONE=us-east1-b
export CLUSTER_LOCATIONS='"us-east1-b","us-east1-c","us-east1-d"'
export CONTEXT=dc1-cluster


#------------------------------------------------------------

# 
# Runtime
#
export RUNTIME_CONFIG=$HYBRID_HOME/dc1-runtime.yaml

export RUNTIME_HOST_ALIAS=$ORG-$ENV-dc1.hybrid-apigee.net
export RUNTIME_IP=35.246.104.54
#------------------------------------------------------------
