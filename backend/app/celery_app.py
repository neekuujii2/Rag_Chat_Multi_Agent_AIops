"""Celery application wiring for asynchronous and scheduled platform jobs."""

from __future__ import annotations

import os

from celery import Celery


def _env(name: str, default: str) -> str:
    value = os.getenv(name, "").strip()
    return value or default


celery_app = Celery(
    "rag_pdf_chat",
    broker=_env("CELERY_BROKER_URL", _env("REDIS_URL", "redis://redis:6379/0")),
    backend=_env("CELERY_RESULT_BACKEND", _env("REDIS_URL", "redis://redis:6379/1")),
    include=["app.tasks"],
)

celery_app.conf.update(
    task_serializer="json",
    accept_content=["json"],
    result_serializer="json",
    timezone=os.getenv("CELERY_TIMEZONE", "UTC"),
    task_track_started=True,
    worker_prefetch_multiplier=1,
    task_acks_late=True,
    result_expires=3600,
    broker_connection_retry_on_startup=True,
    beat_schedule={
        "cleanup-stale-faiss-sessions": {
            "task": "app.tasks.cleanup_stale_faiss_sessions",
            "schedule": float(os.getenv("FAISS_CLEANUP_INTERVAL_SECONDS", "3600")),
        },
    },
)
