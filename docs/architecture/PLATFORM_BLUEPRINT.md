# RAG Platform Blueprint

## Topology

```text
Users -> Route53 -> CloudFront -> AWS WAF -> ALB -> EKS Ingress
                                                -> Frontend Pods
                                                -> Backend Pods
                                                     -> Redis / Celery
                                                     -> RDS PostgreSQL
                                                     -> Qdrant
                                                     -> S3 document archive
                                                     -> OpenRouter / model APIs

Telemetry -> Fluent Bit/Loki + Prometheus/Grafana + OTel/Jaeger + Langfuse/Phoenix
CI/CD -> GitHub Actions -> ECR -> Helm -> EKS
Secrets -> AWS Secrets Manager + IRSA
```

## Reliability Model

- Multi-AZ VPC with public ingress subnets and private workload/data subnets.
- EKS managed node groups for steady workloads; optional Karpenter or Fargate profiles for bursty async workers.
- ALB health checks, Kubernetes readiness/liveness, PodDisruptionBudgets, and HPA-driven autoscaling.
- RDS Multi-AZ, ElastiCache failover, S3 versioning, and backup retention baked into Terraform.

## Security Model

- TLS from CloudFront to ALB with ACM certificates.
- WAF managed rules, Nginx and ALB rate limiting, least-privilege IRSA roles, and private data plane subnets.
- Kyverno, Gatekeeper, and Falco enforce runtime hardening and detect drift or suspicious behavior.
- Code, dependency, container, and secret scanning in GitHub Actions before release promotion.

## AI/LLM Operations

- OTel spans and Prometheus metrics for request latency, agent stage timings, Redis, Qdrant, and queue health.
- Add Langfuse or Arize Phoenix as a downstream collector for prompts, responses, token usage, costs, and evaluator traces.
- Enforce document validation, malware scanning, prompt injection filtering, and output moderation before response delivery.
