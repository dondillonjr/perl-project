#!/usr/bin/perl

use 5.006;
use strict;
use warnings;


use warnings;
use strict;
use Net::SSH2;

sub is_sshalive;

#my $host = "ec2-3-136-87-88.us-east-2.compute.amazonaws.com"; # use the ip host to connect
#my $host = "ec2-18-216-119-62.us-east-2.compute.amazonaws.com";
my $host = "18.216.119.62";
my $user = "ec2-user"; # your account
my $pass = ""; # your password
my $cmd;
my $ssh2 = Net::SSH2->new();
$ssh2->debug(1);
if ($ssh2->connect($host)) {
    if ($ssh2->auth_password($user,$pass)) {
    #if ($ssh2->auth_keyboard($user,$pass)) {
        print "\n Executing command...\n";
        $cmd = "ls";
        print " ==> Running $cmd\n";
        if(is_sshalive($ssh2) == 1) {
                print "\nSSH connection died";
                exit 1;
        } else {
            run_testsuite($cmd, $ssh2);
        }
    } else {
        warn "ssh auth failed.\n";
        exit 1;
    }
} else {
    warn "Unable to connect Host $host \n";
    exit 1;
}
print "test passed done 0\n";