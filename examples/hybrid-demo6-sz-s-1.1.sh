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
export HYBRID_VERSION=1.1.0
export HYBRID_INSTALL_DIR=~/apigee-hybrid/hybrid-demo6-1.1
export HYBRID_INSTALL_TARBALL=apigeectl_linux_64.tar.gz




#
# GCP Project: demo6
#

export PROJECT=emea-cs-hybrid-demo6
export REGION=europe-west1
#

#
# Runtime Cluster definition
#
export CLUSTER_TEMPLATE=$AHR_HOME/templates/cluster-single-zone-one-nodepool-template.json
export CLUSTER_CONFIG_FILE=cluster-sz.json


export MACHINE_TYPE_DATA=n1-standard-8
export MACHINE_TYPE_RUNTIME=n1-standard-4

export CLUSTER_VERSION=1.13

export CLUSTER=${PROJECT}-cluster
export CLUSTER_ZONE=europe-west1-b
export CLUSTER_LOCATIONS='"europe-west1-b"'
export CONTEXT=gke_${PROJECT}_${CLUSTER_ZONE}_${CLUSTER}


#------------------------------------------------------------

# 
# Runtime Hybrid configuration
#
export HYBRID_CONFIG_FILE=$HYBRID_INSTALL_DIR/overrides-sz.yaml


export ORG=$PROJECT
export ENV=test


export ENC_KEY_KMS=$(LC_ALL=C tr -dc "[:print:]" < /dev/urandom | head -c 32 | openssl base64)
export ENC_KEY_KVM=$ENC_KEY_KMS
export ENC_KEY_CACHE=$ENC_KEY_KMS


export APIGEE_NET_CHAIN=/home/yuriyl/apigee-hybrid/certificates/hybrid-net-cert-20200308.pem
export APIGEE_NET_KEY=/home/yuriyl/apigee-hybrid/certificates/hybrid-net-key-20200308.pem

export SA_DIR=$HYBRID_INSTALL_DIR/service-accounts

export MART_ID=apigee-mart
export SYNCHRONIZER_ID=apigee-synchronizer


export SYNCHRONIZER_SA=$SA_DIR/$ORG-$SYNCHRONIZER_ID.json
export UDCA_SA=$SA_DIR/$ORG-apigee-udca.json
export MART_SA=$SA_DIR/$ORG-apigee-mart.json
export METRICS_SA=$SA_DIR/$ORG-apigee-metrics.json

export MART_SA_ID=$MART_ID@$PROJECT.iam.gserviceaccount.com
export SYNCHRONIZER_SA_ID=$SYNCHRONIZER_ID@$PROJECT.iam.gserviceaccount.com

export RUNTIME_HOST_ALIAS=$ORG-$ENV.hybrid-apigee.net
export RUNTIME_SSL_CERT=$APIGEE_NET_CHAIN
export RUNTIME_SSL_KEY=$APIGEE_NET_KEY
export RUNTIME_IP=35.241.135.204

export MART_HOST_ALIAS=$ORG-mart.hybrid-apigee.net
export MART_SSL_CERT=$APIGEE_NET_CHAIN
export MART_SSL_KEY=$APIGEE_NET_KEY
export MART_IP=34.76.212.108

#------------------------------------------------------------
