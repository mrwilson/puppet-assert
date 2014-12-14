source puppet-assert.sh

@test "File :: should support hasMode" {
  NAME=${BATS_TMPDIR}/${BATS_TEST_NUMBER}
  touch ${NAME} 
  chmod 700 ${NAME}
  assertFile ${NAME} hasMode 700
}

@test "File :: should support hasType :: file" {
  NAME=${BATS_TMPDIR}/${BATS_TEST_NUMBER}
  touch ${NAME}
  assertFile ${NAME} hasType file
}

@test "File :: should support hasType :: directory" {
  NAME=${BATS_TMPDIR}/${BATS_TEST_NUMBER}
  mkdir -p ${NAME}
  assertFile ${NAME} hasType directory
}

@test "File :: should fail on unexpected input :: no such file" {
  ! assertFile "does_not_exist" hasType file
}

@test "File :: should fail on unexpected input :: bad type" {
  NAME=${BATS_TMPDIR}/${BATS_TEST_NUMBER}
  touch ${NAME}
  ! assertFile ${NAME} hasType "not_a_type"
}
