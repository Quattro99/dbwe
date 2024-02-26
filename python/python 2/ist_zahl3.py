konvertiert = False

while konvertiert == False :
    try:
        zahl = int(float(input('Geben Sie eine ganze Zahl ein: ')))
        konvertiert = True
    except ValueError :
        print('Ihre Eingabe ist keine ganze Zahl.')

print('Die Zahl ist: ', zahl)