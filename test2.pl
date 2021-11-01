#!/usr/bin/perl

use 5.010;
#use strict;
use warnings;
use Net::OpenSSH;

my $s;
my @servers = ( 'awsLinux' );
print "START\n";foreach $s (@servers) {
	print "INLOOP: $s\n";
	my $ssh = Net::OpenSSH->new("ec2-user\@ec2-18-216-119-62.us-east-2.compute.amazonaws.com", timeout=>30);
	$ssh-error and die "Unable to connect: " . $ssh->error;

	print "Connected to AWS";

	my $fh = $ssh->pipe_out('uname -a') or die "Unable to run command\n";

	while ( <$fh> ) {
		print "$s: $_";
	}
	#close $fh;
	#udef $ssh;
}
