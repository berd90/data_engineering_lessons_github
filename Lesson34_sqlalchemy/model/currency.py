
from sqlalchemy import Column, Integer, VARCHAR, Date, Boolean, Float, TIMESTAMP
import sys
sys.path.append("..")



from model.base import Base

class Currency(Base):
    __tablename__ = 'currency2'
    id = Column(Integer, nullable=False, unique=True, primary_key=True, autoincrement=True)
    currency = Column(VARCHAR(50), nullable=False)
    value = Column(Float, nullable=False)
    currate_date = Column (TIMESTAMP, nullable=False, index=True)