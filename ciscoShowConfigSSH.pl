#!/usr/bin/perl

use 5.006;
use strict;
use warnings;

#
# usage: perl cisco.pl (target_host) (ssl_password) (enable_password)
#
use Net::SSH2;
use warnings;
use strict;
my $host = $ARGV[0];          ### target host as input string1
my $user = “admin”;
my $password = $ARGV[1];      ### ssh password as input string2
my $secret = $ARGV[2];        ### enable password as input string3
my $ssh = Net::SSH2->new();

if(!$ssh->connect($host)){
   print(“Connection Failed\n”);
   exit(1);
}

if(!$ssh->auth_password($user,$password)){
   print(“Authentication Failed”);
   exit(1);
}

my $channel = $ssh->channel();

$channel->blocking(0);
$channel->shell();

print $channel “enable\n”;
print $channel “$secret\n”;     ### enable password from input string3

print $channel “term len 0\n”;
print $channel “show config\n”;

### target host as filename
open (my $OUTPUTFILE, “> /var/tmp/$host.log”) or die “Can’t open /var/tmp/$host.log: $!”;

while (<$channel>) {
  chomp;
  print $OUTPUTFILE “$_”;
}

close $OUTPUTFILE or die “$OUTPUTFILE: $!”;

