
message = "Die Nr '{}' ist > als das Maximum '{}'".format(100, 50)
print(message)

message = "Die Nr '{nr}' ist > als das Maximum '{max}'. Die Nr. '{nr}' muss kleiner sein als '{max}'".format(max=100, nr=50)
print(message)

nr = 50
max = 100

print(f"Die Nr '{nr}' ist > als das Maximum '{max}'. Die Nr. '{nr}' muss kleiner sein als '{max}'")