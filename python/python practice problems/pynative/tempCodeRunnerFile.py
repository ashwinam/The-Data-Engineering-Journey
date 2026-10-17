prev = 0
curr = 1


for _ in range(15):
    print(prev, end=" ")
    next = prev + curr
    prev = curr
    curr = next