#!/usr/bin/perl -w
# Author : Charles VAN GOETHEM


# Perl libs
use warnings;
use strict;
use Getopt::Long;
use Pod::Usage;
use File::Basename;
use Data::Dumper;



##########################################################################################
##########################################################################################

# Mandatory 
my @file;
my @directory;

# General arguments
my $man 		= 0;
my $help 		= 0;
my $verbosity	= 0;


## Parse options and print usage if there is a syntax error, 
## or if usage was explicitly requested.

GetOptions(
	'f|file=s'	 		=> \@file,
	'd|directory=s'		=> \@directory,
	'v|verbosity=i'		=> \$verbosity,
	'help|?' 			=> \$help,
	'm|man' 			=> \$man
) or pod2usage(1);

pod2usage(1) if $help;
pod2usage(-verbose => 2) if $man;

@file = split(/,/,join(',',@file));
@directory = split(/,/,join(',',@directory));

# Test arguments
pod2usage("Error : need file(s) and/or directory(ies).") unless (@file or @directory);

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