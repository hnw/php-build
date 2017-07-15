#!/usr/bin/env bats

@test "Installs xdebug.so" {
    local ext_dir=$("$TEST_PREFIX/bin/php" -r "echo ini_get('extension_dir');")

    [ echo "$DEFINITION_CONFIG" | grep '^install_xdebug' ] || return
    [ -f "$ext_dir/xdebug.so" ]
}

@test "Enables XDebug" {
    [ echo "$DEFINITION_CONFIG" | grep '^install_xdebug' ] || return
    "$TEST_PREFIX/bin/php" -i | grep "xdebug"
}

