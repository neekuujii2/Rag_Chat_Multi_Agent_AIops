# Environment and Secrets Strategy

## Environment model

- `dev`: local Docker or ephemeral cloud environment with lower-cost AWS sizing.
- `staging`: production-like EKS, lower traffic, full security controls, seeded synthetic data.
- `production`: multi-AZ EKS, managed data services, WAF, CloudFront, and stricter SLOs.

## Configuration boundaries

- Non-secret runtime config lives in Kubernetes `ConfigMap`, Helm values, and Terraform variables.
- Secrets never live in Git. Use AWS Secrets Manager for cloud and `.env.platform.example` only as a contract.
- For local work, load secrets through `.env.local` ignored by Git or through `direnv`/`doppler`/`1Password` CLI.
- Prefer External Secrets Operator or Secrets Store CSI Driver to sync AWS Secrets Manager into EKS.

## Secret inventory

- `OPENROUTER_API_KEY`, fallback provider keys, JWT signing secret, Sentry DSN.
- `POSTGRES_DSN`, Redis auth token, Qdrant API key if managed, Grafana admin secret.
- GitHub Actions OIDC role ARN, Slack webhook, Sonar token.

## Rotation policy

- API and signing keys every 90 days.
- Database and Redis credentials every 180 days with dual-write rotation procedure.
- TLS private material managed in ACM rather than filesystem wherever possible.
