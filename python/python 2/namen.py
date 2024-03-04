
value = None
names = []

while names != "exit":
    try:
        value = input("Geben Sie einen Namen ein. Abschluss mit ENDE: ")
        name = str(value)
        names.append(value)

    except ValueError:
        message = "Eingabe '{}'ist keine Zahl".format(value)
        print(message)

print("Names:")
print(names)
