### Pin files and directories

IPFS stores all added objects in the local repository, but a garbage collection will not remove pinned objects.
A garbage collection takes place periodically as configured; see: ```ipfs config Datastore.GCPeriod```. 

To test this behavior, we can go offline by ```ipfs shutdown```, or we see the immediately reload from other IPFS nodes if we make a request.

<br>
Add a file pinned by default.

```
echo "hello world" > testfile.txt
ipfs add testfile.txt
ipfs pin ls QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
```

Garbage collect the repository and check for the pinned file again.

```
ipfs repo gc
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
```

Remove the pin, garbage collect the repository and check now for the unpinned file.

```
ipfs pin rm QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
ipfs pin ls QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o

ipfs repo gc
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
```

<br>
Create a test directory and add it without pinning.
If you have already done this in a former exercise, skip this step.

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

Now, look for pins, remove them, and look again.

```
ipfs pin ls QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs pin add QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs pin ls QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
```

Garbage collect the repo and check for pinned file.

```
ipfs refs -re QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs repo gc
ipfs refs -re QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
```

Remove pins and repeat it.

```
ipfs rm -r QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs pin ls QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM

ipfs refs -re QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
ipfs repo gc
ipfs refs -re QmScbQs6aEU5sL7RuapUPVbqRTym8WpdRbgjCPnhdLH4LM
```

<br>

If you have done the exercise offline, you can start the daemon and repeat the tasks, if you please.

If you want to pin objects without having an IPFS node yourself, you can use a pinning service like [Pinata](https://pinata.cloud/).
