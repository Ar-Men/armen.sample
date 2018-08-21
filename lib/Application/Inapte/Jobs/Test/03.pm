#######
##                                                      __
##   ___ _______ _  ___ ___        ___ ___ ___ _  ___  / /__
##  / _ `/ __/  ' \/ -_) _ \  _   (_-</ _ `/  ' \/ _ \/ / -_)
##  \_,_/_/ /_/_/_/\__/_//_/ (_) /___/\_,_/_/_/_/ .__/_/\__/
##                                             /_/
##
####### Ecosystème basé sur les microservices ##################### (c) 2018 losyme ####### @(°_°)@

package Application::Inapte::Jobs::Test::03;

#md_# Application::Inapte::Jobs::Test::03
#md_

use Exclus::Exclus;
use Moo;
use namespace::clean;

extends qw(Application::Inapte::Job);

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
                    type => 'Test::05',
                    next_step => 'test_06'
                },
                test_06 => {
                    application => 'Inapte',
                    type => 'Test::06'
                }
            }
        }
    );
}

1;
__END__
