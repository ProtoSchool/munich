### Server Preparation 

<br>
Prepare server node in one terminal (#1)

```
export IPFS_PATH="~/.ipfs-p2p-server"
ipfs init
```

<br>
Enable Libp2pStreamMounting and start the daemon

```
ipfs config Experimental.Libp2pStreamMounting --bool true
ipfs daemon &
```

<br>
Start listening to forward the received connections to the target address

```
ipfs p2p listen /x/101-IPFS-Workshop/1.0 /ip4/127.0.0.1/tcp/22365
```

<br>
Get server's ID

```
ipfs config Identity.PeerID
```

<br>

### Client Preparation 

<br>
Prepare client node in another terminal (#2)

```
export IPFS_PATH="~/.ipfs-p2p-client"
ipfs init
```

<br>
Change the ports of the Addresses, enable Libp2pStreamMounting and start the daemon

```
ipfs config Addresses
ipfs config edit
ipfs config Experimental.Libp2pStreamMounting --bool true
ipfs daemon &
```

<br>
Forward specified client connection to server

```
ipfs p2p forward /x/101-IPFS-Workshop/1.0 /ip4/127.0.0.1/tcp/22366 /ipfs/<server Identity.PeerID>
```


<br>

### Simple Test  

<br>
Start listening to the server's target address in one terminal

```
nc -l 127.0.0.1 22365
```

<br>
Start streaming to the forwarded client connection in the other terminal

```
while true
do
    sleep 1
    printf "%s\n" "$(date)"
done | nc -v 127.0.0.1 22366
```

<br>

### Media Test  

<br>
Prepare a named pipe for a little streaming 

```
mkfifo -m a+rw /tmp/pipe
```

<br>
Start the media program in yet another terminal (#3)

```
/Applications/VLC.app/Contents/MacOS/VLC /tmp/pipe
```

<br>
Start listening to forward to the pipe in another terminal

```
nc -l 127.0.0.1 22365 > /tmp/pipe
```

<br>
Start streaming yet in another terminal

```
cat ~/Desktop/testmovie.mp4 | nc -v 127.0.0.1 22366
```

Bug: Last two steps has to be done again.


<br>

### Clean up 

<br>
Closing the terminals #1 and #2 will stop the ipfs daemons.
<br>

<br>
Remove named pipe and config directories

```
rm /tmp/pipe
rm -rf ~/.ipfs-p2p-client ~/.ipfs-p2p-server
```