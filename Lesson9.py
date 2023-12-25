
import datetime
import pandas as pd

import Utils.utils1

from Utils.utils1 import Human

from Utils.global_config import USER_NAME

from Lesson1 import v_float

d_one = datetime.datetime.utcnow()

print(d_one)
print(type(d_one))

one_human = Utils.utils1.Human()
one_human.say_hello()

df1 = pd.DataFrame()

print(Utils.utils1.say_hello2())

