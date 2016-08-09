# bench_leon

## Just a little story

In the 1970's Sanger and colleagues and Maxam and Gilbert developed a rapid method to sequence the DNA. 
Twenty years after the sequencing by Sanger method is the common way and permit the whole genome sequencing for the first organism : _Haemophilus influenzae_, in 1995.
In 2004, almost thirty years after Sanger developed his method, the Human Genome project sequenced for the first the entire Human genome.
Since 2004, the sequencing methods changed and the Next Generation Sequencing (NGS) emerge.
In approximately ten years the cost and time to sequence a whole human genome decreases considerably.
NGS technology offers the possibility to sequence routinely a large number of samples.
So the data generated by NGS dramatically increase in the last decade, and the storage and transmission of these data is actually a major concern.

![Graph from SRA (http://www.ncbi.nlm.nih.gov/Traces/sra/) 2016-08-08](https://github.com/Char-Al/bench_leon/blob/master/images/NGS_data.png "The SRA database, wich contains a large part of the world wide sequencing, is growing very fast and now contains almost 6 petabases (date : 2016-08-08)")

## What is currently done?

### GZIP

Actually the common way to compress those data is the GZIP format.
GZIP is based on the Deflate algrithm, in fact it is the combination of the LZ77 algorithm and Huffmann coding ([more explanation here](http://www.zlib.net/feldspar.html)).
This algorithm was developed to compress text data, wich means data with a large set of characters.

## What is LEON ?

LEON is a new software to compress data issue from NGS (Fasta and FastQ).
This approach shared some similarities with those used a reference genome.
The particularity of LON is that this reference is built _de novo_ with a _de Bruijn Graph_ whose the pieces are _k-mers_.
As the _de Bruijn Graph_ must be stored with the compressed data its size could be a problem.
To work around this problem, the _de Bruijn Graph_ needs a good parametrization and its implementation is based on probabilistic data structure.
Based on bloom filters the _de Bruijn Graph_ this is not exact but efficient to store large data.

![LEON method overview (from : Reference-free compression of high throughput sequencing data with a probabilistic de Bruijn graph)](https://github.com/Char-Al/bench_leon/blob/master/images/LEON_overview.png "LEON method overview (from : Reference-free compression of high throughput sequencing data with a probabilistic de Bruijn graph)")

## Comparison between compression of fastq by gzip and Leon


## Citations

* Sanger, F., Nicklen, S. & Coulson, A. R. **DNA sequencing with chain- terminating inhibitors.** Proceedings of the National Academy of Sci- ences of the United States of America 74, 5463–5467. issn: 0027-8424 (Dec. 1977).
* Zhang, Y. et al. **Light-weight reference-based compression of FASTQ data.** BMC bioinformatics 16, 188. issn: 1471-2105 (2015).
* Benoit, G. et al. **Reference-free compression of high throughput sequencing data with a probabilistic de Bruijn graph.** BMC bioinformatics 16, 288. issn: 1471-2105 (2015).
* Van Dijk, E. L., Auger, H., Jaszczyszyn, Y. & Thermes, C. **Ten years of next-generation sequencing technology.** Trends in genetics: TIG 30, 418–426. issn: 0168-9525 (Sept. 2014).

![Boxplot comparant les taux de compression de gzip et LEON avec différentes options](https://github.com/Char-Al/bench_leon/blob/master/example/boxplot_compression.png "Boxplot comparant les taux de compression de gzip et LEON avec différentes options")

![Evolution du taux de compression en fonction de la taille des fastQ d'origine](https://github.com/Char-Al/bench_leon/blob/master/example/point_compression.png "Evolution du taux de compression en fonction de la taille des fastQ d'origine")

![Evolution du temps de compression en fonction de la taille des fastQ d'origine](https://github.com/Char-Al/bench_leon/blob/master/example/point_time.png "Evolution du temps de compression en fonction de la taille des fastQ d'origine")
