
number = 125

def is_paliandrome(num):
    return int(str(num)[0]) == int(str(num)[-1])

print("Result is: ", is_paliandrome(number))