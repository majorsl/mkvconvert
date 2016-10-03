#!/bin/sh
# version 1.0.1
#
# Requires installed and working Homebrew, then: brew install ffmpeg
#
# Written quickly to remove a batch of language audio tracks from a series of video files.
# First map is the video track to keep, second is the audio track to keep. It saves files
# to the same directory inside a CONVERTED directory.

STARTDIR=$1
EXCLUDE=$2

if [ "$STARTDIR" = "" ] || [ "$STARTDIR" = "?" ] || [[ "$STARTDIR" = *-h* ]]; then
	ECHO ""
	ECHO "Usage: mkvedit.sh <directorypath> to parse."
	ECHO ""
	exit
fi

IFS=$'\n'

cd $STARTDIR

for FILENAME in *.mkv
do
echo "Processing: $FILENAME"

ffmpeg -i $FILENAME -map 0:0 -map 0:2 -vcodec copy -acodec copy CONVERTED/$FILENAME

done

unset IFS