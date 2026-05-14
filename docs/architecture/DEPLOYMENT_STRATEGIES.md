# Deployment Strategies

## Zero downtime

- Standard path uses Kubernetes rolling updates with `maxUnavailable=0`.
- ALB health checks and readiness probes gate traffic before cutover.
- `preStop` hook plus graceful Gunicorn shutdown avoids terminating in-flight SSE streams.

## Blue-green

- Deploy a second Helm release using `infra/scripts/deploy-blue-green.sh`.
- Validate health, smoke tests, and synthetic conversations on the green stack.
- Shift traffic by changing ALB weighted target groups, then retire blue after soak time.

## Canary

- Deploy `rag-platform-canary` with 5-10% weighted traffic.
- Watch latency, error budget, token cost, and hallucination metrics before increasing weight.
- Roll back immediately if p95 latency, 5xx rate, or eval score thresholds breach.
