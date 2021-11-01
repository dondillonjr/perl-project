#!/usr/bin/perl
use strict;
use warnings;
use Net::OpenSSH;

#ec2-18-216-119-62.us-east-2.compute.amazonaws.com"
my $s;
my @servers = ("18.216.119.62");

foreach $s (@servers) {
	my $ssh = Net::OpenSSH->new("ec2-user\@$s", timeout=>30);
	$ssh->error and die "Unable to connect: " . $ssh->error;
	print "Connected to $s\n";
	
	my $fh = $ssh->pipe_out('uname -r') or die "Unable to run command\n";
	
	while (<$fh>) {
		print "$s: $_";
	}
	close $fh;
	undef $ssh;
}


	