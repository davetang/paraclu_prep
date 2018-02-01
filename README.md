Clustering reads
================

I wrote a blog post on [clustering mapped reads](http://davetang.org/muse/2012/03/30/clustering-mapped-reads), which describes the `paraclu` program. To test out `paraclu` first download some CAGE libraries.

```bash
parallel --verbose < download.txt

mkdir bam
mv *.bam bam
```

Next download and compile `paraclu`.

```bash
wget https://davetang.org/file/paraclu-9.zip
unzip paraclu-9.zip
cd paraclu-9
make
```

Finally, execute `run.sh`.

```bash
./run.sh
```

# Peak file headers

```
#chr    start   end     id                      count   strand  peak_count   peak_pos/s
chr1    16330   16332   chr1_16330_16332_-      23      -       22           16330
chr1    17469   17497   chr1_17469_17497_-      12      -       4            17496
chr1    19765   19809   chr1_19765_19809_-      15      -       3            19780
chr1    21570   21615   chr1_21570_21615_-      24      -       9            21577
chr1    29262   29392   chr1_29262_29392_-      8171    -       3733         29347
chr1    88202   88385   chr1_88202_88385_-      13      -       2            88384,88385
chr1    534298  534305  chr1_534298_534305_+    16      +       6            534301
chr1    564466  564468  chr1_564466_564468_+    152     +       117          564467
chr1    564518  564519  chr1_564518_564519_-    32      -       18           564519
chr1    564532  564533  chr1_564532_564533_-    12      -       8            564533
```

