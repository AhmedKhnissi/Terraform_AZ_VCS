from fastapi import FastAPI
from shared.config import APP_NAME, APP_ENV, APP_VERSION, STORAGE_MODE


app = FastAPI(
    title=APP_NAME,
    version=APP_VERSION,
    description="Azure DevSecOps demo API"
)


@app.get("/healthz")
def healthz():
    return {
        "status": "ok",
        "service": "api",
        "app": APP_NAME,
        "env": APP_ENV,
        "version": APP_VERSION
    }


@app.get("/readyz")
def readyz():
    return {
        "status": "ready",
        "storage_mode": STORAGE_MODE
    }


@app.get("/api/v1/files")
def list_files():
    return {
        "items": [
            {"name": "demo-report.pdf", "type": "document"},
            {"name": "architecture.yaml", "type": "config"}
        ]
    }


@app.post("/api/v1/events")
def create_event(payload: dict):
    return {
        "status": "accepted",
        "event": payload
    }