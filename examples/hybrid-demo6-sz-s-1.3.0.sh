#
# collection of variables to define apigee hybrid topology and configuration
#
#  cloud: GCP
#  cluster: two node-pools, multi-zonal
#  
#
# usage:
#    source <env-conf-file>

export CERT_MANAGER_MANIFEST=https://github.com/jetstack/cert-manager/releases/download/v0.14.2/cert-manager.yaml

export ASM_TARBALL=istio-1.5.8-asm.7-linux.tar.gz
export ASM_TEMPLATE=$AHR_HOME/templates/asm-overrides.yaml
export ASM_CONFIG=$HYBRID_HOME/asm.yaml

export ASM_ID=asm-sa
export ASM_SA=$SA_DIR/$PROJECT-asm-sa.json
export ASM_SA_ID=$ASM_ID@$PROJECT.iam.gserviceaccount.com 


#
# Hybrid release configuration
#
export HYBRID_VERSION=1.3.0
export HYBRID_TARBALL=apigeectl_linux_64.tar.gz




#
# GCP Project:
#

export NETWORK=default
export SUBNETWORK=default

export REGION=europe-west1
export AX_REGION=$REGION
#

#
# Runtime Cluster definition
#
export CLUSTER_TEMPLATE=$AHR_HOME/templates/cluster-single-zone-one-nodepool-template.json
export CLUSTER_CONFIG=$HYBRID_HOME/cluster-sz.json

export MACHINE_TYPE_DATA=n1-standard-8
export MACHINE_TYPE_RUNTIME=n1-standard-4

export CLUSTER_VERSION=1.16

export CLUSTER=hybrid-cluster
export CLUSTER_ZONE=europe-west1-b
export CLUSTER_LOCATIONS='"europe-west1-b"'
export CONTEXT=$CLUSTER


#------------------------------------------------------------

# 
# Runtime Hybrid configuration
#
export RUNTIME_CONFIG=$HYBRID_HOME/runtime-sz.yaml


export ORG=$PROJECT
export ENV=test
export ENV_GROUP=test-group

export ENC_KEY_KMS=$(LC_ALL=C tr -dc "[:print:]" < /dev/urandom | head -c 32 | openssl base64)
export ENC_KEY_KVM=$ENC_KEY_KMS
export ENC_KEY_CACHE=$ENC_KEY_KMS


export APIGEE_NET_CHAIN=/home/yuriyl/apigee-hybrid/certificates/hybrid-net-cert-20200531.pem
export APIGEE_NET_KEY=/home/yuriyl/apigee-hybrid/certificates/hybrid-net-key-20200531.pem

export SA_DIR=$HYBRID_HOME/service-accounts

export MART_ID=apigee-mart
export SYNCHRONIZER_ID=apigee-synchronizer


export SYNCHRONIZER_SA=$SA_DIR/$PROJECT-$SYNCHRONIZER_ID.json
export UDCA_SA=$SA_DIR/$PROJECT-apigee-udca.json
export MART_SA=$SA_DIR/$PROJECT-apigee-mart.json
export METRICS_SA=$SA_DIR/$PROJECT-apigee-metrics.json

export MART_SA_ID=$MART_ID@$PROJECT.iam.gserviceaccount.com
export SYNCHRONIZER_SA_ID=$SYNCHRONIZER_ID@$PROJECT.iam.gserviceaccount.com

export RUNTIME_HOST_ALIAS=$ORG-$ENV.hybrid-apigee.net
export RUNTIME_SSL_CERT=$APIGEE_NET_CHAIN
export RUNTIME_SSL_KEY=$APIGEE_NET_KEY
export RUNTIME_IP=$(gcloud compute addresses describe runtime-ip --region $REGION --format='value(address)')

#------------------------------------------------------------
