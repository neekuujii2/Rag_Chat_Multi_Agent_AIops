#!/usr/bin/env bash
set -euo pipefail

mkdir -p infra/nginx/certs
openssl req \
  -x509 \
  -nodes \
  -days 365 \
  -newkey rsa:4096 \
  -keyout infra/nginx/certs/local.key \
  -out infra/nginx/certs/local.crt \
  -subj "/CN=app.local.rag.internal/O=RAG Platform/C=IN"
