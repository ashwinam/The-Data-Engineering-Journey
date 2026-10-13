numbers_x = [10, 20, 30, 40, 10]
numbers_y = [75, 65, 35, 75, 30]

def is_numbers_matched(num:list):
    return num[0] == num[-1]

print(f"Given list: {numbers_x} | result is {is_numbers_matched(numbers_x)}")
print(f"Given list: {numbers_y} | result is {is_numbers_matched(numbers_y)}")