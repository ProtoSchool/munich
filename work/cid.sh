#!/usr/bin/env bash

b="$(ipfs cid format -f %b $1)"

echo "%b multibase name                                    : $(ipfs cid format -f %b $1)"
echo "%B multibase code                                    : $(ipfs cid format -f %B $1)"
echo "%v version string                                    : $(ipfs cid format -f %v $1)"
echo "%V version number                                    : $(ipfs cid format -f %V $1)"
echo "%c codec name                                        : $(ipfs cid format -f %c $1)"
echo "%C codec code                                        : $(ipfs cid format -f %C $1)"
echo "%h multihash name                                    : $(ipfs cid format -f %h $1)"
echo "%H multihash code                                    : $(ipfs cid format -f %H $1)"
echo "%L hash digest length                                : $(ipfs cid format -f %L $1)"
echo "%m multihash encoded in $b (with multibase prefix)   : $(ipfs cid format -f %m $1)"
echo "%M multihash encoded in $b without multibase prefix  : $(ipfs cid format -f %M $1)"
echo "%d hash digest encoded in $b (with multibase prefix) : $(ipfs cid format -f %d $1)"
echo "%D hash digest encoded in $b without multibase prefix: $(ipfs cid format -f %D $1)"
echo "%s cid string encoded in $b (1)                      : $(ipfs cid format -f %s $1)"
echo "%S cid string encoded in $b without multibase prefix : $(ipfs cid format -f %S $1)"
echo "%P cid prefix: %v-%c-%h-%L                           : $(ipfs cid format -f %P $1)"


