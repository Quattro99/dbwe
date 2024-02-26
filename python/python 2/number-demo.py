
value = None
numbers = []

while value != "exit":
    try:
        value = input("Zahl oder exit: ")
        number = float(value)
        numbers.append(number)
    except ValueError:
        message = "Eingabe '{}'ist keine Zahl".format(value)
        print(message)

print("Numbers:")
print(numbers)