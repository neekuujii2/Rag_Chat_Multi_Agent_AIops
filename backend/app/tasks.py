"""Operational background tasks for cleanup and platform automation."""

from __future__ import annotations

import logging

from .celery_app import celery_app
from .services.faiss_session_cleanup import prune_stale_session_indexes

logger = logging.getLogger(__name__)


@celery_app.task(name="app.tasks.cleanup_stale_faiss_sessions")
def cleanup_stale_faiss_sessions() -> dict[str, int]:
    stale, junk = prune_stale_session_indexes()
    logger.info("faiss cleanup completed", extra={"stale_removed": stale, "junk_removed": junk})
    return {"stale_removed": stale, "junk_removed": junk}
