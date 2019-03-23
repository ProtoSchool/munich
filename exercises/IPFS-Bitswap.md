### Get a large file and watch bitswap acting.

<br>
Reset the bitswap statistics.

```
ipfs bitswap stat
ipfs shutdown
ipfs daemon &
ipfs bitswap stat
```

<br>
Watch the statistics in one terminal.

```
while true
do
    ipfs bitswap stat | grep -v Qm | grep -v 12D
    sleep 1
done
```

<br>
Watch the bitswap ledger in one terminal.

```
while true
do
  for peer in $(ipfs swarm peers | awk -F/ '{ print $NF }')
  do
    ledgerdata=$(ipfs bitswap ledger $peer)
    if [[ -n "$(echo $ledgerdata | grep -v '\t0$' | grep -v '\t0.000000$' | grep Bytes)" ]]
    then 
        date
        echo $peer
        echo $ledgerdata
        echo
    fi
  done
  sleep 1
done
```

<br>
Watch the number of connected peers in one terminal.

```
while true
do
   printf "\rNumber of connected peers: %s" $(ipfs swarm peers | wc -l)
   sleep 1
done
```

<br>
Start the download in one terminal.

```
ipfs get -o /tmp/bigfile QmYi6yy3ygc3dNJETqFvvyXdZx28dNyNbZLHkiimhd8Jzd
```

Note: Do you have it already in your repo? You can remove it, i.e. `ipfs repo gc.`
If the download is stalling, you can do the same download from another node in parallel.

ToDo: What is different, if a peer nearby has the big file already downloaded?
