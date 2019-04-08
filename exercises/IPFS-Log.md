### Standard logging

If the daemon is running, you can watch the event log which shows all emerging log messages.

```
ipfs log tail
```

The daemon is separated into subsystems - so does the logging.
To focus it on a particular subsystem you can change the log level of the subsystem.
The output shows up in the terminal where you started the daemon.

```
ipfs log ls
ipfs log level swarm2 info
```

A restart always sets the log configuration to default.

### Advanced logging

For more logging flexibility and control over its output, you must start the daemon differently.

```
ipfs shutdown
(ipfs daemon 2>&1) > /tmp/daemon.log

ipfs log level swarm2 info
ipfs log level dht info
```

Now you can watch different things in different terminals in parallel.

```
tail -f /tmp/daemon.out
tail -f /tmp/daemon.out | grep swarm2
tail -f /tmp/daemon.out | grep dht
```

Be aware of the growing ```/tmp/daemon.out``` and remove it accordingly.
