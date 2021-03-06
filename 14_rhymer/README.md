# Rhymer

Write a program that will create rhyming words for a given word by removing the initial consonant sounds and substituting other sounds.
Note that the given word should not appear in the output, so "cake" will be omitted from this run

```
C:\> ./rhymer.ps1 cake | Select-Object -First 10
bake
blake
brake
chake
clake
crake
dake
drake
fake
flake
```

The rhyming words will be created by adding all the consonants plus the following consonant clusters

```
bl br ch cl cr dr fl fr gl gr pl pr sc 
sh sk sl sm sn sp st sw th tr tw thw wh wr 
sch scr shr sph spl spr squ str thr
```

The output should be sorted alphabetically.
If there is no initial consonant sound, then apply all the consonant sounds to the given word

```
C:\> ./rhymer.ps1 apple | tail
thwapple
trapple
twapple
vapple
wapple
whapple
wrapple
xapple
yapple
zapple
```