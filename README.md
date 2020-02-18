ahr Apigee Hybrid Runtime utility

Status: v0.1 alpha. Current theme: UX fine-tuning. Things are stabilizing but expect a few refectorings until beta.

# Things to look for if you're interested to contribute

* Output of some commands is too noisy/verbose during 'happy path' run; we need to fine-tune it

* Functionally complete: commands need to cover whole sdlc experience of a specific component. look at the ahr-sa-ctl for an example of what we aim to

* Mininal but useful comments in source code



# Use Cases

Does this world really need another abstraction laver over apigeectl/.yaml config files?!

Apparently, yes.

* The automation. Create a single-command CD/CD for Performance Test that would a) install Runtime; b) deploy proxies; c) execute tests d) collect outputs e) destroy test environment

* Study tool. 


# Design Principles

* Executable documentation

  The scripts are meant to be read and consulted to observe how to implement required steps. You will need them for your authomation (ie, CI/CD scripts)

* Be intuitively compatible with a manual installation process

  The collection of ahr-* scripts and their options are tasks that are the high-level process of Hybrid installation process.

* Templating

  For cluster config and runtime config file we cannot provide generic enough file to cater for all eventualities. Therefore we provide a templating mechanism that lets you create any desired configuration.

# Scripting Best Practices

* Full explicit paths -- removes a current-directory ambiguity

* Copy-Paste-friendly commands -- via usage of environment variables



# Quick Start

## __Current__ Assumptions
- GCP/GKE
- DemoX org

### Set up environment

?. Create a folder for your Hybrid installation
```
mkdir ~/apige-hybrid
cd ~/apigee-hybrid
```
?. Clone this repository.
```
git clone https://github.com/yuriylesyuk/ahr.git
```
?. Define AHR_HOME and add bin directory to your path

**NOTE:** as you run it first time before PROJECT and REGION variables are not set up yet, it will fail with an ABEND message. But the AHR_HOME will be populated and $AHR_HOME/bin added to your path variable.
```
source ~/apigee-hybrid/ahr/bin/ahr-env
```
?. Create your hybrid project directory
```
mkdir ~/apigee-hybrid/hybrid-demo6-1.1
cd ~/apigee-hybrid/hybrid-demo6-1.1
````

?. Copy an example file
```
cp $AHR_HOME/examples/hybrid-demo6-1.1.sh hybrid-demo6-1.1.sh
```
### Configure your runtime settings
```
vi hybrid-demo6-1.1.sh
```

The key sections to customise are:
* Hybrid release configuration;
  * HYBRID_INSTALL_DIR -- your project directtory; this directory;
* GCP Project settings;
* Runtime Cluster definitions;
  * CLUSTER_CONFIG_FILE -- this will be used as file name for generated template for runtime cluster.
* Runtime Hybrid configuration
  * HYBRID_CONFIG_FILE -- file that will contain your custom setting (aka 'overrides' file).

  * *_SA variables -- names for key json files that will contain service account Google credentials file.

## Runtime Installation Workflow

?. Source Environment Variabls
```
source hybrid-demo6-1.1.sh
```
?. (Re-)configure environment
This will set up kubectl autocompletion amongst other things

```
source ahr-env
```

?. Add apigeectl to the path
```
source <(ahr-runtime-ctl home)
```

?. Create Service Accounts
```
ahr-sa-ctl create all
```



?. Verify parameters
```
ahr-verify
```


?. Generate Cluster file
```
ahr-cluster-ctl template $AHR_HOME/templates/cluster-multi-zone-template.json > $CLUSTER_CONFIG_FILE
```

?. Create Cluster
```
ahr-cluster-ctl create
```


?. Generate Runtime Configuration  file
```
ahr-runtime-ctl template $AHR_HOME/templates/overrides-large-template.yaml > $HYBRID_CONFIG_FILE
```
?. Install Hybrid Runtime
```
ahr-runtime-ctl install
```



### Delete Hybrid Installation

?. Delete cluster
```
ahr-cluster-ctl delete
```

?. Delete Service Accounts
```
ahr-sa-ctl delete all
```




# Sample Troubleshooting flows

### Synchronizer: re-create with different id

Skip steps as appropriate.

?. Edit runtime config file

```
vi hybrid-demo6-1.1.sh
...
export SYNCHRONIZER_ID=apigee-synchronizer1
...
```

?. Update environment variables
```
source hybrid-demo6-1.1.sh
```

?. Regenerate hybrid config file
```
ahr-runtime-ctl template $AHR_HOME/templates/overrides-large-template.yaml > $HYBRID_CONFIG_FILE
```

?. Create synchronizer Service Account
```
ahr-sa-ctl create synchronizer $SYNCHRONIZER_ID
```

?. Check syncronizer Service Account
?. Create synchronizer Service Account
```
ahr-sa-ctl config synchronizer $SYNCHRONIZER_ID
```


?. Set Sync Authorization. Copy-and-paste from ahr-runtime-ctl
```
curl -X POST -H "Authorization: Bearer $(token)" -H "Content-Type:application/json" "https://apigee.googleapis.com/v1/organizations/$ORG:setSyncAuthorization" --data-binary @- <<EOF
{
    "identities": [ "serviceAccount:$SYNCHRONIZER_SA_ID" ]
}
EOF
```


?. Re-apply synchronizer
```
(
cd $APIGEECTL_HOME
apigeectl -c synchronizer delete -f $HYBRID_CONFIG_FILE
apigeectl -c synchronizer apply -f $HYBRID_CONFIG_FILE
)
```



<hr>
2020, Not an official Google project.


