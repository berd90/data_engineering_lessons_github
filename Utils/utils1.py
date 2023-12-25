

class Human:
    age: int
    name: str

    def __init__(self, name="Igor"):
        self.name = name
        self.age = 20

    def say_hello(self):
        print('Hello, world')

def say_hello2():
    return 'Hello!'