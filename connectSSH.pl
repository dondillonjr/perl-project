use warnings;
use Net::OpenSSH;
####################################################################
my $user   = "ec2-user";
my $ssh="";
my @servers = ("ec2-18-216-119-62.us-east-2.compute.amazonaws.com", "18.216.119.62");
my $hostIP;
####################################################################
sub call_system
{
        print "System Call - invoke [ls]\n";
        $ssh->system('ls');
        print "\nSystem Call - invoke [pwd]\n";
        $ssh->system('pwd');
        print "\nSystem Call - invoke [who]\n";
        $ssh->system('who');
        print "\nSystem Call - invoke [date]\n";
        $ssh->system('date');
}
###################################################################
sub call_pipe
{
        print "\nPIPE-OUT - invoke [df -l] \n";
        my $fh = $ssh->pipe_out('df -l') or die "UNABLE to run command\n";
        while ( <$fh> )
        {
                print "$_[0] : $_";
        }
}
################################################################
sub call_df
{
        print "\nCAPTURE  - invoke [df -k /home | tail -1] \n";
        my $cp = $ssh->capture("df -k /home/ | tail -1") or die "Unable to run command\n";
        my @df_arr = split(/\s+/, $cp);
        print "$_[0]:  FileSystem      = $df_arr[0] \n";
        print "$_[0]:  Disk Space Used = $df_arr[2] \n";
        print "$_[0]:  Disk Space Free = $df_arr[3] \n";
        print "$_[0]:  Disk Space Use% = $df_arr[4] \n\n";
}
################################################################
sub call_top
{
        print "\nCAPTURE  - invoke [top -b -n1 | head -3 | tail -1]\n";
        my $top = $ssh->capture("top -b -n1 | head -3 | tail -1") or die "Unable to run command\n";
        $top =~ s/,(?=\S)/, /g;
        my @top_arr = split(/\s+/, $top);

        print "us, user    : time running un-niced user processes\n";
        print "sy, system  : time running kernel processes\n";
        print "ni, nice    : time running niced user processes\n";
        print "id, idle    : time spent in the kernel idle handler\n";
        print "wa, IO-wait : time waiting for I/O completion\n";
        print "hi : time spent servicing hardware interrupts\n";
        print "si : time spent servicing software interrupts\n";
        print "st : time stolen from this vm by the hypervisor\n\n";
        print "@top_arr\n\n";

        print "$_[0]:  USER UN-NICED Processes   = $top_arr[1] \n";
        print "$_[0]:  Kernel Processes          = $top_arr[3] \n";
        print "$_[0]:  USER NICED PROCESSES      = $top_arr[5] \n";
        print "$_[0]:  Kernel Idel Handler       = $top_arr[7] \n";
        print "$_[0]:  WAIT For I/O              = $top_arr[9] \n";
        print "$_[0]:  SERV Hardware Interrupts  = $top_arr[11] \n";
        print "$_[0]:  SERV Software Interrupts  = $top_arr[13] \n";
        print "$_[0]:  Stolen Time by Hypervisor = $top_arr[15] \n";
}
####################################################################
sub call_remoteName
{
        my $whoAmI = $ssh->capture("uname -n; who;  date");
        print "\nREMOTE-NAME=${whoAmI} \n";
}
####################################################################
sub call_myName
{
	my $my_name = `uname -n ; date`;
        print "\nMY-Name=${my_name}\n"
}

####################################################################
sub call_launchGiveCreatureLifeJavaJar
{
       sleep 10;
       my $javaJar = $ssh->capture("/bin/java -jar /home/ec2-user/java_programs/GiveCreatureLifeLinux.jar");
       print "\n\nLaunching GIVEcreatureLife\n $javaJar\n";
}

##################################################################
foreach $hostIP (@servers)
{
    $ssh = Net::OpenSSH->new("$user\@$hostIP", timeout=>30);
    $ssh->error and die "Unable to connect: ", $ssh->error;
    print "Connected to $hostIP\n\n";
    call_system();
    call_pipe($hostIP);
    call_df($hostIP);
    call_top($hostIP);
    call_remoteName();
    call_myName();
    call_launchGiveCreatureLifeJavaJar();
    undef $ssh;
    print ("\n\n");
}
print ("\n\nGood BY\n");
