# AI Security and LLMOps Guardrails

## Runtime controls

- Put a malware scanning sidecar or asynchronous ClamAV scan in front of document persistence.
- Enforce MIME sniffing, file extension validation, PDF structural validation, and max page-count/size controls.
- Strip executable attachments, embedded JavaScript, and suspicious metadata before indexing.
- Run prompt injection detection on extracted chunks and user prompts; mark risky chunks and exclude them from retrieval.
- Add output moderation for PII leakage, unsafe content, and policy-violating tool calls before streaming the answer.

## Observability model

- Export OTel spans per agent stage: preprocess, extract, analyze, synthesize, validate.
- Track prompt tokens, completion tokens, latency, failure class, model, provider, and estimated cost per request.
- Log retrieval hit score distributions, top-k variance, empty retrieval rate, and context truncation events.
- Create evaluator jobs that compare grounded answers against retrieved chunks and emit hallucination scores.

## Multi-tenant posture

- Issue tenant-scoped JWT claims and propagate them through logs, traces, DB rows, and vector namespaces.
- Store tenant documents in isolated S3 prefixes and Qdrant collections or payload filters.
- Apply Redis key prefixing and per-tenant rate quotas.
