Get a large file and watch bitswap acting.

```
ipfs get -o /tmp/bigfile QmfWQHVazH6so9p27z27rr8TJSdBFGpH7hunDcaZ1EAQ2c

ipfs bitswap wantlist
ipfs bitswap ledger <peer id>

num=1
for i in $(ipfs bitswap wantlist)
do
    echo $num $i
    ipfs bitswap ledger $i
    echo
    let num=num+1
done
```

Note: The output of the ledger shows no data transfer. I've ask about it in the [IPFS Forum](https://discuss.ipfs.io/t/bitswap-ledger-shows-no-transferred-data/5073).

<br>
Get a large file and compare statistics before and after.

```
ipfs bitswap stat | head -20
ipfs get -o /tmp/bigfile QmYi6yy3ygc3dNJETqFvvyXdZx28dNyNbZLHkiimhd8Jzd
ipfs bitswap stat | head -20
```
