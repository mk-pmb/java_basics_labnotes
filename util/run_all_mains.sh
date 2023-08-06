#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function run_all_mains () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  # cd -- "$SELFPATH" || return $?

  local SRC= BFN=
  for SRC in $(grep -lFe 'public static void main(' -- *.java); do
    BFN="${SRC%.*}"
    echo "==== $BFN ===="
    javac "$SRC" || return $?
    java "$BFN" || return $?
    echo
  done
}










run_all_mains "$@"; exit $?
