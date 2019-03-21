Stop the daemon (if necessary).

```
ps -ef | grep "ipfs daemon"
kill <pid>
```

<br>
Add a file pinned by default.

```
echo "hello world" > testfile.txt
ipfs add testfile.txt
ipfs pin ls QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
```

<br>
Garbage collect the repo and check for pinned file.

```
ipfs repo gc
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
```

<br>
Remove pin, garbage collect the repo and check for file.

```
ipfs pin rm QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
ipfs pin ls QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o

ipfs repo gc
ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
```


<br>
Create a test directory (if necessary), add it without pins and pin it explicitly.

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

ipfs pin ls QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs pin add QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs pin ls QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
```

<br>
Garbage collect the repo and check for pinned file.

```
ipfs refs -re QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs repo gc
ipfs refs -re QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
```

<br>
Remove pins and repeat it.

```
ipfs rm -r QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs pin ls QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e

ipfs refs -re QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
ipfs repo gc
ipfs refs -re QmVeXcawu61X6w2ey6kAK9ZZ3ayaFxxT7nL9kurJRbJW9e
```

<br>

Start the daemon and repeat the exercise.
