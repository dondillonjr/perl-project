#!/usr/bin/perl

use strict;                                                                                                                                                                                                                                                              
use warnings;
use Net::SSH::Expect;

my $ssh = Net::SSH::Expect->new (
    host        => "ec2-18-216-119-62.us-east-2.compute.amazonaws.com",
    password    => '',
    user        => 'ec2-user',
    raw_pty     => 1
);

my $login_output = $ssh->login();
warn $login_output;
warn "-------------------------------------";
if ($login_output !~ /Welcome/) {
    die "Login has failed. Login output was $login_output";
}
$ssh->exec("stty raw -echo");
my $ls = $ssh->exec("ls -l /");
print( $uname -a );

print $ssh->peek(0);

$ssh->eat($ssh->peek(0));
$ssh->close();