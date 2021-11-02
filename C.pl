

use strict;
use Net::OpenSSH;

my $user   = "ec2-user";
my $ssh    = "";
my @servers = ("ec2-18-216-119-62.us-east-2.compute.amazonaws.com", "18.216.119.62");
my $hostIP;

print "START\n\n"; 

foreach $hostIP (@servers)
{
	$ssh = Net::OpenSSH->new("$user\@$hostIP", timeout=>30);
	$ssh->error and die "Unable to connect: ", $ssh->error;

	print "Connected to AWS: $hostIP\n";

	my $fh = $ssh->pipe_out('df -k') or die "Unable to run command\n";

	while ( <$fh> ) {
		print "$hostIP **: $_";
	}
        close $fh;
	print ("\n\n");
}
print "\nGood By\n";
