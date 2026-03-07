from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

load_dotenv("../.env.secrests")

DATABASE_URL = f"postgresql://{os.getenv('DATABASE_USER')}:{os.getenv('DATABASE_PASSWORD')}@{os.getenv('DATABASE_HOST')}:{os.getenv('DATABASE_PORT')}/{os.getenv('DATABASE_NAME')}"


def test_db_connection():
    
    try:
        engine = create_engine(DATABASE_URL)
        connection = engine.connect()
        print("Database connection successful!")
        connection.close()
    except Exception as e:
        print(f"Error connecting to database: {e}")

if __name__ == "__main__":
    test_db_connection()