#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function download_3rdparty_jar_files () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SUBDIR='3rd-party'
  [ -f "$SUBDIR"/.gitignore ] || return 0
  cd -- "$SUBDIR" || return $?

  local NEED=()
  readarray -t NEED < <(sed -nrf <(echo '
    s~^#!jar-download!\s+(https://)~\1~p
    ' ) -- .gitignore)
  local URL= JAR= DL=
  for URL in "${NEED[@]}"; do
    JAR="${URL##*/}"
    [ -s "$JAR" ] && continue
    DL="tmp.$$.$JAR.part"
    echo -n "D: Download missing JAR: $JAR <"
    wget --output-document="$DL" -- "$URL" || return $?
    mv --verbose --no-target-directory -- "$DL" "$JAR" || return $?
    echo
  done
}










download_3rdparty_jar_files "$@"; exit $?
