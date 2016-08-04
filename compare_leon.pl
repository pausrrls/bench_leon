#!/usr/bin/perl -w
# Author : Charles VAN GOETHEM


# Perl general libs
use warnings;
use strict;
use Getopt::Long;
use Pod::Usage;
use File::Basename;
use Data::Dumper;

# Perl libs for given/when (smartmatch is experimental)
use v5.14;
no warnings 'experimental::smartmatch';


##########################################################################################
##########################################################################################


my $path_leon = "/Users/adminbioinfo/Documents/Leon/";


##########################################################################################
##########################################################################################

# Mandatory 
my @files;
my @directories;

# General arguments
my $man 		= 0;
my $help 		= 0;
my $verbosity	= 0;


## Parse options and print usage if there is a syntax error, 
## or if usage was explicitly requested.

GetOptions(
	'f|file=s'	 		=> \@files,
	'd|directory=s'		=> \@directories,
	'v|verbosity=i'		=> \$verbosity,
	'help|?' 			=> \$help,
	'm|man' 			=> \$man
) or pod2usage(1);

pod2usage(1) if $help;
pod2usage(-verbose => 2) if $man;

@files = split(/,/,join(',',@files));
@directories = split(/,/,join(',',@directories));

# Test arguments
pod2usage("Error : need file(s) and/or directory(ies).") unless (@files or @directories);

# Check the files
foreach my $file (@files) {
	pod2usage("Error : $file is not a plain text or did not exist.") unless (-f $file);
	
	# Check if file is a fastq or fastq.gz
	my ($name, $dir, $ext) = fileparse($file,qw(.fastq .fastq.gz));
	pod2usage("Error : $file is not a fastq or a fastq.gz.") unless ($ext);
}

# Check directories and get fastq and fastq.gz
foreach my $directory (@directories) {
	pod2usage("Error : $directory is not a directory or did not exist.") unless (-d $directory);
	
	# Complete the list of files with the fastq and fastq.gz in the repertory
	push(@files, glob "$directory/*.{fastq,fastq.gz}");
}

# print Dumper @files;

##########################################################################################
##########################################################################################


###### Step 

foreach my $file (@files) {
	my ($name, $dir, $ext) = fileparse($file,qw(.fastq .fastq.gz));
	
	# uncompress if necessary 
	given($ext) {
		when(".fastq.gz") { # Uncompress then launch the bench
			print "file : \"".$dir.$name.$ext."\" is a fastQ.gz\n";
		}
		#when(".fastq") { # Launch the fastq bench function
		#	print "file : \"".$dir.$name.$ext."\" is a fastQ\n";
		#}
	}
	
	print "ln -s ".$dir.$name.".fastq ".$out.$name.".lossy-leon.fastq";
	print "ln -s ".$dir.$name.".fastq ".$out.$name.".lossless-leon.fastq";
	
	print $path_leon." -f ".$dir.$name.".fastq\n -c";
	print $path_leon." -f ".$dir.$name.".fastq\n -c -lossless";
	
}

##########################################################################################
##########################################################################################


sub benchFastq {
	
}


##########################################################################################
##########################################################################################

__END__

=pod

=encoding UTF-8

=head1 NAME

compare_leon.pl - Compare Leon compression algorithm with gzip (generally used) for fastQ.

=head1 VERSION

version 0.01

=head1 SYNOPSIS

compare_leon.pl  -f file.fastq (-f file2.fastq,file3.fastq) -d directory/with/some/fastq

=head1 DESCRIPTION

This script compress and uncompress automatically some fastQ file.

=head1 OPTIONS

=head2 General

	-h,--help		Print this help
	-m,--man		Open man page
	-v,--verbosity		Level of verbosity

=head2 Mandatory arguments

	-f,--file=file.fastq			Specify the fastq file you want use (possible multiple file) 
	-d,--directory=path/to/directory	Specify a directory contains some fastq you want use (possible multiple directory)

=head1 AUTHORS

=over 4

=item -
Charles VAN GOETHEM

=back

=cut