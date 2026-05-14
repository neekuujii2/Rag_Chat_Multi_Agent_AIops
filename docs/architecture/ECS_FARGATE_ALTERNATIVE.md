# ECS Fargate Alternative

Use EKS as the primary production target for richer policy, autoscaling, and observability control. If a lighter control plane is preferred:

- Build backend and frontend images exactly as defined in `backend/Dockerfile.prod` and `frontend/Dockerfile.prod`.
- Publish to ECR and run services on ECS Fargate behind an ALB.
- Keep PostgreSQL on RDS, Redis on ElastiCache, documents on S3, and telemetry in CloudWatch plus managed Grafana.
- Run Celery workers and beat as separate ECS services or migrate scheduled tasks to EventBridge Scheduler and SQS consumers.
- Use AWS App Mesh or ECS service deployments for canary/blue-green if Kubernetes is not desired.
