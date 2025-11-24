#!/usr/bin/env bash
set -euo pipefail

ex="${1:-}"
lang="${2:-clj}"

cd "$(dirname "${BASH_SOURCE[0]}")/.."

case "${lang}" in
  clj)
    cd clojure

    if [ -z "${ex}" ]; then
      clj -M:test
      exit 0
    fi

    chapter="${ex%%-*}"
    number="${ex#*-}"
    chapter_padded="$(printf '%02d' "${chapter}")"

    ns="chapter${chapter_padded}.ex-${chapter}-${number}-test"

    clj -M:test -e "(require '${ns}) (clojure.test/run-tests '${ns})"
    ;;

  *)
    echo "unsupported lang: ${lang}" >&2
    exit 1
    ;;
esac

