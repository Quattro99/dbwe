def f1 (x):
    if x < 0:
        e = Exception("Es sind nur postive Werte erlaubt für x")
        raise e
    print("f1 x:", x)
    result = x *  2
    print("f1 r:", result)
    return result

def f2 (x):
    print("f2 x:", x)
    result = x / 3
    print("f2 r:", result)
    return result


def f3 (x):
    print("f3 x:", x)
    result = x * x
    print("f3 r:", result)
    return result

print("Start")

try:
    print("Allocate filehandle")
    x = 5
    x = f1(x)
    x = f2(x)
    x = f3(x)
except ZeroDivisionError as ze:
    print ("Calculation failed with error:", ze)
except Exception as e:
    print ("Calculation failed with error:", e)
finally:
    print("Free filehandle")
    print("Finally Block")

print("End")