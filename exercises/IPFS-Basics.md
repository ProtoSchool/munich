### Initialize IPFS

Before you can start IPFS for the first time, you have to initialize it.

```
ipfs init
```
Now, IPFS has created a home directory and filled it initially. 
The default is ```~/.ipfs```, but you can change it via the variable ```IPFS_PATH```, 
and another execution of ```ipfs init``` creates a new instance with another home directory.

There IPFS stores configuration, keys, and other data. But you should use commands to explore.

<br>

### See the config and start the daemon

Some commands do not need a running IPFS. 

Get the config of your IPFS node and its ID.

```
ipfs config show
ipfs id
```

<br>
Parts of the JSON data can be selected individually.

```
ipfs config Addresses
ipfs config Addresses.API
```

Let's start IPFS and see some things a running IPFS provides.

<br>
Start the daemon in the background.

```
ipfs daemon &
```

<br>

### The API server and the web UI

The API server provides a [HTTP interface for JSON](https://docs.ipfs.io/reference/api/http/).

Get the API server address, the version and then prepare the URL to request the ID of your node.

```
ipfs config Addresses.API
ipfs version
curl http://127.0.0.1:5001/api/v0/id | jq
```

If you have seen the difference between the CLI output before and this one, it is because you were offline. 
The CLI requests the API server, if online.

<br>

The API server offers a web UI out of the box.
```
open http://127.0.0.1:5001/webui
```

The web UI is using IPFS, and the URL in the browser has changed and does look like this:

```http://127.0.0.1:5001/ipfs/QmXc9raDM1M5G5fpBnVyQ71vR4gbnskwnB9iMEzBuLgvoZ/#/```

To investigate this, we use the CID (QmHash) of the web UI URL and explore it in the web UI. 
So, copy 'QmXc9raDM1M5G5fpBnVyQ71vR4gbnskwnB9iMEzBuLgvoZ' in the 'Explore' textfield.

You see the directory of the web UI itself. Navigate deeper and find out files are not displayed according to its type. 
Here the gateway does help. 

<br>

###  Local and public gateways to IPFS files

IPFS includes a local gateway which provides files and directories requested via CID and displayed according to its type.

Open your local gateway and display content from the already open web UI via CIDs.

```
ipfs config Addresses.Gateway
open http://127.0.0.1:8080/ipfs/QmUVmQX9RQpn2iDJ5CKraqGN412UWAmwyvSgqB7bzYovSV
```

As well, you can use the link 'View on IPFS Gateway' in the web UI to navigate to the file displayed in a public gateway.

There is a list of [public IPFS gateways](https://ipfs.github.io/public-gateway-checker/) online.

<br>

### Explore with CLI 

Before we go on using the CLI, I like to mention the CLI help. Please, have a look at ```ipfs --help```.

IPFS is a filesystem and has files and directories addressable directly by its CIDs. 
Child elements can be addressed as well by a CID and the following path.

Now, explore files and directories via a root CID and paths.

```
ipfs ls -v /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/
ipfs ls -v /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/static/
ipfs ls -v /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/static/js

ipfs cat /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/manifest.json

ipfs get -o /tmp/manifest.json /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/manifest.json
cat /tmp/manifest.json
```

To get an impression of the internal reference structure we can use ```ipfs refs```

```
ipfs refs -re /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh
ipfs refs -re /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh/static/
```

<br>
Explore files and directories again. Now via CIDs directly.

```
ipfs ls -v /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh
ipfs ls -v /ipfs/QmchYktXUvYPeNLWu2miVi1TNKTWazFnyDsBo3NufHo87x
ipfs ls -v /ipfs/QmWNSMT98yZ2Km1rNUzvGkvCKbZp7PDKi5EFGgL3eA2haH

ipfs cat /ipfs/QmPKPhRf2FaxEPeYPa1PebmoLLENgHyq7Sd8UJSSVpnti4

ipfs get -o /tmp/manifest2.json /ipfs/QmPKPhRf2FaxEPeYPa1PebmoLLENgHyq7Sd8UJSSVpnti4
cat /tmp/manifest.json

ipfs refs -re /ipfs/QmSDgpiHco5yXdyVTfhKxr3aiJ82ynz8V14QcGKicM3rVh
ipfs refs -re /ipfs/QmchYktXUvYPeNLWu2miVi1TNKTWazFnyDsBo3NufHo87x/
```
<br>

### Add files

<br>
First, we create only CIDs of files ...

```
ipfs add --only-hash /tmp/manifest.json /tmp/manifest2.json

echo " " >> /tmp/manifest.json
ipfs add --only-hash /tmp/manifest.json /tmp/manifest2.json

ipfs add --only-hash --wrap-with-directory /tmp/manifest.json /tmp/manifest2.json

```
and directories. Now using ```-n -w``` instead of ```--only-hash --wrap-with-directory```
 
```
mkdir /tmp/test
cp /tmp/manifest*.json /tmp/test

ipfs add -n --recursive /tmp/test
ipfs add -nw --recursive /tmp/test
```

<br>
Now, we create files and directories, and only add them to IPFS and do not pin them. 
They usually will be pinned, i.e., be stored in the local repository permanently.
Now using ```-r``` instead of ```--recursive```.

```
mkdir testdata
cd testdata

for dir in a b c
do
    mkdir $dir
    for file in d e f
    do
        echo "being in $dir/$file" > $dir/$file
    done
done
find .

ipfs add -r --pin=false .
```

<br>

Explore ```testdata``` in the web UI.

```
open http://127.0.0.1:5001/ipfs/QmXc9raDM1M5G5fpBnVyQ71vR4gbnskwnB9iMEzBuLgvoZ/#/explore/QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
```


<br>

Explore ```testdata``` via CLI

```
ipfs ls QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs refs -r --edges QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM

ipfs cat QmTnXiAHv2eV3Nx1AwAuifoLFYXwY2HdHjB9atXCp7xXUV
```

Change a file, add it all again, and investigate the changes.
Now using ```-e``` instead of ```--edges```.

```
echo "I was changed" > a/d
ipfs add -r --pin=false .
ipfs cat QmevGKHyANXuX91aHqr6C7Tw9Eh9BiiBWt536ndgBAdUij

ipfs ls QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs ls QmfLbiadyx6z3GkAb5KULbo5J6NJUVGhWCfk34xDmm47mU

ipfs refs -re QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs refs -re QmfLbiadyx6z3GkAb5KULbo5J6NJUVGhWCfk34xDmm47mU
```

Under the hood, we have manipulated DAG objects. We can do this directly via ```ipfs object```.

```
ipfs object get QmevGKHyANXuX91aHqr6C7Tw9Eh9BiiBWt536ndgBAdUij | jq

ipfs object get QmfLbiadyx6z3GkAb5KULbo5J6NJUVGhWCfk34xDmm47mU | jq
ipfs object links QmfLbiadyx6z3GkAb5KULbo5J6NJUVGhWCfk34xDmm47mU
ipfs object stat QmfLbiadyx6z3GkAb5KULbo5J6NJUVGhWCfk34xDmm47mU

ipfs object diff -v QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM QmfLbiadyx6z3GkAb5KULbo5J6NJUVGhWCfk34xDmm47mU 
```

There will be more about Merkle DAG objects and their raw data in another exercise to come.

