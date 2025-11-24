#!/usr/bin/env bash
set -euo pipefail

ex="${1:-1-02}"
lang="${2:-clj}"

cd "$(dirname "${BASH_SOURCE[0]}")/.."

case "${lang}" in
  clj)
    cd clojure

    chapter="${ex%%-*}"
    number="${ex#*-}"
    chapter_padded="$(printf '%02d' "${chapter}")"

    ns="solutions.chapter${chapter_padded}.ex-${chapter}-${number}"

    clj -M -e "(require '${ns}) (println ${ns}/solution)"
    ;;

    *)
    echo "unsupported lang: ${lang}" >&2
    exit 1
    ;;
esac

