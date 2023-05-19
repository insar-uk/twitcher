#!/bin/bash
t=10
fs=44100
s=$[$t*$fs]
arecord -D plughw:Device,0 -f cd -t wav -s $s -r $fs -c 1 -q - | tee soundcard1.wav > /dev/null &
arecord -D plughw:Device_1,0 -f cd -t wav -s $s -r $fs -c 1 -q - | tee soundcard2.wav > /dev/null &
arecord -D hw:Device_2,0 -f cd -t wav -s $s -r $fs -c 1 -q - | tee soundcard3.wav > /dev/null &
arecord -D hw:Device_3,0 -f cd -t wav -s $s -r $fs -c 1 -q - | tee soundcard4.wav > /dev/null &
echo $(date) " RECORDING FOR " $t
aplay chirp.wav
sleep $t
date
echo "sending"
python send_audio.py
date
echo "done send"
