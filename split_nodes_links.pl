#!/usr/bin/perl

use strict;
use warnings;

my ($root_name, $suffix) = ($ARGV[0], ".txt");
$suffix = $1 if ($root_name =~ s/(\.\w+?$)//);

open OUTPUT, ">${root_name}_nodes$suffix" or die "Can't open nodes file for output";
while (<>) {
  next if /#graph/ || /^\s+$/;
  if (/^-\n$/) {
    close OUTPUT;
    open OUTPUT, ">${root_name}_links$suffix" or die "Can't open links file for output";
    next;
  }
  s/^#//;
  print OUTPUT;
}
close OUTPUT;
