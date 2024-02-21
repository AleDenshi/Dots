#!/bin/sh

browserdir="$HOME/.mozilla/firefox"
profilesini="$browserdir/profiles.ini"

firefox --headless >/dev/null 2>&1 &
sleep 1
pdir="$1"
profile="$(sed -n "/Default=.*.default-release/ s/.*=//p" "$profilesini")"
[ -z "$1" ] && pdir="$browserdir/$profile"

overrides="$2"
[ -z "$2" ] && overrides="$HOME/.config/firefox/user-overrides.js"


# Stop Firefox
pkill firefox

# Get the Arkenfox user.js and prepare it.
arkenfox="$pdir/arkenfox.js"
curl "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js" > "$arkenfox"
userjs="$pdir/user.js"

cat "$arkenfox" "$overrides" > "$userjs"

# Install extensions
addonlist="ublock-origin decentraleyes istilldontcareaboutcookies"
addontmp="$(mktemp -d)"
trap "rm -fr $addontmp" HUP INT QUIT TERM PWR EXIT
IFS=' '
mkdir -p "$pdir/extensions/"

# Loop through addons and install them
for addon in $addonlist; do
	echo "Downloading $addon"
	addonurl="$(curl --connect-timeout 5 "https://addons.mozilla.org/en-US/firefox/addon/${addon}/" |
		grep -o 'https://addons.mozilla.org/firefox/downloads/file/[^"]*')"
	file="${addonurl##*/}"
	curl -LOs "$addonurl" > "$addontmp/$file"
	id="$(unzip -p "$file" manifest.json | grep "\"id\"")"
	id="${id%\"*}"
	id="${id##*\"}"
	mv "$file" "$pdir/extensions/$id.xpi"
done
