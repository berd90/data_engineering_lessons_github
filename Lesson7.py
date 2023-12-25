
#public
#protected
#private

class Human:
    name: str
    __age: int

    def __init__(self, v_name="Vasya"):
        self.name = v_name
        self._password = "12345"
        self.__age = 30

    def get_age(self):  #геттер
        return self.__age

    def set_age(self, v_age: int):  #сеттер
        if type(v_age) == int:
            self.__age = v_age
        else:
            print('error')

o_vasya = Human()
o_vasya.name = 'Ivan'
print(o_vasya.name)
print(o_vasya._password)


o_vasya.set_age('15 let')
abc = o_vasya.get_age()
print(f"abc = {str(abc)}")
print(o_vasya.get_age())
