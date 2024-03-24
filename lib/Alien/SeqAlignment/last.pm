  use strict;
  use warnings;
  package Alien::SeqAlignment::last;
$Alien::SeqAlignment::last::VERSION = '0.02';
use parent qw( Alien::Base );
=head1 NAME

Alien::SeqAlignment::edlib - find, build and install the last tools

=head1 VERSION

version 0.02

=head1 SYNOPSIS

To execute the last set of tools, you can use the following code:

 use Alien::SeqAlignment::last;
 use Env qw( @PATH );
 unshift @PATH, Alien::SeqAlignment::last->bin_dir;

Now you can run the last tools as:

 system Alien::SeqAlignment::last->lastal (options);    
 system Alien::SeqAlignment::last->lastdb (options); 
 system Alien::SeqAlignment::last->maf_convert (options); 
 system Alien::SeqAlignment::last->train (options); 
 system Alien::SeqAlignment::last->split_or_splice (options); 
 system Alien::SeqAlignment::last->split_or_splice_pe (options); 
 system Alien::SeqAlignment::last->pe_probs (options);

=head1 DESCRIPTION

This distribution provides last so that it can be used by other
Perl distributions that are on CPAN.  The source code will be downloaded
from the last Gitlab repo, and if that fails it will use the location of a
fork by the author of this Perl module. The build provides the various  
CLI tools in the last and last-pair-pe suites. 
Parallelization requires the installation of the GNU parallel package.
If this is not available, the installation will terminate. In that case,
install GNU Parallel from https://www.gnu.org/software/parallel/ and 
re-attempt installation of this Alien.

=cut

=head1 METHODS

=head2 lastal

 Alien::SeqAlignment::last->lastal

Returns the command name for running the CLI version of the last aligner.
The latter finds local alignments between query sequences, and
reference sequences that have been collected into a database using lastdb.

=cut

sub lastal {
    my ($class) = @_;
  $class->runtime_prop->{command}->{lastal} ;
}

=head2 dbbuild

 Alien::SeqAlignment::last->dbbuild

Returns the command name for the application that builds the database of
the reference sequences.

=cut

sub dbbuild {
    my ($class) = @_;
  $class->runtime_prop->{command}->{dbbuild} ;
}

=head2 maf_convert

 Alien::SeqAlignment::last->maf_convert

Interconverts the MAF format with other multiple alignment formats. The 
formats currently supported are:  axt, bed, blast, blasttab, chain, 
gff, html, psl, sam, tab. Note that per the author of last, the blast 
format is merely "blast-like", i.e. not identical to NCBI BLAST. 

=cut

sub maf_convert {
    my ($class) = @_;
  $class->runtime_prop->{command}->{maf_convert} ;
}

=head2 last_train

 Alien::SeqAlignment::last->last_train

last-train finds the rates (probabilities) of insertion, deletion, and
substitutions between two sets of sequences.  It thereby finds
suitable substitution and gap scores for aligning them.   

=cut

sub train {
    my ($class) = @_;
  $class->runtime_prop->{command}->{train} ;
}

=head2 split_or_splice

 Alien::SeqAlignment::last->split_or_splice

This commnd provides access to last-split, which finds "split alignments" 
(typically for DNA) or "spliced alignments" (typically for RNA). 

=cut

sub split_or_splice {
    my ($class) = @_;
  $class->runtime_prop->{command}->{split_or_splice} ;
}


=head2 split_or_splice_for_pe

 Alien::SeqAlignment::last->split_or_splice_for_pe

This commnd provides access to last-split, which finds "split alignments" 
(typically for DNA) or "spliced alignments" (typically for RNA). It 
specifically targets paired-end reads. 
last-split-pe is a method that can split-align a short DNA read to a 
reference genome. It achieves high accuracy by combining probabilistic 
alignments with information from paired-end reads.

=cut

sub split_or_splice_pe {
    my ($class) = @_;
  $class->runtime_prop->{command}->{split_or_splice_pe} ;
}

=head2 pe_probs

 Alien::SeqAlignment::last->pe_probs

This commnd provides access to last-pair-probs, which reads candidate 
alignments of paired DNA reads to a genome, and:

* estimates the distribution of distances between paired reads,
* estimates the probability that each alignment represents the
genomic source of the read.
These probabilities corresponds to a split alignment of the pair end
read. 
=cut

sub pe_probs {
    my ($class) = @_;
  $class->runtime_prop->{command}->{pe_probs} ;
}

=head1 SEE ALSO

=over 4

=item * L<LAST|https://gitlab.com/mcfrith/last/-/tree/main>

LAST: find & align related regions of sequences
LAST is designed for moderately large data (e.g. genomes, DNA reads,
proteomes).  It's especially good at:

* Finding rearrangements and recombinations: the primary author claims 
that last-split does that more rigorously than anything else.
* Finding DNA-versus-protein related regions, especially protein
fossils.
* Unusual data, e.g. AT-rich DNA, because we can fit parameters to
the data and calculate significance.
* Sensitive DNA-DNA search, due to fitting, sensitive seeding, and
calculating significance.

It can also: indicate the confidence/uncertainty of each column in an
alignment, and use sequence quality data in a rigorous fashion.

=item * L<last-split-pe|https://bitbucket.org/splitpairedend/last-split-pe/wiki/Home>

last-split-pe is a method that can split-align a short DNA read to a 
reference genome. It achieves high accuracy by combining probabilistic 
alignments with information from paired-end reads.

=item * L<Alien>

Documentation on the Alien concept itself.

=item * L<Alien::Base|https://metacpan.org/pod/Alien::Base>

The base class for this Alien. The methods in that class allow you to use
the static and the dynamic edlib library in your code. 

=item * L<Alien::Build::Manual::AlienUser|https://metacpan.org/dist/Alien-Build/view/lib/Alien/Build/Manual/AlienUser.pod>

Detailed manual for users of Alien classes.

=item * L<Bio::SeqAlignment|https://metacpan.org/pod/Bio::SeqAlignment>

A collection of tools and libraries for aligning biological sequences 
from within Perl. 

=back

=head1 AUTHOR

Christos Argyropoulos <chrisarg@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2024 by Christos Argyropoulos.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

1;
