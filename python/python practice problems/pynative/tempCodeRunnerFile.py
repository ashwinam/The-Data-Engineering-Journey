print("Printing current and previous number sum in a range(10)")
prev_num = 0
for i in range(10):
    x_sum = i + prev_num
    print(f"Current Number {i} Previous Number {prev_num} Sum: {i + prev_num}")

    prev_num = i