### Check the config and start the daemon

<br>
Get the config of your IPFS node.

```
ipfs config show
```

<br>
Get the addresses of the node.

```
ipfs config Addresses
```


<br>
Start the daemon in the background.

```
ipfs daemon &
```

<br>

### The Web UI and the Gateways

<br>
Get IP address of API server and open web UI.

```
ipfs config Addresses.API
open http://127.0.0.1:5001/webui
```

<br>
Get the hash of the web UI URL and explore it in the web UI. 

Check out the [public IPFS gatways](https://ipfs.github.io/public-gateway-checker/).
Check out the local gateway.

```
ipfs config Addresses.Gateway
open http://127.0.0.1:8080/ipfs/QmPKPhRf2FaxEPeYPa1PebmoLLENgHyq7Sd8UJSSVpnti4
```

<br>

### Explore with CLI 

<br>
Explore files and directories via a root hash and names.

```
ipfs ls -v /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/
ipfs ls -v /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/static/

ipfs cat /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/manifest.json

ipfs get -o /tmp/manifest.json /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/manifest.json
cat /tmp/manifest.json

ipfs refs -re /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh
ipfs refs -re /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/static/
```

<br>
Explore files and directories via hashes directly

```
ipfs ls -v /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/
ipfs ls -v /ipfs/QmchYktXUvYPeNLWu2miVi1TNKTWazFnyDsBo3NufHo87x/

ipfs cat /ipfs/QmPKPhRf2FaxEPeYPa1PebmoLLENgHyq7Sd8UJSSVpnti4

ipfs get -o /tmp/manifest2.json /ipfs/QmPKPhRf2FaxEPeYPa1PebmoLLENgHyq7Sd8UJSSVpnti4
cat /tmp/manifest.json

ipfs refs -re /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh
ipfs refs -re /ipfs/QmchYktXUvYPeNLWu2miVi1TNKTWazFnyDsBo3NufHo87x/
```
<br>

### Add files

<br>
Create hashes of files and directories.

```
ipfs add -n /tmp/manifest.json /tmp/manifest2.json

echo " " >> /tmp/manifest.json
ipfs add -n /tmp/manifest.json /tmp/manifest2.json

ipfs add -nw /tmp/manifest.json /tmp/manifest2.json

mkdir /tmp/test
cp /tmp/manifest*.json /tmp/test

ipfs add -nr /tmp/test
ipfs add -nrw /tmp/test
```

<br>
Add files and directories.

```
mkdir testdata
cd testdata

for d in a b c
do
    mkdir $d
    for f in d e f
    do
        echo $f > $d/$f
    done
done
find .

ipfs add -r --pin=false .
```

<br>

Explore ```testdata``` in the web UI.


<br>

Explore what a change changes.

```
ipfs ls QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs refs -re QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e

ipfs cat QmTnXiAHv2eV3Nx1AwAuifoLFYXwY2HdHjB9atXCp7xXUV
echo "x" > a/d
ipfs add -r --pin=false .
ipfs cat QmUNXr47Bja3aHUMfhXX5mMWTFJKuoUGETcA48vHG7dhag

ipfs ls QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs ls QmSmXg1ehfz2wfhXVh3N6MvFKctDZ9qs9U5Y7KpuNZkRhX

ipfs refs -re QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs refs -re QmSmXg1ehfz2wfhXVh3N6MvFKctDZ9qs9U5Y7KpuNZkRhX
```


