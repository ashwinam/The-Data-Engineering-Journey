# Pynative Basic Questions

# Exercise 1
""" 
Arithmatic product and conditional logic.

Write a Python function that accepts two integer numbers. If the product of the two numbers is less than or equal to 1000, return their product; otherwise, return their sum.
"""

def sum_num(num1, num2):
    if num1 * num2 >= 1000:
        return num1 + num2
    return num1 * num2

print(sum_num(20, 30))
print(sum_num(40, 30))

# Exercise 2
""" 
Cumulative sum of range

Iterate through the first 10 numbers (0–9). In each iteration, print the current number, the previous number, and their sum."""

print("Printing current and previous number sum in a range(10)")
for i in range(10):
    if i == 0:
        prev_num = i
    else:
        prev_num = i - 1
    print(f"Current Number {i} Previous Number {prev_num} Sum: {i + prev_num}")
    