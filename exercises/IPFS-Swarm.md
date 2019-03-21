Start the daemon in the background (if necessary.

```
ipfs daemon &
```

<br>

### The peers of your swarm

<br>
Show information about the peers you are connected.

```
ipfs swarm peers
ipfs swarm peers -v
ipfs swarm addrs

ipfs id <peer hash>
```

<br>
Disconnect a connected peer and connect again.

```
ipfs swarm peers | head -1

ipfs swarm disconnect <peer address>
ipfs swarm peers | grep <peer address>

ipfs swarm connect <peer address>
ipfs swarm peers | grep <peer address>
```

<br>
Ping peer and check out, if a ping connects a disconnected peer.

```
ipfs ping <peer address>

ipfs swarm disconnect <peer address>
ipfs swarm peers | grep <peer address>

ipfs ping <peer address>
ipfs swarm peers | grep <peer address>
```

<br>
Check the connections with other member of the workshop.
