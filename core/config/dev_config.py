import os

from .base_config import Base, str2bool


class DevConfig(Base):
    CONFIG_NAME = "DEV"

    DATABASE_MYSQL_URL = os.getenv("DATABASE_MYSQL_URL", "root:dSSALHwSsCiXzPr@192.168.0.126:3306/fastapi")

    PROD = str2bool(os.getenv("PROD", "False"))

    # db
    DATABASE_URL = os.getenv("DATABASE_URL", f"mysql+aiomysql://{DATABASE_MYSQL_URL}?charset=utf8mb4")
    SHOW_SQL = str2bool(os.getenv("SHOW_SQL", "True"))
