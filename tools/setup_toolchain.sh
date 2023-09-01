#!/bin/bash

set -eu

declare -r KEL_HOME='/tmp/kel-toolchain'

if [ -d "${KEL_HOME}" ]; then
	PATH+=":${KEL_HOME}/bin"
	export KEL_HOME \
		PATH
	return 0
fi

declare -r KEL_CROSS_TAG="$(jq --raw-output '.tag_name' <<< "$(curl --retry 10 --retry-delay 3 --silent --url 'https://api.github.com/repos/AmanoTeam/Kel/releases/latest')")"
declare -r KEL_CROSS_TARBALL='/tmp/kel.tar.xz'
declare -r KEL_CROSS_URL="https://github.com/AmanoTeam/Kel/releases/download/${KEL_CROSS_TAG}/x86_64-unknown-linux-gnu.tar.xz"

curl --connect-timeout '10' --retry '15' --retry-all-errors --fail --silent --location --url "${KEL_CROSS_URL}" --output "${KEL_CROSS_TARBALL}"
tar --directory="$(dirname "${KEL_CROSS_TARBALL}")" --extract --file="${KEL_CROSS_TARBALL}"

rm "${KEL_CROSS_TARBALL}"

mv '/tmp/kel' "${KEL_HOME}"

PATH+=":${KEL_HOME}/bin"

export KEL_HOME \
	PATH
