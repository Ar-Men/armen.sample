#######
##                                                      __
##   ___ _______ _  ___ ___        ___ ___ ___ _  ___  / /__
##  / _ `/ __/  ' \/ -_) _ \  _   (_-</ _ `/  ' \/ _ \/ / -_)
##  \_,_/_/ /_/_/_/\__/_//_/ (_) /___/\_,_/_/_/_/ .__/_/\__/
##                                             /_/
##
####### Ecosystème basé sur les microservices ##################### (c) 2018 losyme ####### @(°_°)@

package Inapte::Jobs::Test::06;

#md_# Inapte::Jobs::Test::06
#md_

use Exclus::Exclus;
use Moo;
use namespace::clean;

extends qw(Inapte::Job);
with qw(Gadget::Jobs::Role::Events);

#md_## Les méthodes
#md_

#md_### on_events()
#md_
sub on_events {
    my ($self) = @_;
    $self->on('__start', sub { return 'end' });
    $self->on('end',     sub { return       });
}

1;
__END__
