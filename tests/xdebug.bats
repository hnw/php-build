#!/usr/bin/env bats

@test "Installs xdebug.so" {
    local ext_dir=$("$TEST_PREFIX/bin/php" -r "echo ini_get('extension_dir');")
    local install_xdebug=$(echo "$DEFINITION_CONFIG" | grep '^install_xdebug')

    if [ -z $install_xdebug ]; then return ; fi
    [ -f "$ext_dir/xdebug.so" ]
}

@test "Enables XDebug" {
    local install_xdebug=$(echo "$DEFINITION_CONFIG" | grep '^install_xdebug')

    if [ -z $install_xdebug ]; then return ; fi
    "$TEST_PREFIX/bin/php" -i | grep "xdebug"
}

