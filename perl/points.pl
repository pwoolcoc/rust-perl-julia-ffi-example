#!/usr/bin/env perl
use v5.10;
use strict;
use warnings;
use FFI::Raw;

my $make_point = FFI::Raw->new(
    "target/libpoints.so", "make_point",
    FFI::Raw::ptr,
    FFI::Raw::int,
    FFI::Raw::int
);

my $get_distance = FFI::Raw->new(
    "target/libpoints.so", "get_distance",
    FFI::Raw::double,
    FFI::Raw::ptr,
    FFI::Raw::ptr
);

my $one_point = $make_point->call(2,2);
my $two_point = $make_point->call(4, 4);

my $result = $get_distance->call($one_point, $two_point);

say $result;

