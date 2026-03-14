#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT="$SCRIPT_DIR/esc-library.kicad_sym"


id="$1"
[[ -z "$id" ]] && { echo "usage: $0 <LCSC_ID>"; exit 1; }

# allow "52148914" -> "C52148914"
[[ "$id" == C* ]] || id="C$id"

easyeda2kicad  --footprint --symbol --3d --lcsc_id="$id" --output "$OUT" --overwrite
