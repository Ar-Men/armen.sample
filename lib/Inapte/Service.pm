#######
##                                                      __
##   ___ _______ _  ___ ___        ___ ___ ___ _  ___  / /__
##  / _ `/ __/  ' \/ -_) _ \  _   (_-</ _ `/  ' \/ _ \/ / -_)
##  \_,_/_/ /_/_/_/\__/_//_/ (_) /___/\_,_/_/_/_/ .__/_/\__/
##                                             /_/
##
####### Ecosystème basé sur les microservices ##################### (c) 2018 losyme ####### @(°_°)@

package Inapte::Service;

#md_# Blocus::Service
#md_

use Exclus::Exclus;
use Module::Runtime qw(use_module);
use Moo;
use namespace::clean;

extends qw(Obscur::Runner::Service);

#md_## Les attributs
#md_

###----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----###
has '+name'        => (default => sub { 'Inapte' });
has '+description' => (default => sub { "Le µs de l'application" });
###----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----###

#md_## Les méthodes
#md_

#md_### _create_job()
#md_
sub _create_job {
    my ($self, $type, $origin, $priority) = @_;
    my $class = use_module("Inapte::Jobs::$type");
    my $job = $class->new(runner => $self, type => $type, origin => $origin, priority => $priority);
    $self->broker->publish('job.insert', $job->priority, $job->unbless);
}

#md_### on_message()
#md_
sub on_message {
    my ($self, $type, $message) = @_;
    if ($type =~ m!^job\.create\.Inapte\.(.+)$!) {
        $self->_create_job($1, $message->sender->{name}, $message->priority);
    }
    else {
        $self->logger->unexpected_error(type => $type);
    }
}

#md_### on_starting()
#md_
sub on_starting {
    my ($self) = @_;
    $self->broker->consume($self->name);
}

1;
__END__
