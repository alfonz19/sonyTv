#!/bin/bash

URL=http://192.168.1.99/sony
PASS=pass

function invoke() {
#	echo "invoking: $1 || $2"

	local word="$1"
	local data="$2"

	shift 2

	curl -v -X POST "${URL}/${word}" --header "X-Auth-PSK: ${PASS}" --data-binary "${data}" "$@"
}

function invokeIrcCommand() {
	invoke IRCC \
		'<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><s:Body><u:X_SendIRCC xmlns:u="urn:schemas-sony-com:service:IRCC:1"><IRCCCode>AAAAAgAAABoAAAB8Aw==</IRCCCode></u:X_SendIRCC></s:Body></s:Envelope>' \
		--header "Connection: Keep-Alive" --header 'SOAPACTION: "urn:schemas-sony-com:service:IRCC:1#X_SendIRCC"' --header "Content-Type: text/xml; charset=UTF-8"
#	curl "http://192.168.1.99/sony/IRCC" --header "Connection: Keep-Alive" --header 'SOAPACTION: "urn:schemas-sony-com:service:IRCC:1#X_SendIRCC"' --header "Content-Type: text/xml; charset=UTF-8" --header "X-Auth-PSK: pass" --data-binary '<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><s:Body><u:X_SendIRCC xmlns:u="urn:schemas-sony-com:service:IRCC:1"><IRCCCode>AAAAAgAAABoAAAB8Aw==</IRCCCode></u:X_SendIRCC></s:Body></s:Envelope>'
}

