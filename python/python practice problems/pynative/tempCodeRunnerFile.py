for i in range(10):
    if i == 0:
        prev_num = i
    else:
        prev_num = i - 1
    print(f"Current Number {i} Previous Number {prev_num} Sum: {i + prev_num}")