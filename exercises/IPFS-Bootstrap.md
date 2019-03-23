### Administrate the bootstrap peers

<br>
List bootstrap peers and ping them.

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

<br>
Add, remove, save and load bootstrap peers.

```
ipfs bootstrap add /ip4/139.59.152.171/tcp/4001/ipfs/QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx

ipfs bootstrap list > /tmp/mybootstraplist

ipfs bootstrap rm all

cat /tmp/mybootstraplist | ipfs bootstrap add

ipfs bootstrap list | grep QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx

ipfs bootstrap rm /ip4/139.59.152.171/tcp/4001/ipfs/QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx
ipfs bootstrap list | grep QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx
```

<br>
Add default bootstrap peers.

```
ipfs bootstrap rm all
ipfs bootstrap add /ip4/139.59.152.171/tcp/4001/ipfs/QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx

ipfs bootstrap add default
ipfs bootstrap list | grep QmSoLer265NRgSp2LA3dPaeykiS1J6DifTC88f5uVxxxxx
```

### Create a private network of peers

Stop the daemon, if running.

```
ipfs shutdown
```

<br>
Remove all bootstrap peers and start the daemon.

```
ipfs bootstrap rm all
ipfs daemon &
```

<br>
Choose peer address for private network.

```
ipfs id -f="<addrs>\n"
```

<br>
Add bootstrap peer from private network.

```
ipfs bootstrap add <multiaddr>/<peerID>
```

ToDo: Let one peer connect to another network and watch the connected peers.


