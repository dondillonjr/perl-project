#!/usr/bin/perl

package main;

use 5.008;
use strict;
use warnings;

package Demo::App;

$| = 1;

# create the WxApplication
my $app = Demo::App->new;
$app->MainLoop;

use strict;
use warnings;
use base 'Wx::App';

sub OnInit {
	my $frame = Demo::App::Frame->new;
	$frame->Show(1);
}

package Demo::App::Frame;
use strict;
use warnings;
use Wx qw(:everything);
use base 'Wx::Frame';

sub new {
	my ($class) = @_;

	my $self = $class->SUPER::new(
		undef, -1,
		'Demo::App',
		wxDefaultPosition, wxDefaultSize,
	);

	return $self;
}

