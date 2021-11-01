#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Net::SSH::Perl;

#my $ssh = Net::SSH::Perl->new("ec2-18-216-119-62.us-east-2.compute.amazonaws.com");
my $ssh = Net::SSH::Perl->new('ec2-18-216-119-62.us-east-2.compute.amazonaws.com', debug => 6 , port => 22);
#my $ssh = Net::SSH::Perl->new('ec2-18-216-119-62.us-east-2.compute.amazonaws.com', port => 22);

$ssh->login("ec2-user", "");
 
$ssh->cmd("pwd");
$ssh->cmd("date")