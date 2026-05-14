#!/usr/bin/env bash
set -euo pipefail

RELEASE="${1:-rag-platform}"
NAMESPACE="${2:-rag-platform}"

helm rollback "${RELEASE}" -n "${NAMESPACE}"
