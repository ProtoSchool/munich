### Administrate the bootstrap peers

For connecting to other peers, your node has to know one peer, at least.
Therefore we configure a list of bootstrap peers. 

You can list bootstrap peers and ping them.

```
ipfs bootstrap list

for peeraddr in $(ipfs bootstrap list)
do
    echo $peeraddr
    peer=$(echo $peeraddr | awk '{ print $NF }')
    ipfs ping -n 1 $peer
    echo
done
```

You can add, remove, save and load bootstrap peers.

```
ipfs bootstrap add /ip4/139.59.152.171/tcp/4001/ipfs/QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx

ipfs bootstrap list > /tmp/mybootstraplist

ipfs bootstrap rm all

cat /tmp/mybootstraplist | ipfs bootstrap add

ipfs bootstrap list | grep QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx

ipfs bootstrap rm /ip4/139.59.152.171/tcp/4001/ipfs/QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx
ipfs bootstrap list | grep QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx
```

There are default bootstrap peers which you can add at any time.

```
ipfs bootstrap rm all
ipfs bootstrap add /ip4/139.59.152.171/tcp/4001/ipfs/QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx

ipfs bootstrap add default
ipfs bootstrap list | grep QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx
```

<br>

### Create a private network of peers

Firstly, you have to stop the daemon, if running.

```
ipfs shutdown
```

Then, you remove all bootstrap peers and start the daemon again.

```
ipfs bootstrap rm all
ipfs daemon &
```

Now, you have a bootstrap peer for a private network.
You choose an address of the bootstrap peer for other peers' configuration.

```
ipfs id -f="<addrs>\n"
```

This address you add as bootstrap peer to other peers.

```
ipfs bootstrap add <multiaddr>/<peerID>
```

ToDo: Let one peer connect to another network and watch the connected peers.


