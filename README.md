
# Enterprise RAG PDF Chat Multi-Agent AI Platform

## Production-Grade Full Stack AI System with DevOps, DevSecOps, AIOps, Kubernetes, Terraform, AWS & Observability

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![React](https://img.shields.io/badge/React-18-blue?logo=react)
![FastAPI](https://img.shields.io/badge/FastAPI-Production-009688?logo=fastapi)
![Docker](https://img.shields.io/badge/Docker-Production-blue?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-blue?logo=kubernetes)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Prometheus](https://img.shields.io/badge/Prometheus-Monitoring-orange?logo=prometheus)
![Grafana](https://img.shields.io/badge/Grafana-Observability-F46800?logo=grafana)
![CI/CD](https://img.shields.io/badge/CI/CD-GitHub_Actions-black?logo=githubactions)
![DevSecOps](https://img.shields.io/badge/DevSecOps-Enabled-red)

---

# Overview

Enterprise-grade AI-powered RAG (Retrieval-Augmented Generation) platform designed for scalable document intelligence, contextual chat, multi-agent orchestration, and production deployment.

The platform combines:

- Multi-Agent AI pipelines
- PDF ingestion and semantic retrieval
- Streaming LLM responses
- Vector search
- AI observability
- Kubernetes orchestration
- DevSecOps security controls
- CI/CD automation
- AWS cloud infrastructure
- Centralized monitoring and tracing

This repository demonstrates how to build and deploy a real-world AI SaaS architecture using modern cloud-native engineering practices.

---

# Enterprise Features

- [x] Multi-Agent AI Pipeline
- [x] Streaming SSE Responses
- [x] PDF Semantic Search
- [x] Vector Embeddings
- [x] Dockerized Services
- [x] Kubernetes Ready
- [x] Terraform Infrastructure
- [x] GitHub Actions CI/CD
- [x] Centralized Monitoring
- [x] Distributed Tracing
- [x] DevSecOps Tooling
- [x] AWS Cloud Deployment
- [x] Background Workers
- [x] AI Observability
- [x] Reverse Proxy & TLS
- [x] Production Logging
- [x] Async Processing with Celery
- [x] RBAC-ready Architecture
- [x] Infrastructure as Code
- [x] Auto Scaling Support

---

# System Architecture

```text
Users
   │
CloudFront CDN
   │
Application Load Balancer
   │
────────────────────────────
│        Frontend           │
│ React + Vite              │
────────────────────────────
   │
Nginx Reverse Proxy
   │
────────────────────────────
│ FastAPI Multi-Agent APIs  │
│ LangGraph Pipelines       │
────────────────────────────
   │
────────────────────────────
│ Celery Workers            │
│ PDF Processing            │
│ Embedding Pipelines       │
────────────────────────────
   │
────────────────────────────
│ Redis │ PostgreSQL │ Qdrant │
────────────────────────────
   │
────────────────────────────
│ OpenRouter / LLM APIs     │
────────────────────────────

Monitoring:
Prometheus + Grafana + Loki + OpenTelemetry

Security:
Trivy + Falco + Semgrep + RBAC

Infrastructure:
Terraform + Kubernetes + AWS
````

---

# Tech Stack

## Frontend

* React 18
* TypeScript
* Vite
* Tailwind CSS
* Framer Motion
* Radix UI
* React Router

## Backend

* FastAPI
* Python 3.11+
* LangChain
* LangGraph
* Celery
* Redis
* PostgreSQL
* Qdrant / FAISS
* SSE Streaming

## AI & LLM

* OpenRouter
* OpenAI Models
* Multi-Agent Pipelines
* Embedding Models
* RAG Architecture

## DevOps

* Docker
* Docker Compose
* Kubernetes
* Helm
* Terraform
* GitHub Actions
* Nginx

## Observability

* Prometheus
* Grafana
* Loki
* OpenTelemetry
* Jaeger
* Langfuse / Phoenix

## DevSecOps

* Trivy
* Bandit
* Semgrep
* GitLeaks
* Falco
* Kyverno

## Cloud

* AWS EKS/ECS
* RDS PostgreSQL
* Elasticache Redis
* S3
* CloudFront
* Route53
* ACM
* Secrets Manager

---

# Project Structure

```text
RAG-PDF-Chat-Multi-Agent-Pipeline/
│
├── frontend/
│   ├── src/
│   ├── public/
│   ├── Dockerfile.prod
│   └── package.json
│
├── backend/
│   ├── app/
│   │   ├── agents/
│   │   ├── routes/
│   │   ├── services/
│   │   ├── observability.py
│   │   ├── celery_app.py
│   │   ├── tasks.py
│   │   └── main.py
│   ├── Dockerfile.prod
│   └── requirements.txt
│
├── infra/
│   ├── terraform/
│   ├── helm/
│   ├── k8s/
│   ├── monitoring/
│   ├── nginx/
│   ├── security/
│   └── scripts/
│
├── docs/
│   └── architecture/
│
├── .github/
│   └── workflows/
│
├── docker-compose.yml
├── docker-compose.dev.yml
├── Makefile
└── README.md
```

---

# DevOps Features

* Multi-stage Docker builds
* Docker Compose orchestration
* Kubernetes deployment manifests
* Helm chart support
* Terraform infrastructure provisioning
* Blue-Green deployment strategy
* Rolling deployments
* Auto-scaling support
* Zero-downtime deployment
* Production-ready Nginx reverse proxy
* Multi-environment support:

  * Development
  * Staging
  * Production

---

# DevSecOps Features

## Security Scanning

* Trivy container scanning
* Bandit Python security checks
* Semgrep static analysis
* GitLeaks secrets detection

## Runtime Security

* Falco runtime monitoring
* Kubernetes policy enforcement
* Secure ingress rules
* Network segmentation

## AI Security

* Prompt injection mitigation
* RAG sanitization
* File upload validation
* Secure PDF processing
* Output filtering
* Content moderation hooks

## Authentication & Access

* JWT-ready architecture
* OAuth2-ready integration
* RBAC support
* Multi-tenant isolation

---

# AIOps & Observability

## Monitoring

* Prometheus metrics collection
* Grafana dashboards
* Container monitoring
* Kubernetes monitoring
* API latency tracking

## Logging

* Loki centralized logs
* Structured application logs
* Error aggregation
* Security event logging

## Distributed Tracing

* OpenTelemetry instrumentation
* Jaeger tracing
* Request lifecycle tracking
* Agent execution tracing

## AI Observability

* Token usage tracking
* LLM latency monitoring
* Prompt/response tracing
* Retrieval quality analysis
* Hallucination monitoring
* Embedding performance tracking

---

# Core Features

## PDF Processing Pipeline

* PDF upload
* Text extraction
* Intelligent chunking
* Embedding generation
* Vector indexing
* Semantic retrieval

## Multi-Agent Pipeline

* Retrieval agent
* Context optimization agent
* Response generation agent
* Validation agent

## Streaming Responses

* SSE-based streaming
* Real-time token output
* Low-latency UX

## Async Processing

* Celery workers
* Background indexing
* Queue-based workloads
* Retry handling

---

# Local Development Setup

## Clone Repository

```bash
git clone <your-repository-url>
cd RAG-PDF-Chat-Multi-Agent-Pipeline
```

---

# Environment Variables

## Backend

```bash
cd backend
cp .env.example .env
```

Example:

```env
OPENROUTER_API_KEY=your_api_key
OPENROUTER_API_BASE=https://openrouter.ai/api/v1

POSTGRES_DB=rag_platform
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password

REDIS_URL=redis://redis:6379

QDRANT_URL=http://qdrant:6333

JWT_SECRET=change_this
```

---

# Run with Docker Compose

## Production Mode

```bash
docker compose up -d --build
```

## Development Mode

```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up
```

---

# Local Services

| Service      | URL                                                      |
| ------------ | -------------------------------------------------------- |
| Frontend     | [http://localhost:5173](http://localhost:5173)           |
| Backend API  | [http://localhost:8000](http://localhost:8000)           |
| Swagger Docs | [http://localhost:8000/docs](http://localhost:8000/docs) |
| Grafana      | [http://localhost:3001](http://localhost:3001)           |
| Prometheus   | [http://localhost:9090](http://localhost:9090)           |
| Qdrant       | [http://localhost:6333](http://localhost:6333)           |

---

# Kubernetes Deployment

## Apply Kubernetes Resources

```bash
kubectl apply -k infra/k8s/base
```

---

# Helm Deployment

```bash
helm install rag-platform ./infra/helm/rag-platform
```

---

# Terraform Infrastructure

## AWS Production Infrastructure

```bash
cd infra/terraform/environments/production

terraform init
terraform plan
terraform apply
```

---

# CI/CD Pipeline

GitHub Actions pipelines include:

* Linting
* Testing
* Security scanning
* Docker image build
* Container registry push
* Kubernetes deployment
* Terraform validation
* Release automation

Pipeline location:

```text
.github/workflows/
```

---

# Monitoring Stack

## Included Services

* Prometheus
* Grafana
* Loki
* OpenTelemetry
* Jaeger

## Metrics Tracked

* API latency
* Container usage
* Token consumption
* Agent execution time
* Vector DB performance
* Queue metrics
* Error rates

---

# Security Notes

Never commit:

* `.env`
* API keys
* AWS credentials
* Terraform state files
* Secrets

Use:

* AWS Secrets Manager
* External Secrets
* Environment-based configuration

---

# Production Engineering Highlights

This project demonstrates real-world experience with:

* Cloud-native AI systems
* Enterprise DevOps pipelines
* Kubernetes deployments
* Terraform IaC
* AI observability
* Production security hardening
* Scalable multi-agent systems
* Distributed AI infrastructure
* Enterprise monitoring systems

---

# Deployment Targets

Supported deployment targets:

* Local Docker
* VPS Deployment
* AWS ECS
* AWS EKS
* Kubernetes Clusters
* Hybrid Infrastructure

---

# Future Improvements

* Full RBAC implementation
* OAuth2 provider integration
* Langfuse integration
* Phoenix AI observability
* Full Qdrant migration
* Multi-region deployments
* GPU inference workloads
* Agent memory persistence

---

# Engineering Concepts Demonstrated

* Enterprise AI architecture
* Production RAG systems
* Multi-agent orchestration
* Kubernetes operations
* DevSecOps engineering
* Infrastructure as Code
* Distributed tracing
* CI/CD automation
* Cloud-native deployment
* Production observability

---

# Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push branch
5. Create Pull Request

---

# License

This project is licensed under the MIT License.

---

# Disclaimer

This repository is intended for:

* Production AI engineering
* Enterprise architecture learning
* DevOps & DevSecOps implementation
* Cloud-native AI deployment
* Multi-agent system experimentation

Use responsibly and secure all production secrets properly.

```
```
