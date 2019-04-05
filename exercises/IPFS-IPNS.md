### Publish with IPNS and your default key

IPNS, the name service of IPFS, makes your data accessible via a name.
An IPNS name is the hash of a public key, e.g. of your node. 
We have to be online for this exercise. So, start the daemon in the background via ```ipfs daemon &```, if necessary.

If you have created a file and added it to IPFS, every change of its content changes the CID completely.

```
echo "hello world" > testfile.txt
ipfs add testfile.txt
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o

echo "Hello world" > testfile.txt
ipfs add testfile.txt
ipfs cat QmePw8gVcBMb8x6kAep6aMBAX23hCSk6iZW3i9VKkiFhu1
```

<br>
If you publish a file with your default key, the file content is irrelevant to find it. 
The hash, i.e., CID, of your public key is returned, which, by the way, is the ID of your node.

```
ipfs id --format="<id>\n"

ipfs name publish QmePw8gVcBMb8x6kAep6aMBAX23hCSk6iZW3i9VKkiFhu1
ipfs name resolve <id>

ipfs cat /ipns/<id>
```

<br>
You do always get the current version and be sure about the originator.

```
echo "Hello World - latest version" > testfile.txt
ipfs add testfile.txt
ipfs cat QmRd4ErbHpTuih7SD9EM3qUqP6u55o4xF9w2x5Cd12pCHu

ipfs cat QmePw8gVcBMb8x6kAep6aMBAX23hCSk6iZW3i9VKkiFhu1
ipfs cat /ipns/<id>

ipfs name publish QmRd4ErbHpTuih7SD9EM3qUqP6u55o4xF9w2x5Cd12pCHu
ipfs cat /ipns/<id>
```

<br>

### Publish with an extra key

For more names and publications, respectively, you can create more keys.

<br>
Named new keys can be created easily.

```
ipfs key list
ipfs key gen --type=rsa --size=2048 101workshop
ipfs key list -l
```

<br>
Publish now your data with the extra key.

```
echo "hello world from 101 workshop" > testfile.txt
ipfs add testfile.txt
ipfs cat QmacF8iBHthXXPxCvJK33cnPXkhhgXVFtzdfP8Jq9iaCep

ipfs name publish --key=101workshop QmacF8iBHthXXPxCvJK33cnPXkhhgXVFtzdfP8Jq9iaCep
ipfs name resolve Qmeu6YZULFnXvXaL2iDz7gDQQEghuUEu6jzSCSP6VpHC28

ipfs cat /ipns/Qmeu6YZULFnXvXaL2iDz7gDQQEghuUEu6jzSCSP6VpHC28
```

<br>

**Note: IPNS is not permanent.**

<br>

### Get named keys

<br>
You can get IDs from other peers you are connected with, and then you can get their public keys.

```
ipfs swarm peers
ipfs id  -f="<pubkey>\n" <peer id>
```

<br>
You can get your private key as well, but be careful.

```
cat ~/.ipfs/config | jq ' {PrivKey: .Identity.PrivKey}'
```

<br>

### Share a public read-write directory

Note: "(optional)" describes the steps for your public read-write directory. 
Regarding the other steps, you can use an existing directory and the key "publicworkshop." 
Or you need a second node to share your public read-write directory.

<br>
Create an extra key (optional).

```
ipfs key list
ipfs key gen --type=rsa --size=2048 <key name>
ipfs key list
```

<br>
Create a directory and add it to IPFS (optional).

```
mkdir IPFS-Workshop-Public
cd IPFS-Workshop-Public
ipfs add -r .
```

<br>
Publish directory using private key (optional).

```
ipfs name publish --key=<key name> /ipfs/QmUNLLsPACCz1vLxQVkXqqLX5R1X345qqfHbsf67hvA3Nn
ipfs ls /ipns/<hash>
```

<br>
Get private key "publicworkshop".

```
ipfs get -o ~/.ipfs/keystore/publicworkshop QmPfYYzGzPZZ7BCa8ZsgTP1jrA8NPDGeWvG6FxAmNw42AN 
ipfs key list
```

<br>
Get shared directory.

```
ipfs get -o ~/IPFS-Workshop-Public /ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

open https://gateway.ipfs.io/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

open http://localhost:8080/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3
```

<br>

### Play around with other peers

<br>
Write in shared directory and refresh the publishing.

```
mkdir ~/IPFS-Workshop-Public/<name>
echo "welcome from me" > ~/IPFS-Workshop-Public/<name>/welcome.txt

ipfs add -r ~/IPFS-Workshop-Public
ipfs name publish --key=publicworkshop /ipfs/<directory hash>
```

<br>
Get changed directory.

```
ipfs get -o ~/IPFS-Workshop-Public /ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

open https://gateway.ipfs.io/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3

open http://localhost:8080/ipns/QmYX4KgNrkX7yuJtNPAUXqMdyyvseFnpHHxNFoAFiw3kF3
```
