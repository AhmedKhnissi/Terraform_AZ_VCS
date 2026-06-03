import time
from shared.config import APP_NAME, APP_ENV, APP_VERSION


def run_worker():
    while True:
        print(
            {
                "service": "worker",
                "app": APP_NAME,
                "env": APP_ENV,
                "version": APP_VERSION,
                "message": "worker heartbeat"
            },
            flush=True
        )
        time.sleep(30)


if __name__ == "__main__":
    run_worker()