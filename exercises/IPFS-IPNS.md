### Publish with IPNS and your default key

IPNS, the name service of IPFS, makes your data accessible via a name.
An IPNS name is the hash of a public key, e.g. of your node. 
We have to be online for this exercise. So, start the daemon in the background via ```ipfs daemon &```, if necessary.

If you have created a file and added it to IPFS, every change of its content changes the CID completely.

```
echo "hello world" > /tmp/testfile.txt
ipfs add /tmp/testfile.txt
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o

echo "Hello world" > /tmp/testfile.txt
ipfs add /tmp/testfile.txt
ipfs cat QmePw8gVcBMb8x6kAep6aMBAX23hCSk6iZW3i9VKkiFhu1
```

If you publish a file with your default key, the file content is irrelevant to find it. 
The hash, i.e., CID, of your public key is returned, which, by the way, is the ID of your node.

```
ipfs id --format="<id>\n"

ipfs name publish QmePw8gVcBMb8x6kAep6aMBAX23hCSk6iZW3i9VKkiFhu1
ipfs name resolve <id>

ipfs cat /ipns/<id>
```

You do always get the current version and be sure about the originator.

```
echo "Hello World - latest version" > /tmp/testfile.txt
ipfs add /tmp/testfile.txt
ipfs cat QmRd4ErbHpTuih7SD9EM3qUqP6u55o4xF9w2x5Cd12pCHu

ipfs cat QmePw8gVcBMb8x6kAep6aMBAX23hCSk6iZW3i9VKkiFhu1
ipfs cat /ipns/<id>

ipfs name publish QmRd4ErbHpTuih7SD9EM3qUqP6u55o4xF9w2x5Cd12pCHu
ipfs cat /ipns/<id>
```

<br>

### Publish with an extra key

For more names and publications, respectively, you can create more keys.

Named new keys can be created easily.

```
ipfs key list
ipfs key gen --type=rsa --size=2048 101workshop
ipfs key list -l
```

Publish now your data with the extra key.

```
echo "hello world from 101 workshop" > /tmp/testfile.txt
ipfs add /tmp/testfile.txt
ipfs cat QmacF8iBHthXXPxCvJK33cnPXkhhgXVFtzdfP8Jq9iaCep

ipfs name publish --key=101workshop QmacF8iBHthXXPxCvJK33cnPXkhhgXVFtzdfP8Jq9iaCep
ipfs name resolve Qmeu6YZULFnXvXaL2iDz7gDQQEghuUEu6jzSCSP6VpHC28

ipfs cat /ipns/Qmeu6YZULFnXvXaL2iDz7gDQQEghuUEu6jzSCSP6VpHC28
```

**Note: IPNS is not permanent.**

<br>

### Get named keys

You can get IDs from other peers you are connected with, and then you can get their public keys.

```
ipfs swarm peers
ipfs id  -f="<pubkey>\n" <peer id>
```

You can get your private key as well, but be careful.

```
cat ~/.ipfs/config | jq ' {PrivKey: .Identity.PrivKey}'
```

<br>

### Create a public read-write directory to share (optional)

These tasks describe the steps if you want to create your public read-write directory 
to share it with other peers. The other peers can be nodes started on the same host.
You can skip these tasks and use already created key and directory.

Firstly, you create an extra key. 
How you distribute the key then is up to you. For this exercise, we have published it in IPFS.

```
ipfs key list
ipfs key gen --type=rsa --size=2048 <key name>
ipfs key list
```

Now, create a directory and add it to IPFS.

```
mkdir IPFS-Workshop-Public
cd IPFS-Workshop-Public
ipfs add -r .
```

Finally, you publish the directory using the key.

```
ipfs name publish --key=<key name> /ipfs/QmUNLLsPACCz1vLxQVkXqqLX5R1X345qqfHbsf67hvA3Nn
ipfs ls /ipns/<hash>
```

<br>

### Share a public read-write directory


But this is already created and published to share.
The other tasks describe how to share it using the key to encrypt. 
If you want to test it alone, you need a second node to share your public read-write directory.


Get private key "publicworkshop".

```
ipfs get -o ~/.ipfs/keystore/publicworkshop QmPfYYzGzPZZ7BCa8ZsgTP1jrA8NPDGeWvG6FxAmNw42AN 
ipfs key list
```

<br>
Get shared directory.

```
ipfs get -o ~/IPFS-Workshop-Public /ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

https://gateway.ipfs.io/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

http://localhost:8080/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3
```

<br>

### Play around with other peers

Write in shared directory and refresh the publishing.

```
mkdir ~/IPFS-Workshop-Public/<name>
echo "welcome from me" > ~/IPFS-Workshop-Public/<name>/welcome.txt

ipfs add -r ~/IPFS-Workshop-Public
ipfs name publish --key=publicworkshop /ipfs/<directory hash>
```

Get changed directory.

```
ipfs get -o ~/IPFS-Workshop-Public /ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

https://gateway.ipfs.io/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

http://localhost:8080/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3
```
