#!/bin/sh

assert () {
  TYPE=$1; NAME=$2;
  shift; shift;
  puppet resource ${TYPE} --verbose ${NAME} | sed 's/[ ]*\([a-z]*\)[ ]*=>/"\1":/g' | sed 's/.*{\(.*\):/{\"name\":\1,/g' | tr "'" "\"" | tr '\n' ' ' | sed 's/, }/}/g' | $*

}

has () {
  jq ".${1}" | grep -q $2
}

assertFile() {
  assert file $*
}

hasMode () {
  has mode $1
}

hasType () {
  has type $1
}
