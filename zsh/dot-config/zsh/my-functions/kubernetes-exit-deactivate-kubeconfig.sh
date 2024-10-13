function k8s-ls() {
	find ~/.kube -maxdepth 1 ! -type l | grep "config\." | xargs basename | sed "s/config\.//"
}

function k8s-add() {
	while [[ $# -gt 0 ]]; do
		case $1 in
			--name)
				CLUSTER_NAME="$2"
				shift # past argument
				shift # past value
			;;
		-*|--*)
				echo "Unknown option $1"
				exit 1
			;;
		*)
				KUBE_CONFIG_PATH="$1"
				shift # past argument
			;;
		esac
	done

	configFile="$HOME/.kube/config.${CLUSTER_NAME}"
	mv "${KUBE_CONFIG_PATH}" "$configFile"
	chmod 600 "$configFile"

}

function k8s-use() {
	if [ ! $# -eq 1 ]; then
		echo "Pass the name of a cluster in here. Please use k8s-ls to see which clusters you have available"
		return
	fi

	configFile="$HOME/.kube/config.$1"

	if [ ! -f "$configFile" ]; then
		echo "The cluster $1 does not exist in your config"
		return
	fi

	targetFile="$HOME/.kube/config"

	ln -s -f "$configFile" "$HOME/.kube/config"
}

function k8s-rm() {
	if [ ! $# -eq 1 ]; then
		echo "Pass the name of a cluster in here. Please use k8s-ls to see which clusters you have available"
		return
	fi

	configFile="$HOME/.kube/config.$1"

	if [ ! -f "$configFile" ]; then
		echo "The cluster $1 does not exist in your config"
		return
	fi

	rm "$configFile"
}

function k8s-exit() {
	configFile="$HOME/.kube/config"
	rm "$configFile"
}

_k8s-use() { compadd -- $(k8s-ls) }
_k8s-rm() { compadd -- $(k8s-ls) }
compdef _k8s-use k8s-use
compdef _k8s-rm k8s-rm


