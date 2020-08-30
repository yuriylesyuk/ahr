BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 


function token { echo -n "$(gcloud config config-helper --force-auth-refresh | grep access_token | grep -o -E '[^ ]+$')" ; }


set -e


# variables:
# PROJECT ORG ENV

export API=ping
export API_BUNDLE=$BASEDIR/ping_rev1_2020_05_27.zip

# import
export REV=$(curl -H "Authorization: Bearer $(token)" -F file=@$API_BUNDLE -X POST "https://apigee.googleapis.com/v1/organizations/$ORG/apis?action=import&name=$API" | jq -r '.revision')

# deploy
curl -H "Authorization: Bearer $(token)" -X POST "https://apigee.googleapis.com/v1/organizations/$ORG/environments/$ENV/apis/$API/revisions/$REV/deployments?override=true"
