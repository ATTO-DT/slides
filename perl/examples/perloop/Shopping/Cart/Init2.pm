package Shopping::Cart::Init2;
use strict;
use warnings;

use Carp qw(carp croak);
use Scalar::Util qw(weaken);
my $objects = 0;
my $existing_objects = 0;
my %objects;

sub new {
    my ($class, @args) = @_;

    my $self = {};

    bless $self, $class;

    $self->init(@args);

    return $self;
}

sub init {
    my ($self, %args) = @_;

    if (defined $args{name}) {
        $self->set_name($args{name});
    }

    $objects++;
    $existing_objects++;
    $objects{"$self"} = $self;
    weaken $objects{"$self"};

    return $self;
}


sub set_name {
    my ($self, $person_name) = @_;
    if (not defined $person_name or $person_name =~ /[^a-zA-Z]/) {
        carp "set_name needs a alphabetical name";
        return;
    }
    $self->{name} = $person_name;
}

sub get_name {
    my ($self) = @_;
    if (@_ >= 2) {
        carp "get_name needs to be called without parameter";
    }
    return $self->{name};
}


sub add_item {
    my ($self, $product_name, $amount) = @_;
    $amount ||= 1;
    $self->{CART}{$product_name} += $amount;
}

sub remove_item {
    my ($self, $product, $amount) = @_;
    $amount ||= 1;
    $self->{CART}{$product} -= $amount;
}

sub list_cart {
    my ($self) = @_;
    return %{ $self->{CART} };
}

sub get_product_price {
    my ($self, $product_name) = @_;
    my %prices = (
        'The OOP book of Damian'          => 23,
        'Perl Best Practices of Damian'   => 17,
        'The Little Prince'               => 8,
        'Objectives and Classifications'  => 48,
        'Winnie The Pooh'                 => 11,
    );
    croak "Product '$product_name' does not exist"
        if not defined $prices{$product_name};
    return $prices{$product_name};
}

sub get_price {
    my ($self) = @_;

    my $price = 0;
    foreach my $entry (keys %{ $self->{CART} }) {
         $price += $self->{CART}{$entry} * $self->get_product_price($entry);
    }

    return $price;
}

sub get_object_count {
    my ($thing) = @_;
    if (ref $thing) {
        croak "get_object_count does not work on objects";
    } else {
        return $objects;
    }
}
sub get_existing_object_count {
    my ($thing) = @_;
    if (ref $thing) {
        croak "get_object_count does not work on objects";
    } else {
        return $existing_objects;
    }
}

DESTROY {
    my ($self) = @_;
    delete $objects{"$self"};
    $existing_objects--;
}

sub list_objects {
    return values %objects;
}

1;

