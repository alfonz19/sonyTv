#!/bin/bash

URL=http://192.168.1.99/sony
PASS=pass

function invoke() {
#	echo "invoking: $1 || $2"

	local word="$1"
	local data="$2"

	curl -s -X POST "${URL}/${word}" --header "X-Auth-PSK: ${PASS}" --data-binary "${data}"
}

function help() {
cat<<EOF
	Not OK, man!
EOF
}


function getInputNames() {
        invoke "avContent" '{"method":"getContentList","id":88,"params":[{"stIdx":0,"cnt":50,"uri":"extInput:hdmi"}],"version":"1.5"}' | jq .result[][].title
}

function getInputs() {
        invoke "avContent" '{"method":"getContentList","id":88,"params":[{"stIdx":0,"cnt":50,"uri":"extInput:hdmi"}],"version":"1.5"}' 
}

function getInputUrls() {
        invoke "avContent" '{"method":"getContentList","id":88,"params":[{"stIdx":0,"cnt":50,"uri":"extInput:hdmi"}],"version":"1.5"}' | jq .result[][].uri
}

function getInputNameToUrlMapping() {
        invoke "avContent" '{"method":"getContentList","id":88,"params":[{"stIdx":0,"cnt":50,"uri":"extInput:hdmi"}],"version":"1.5"}' | jq ".result[][] | .title + \" —>\" + .uri "
}

function setInput() {
#	echo here1: $1
	invoke "avContent" "{\"method\":\"setPlayContent\",\"id\":101,\"params\":[{\"uri\":\"extInput:hdmi?port=${1}\"}],\"version\":\"1.0\"}"
}


function run() {
#	echo $1
#	echo $2
#	echo $3
	if [[ $# -eq 0 ]]; then 
		echo -e "\tmissing command specification!"
		help
		exit 1
	fi

	local command="${1}"
	shift
	case "${command}" in
#		test)
#			echo $1
#			echo $2
#			;;	
		setInput)
			if [[ $# -eq 0 ]]; then
				echo -e "\tmissing input specification"
				help
				exit 1
			fi
			setInput "${1}"
			shift
			;;	
		getInputs)
			getInputs
			;;	
		getInputNames)
			getInputNames
			;;	
		getInputNameToUrlMapping)
			getInputNameToUrlMapping
			;;	
		getInputUrls)
			getInputUrls
			;;	
		*)
			echo -e "\tunknown command!"
			help
			exit 1
			;;
	esac
	
}

run "$@"
