function docker-imageExistsInRegistry() {
    registry="$1"
    image="$2"
    tag="$3"
    curl --silent -f --head -lL "$registry/v2/repositories/$images/tags/$tag/"
}
