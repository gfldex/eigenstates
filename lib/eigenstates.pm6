class the-eigenstates:ver<0.0.1>:auth<cpan:ELIZABETH> { }  # just for mi6

proto sub eigenstates(|) is export {*}
multi sub eigenstates(Junction:D \j --> List:D) {
    use nqp;
    nqp::getattr(j,Junction,'$!eigenstates').List
}
multi sub eigenstates(Mu \object) {
    (object,)
}

=begin pod

=head1 NAME

eigenstates - expose the eigenstates of an object

=head1 SYNOPSIS

=begin code :lang<raku>

  use eigenstates;

  say eigenstates(1|2|3);  # (1 2 3)

  say eigenstates(42);     # (42)

  sub handles-junctions(Junction:D $j) {
    say eigenstates $j;
  }

  handles-junctions(1&2&3); # (1 2 3)

  sub catch-all(Mu:D $j is raw) {
    say eigenstates $j;
  }

  catch-all(1&2); # (1 2)
  catch-all("String"); # (String)

=end code

=head1 DESCRIPTION

The eigenstates distribution exports a single subroutine called C<eigenstates>
that returns a list of a eigenstates of an object.  For all objects except
C<Junction>s, that's a list with the given object.  For a C<Junction>, it
returns the internal values (aka "eigenstates") as a List.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/eigenstates . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2020 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
