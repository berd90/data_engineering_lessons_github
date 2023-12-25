


def func1():
    print('a')
    print('b')

# for one_element in [1, 2, 3]:
#     func1()

def func2(local_element):
    print(local_element, local_element * 2)


# for one_element in [1, 2, 3, 'hello!']:
#     func2(local_element=one_element)

def func3(name, surname='Сидоров', otchestvo='petrovich'):
    print(f'name is {str(name)}, surname is {str(surname)}, {otchestvo}')


func3(name='Иван', surname='Петров')
func3('Иван', 'Петров')
func3(name='Иван')


def sum2(a, b):
    result = a + b
    return result

def sum3(c):
    return sum2(c, c)

print(sum3(100))


# print(sum2(a=1, b=5))

def any_function(a, b):
    result1 = a + b
    result2 = a - b
    return result1, result2

var1, var2 = any_function(10, 8)
# print(var1)
# print(var2)


def func123(a: float):
    return a + 2

# def func123(a: str):
#     return a

print(func123(1))


def loop1():
    for element in [1, 2, 3, 4, 5, 6, 7, 8]:
        print(element)
        if element > 3:
            return None

loop1()