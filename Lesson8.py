


class Human:
    _name: str
    __location: str

    def __init__(self, name='Ivan'):
        self._name = name
        self._location = 'Moscow'

    def get_name(self):
        return self._name

    def get_location(self):
        return self._name + ': ' + self._location

    def set_location(self, location):
        self._location = location

class Childern(Human):
    _age = 5
    def __init__(self, name='Ivan'):
        super().__init__(name)

    def set_age(self, age):
        self._age = age

    def get_age(self):
        return self._name + ': ' + str(self._age)

class Bus:
    __children: list()
    def __init__(self, children: list):
        self.__children = children

    def add_children(self, children: list):
        self.__children = self.__children + children

    def remove_children(self, children: list):
        for one_chield in children:
            if one_chield in self.__children:
                self.__children.remove(one_chield)

    def print_all_children_locations(self):
        for one_chield in self.__children:
            print(one_chield.get_location())

    def go_to_new_location(self, new_location):
        for one_chield in self.__children:
            one_chield.set_location(new_location)



first_chield = Childern()
second_chield = Childern('Petya')
third_chield = Childern('Vasya')

one_bus = Bus([first_chield, second_chield])
one_bus.print_all_children_locations()

print('---------------------')
one_bus.add_children([third_chield])
one_bus.print_all_children_locations()

print('---------------------')
# one_bus.remove_children([first_chield, second_chield])
one_bus.go_to_new_location('Dagestan')
one_bus.print_all_children_locations()

print('---------------------')
one_bus.go_to_new_location('Novgorod')
one_bus.print_all_children_locations()


############################################################################################################

list1 = [1, 2, 3, 4, 'hello!', 5, 6, 7]

def list_division(local_list: list):
    l_result = list()
    for one_element in local_list:
        try:
            l_result.append(100/(one_element-2))
        except ZeroDivisionError:
            print('na 0 delit nelza')
        except Exception as e:
            print(e)
        finally:
            print(one_element)
    return l_result

print(list_division(list1))

