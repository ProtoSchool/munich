### The peers of your swarm

Under the hood, you are connected to other peers, and together you constitute a swarm.

You can display information, like peer id, addresses, or public key, about the peers you are connected.

```
ipfs swarm peers
ipfs swarm peers -v
ipfs swarm addrs

ipfs id <peer hash>
```

You can explicitly disconnect a connected peer and connect again, or vice versa, if you know the peer id.

```
ipfs swarm peers | head -1

ipfs swarm disconnect <peer address>
ipfs swarm peers | grep <peer address>

ipfs swarm connect <peer address>
ipfs swarm peers | grep <peer address>
```

You can ping a peer and check out, if a ping connects a disconnected peer again.

```
ipfs ping <peer address>

ipfs swarm disconnect <peer address>
ipfs swarm peers | grep <peer address>

ipfs ping <peer address>
ipfs swarm peers | grep <peer address>
```

<br>
Check the connections with other member of the workshop.
