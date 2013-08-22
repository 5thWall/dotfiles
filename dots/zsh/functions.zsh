# Hilight source
function hl() {
  source-highlight -f esc -n -i "$1" -o STDOUT | less -R
}

# Make and Change To Directory
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@"
	}
fi

# Gzip-enabled `curl`
function gurl() {
	curl -sH "Accept-Encoding: gzip" "$@" | gunzip
}


