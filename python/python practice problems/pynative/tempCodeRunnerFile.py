def check_paliandrome(num: int):
    reverse_num = 0
    original_num = num
    while num:
        rem = num % 10
        num = num // 10

        reverse_num = (reverse_num * 10) + rem

    return original_num == reverse_num

print(check_paliandrome(121))