#!/usr/bin/env bats

@test "Installs xdebug.so" {
    local ext_dir=$("$TEST_PREFIX/bin/php" -r "echo ini_get('extension_dir');")

    [ -z $(echo "$DEFINITION_CONFIG" | grep '^install_xdebug') ] || skip "Xdebug isn't installed"
    [ -f "$ext_dir/xdebug.so" ]
}

@test "Enables Xdebug" {
    [ -z $(echo "$DEFINITION_CONFIG" | grep '^install_xdebug') ] || skip "Xdebug isn't installed"
    "$TEST_PREFIX/bin/php" -i | grep "xdebug"
}

