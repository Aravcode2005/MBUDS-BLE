#!/bin/bash
cd BackendService
node server.js & serverPid=$!

for i in ${1...15};do
statusCode==$(curl -o /dev/null -s -w "%{http_code}\n" $protocol://localhost:$port/$endpoint)
if [ $statusCode == "000"];
then
sleep 1
fi 
break
echo $statusCode
kill $serverPid





