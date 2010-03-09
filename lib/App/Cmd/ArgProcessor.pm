use strict;
use warnings;

package App::Cmd::ArgProcessor;

=head1 NAME

App::Cmd::ArgProcessor - App::Cmd-specific wrapper for Getopt::Long::Descriptive

=head1 VERSION

version 0.306

=cut

our $VERSION = '0.306';

sub _process_args {
  my ($class, $args, @params) = @_;
  local @ARGV = @$args;

  require Getopt::Long::Descriptive;
  Getopt::Long::Descriptive->VERSION(0.084);

  my ($opt, $usage) = Getopt::Long::Descriptive::describe_options(@params);

  return (
    $opt,
    [ @ARGV ], # whatever remained
    usage => $usage,
  );
}

1;
