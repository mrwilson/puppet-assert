source puppet-assert.sh

@test "File :: should support hasMode" {
  touch /tmp/foo
  chmod 700 /tmp/foo
  assertFile /tmp/foo hasMode 700
}
