Watch the event log.

```
ipfs log tail
```

<br>
Administrate the logging of the daemon which shows up in the terminal where you started the daemon.

```
ipfs log ls
ipfs log level swarm2 info
```

<br>
For more control over the output restart the daemon differently.

```
ipfs shutdown
(ipfs daemon 2>&1) > /tmp/daemon.log

ipfs log level swarm2 info
ipfs log level dht info
```

Note: A restart always sets the log configuration to default.

<br>
Now you can watch different things in different terminals in parallel.

```
tail -f /tmp/daemon.out
tail -f /tmp/daemon.out | grep swarm2
tail -f /tmp/daemon.out | grep dht
```

Note: Be aware of the growing ```/tmp/daemon.out``` and remove it accordingly.
