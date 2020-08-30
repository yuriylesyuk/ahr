
function vaml() { vim -R -c 'set syntax=yaml' -;}

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


function check_commands() {
    local comlist=$1

    local comsnotset="F"

    for c in $comlist; do
        if ! [ -x "$(command -v $c)" ]; then
            echo "Required command is not on your PATH: $c."
            comsnotset="T"
        fi
    done

    if [ "$comsnotset" = "T" ]; then
        echo ""
        echo "ABEND. Please make sure required commands are set and accesible via PATH."
        return 1
    fi
}


function get_password(){
    local password
    local passconfirm
    while true; do
        read -srp "Enter password: " password
        echo "" >&2
        read -srp "Confirm password: " passconfirm
        echo "" >&2
        if [ "$password" == "$passconfirm" ]; then
            break
        else
            echo "Passwords do not match. Please re-enter" >&2
        fi
    done
    echo -n "$password"
}

# example: wait_for_ready "ready" 'cat ready.txt' "File is ready."
function wait_for_ready(){
    local status=$1
    local action=$2
    local message=$3

    while true; do
        local signal=$(eval "$action")
        if [ $(echo $status) = "$signal" ]; then
            echo -e "\n$message"
            break
        fi
        echo -n "."
        sleep 5
    done
}


function get_account_as_member() {
  ACCOUNT=$(gcloud config list --format='value(core.account)')
  gcloud iam service-accounts describe $ACCOUNT &> /dev/null
  if [ $? -eq 0 ] ; then
    echo "serviceAccount:$ACCOUNT"
    return
  fi
  echo "user:$ACCOUNT"
}


function get_platform_suffix() {
  local COMP=$1
  local PLATFORM=$2
  local SUFFIX

  case "$COMP" in
  [0-9][0-9.]*-asm*)
    case "$PLATFORM" in
    linux)

      case "$COMP" in
      1.5[0-9.]*-asm*)
         SUFFIX=linux.tar.gz ;;
      *)
         SUFFIX=linux-amd64.tar.gz ;;
      esac ;;
    osx)
      SUFFIX=osx.tar.gz ;;
    win)
      SUFFIX=win.zip ;;
    esac ;;

  apigeectl)
    case "$PLATFORM" in
    linux)
      SUFFIX=linux_64.tar.gz ;;
    osx)
      SUFFIX=mac_64.tar.gz ;;
    esac ;;
  esac

  echo -n "$SUFFIX"
}

