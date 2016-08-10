# bench_leon

## Just a little story

In the 1970's Sanger, Maxam, Gilbert and colleagues developed a rapid method to sequence the DNA. 
Twenty years after, sequencing by Sanger method is the more common way and allows the first whole genome sequencing for _Haemophilus influenzae_, in 1995.
In 2004, almost thirty years after Sanger has developed his method, the Human Genome project sequenced the first whole Human genome.
Since 2004, sequencing methods have changed and the Next Generation Sequencing (NGS) have emerged.
In ten years the cost and time to sequence a whole human genome decreases considerably. NGS technologies allow to sequence routinely a large number of samples. So, the amount of data generated by NGS substantially increase during the last decade and the storage and transmission of these data are a major concern for now.

![Graph from SRA (http://www.ncbi.nlm.nih.gov/Traces/sra/) 2016-08-08](https://github.com/Char-Al/bench_leon/blob/master/images/NGS_data.png "The SRA database, wich contains a large part of the world wide sequencing, is growing very fast and now contains almost 6 petabases (date : 2016-08-08)")

## What is currently done?

### GZIP

Now, the common way to compress those data is the GZIP format. GZIP is based on the Deflate algorithm, actually it is the combination of the Huffman coding and the LZ77 algorithm ([more explanation here](http://www.zlib.net/feldspar.html)).
This algorithm have been developed in order to compress text data, which means data with a large set of characters.

## What is LEON 

LEON is a new software to compress data issue from NGS (Fasta and FastQ).
LEON shares similarities with approaches using a reference genome to compress files.
The LEON approach build the reference _de novo_, contrary to the other algorithms, with a _de Bruijn Graph_ whose the pieces are _k-mers_.
The _de Bruijn Graph_ is heavy and it has to be stored with the compressed data, so the size could be a problem.
To figure out this problem, the _de Bruijn Graph_ needs a good parametrization and the implementation is based on probabilistic data structure in order to reduce its size. Based on Bloom filters the _de Bruijn Graph_ is efficient to store large data.

![LEON method overview (from : Reference-free compression of high throughput sequencing data with a probabilistic de Bruijn graph)](https://github.com/Char-Al/bench_leon/blob/master/images/LEON_overview.png "LEON method overview (from : Reference-free compression of high throughput sequencing data with a probabilistic de Bruijn graph)")

## Comparison between compression of fastq by Gzip and LEON

With this little magic script, we produce some awesome graphs to compare the efficiency of GZIP and LEON.
To compare these two softwares, we are interested in the global rate of compression, the rate of compression depending the size of the initial FastQ and the time of compression/decompression.
We use FastQ from Human data with size between 100 Mo and 26 Go.

We can see that the ratio of the compression by LEON in lossy mode (red) is between 90 and 95%, unregards the size of the FastQ.



## Citations
* International Human Genome Sequencing Consortium. __Finishing the euchromatic sequence of the human genome.__ Nature 431, 931–945. issn: 1476-4687 (Oct. 2004).
* Fleischmann, R. D. et al. __Whole-genome random sequencing and assembly of Haemophilus influenzae Rd.__ Science (New York, N.Y.) 269, 496– 512. issn: 0036-8075 (July 1995).
* Sanger, F., Nicklen, S. & Coulson, A. R. **DNA sequencing with chain- terminating inhibitors.** Proceedings of the National Academy of Sci- ences of the United States of America 74, 5463–5467. issn: 0027-8424 (Dec. 1977).
* Zhang, Y. et al. **Light-weight reference-based compression of FASTQ data.** BMC bioinformatics 16, 188. issn: 1471-2105 (2015).
* Benoit, G. et al. **Reference-free compression of high throughput sequencing data with a probabilistic de Bruijn graph.** BMC bioinformatics 16, 288. issn: 1471-2105 (2015).
* Van Dijk, E. L., Auger, H., Jaszczyszyn, Y. & Thermes, C. **Ten years of next-generation sequencing technology.** Trends in genetics: TIG 30, 418–426. issn: 0168-9525 (Sept. 2014).

![Boxplot comparant les taux de compression de gzip et LEON avec différentes options](https://github.com/Char-Al/bench_leon/blob/master/example/boxplot_compression.png "Boxplot comparant les taux de compression de gzip et LEON avec différentes options")

![Evolution du taux de compression en fonction de la taille des fastQ d'origine](https://github.com/Char-Al/bench_leon/blob/master/example/point_compression.png "Evolution du taux de compression en fonction de la taille des fastQ d'origine")

![Evolution du temps de compression en fonction de la taille des fastQ d'origine](https://github.com/Char-Al/bench_leon/blob/master/example/point_time.png "Evolution du temps de compression en fonction de la taille des fastQ d'origine")
