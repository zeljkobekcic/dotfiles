script_root="$(dirname "$(readlink -f "$0")")"
source "$script_root/util.sh"


function __recursivelyListVaultSecrets() {
  local vaultPath="$1"
  if [ -e "$vaultPath" ]; then
    echo "Error: No argument (vaultPath) provided"
    return 1
  fi

  local nextElements
  nextElements="$(vault kv list -format="yaml" "$vaultPath" | yq eval '.[]')"
  if [[ "$nextElements" == 'null' ]]; then
    local secretFields
    secretFields="$(vault kv get -format='yaml' "$vaultPath" | yq eval -I=0 '.data.data | keys | .[]')"
    echo "$secretFields" | while read -r secretField; do
      echo "$vaultPath:$secretField"
    done
    return 0
  fi

  echo "$nextElements" | while read -r newPath; do
    __recursivelyListVaultSecrets "$vaultPath$newPath"
  done
}

function vault-listSecrets() {
    __check_program_installed vault || return 1
    __check_program_installed yq || return 1

    local initialPath="$1"
    if [ -z "$initialPath" ]; then
      echo "Error: No argument (initialPath) provided"
      return 1
    fi

    # adds trailing slash which is required
    [[ "${initialPath}" != */ ]] && initialPath="${initialPath}/"

    __recursivelyListVaultSecrets "$initialPath"
}
