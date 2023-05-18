#!/bin/bash
t=10
arecord -D plughw:Device,0 -f cd -t wav -d $t -r 44100 -c 1 -q - | tee soundcard1.wav > /dev/null &
arecord -D plughw:Device_1,0 -f cd -t wav -d $t -r 44100 -c 1 -q - | tee soundcard2.wav > /dev/null &
arecord -D hw:Device_2,0 -f cd -t wav -d $t -r 44100 -c 1 -q - | tee soundcard3.wav > /dev/null &
arecord -D hw:Device_3,0 -f cd -t wav -d $t -r 44100 -c 1 -q - | tee soundcard4.wav > /dev/null &
sleep $t
sleep 1
date
echo "sending"
python sender.py
date
echo "done send"
