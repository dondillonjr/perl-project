use v6;


#!/usr/bin/perl -w
use strict;

use Net::SSH2;

my $ssh2 = Net::SSH2->new();
$ssh2->connect('3.136.87.88') or die $!;
my $auth = $ssh2->auth_publickey(
    'ec2-user',
    '/home/ec2-user/.ssh/id_rsa.pub'
);

my $chan2 = $ssh2->channel();
$chan2->blocking(1);

# This is where we send the command and read the response
$chan2->exec("uname -a\n");
print "$_" while <$chan2>;

$chan2->close;


