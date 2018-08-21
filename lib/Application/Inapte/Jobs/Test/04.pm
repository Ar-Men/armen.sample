#######
##                                                      __
##   ___ _______ _  ___ ___        ___ ___ ___ _  ___  / /__
##  / _ `/ __/  ' \/ -_) _ \  _   (_-</ _ `/  ' \/ _ \/ / -_)
##  \_,_/_/ /_/_/_/\__/_//_/ (_) /___/\_,_/_/_/_/ .__/_/\__/
##                                             /_/
##
####### Ecosystème basé sur les microservices ##################### (c) 2018 losyme ####### @(°_°)@

package Application::Inapte::Jobs::Test::04;

#md_# Application::Inapte::Jobs::Test::04
#md_

use Exclus::Exclus;
use Moo;
use Types::Standard qw(Str);
use Gadget::Jobs::Attributes;
use namespace::clean;

extends qw(Application::Inapte::Job);

#md_## Les attributs
#md_

#md_### _next_label
#md_
public '_next_label' => ('ro', Str, 'test_06');

#md_## Les méthodes
#md_

#md_### run()
#md_
sub run {
    my ($self) = @_;
    $self->next_step_label($self->_next_label);
}

1;
__END__
