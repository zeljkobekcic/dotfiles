function youtube-download-mp3() {
	if [ "$#" -eq 0 ]; then
		echo "You need to provide an url"
		return
	fi

	yt-dlp "$1" -x --audio-format mp3 --audio-quality 0
}
