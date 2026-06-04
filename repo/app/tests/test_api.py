from fastapi.testclient import TestClient
from app.api.main import app


client = TestClient(app)


def test_healthz():
    response = client.get("/healthz")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_readyz():
    response = client.get("/readyz")
    assert response.status_code == 200
    assert response.json()["status"] == "ready"


def test_list_files():
    response = client.get("/api/v1/files")
    assert response.status_code == 200
    assert "items" in response.json()


def test_create_event():
    response = client.post("/api/v1/events", json={"type": "demo"})
    assert response.status_code == 200
    assert response.json()["status"] == "accepted"