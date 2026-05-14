#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${NAMESPACE:-rag-platform}"
RELEASE="${RELEASE:-rag-platform}"
COLOR="${1:-green}"
IMAGE_TAG="${2:?image tag required}"

helm upgrade --install "${RELEASE}-${COLOR}" infra/helm/rag-platform \
  --namespace "${NAMESPACE}" \
  --set backend.image.tag="${IMAGE_TAG}" \
  --set frontend.image.tag="${IMAGE_TAG}" \
  --set global.environment=production

kubectl rollout status deployment/"${RELEASE}-${COLOR}-backend" -n "${NAMESPACE}" --timeout=10m
kubectl rollout status deployment/"${RELEASE}-${COLOR}-frontend" -n "${NAMESPACE}" --timeout=10m

echo "Switch ALB weights or service selectors after validation."
