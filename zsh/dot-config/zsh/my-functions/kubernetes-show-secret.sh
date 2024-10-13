function k8s-showSecret() {
    cat | yq '.data | map_values(@base64d)'
}
