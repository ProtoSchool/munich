### Default key: Create, publish, change data and refresh

<br>
Create a testfile and add it to IPFS.

```
echo "hello world" > testfile.txt
ipfs add testfile.txt
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
```

<br>
Publish your data with your default key.

```
ipfs name publish QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
ipfs cat /ipns/<hash>

ipfs name resolve <hash>
```

<br>
Change the data and refresh the publishing.

```
echo "hello world from self" > testfile.txt
ipfs add testfile.txt
ipfs cat QmaAAfeTMXBkrNaRqztWv72QEBFYrg7YECSCdhmAj9xipS

ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
ipfs cat /ipns/<old hash>

ipfs name publish QmaAAfeTMXBkrNaRqztWv72QEBFYrg7YECSCdhmAj9xipS
ipfs cat /ipns/<new hash>
```

<br>

### Publish with an extra key

<br>
Create an extra key.

```
ipfs key list
ipfs key gen --type=rsa --size=2048 101workshop
ipfs key list
```

<br>
Publish your data with the extra key.

```
echo "hello world from 101 workshop" > testfile.txt
ipfs add testfile.txt
ipfs name publish --key=101workshop QmacF8iBHthXXPxCvJK33cnPXkhhgXVFtzdfP8Jq9iaCep
ipfs cat /ipns/Qmeu6YZULFnXvXaL2iDz7gDQQEghuUEu6jzSCSP6VpHC28

ipfs name resolve Qmeu6YZULFnXvXaL2iDz7gDQQEghuUEu6jzSCSP6VpHC28
```

<br>

**Note: IPNS is not permanent.**

<br>

### Get your keys

<br>
Get your peer id and your public key.

```
ipfs config Identity.PeerID
ipfs id <peer id>
```

<br>
Get your private key.

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
