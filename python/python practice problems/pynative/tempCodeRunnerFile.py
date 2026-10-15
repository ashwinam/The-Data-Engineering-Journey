income = 9000
tax = 0
if income > 20_000:
    tax += (20_000 * 5) // 100
    income -= 20_000
    tax += (income * 20) // 100
else:
    if income < 10_000:
        print(tax)
    else:
        income = income - 10_000
        print("Income is: ", income)
        tax += (income * 10) // 100

print(tax)