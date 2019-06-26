echo '{"id":0,"jsonrpc":"2.0","method":"miner_getstatdetail"}' | nc 127.0.0.1 3333 | jq  '.result' | curl -H "Content-Type: application/json" -X POST -d @- http://api.gpu.network/api/rigs
