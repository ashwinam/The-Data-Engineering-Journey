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
prev_num = 0
for i in range(10):
    x_sum = i + prev_num
    print(f"Current Number {i} Previous Number {prev_num} Sum: {i + prev_num}")

    prev_num = i


# Exercise 3
""" 
String Indexing and Even Slicing

Display only those characters which are present at an even index number in given string.
"""

string="pynative"
print(string[::2])