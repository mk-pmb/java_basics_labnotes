#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function run_all_mains () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  # cd -- "$SELFPATH" || return $?

  "$SELFPATH"/download_3rdparty_jar_files.sh || return $?

  local SRC= BFN=

  local JAVA_OPTS=()
  local EXTRA_CLASS_PATHS=
  for SRC in 3rd-party/*.jar; do
    [ -f "$SRC" ] || continue
    EXTRA_CLASS_PATHS+=":$SRC"
  done
  [ "$CLASS_PATHS" == . ] || export CLASSPATH=".$EXTRA_CLASS_PATHS"

  for SRC in $(grep -lFe 'public static void main(' -- *.java); do
    BFN="${SRC%.*}"
    echo "==== $BFN ===="
    javac "$SRC" || return $?$(echo E: Failed to compile "$SRC, rv=$?" >&2)
    java  "$BFN" || return $?$(echo E: Failed to run     "$BFN, rv=$?" >&2)
    echo
  done
}










run_all_mains "$@"; exit $?