#to regenerate: echo '{"method":"getRemoteControllerInfo","id":54,"params":[],"version":"1.0"}' | ~/launchOnSony.sh system | jq -c .result[1] | jq > /tmp/abc
function irqCommandsJson() {
cat<<EOF
[
  {
    "name": "Num1",
    "value": "AAAAAQAAAAEAAAAAAw=="
  },
  {
    "name": "Num2",
    "value": "AAAAAQAAAAEAAAABAw=="
  },
  {
    "name": "Num3",
    "value": "AAAAAQAAAAEAAAACAw=="
  },
  {
    "name": "Num4",
    "value": "AAAAAQAAAAEAAAADAw=="
  },
  {
    "name": "Num5",
    "value": "AAAAAQAAAAEAAAAEAw=="
  },
  {
    "name": "Num6",
    "value": "AAAAAQAAAAEAAAAFAw=="
  },
  {
    "name": "Num7",
    "value": "AAAAAQAAAAEAAAAGAw=="
  },
  {
    "name": "Num8",
    "value": "AAAAAQAAAAEAAAAHAw=="
  },
  {
    "name": "Num9",
    "value": "AAAAAQAAAAEAAAAIAw=="
  },
  {
    "name": "Num0",
    "value": "AAAAAQAAAAEAAAAJAw=="
  },
  {
    "name": "Num11",
    "value": "AAAAAQAAAAEAAAAKAw=="
  },
  {
    "name": "Num12",
    "value": "AAAAAQAAAAEAAAALAw=="
  },
  {
    "name": "Enter",
    "value": "AAAAAQAAAAEAAAALAw=="
  },
  {
    "name": "GGuide",
    "value": "AAAAAQAAAAEAAAAOAw=="
  },
  {
    "name": "ChannelUp",
    "value": "AAAAAQAAAAEAAAAQAw=="
  },
  {
    "name": "ChannelDown",
    "value": "AAAAAQAAAAEAAAARAw=="
  },
  {
    "name": "VolumeUp",
    "value": "AAAAAQAAAAEAAAASAw=="
  },
  {
    "name": "VolumeDown",
    "value": "AAAAAQAAAAEAAAATAw=="
  },
  {
    "name": "Mute",
    "value": "AAAAAQAAAAEAAAAUAw=="
  },
  {
    "name": "TvPower",
    "value": "AAAAAQAAAAEAAAAVAw=="
  },
  {
    "name": "Audio",
    "value": "AAAAAQAAAAEAAAAXAw=="
  },
  {
    "name": "MediaAudioTrack",
    "value": "AAAAAQAAAAEAAAAXAw=="
  },
  {
    "name": "Tv",
    "value": "AAAAAQAAAAEAAAAkAw=="
  },
  {
    "name": "Input",
    "value": "AAAAAQAAAAEAAAAlAw=="
  },
  {
    "name": "TvInput",
    "value": "AAAAAQAAAAEAAAAlAw=="
  },
  {
    "name": "TvAntennaCable",
    "value": "AAAAAQAAAAEAAAAqAw=="
  },
  {
    "name": "WakeUp",
    "value": "AAAAAQAAAAEAAAAuAw=="
  },
  {
    "name": "PowerOff",
    "value": "AAAAAQAAAAEAAAAvAw=="
  },
  {
    "name": "Sleep",
    "value": "AAAAAQAAAAEAAAAvAw=="
  },
  {
    "name": "Right",
    "value": "AAAAAQAAAAEAAAAzAw=="
  },
  {
    "name": "Left",
    "value": "AAAAAQAAAAEAAAA0Aw=="
  },
  {
    "name": "SleepTimer",
    "value": "AAAAAQAAAAEAAAA2Aw=="
  },
  {
    "name": "Analog2",
    "value": "AAAAAQAAAAEAAAA4Aw=="
  },
  {
    "name": "TvAnalog",
    "value": "AAAAAQAAAAEAAAA4Aw=="
  },
  {
    "name": "Display",
    "value": "AAAAAQAAAAEAAAA6Aw=="
  },
  {
    "name": "Jump",
    "value": "AAAAAQAAAAEAAAA7Aw=="
  },
  {
    "name": "PicOff",
    "value": "AAAAAQAAAAEAAAA+Aw=="
  },
  {
    "name": "PictureOff",
    "value": "AAAAAQAAAAEAAAA+Aw=="
  },
  {
    "name": "Teletext",
    "value": "AAAAAQAAAAEAAAA/Aw=="
  },
  {
    "name": "Video1",
    "value": "AAAAAQAAAAEAAABAAw=="
  },
  {
    "name": "Video2",
    "value": "AAAAAQAAAAEAAABBAw=="
  },
  {
    "name": "AnalogRgb1",
    "value": "AAAAAQAAAAEAAABDAw=="
  },
  {
    "name": "Home",
    "value": "AAAAAQAAAAEAAABgAw=="
  },
  {
    "name": "Exit",
    "value": "AAAAAQAAAAEAAABjAw=="
  },
  {
    "name": "PictureMode",
    "value": "AAAAAQAAAAEAAABkAw=="
  },
  {
    "name": "Confirm",
    "value": "AAAAAQAAAAEAAABlAw=="
  },
  {
    "name": "Up",
    "value": "AAAAAQAAAAEAAAB0Aw=="
  },
  {
    "name": "Down",
    "value": "AAAAAQAAAAEAAAB1Aw=="
  },
  {
    "name": "ClosedCaption",
    "value": "AAAAAgAAAKQAAAAQAw=="
  },
  {
    "name": "Component1",
    "value": "AAAAAgAAAKQAAAA2Aw=="
  },
  {
    "name": "Component2",
    "value": "AAAAAgAAAKQAAAA3Aw=="
  },
  {
    "name": "Wide",
    "value": "AAAAAgAAAKQAAAA9Aw=="
  },
  {
    "name": "EPG",
    "value": "AAAAAgAAAKQAAABbAw=="
  },
  {
    "name": "PAP",
    "value": "AAAAAgAAAKQAAAB3Aw=="
  },
  {
    "name": "TenKey",
    "value": "AAAAAgAAAJcAAAAMAw=="
  },
  {
    "name": "BSCS",
    "value": "AAAAAgAAAJcAAAAQAw=="
  },
  {
    "name": "Ddata",
    "value": "AAAAAgAAAJcAAAAVAw=="
  },
  {
    "name": "Stop",
    "value": "AAAAAgAAAJcAAAAYAw=="
  },
  {
    "name": "Pause",
    "value": "AAAAAgAAAJcAAAAZAw=="
  },
  {
    "name": "Play",
    "value": "AAAAAgAAAJcAAAAaAw=="
  },
  {
    "name": "Rewind",
    "value": "AAAAAgAAAJcAAAAbAw=="
  },
  {
    "name": "Forward",
    "value": "AAAAAgAAAJcAAAAcAw=="
  },
  {
    "name": "DOT",
    "value": "AAAAAgAAAJcAAAAdAw=="
  },
  {
    "name": "Rec",
    "value": "AAAAAgAAAJcAAAAgAw=="
  },
  {
    "name": "Return",
    "value": "AAAAAgAAAJcAAAAjAw=="
  },
  {
    "name": "Blue",
    "value": "AAAAAgAAAJcAAAAkAw=="
  },
  {
    "name": "Red",
    "value": "AAAAAgAAAJcAAAAlAw=="
  },
  {
    "name": "Green",
    "value": "AAAAAgAAAJcAAAAmAw=="
  },
  {
    "name": "Yellow",
    "value": "AAAAAgAAAJcAAAAnAw=="
  },
  {
    "name": "SubTitle",
    "value": "AAAAAgAAAJcAAAAoAw=="
  },
  {
    "name": "CS",
    "value": "AAAAAgAAAJcAAAArAw=="
  },
  {
    "name": "BS",
    "value": "AAAAAgAAAJcAAAAsAw=="
  },
  {
    "name": "Digital",
    "value": "AAAAAgAAAJcAAAAyAw=="
  },
  {
    "name": "Options",
    "value": "AAAAAgAAAJcAAAA2Aw=="
  },
  {
    "name": "Media",
    "value": "AAAAAgAAAJcAAAA4Aw=="
  },
  {
    "name": "Prev",
    "value": "AAAAAgAAAJcAAAA8Aw=="
  },
  {
    "name": "Next",
    "value": "AAAAAgAAAJcAAAA9Aw=="
  },
  {
    "name": "DpadCenter",
    "value": "AAAAAgAAAJcAAABKAw=="
  },
  {
    "name": "CursorUp",
    "value": "AAAAAgAAAJcAAABPAw=="
  },
  {
    "name": "CursorDown",
    "value": "AAAAAgAAAJcAAABQAw=="
  },
  {
    "name": "CursorLeft",
    "value": "AAAAAgAAAJcAAABNAw=="
  },
  {
    "name": "CursorRight",
    "value": "AAAAAgAAAJcAAABOAw=="
  },
  {
    "name": "ShopRemoteControlForcedDynamic",
    "value": "AAAAAgAAAJcAAABqAw=="
  },
  {
    "name": "FlashPlus",
    "value": "AAAAAgAAAJcAAAB4Aw=="
  },
  {
    "name": "FlashMinus",
    "value": "AAAAAgAAAJcAAAB5Aw=="
  },
  {
    "name": "DemoMode",
    "value": "AAAAAgAAAJcAAAB8Aw=="
  },
  {
    "name": "Analog",
    "value": "AAAAAgAAAHcAAAANAw=="
  },
  {
    "name": "Mode3D",
    "value": "AAAAAgAAAHcAAABNAw=="
  },
  {
    "name": "DigitalToggle",
    "value": "AAAAAgAAAHcAAABSAw=="
  },
  {
    "name": "DemoSurround",
    "value": "AAAAAgAAAHcAAAB7Aw=="
  },
  {
    "name": "*AD",
    "value": "AAAAAgAAABoAAAA7Aw=="
  },
  {
    "name": "AudioMixUp",
    "value": "AAAAAgAAABoAAAA8Aw=="
  },
  {
    "name": "AudioMixDown",
    "value": "AAAAAgAAABoAAAA9Aw=="
  },
  {
    "name": "PhotoFrame",
    "value": "AAAAAgAAABoAAABVAw=="
  },
  {
    "name": "Tv_Radio",
    "value": "AAAAAgAAABoAAABXAw=="
  },
  {
    "name": "SyncMenu",
    "value": "AAAAAgAAABoAAABYAw=="
  },
  {
    "name": "Hdmi1",
    "value": "AAAAAgAAABoAAABaAw=="
  },
  {
    "name": "Hdmi2",
    "value": "AAAAAgAAABoAAABbAw=="
  },
  {
    "name": "Hdmi3",
    "value": "AAAAAgAAABoAAABcAw=="
  },
  {
    "name": "Hdmi4",
    "value": "AAAAAgAAABoAAABdAw=="
  },
  {
    "name": "TopMenu",
    "value": "AAAAAgAAABoAAABgAw=="
  },
  {
    "name": "PopUpMenu",
    "value": "AAAAAgAAABoAAABhAw=="
  },
  {
    "name": "OneTouchTimeRec",
    "value": "AAAAAgAAABoAAABkAw=="
  },
  {
    "name": "OneTouchView",
    "value": "AAAAAgAAABoAAABlAw=="
  },
  {
    "name": "DUX",
    "value": "AAAAAgAAABoAAABzAw=="
  },
  {
    "name": "FootballMode",
    "value": "AAAAAgAAABoAAAB2Aw=="
  },
  {
    "name": "iManual",
    "value": "AAAAAgAAABoAAAB7Aw=="
  },
  {
    "name": "Netflix",
    "value": "AAAAAgAAABoAAAB8Aw=="
  },
  {
    "name": "Assists",
    "value": "AAAAAgAAAMQAAAA7Aw=="
  },
  {
    "name": "FeaturedApp",
    "value": "AAAAAgAAAMQAAABEAw=="
  },
  {
    "name": "FeaturedAppVOD",
    "value": "AAAAAgAAAMQAAABFAw=="
  },
  {
    "name": "GooglePlay",
    "value": "AAAAAgAAAMQAAABGAw=="
  },
  {
    "name": "ActionMenu",
    "value": "AAAAAgAAAMQAAABLAw=="
  },
  {
    "name": "Help",
    "value": "AAAAAgAAAMQAAABNAw=="
  },
  {
    "name": "TvSatellite",
    "value": "AAAAAgAAAMQAAABOAw=="
  },
  {
    "name": "WirelessSubwoofer",
    "value": "AAAAAgAAAMQAAAB+Aw=="
  },
  {
    "name": "AndroidMenu",
    "value": "AAAAAgAAAMQAAABPAw=="
  },
  {
    "name": "RecorderMenu",
    "value": "AAAAAgAAAMQAAABIAw=="
  },
  {
    "name": "STBMenu",
    "value": "AAAAAgAAAMQAAABJAw=="
  },
  {
    "name": "MuteOn",
    "value": "AAAAAgAAAMQAAAAsAw=="
  },
  {
    "name": "MuteOff",
    "value": "AAAAAgAAAMQAAAAtAw=="
  },
  {
    "name": "AudioOutput_AudioSystem",
    "value": "AAAAAgAAAMQAAAAiAw=="
  },
  {
    "name": "AudioOutput_TVSpeaker",
    "value": "AAAAAgAAAMQAAAAjAw=="
  },
  {
    "name": "AudioOutput_Toggle",
    "value": "AAAAAgAAAMQAAAAkAw=="
  },
  {
    "name": "ApplicationLauncher",
    "value": "AAAAAgAAAMQAAAAqAw=="
  },
  {
    "name": "YouTube",
    "value": "AAAAAgAAAMQAAABHAw=="
  },
  {
    "name": "PartnerApp1",
    "value": "AAAAAgAACB8AAAAAAw=="
  },
  {
    "name": "PartnerApp2",
    "value": "AAAAAgAACB8AAAABAw=="
  },
  {
    "name": "PartnerApp3",
    "value": "AAAAAgAACB8AAAACAw=="
  },
  {
    "name": "PartnerApp4",
    "value": "AAAAAgAACB8AAAADAw=="
  },
  {
    "name": "PartnerApp5",
    "value": "AAAAAgAACB8AAAAEAw=="
  },
  {
    "name": "PartnerApp6",
    "value": "AAAAAgAACB8AAAAFAw=="
  },
  {
    "name": "PartnerApp7",
    "value": "AAAAAgAACB8AAAAGAw=="
  },
  {
    "name": "PartnerApp8",
    "value": "AAAAAgAACB8AAAAHAw=="
  },
  {
    "name": "PartnerApp9",
    "value": "AAAAAgAACB8AAAAIAw=="
  },
  {
    "name": "PartnerApp10",
    "value": "AAAAAgAACB8AAAAJAw=="
  },
  {
    "name": "PartnerApp11",
    "value": "AAAAAgAACB8AAAAKAw=="
  },
  {
    "name": "PartnerApp12",
    "value": "AAAAAgAACB8AAAALAw=="
  },
  {
    "name": "PartnerApp13",
    "value": "AAAAAgAACB8AAAAMAw=="
  },
  {
    "name": "PartnerApp14",
    "value": "AAAAAgAACB8AAAANAw=="
  },
  {
    "name": "PartnerApp15",
    "value": "AAAAAgAACB8AAAAOAw=="
  },
  {
    "name": "PartnerApp16",
    "value": "AAAAAgAACB8AAAAPAw=="
  },
  {
    "name": "PartnerApp17",
    "value": "AAAAAgAACB8AAAAQAw=="
  },
  {
    "name": "PartnerApp18",
    "value": "AAAAAgAACB8AAAARAw=="
  },
  {
    "name": "PartnerApp19",
    "value": "AAAAAgAACB8AAAASAw=="
  },
  {
    "name": "PartnerApp20",
    "value": "AAAAAgAACB8AAAATAw=="
  }
]
EOF
}

selection=$(irqCommandsJson | jq .[].name | nl -v 0| fzf --with-nth 2.. | awk '{print $1}')

if [[ -n "${selection}" ]]; then 
	cmd=$(irqCommandsJson | jq -r ".[${selection}].value")
	#invokeIrcCommand $cmd
	#echo $cmd
fi


