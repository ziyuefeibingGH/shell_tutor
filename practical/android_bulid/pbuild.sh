#!/bin/bash
#
# when android build fw, first need source env, just for source
#

SOURCE_EXECPATH=$(pwd)

# source android envsetup.sh
source $SOURCE_EXECPATH/build/envsetup.sh

# achieve prev*.mk path, not use ls, because in my .bashrc: 
# alias ls='ls --color=auto'
PREV_FILEPATH=$(file $(pwd)/out/target/product/*/previous_build_config.mk | grep -v "generic" )
PREV_FILEPATH=${PREV_FILEPATH%:*}
echo $PREV_FILEPATH

if [ -e $PREV_FILEPATH ]
# file exists 
then
	OLD_LUNCH_OPTION=$(sed -nr "{s/.*(:=[[:space:]])(.*)(-\{).*/\2/p}" $PREV_FILEPATH)
	echo $1
	case "$1" in
		# if specified option
		eng|userdebug|user)
			NEW_LUNCH_OPTION=${OLD_LUNCH_OPTION%-*}-$1
			echo $NEW_LUNCH_OPTION
			lunch $NEW_LUNCH_OPTION
			;;
		**)
			echo $OLD_LUNCH_OPTION
			lunch $OLD_LUNCH_OPTION
			;;
	esac
# not exixts
else
	lunch
fi
