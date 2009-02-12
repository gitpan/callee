package callee;

use strict;
use warnings;
use Devel::Caller qw(caller_cv);

our $VERSION = '0.01';

use base 'Exporter';

our @EXPORT = qw(callee);

sub callee { caller_cv(1) }

1;

__END__

=head1 NAME

callee - support recursive anonymous functions

=head1 SYNOPSIS

    use callee;

    my $f = sub {
        my $x = shift;
        return 1 if $x <= 1;
        $x * callee->($x-1);
    }->(5);

    # $f is 120

=head1 DESCRIPTION

This module exports one function, C<callee()>, which allows anonymous
functions to refer to themselves. This is necessary for recursive anonymous
functions. 

A recursive function must be able to refer to itself. Typically, a function
refers to itself by its name. However, an anonymous function does not have a
name, and if there is no accessible variable referring to it, i.e. the
function is not assigned to any variable, the function cannot refer to itself.
This is where callee comes in.

This module is just very thin syntactic sugar for L<Devel::Caller>.

=head1 EXPORTS

=over 4

=item C<callee>

Returns a coderef to the function within which it is called.

=back

=head1 SEE ALSO

Takesako-san wrote C<arguments.pm> - see
http://svn.coderepos.org/share/lang/perl/arguments/trunk/ - which does
practically the same thing. I released this module because C<arguments.pm> is
not on CPAN, and because Devel::Caller already existed on CPAN, but not with
the syntax I wanted.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see L<http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

The development version lives at L<http://github.com/hanekomu//>.
Instead of sending patches, please fork this project using the standard git
and github infrastructure.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2008 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

