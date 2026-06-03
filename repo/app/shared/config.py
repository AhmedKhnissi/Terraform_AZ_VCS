import os


APP_NAME = os.getenv("APP_NAME", "azdevsecops-app")
APP_ENV = os.getenv("APP_ENV", "dev")
APP_VERSION = os.getenv("APP_VERSION", "0.1.0")
STORAGE_MODE = os.getenv("STORAGE_MODE", "local")