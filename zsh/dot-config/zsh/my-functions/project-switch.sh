function switch-project() {
	projectDir="$(find ~/Projects -maxdepth 2 -mindepth 2 -type d | fzf --ignore-case)"
	cd "$projectDir"
}
