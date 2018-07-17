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
use Types::Standard qw(Int Str);
use Gadget::Jobs::Attributes;
use namespace::clean;

extends qw(Inapte::Job);
with qw(Gadget::Jobs::Role::Events);

#md_## Les attributs
#md_

#md_### next_label
#md_
public 'next_label' => ('ro', Str);

#md_### _unusable
#md_
public '_unusable' => ('ro', Int, 789);

#md_## Les méthodes
#md_

#md_### on_events()
#md_
sub on_events {
    my ($self) = @_;
    $self->logger->debug(__PACKAGE__, [next_label => $self->next_label, _unusable => $self->_unusable]);
    $self->_unusable('123');
    $self->logger->debug(__PACKAGE__, [next_label => $self->next_label, _unusable => $self->_unusable]);
    $self->on('__start', sub { return 'end' });
    $self->on('end',     sub { return       });
}

1;
__END__
