#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${NAMESPACE:-rag-platform}"
BASE_RELEASE="${BASE_RELEASE:-rag-platform}"
IMAGE_TAG="${1:?image tag required}"

helm upgrade --install "${BASE_RELEASE}-canary" infra/helm/rag-platform \
  --namespace "${NAMESPACE}" \
  --set backend.image.tag="${IMAGE_TAG}" \
  --set frontend.image.tag="${IMAGE_TAG}" \
  --set backend.replicaCount=1 \
  --set frontend.replicaCount=1

echo "Route 5-10% traffic to canary using ALB weighted target groups or service mesh."
