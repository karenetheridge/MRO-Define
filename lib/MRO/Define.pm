use strict;
use warnings;

package MRO::Define;
# ABSTRACT: Define your own method resolution order

require 5.010001;

use XSLoader;

XSLoader::load(
    __PACKAGE__,
    $MRO::Define::{VERSION} ? ${ $MRO::Define::{VERSION} } : (),
);

1;

=head1 SYNOPSIS

    # define your mro
    use mro;
    use MRO::Define;
    MRO::Define::register_mro(your_mro => sub { ... });

    # use your mro somewhere else
    use mro 'your_mro';

=head1 DESCRIPTION

With recent versions of perl it is possible to change the method resolution
order (mro) of a given class either by using C<use mro> as shown in the
synopsis, or by using the C<mro::set_mro>.

Perl itself comes with two MROs by default. The traditional Perl default MRO
(depth first search, DFS) and C3 MRO.

This module allows you to define custom method resolution orders in addition to
those perl already has.

=func register_mro ($name, $resolve_callback)

This function allows registering of custom method resolution orders. Your MRO
needs to have a C<$name> as well as a C<$resolve_callback> that will get
invoked when a method trying to be resolved using your MRO. The resolve
callback is expected to return an array reference of package names that will be
used for the method lookup.

=cut
