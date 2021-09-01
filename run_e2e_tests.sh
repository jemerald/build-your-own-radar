#!/bin/bash

API_KEY=$1
CLIENT_ID=$2
TEST_URL=$3

API_KEY=$API_KEY CLIENT_ID=$CLIENT_ID npm run dev &
sleep 30
TEST_URL_LOCAL=$TEST_URL npm run end_to_end_test

ps -eo 'pgid pid command'
ps fj
PID=$(jobs -p)
echo $PID
kill -- -$(ps -o pgid= $PID | grep -o [0-9]*)
ps fj