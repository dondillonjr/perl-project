#!/usr/bin/perl

use strict;
use warnings;
use Net::OpenSSH;

#my $host="ec2-18-216-119-62.us-east-2.compute.amazonaws.com";
#my $ssh = Net::OpenSSH->new("ec2-user@" + $host);
my $ssh = Net::OpenSSH->new("ec2-user\@ec2-18-216-119-62.us-east-2.compute.amazonaws.com", timeout=>30);
$ssh->error and die "Couldn't establish SSH connection: ". $ssh->error;
print "Connected to AWS box as ec2-user";
$ssh->system("uname -a") or  die "remote command failed: " . $ssh->error;
undef $ssh;




