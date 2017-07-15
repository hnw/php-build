#!/usr/bin/env bats

@test "Check loaded extensions" {
    run "$TEST_PREFIX/bin/php" -m
    echo "PHP minor version: $PHP_MINOR_VERSION"
    echo "$output" >&2

    echo "$output" | grep -q '^bz2$'
    echo "$output" | grep -q '^curl$'
    echo "$output" | grep -q '^date'
    echo "$output" | grep -q '^exif$'
    echo "$output" | grep -q '^ftp$'
    echo "$output" | grep -q '^gd$'
    echo "$output" | grep -q '^hash$'
    echo "$output" | grep -q '^json'
    echo "$output" | grep -q '^libxml$'
    # mcrypt is removed from the core in PHP 7.2.0
    [[ $PHP_MINOR_VERSION < 7.2 ]] && echo "$output" | grep -q '^mcrypt$'
    echo "$output" | grep -q '^mbstring$'
    echo "$output" | grep -q '^mysqli$'
    # mysqlnd is introduced since PHP 5.3.0
    [[ $PHP_MINOR_VERSION > 5.2 ]] && echo "$output" | grep -q '^mysqlnd$'
    echo "$output" | grep -q '^openssl$'
    echo "$output" | grep -q '^pcre$'
    echo "$output" | grep -q '^pdo_mysql$'
    echo "$output" | grep -q '^pdo_sqlite$'
    echo "$output" | grep -q '^soap$'
    echo "$output" | grep -q '^tidy$'
    echo "$output" | grep -q '^xml$'
    echo "$output" | grep -q '^xmlreader$'
    echo "$output" | grep -q '^xmlrpc$'
    echo "$output" | grep -q '^xsl$'
    echo "$output" | grep -q '^zip$'
    echo "$output" | grep -q '^zlib$'
}
