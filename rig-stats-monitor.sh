echo '{"id":0,"jsonrpc":"2.0","method":"miner_getstatdetail"}' | nc 127.0.0.1 3333 -w 1 | jq  '.result' | curl -H "Content-Type: application/json" -X POST -d @- http://165.227.12.162:4444/api/rigs
