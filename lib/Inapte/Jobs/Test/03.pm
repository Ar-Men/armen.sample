#######
##                                                      __
##   ___ _______ _  ___ ___        ___ ___ ___ _  ___  / /__
##  / _ `/ __/  ' \/ -_) _ \  _   (_-</ _ `/  ' \/ _ \/ / -_)
##  \_,_/_/ /_/_/_/\__/_//_/ (_) /___/\_,_/_/_/_/ .__/_/\__/
##                                             /_/
##
####### Ecosystème basé sur les microservices ##################### (c) 2018 losyme ####### @(°_°)@

package Inapte::Jobs::Test::03;

#md_# Inapte::Jobs::Test::03
#md_

use Exclus::Exclus;
use Moo;
use namespace::clean;

extends qw(Inapte::Job);

#md_## Les méthodes
#md_

#md_### run()
#md_
sub run {
    my ($self) = @_;
    $self->runner->broker->try_publish(
        'workflow.insert',
        'NONE',
        {
            title => 'Workflow de test',
            first_step => 'test_04',
            all_steps => {
                test_04 => {
                    application => 'Inapte',
                    type => 'Test::04',
                    next_step => 'test_05'
                },
                test_05 => {
                    application => 'Inapte',
                    type => 'Test::05'
                }
            }
        }
    );
}

1;
__END__
