#!/usr/bin/env perl
#-------------------------------------------------------------------------
#
# gen-imports.pl - generate SAS 'proc import' statements for all XLS files
#                   found in a certain directory
#
#-------------------------------------------------------------------------
# http://         -:-   
#-------------------------------------------------------------------------
#
# Project: \__UNDEFINED
# Updated: 2014-01-22, (Created: 2014-01-22)
# Author : Farley Balasuriya (developer@QuestorSystems.com)
#            
#-------------------------------------------------------------------------
# (C) Copyright 2014, , All rights reserved.
# , 
# telephone: ,  email: 
#-------------------------------------------------------------------------
# 2014-01-22T23:53:15 - CLI003 - cli003\user42 - 
#-------------------------------------------------------------------------

use Modern::Perl '2013';
#use Carp;

our $VERSION = '0.1.0';


my @filelist;

gen_library('MEGAMEGA', 'c:\\tmp\\SAS\\', 'core library - for PRODUCTION routines');

foreach my $file (<*.xls>) {
	# print "found: $file\n";
	genproc_import($file);
	push(@filelist, $file);
	}

genproc_cleanup(@filelist);	

sub gen_library
{
    my $library = shift;
    my $path = shift;
    my $remark = shift || '';

    gencomment('library', $remark);
    print "libname\n   $library   \"$path\";\n";
    gen_space();
}
sub gen_space
{
    my $str = "\n" x 2;
    print $str;
}
sub gencomment
{
    my $title = shift || 'step';
    my $remark = shift || '';

    print "/*\n * $title: $remark\n */\n";
}

sub genproc_cleanup
{
my @files = @_;

print<<"EOF_CLEANUP"


/*
 * cleanup: remove temporary staging data data-sets before EXIT
 */
proc sql;

    /* DROP the TABLEs - we're done here ...*/
EOF_CLEANUP
;


	foreach my $data_set (@files){
		$data_set = map_data_set_name($data_set, 'MEGAMEGA._load_');
		print "    * DROP TABLE $data_set;\n";	# indent 4 spaces
		}
print "quit;\n\n";
}


sub map_data_set_name
{
my $filename = shift;
my $prefix = shift || '';

	$filename =~ s/.xls$//gi;	# remove extension
	$filename =~ s/-/_/gi;		# replace hyphens

	return $prefix . $filename;	# a valid SAS name
}
	
sub genproc_import
{
my $xls = shift;
my $sheetname = shift || 'Sheet1';

my $data_set = map_data_set_name($xls, 'MEGAMEGA._load_');
print<<"EOF_IMPORT";


/*
 * load: $xls
 */
proc import 
    datafile = \"$xls\"
    out      = $data_set
    dbms     = xls replace;
    sheet    = \"$sheetname\";
    getnames = yes;
run;

EOF_IMPORT

}
__END__

=pod

=head1 NAME

gen_imports - create SAS 'proc import' statements for all Excel files found

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SWITCHES & OPTIONS

=head1 ENVIRONMENT

=head1 SEE ALSO

The following resources were useful during development of this script

=over 4

=item * link-here

=back

=head1 REVISION HISTORY

v0.1.0 - 2014-01-22 - script created
    
=head1 AUTHOR

Farley Balasuriya    ()

=head1 LICENCE AND COPYRIGHT

(C) Copyright 1997-2014 Farley Balasuriya.  All rights reserved.  
Questor Systems GmbH - www.QuestorSystems.com

=cut
