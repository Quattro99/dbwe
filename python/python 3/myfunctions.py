
# Aufgabe 1
def is_int(string: str) -> bool:
    try:
        zahl = int(string)
        return True
    except ValueError:
        return False

