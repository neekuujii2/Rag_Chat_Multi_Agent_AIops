# AI Observability Setup

## Recommended stack

- Primary telemetry: OpenTelemetry for traces, metrics, and structured logs.
- LLM telemetry sink: Langfuse for prompt/response traces and cost accounting, or Arize Phoenix for eval-heavy workflows.
- Grafana for operational dashboards, Jaeger for trace deep dives, Loki for log correlation.

## Multi-agent trace model

- Root span: API request or async ingestion job.
- Child spans: `preprocessor`, `extractor`, `analyzer`, `optimizer`, `assembler`, `validator`, `synthesizer`.
- Attach attributes for `tenant_id`, `session_id`, `model`, `provider`, `embedding_model`, `vector_store`, `token_in`, `token_out`, `estimated_cost_usd`, and `hallucination_score`.

## SLO-aligned metrics

- `llm_request_latency_seconds`
- `agent_stage_duration_seconds`
- `rag_retrieval_score_mean`
- `rag_empty_retrieval_ratio`
- `prompt_injection_block_total`
- `upload_malware_detected_total`
- `llm_estimated_cost_usd_total`

## Evaluations

- Sample 1-5% of completions into an offline evaluator queue.
- Compare answer grounding against retrieved chunks.
- Alert on hallucination score spikes, empty context responses, and cost outliers by tenant or model.
