#!/usr/bin/perl

use 5.006;
use strict;
use warnings;

#use Modern::Perl;
use Net::SSH::Perl;
use Data::Dumper;
#18.216.199.62
#ec2-user@ec2-18-216-119-62.us-east-2.compute.amazonaws.com
my $ssh = Net::SSH::Perl->new('ec2-18-216-119-62.us-east-2.compute.amazonaws.com', debug => 4 , port => 22);

$ssh->login('ec2-user');
#print Dumper $ssh->cmd('pwd');
print "START\n\n\n\n";
print Dumper $ssh->cmd('date');
print "FINISH\n";
#print Dumper $ssh->cmd('ls -ltr');