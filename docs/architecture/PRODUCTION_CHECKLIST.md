# Production Checklist

## Before first production deploy

- Provision AWS foundation from `infra/terraform/environments/production`.
- Create ACM certificates for CloudFront and ALB domains.
- Store application secrets in AWS Secrets Manager and map them into Kubernetes through External Secrets or CSI Secret Store.
- Push signed backend and frontend images into ECR.
- Validate WAF, Route53, CloudFront, and ALB routing in staging.
- Run Trivy, Bandit, Semgrep, GitLeaks, pip-audit, Safety, and SonarQube quality gates.
- Load test `/upload`, `/ask`, SSE streaming, Celery worker concurrency, and Redis failover behavior.
- Verify RDS backups, point-in-time recovery, and S3 lifecycle/versioning policies.

## AI-specific go-live controls

- Enable prompt injection heuristics before retrieval and before final response synthesis.
- Sanitize PDF content, reject encrypted/corrupt files, and pass uploads through malware scanning.
- Persist prompt, retrieval, model, latency, and token metadata into Langfuse or Phoenix.
- Define hallucination review workflows and sampling-based human evaluation.
- Set per-tenant usage quotas, cost budgets, and anomaly alerts.

## Day-2 operations

- Review SLO burn alerts daily.
- Patch images weekly and rebuild on every base image CVE.
- Rotate database, Redis, OpenRouter, and JWT signing secrets every 90 days.
- Review WAF blocked requests, Falco events, and audit logs weekly.
- Test restore from backup and blue-green rollback every release cycle.
