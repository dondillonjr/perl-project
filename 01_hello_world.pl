#!/perl/bin
# The line above tells any Linux system that this is a Perl program

# Lines that start with a # sign are comments, they are not part of
# the source and are ignored by Perl. You could also append comments
# at the end of lines by using a #.

# The following line prints (shows) a short text to the user.
use strict;
use warnings FATAL => 'all';
use warnings FATAL => 'all';
print "Hello World1!\n"; # This is output for the user
my $a="test1";
print "Hello World2!\n"; # This is output for the user
my $b="test2";
print "Hello World3!\n"; # This is output for the user
my $c="test3";
print "Hello World4!\n"; # This is output for the user 
my $d="test4";                                                                                                    
print "Hello World5!\n"; # This is output for the user
                                                                                                            
# The text following the print command is surrounded by " ". They're
# used to mark the message "Hello World" as text to be printed,
# otherwise they would be processed as Perl commands.
# The message is followed by newline written as \n.
# The last char is a ; which is used to end a line in Perl.

# Now press F5 and Padre will execute this script.
#
# You'll see a new window on the bottom of Padre which shows you the
# output of this script.
