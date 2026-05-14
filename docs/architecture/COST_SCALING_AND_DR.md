# Cost, Scaling, and Disaster Recovery

## Cost optimization

- Use Graviton (`t4g`, `r7g`) for Redis/RDS in dev and staging; reserve `r6g/r7g` for production.
- Keep frontend static assets on CloudFront and S3 where possible to reduce pod egress and ALB load.
- Use Karpenter or Cluster Autoscaler with mixed on-demand and spot node groups for Celery and batch jobs.
- Set log retention to 30 days in CloudWatch and tier long-term archives into S3 Glacier.
- Apply request and token budgets per tenant to prevent runaway LLM spend.

## Scaling strategy

- HorizontalPodAutoscaler on backend and frontend, and KEDA or custom metrics for Celery queue depth.
- Separate worker pools by workload type: ingestion, embedding, evaluation, and scheduled maintenance.
- Move vector storage to managed Qdrant or OpenSearch when FAISS local volumes become operationally limiting.
- Shard by tenant or document namespace once Qdrant collections exceed latency thresholds.

## Backup and disaster recovery

- RDS: 14-day automated backups plus PITR, quarterly restore drills.
- Redis: Multi-AZ with snapshots, accept cache warm-up as part of recovery plan.
- S3: versioning, lifecycle, and cross-region replication for regulated tenants.
- Qdrant: daily snapshot export to S3, restore validation in staging.
- Target RPO 15 minutes for metadata, 24 hours for vector snapshots; target RTO 2 hours.
