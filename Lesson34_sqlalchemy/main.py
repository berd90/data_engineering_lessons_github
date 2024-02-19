import datetime as datetime
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker



import sys
sys.path.append("..")

from model.base import Base
from model.currency import Currency

from config import SQLALCHEMY_DATABASE_URI

engine = create_engine(SQLALCHEMY_DATABASE_URI)

Base.metadata.create_all(bind=engine)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
session_local = SessionLocal()

new_record = Currency(
                    currency='EUR',
                    value=2.222,
                    currate_date=datetime.datetime.utcnow()
                    )
new_record2 = Currency(
                    currency='RUB',
                    value=3.333,
                    currate_date=datetime.datetime.utcnow()
                    )

session_local.add(new_record)
session_local.add(new_record2)

session_local.commit()
