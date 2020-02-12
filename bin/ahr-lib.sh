

function token { echo -n "$(gcloud config config-helper --force-auth-refresh | grep access_token | grep -o -E '[^ ]+$')" ; }

function check_envvars() {
    local varlist=$1

    local varsnotset="F"

    for v in $varlist; do
        if [ -z "${!v}" ]; then
            echo "Required environment variable $v is not set."
            varsnotset="T"
        fi
    done

    if [ "$varsnotset" = "T" ]; then
        echo ""
        echo "ABEND. Please set up required variables."
        return 1
    fi
}


