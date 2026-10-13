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

# exercise 4
""" 
String Slicing and substring removal

Write a function to remove characters from a string starting from index 0 up to n and return a new string.
"""

def remove_char(string, n):
    return string[n:]

print(remove_char("pynative", 4))

# Exercise 5
""" 
Variable Swapping (The In-Place Method)

Write a program to swap the values of two variables, a and b, without using a third temporary variable.
"""

a = 5
b = 10
print("Before swap: ", a, b)
a, b = b, a
print("After swap: ", a, b)

# Exercise 6
""" 
Calculating Factorial with a Loop

Write a program that calculates the factorial of a given number (e.g., 5!) using a for loop.
"""

factorial = 1
num = 5
for i in range(1, num + 1):
    factorial *= i

print(factorial)

# Exercise 7
""" 
List Manipulation: Add and Remove

Create a list of 5 fruits. Add a new fruit to the end of the list, then remove the second fruit (at index 1).
"""

fruits = ['apple', 'orange', 'dragon fruit', 'chikku', 'banana']

print(fruits)

fruits.append("lichi")
print(fruits)

fruits.pop(1)
print(fruits)

# Exercise 8
""" 
String Reversal

Write a program that takes a string and reverses it (e.g., “Python” becomes “nohtyP”).
"""

string = "Python"
print(string[::-1])

# Exercise 9
""" 
Vowel Frequency Counter

Write a program to count the total number of vowels (a, e, i, o, u) present in a given sentence.
"""

count = 0
sentence = "Learning Python is fun!"

for each_char in sentence:
    if each_char in 'aeiou':
        count += 1

print(count)

# Exercise 10
""" 
Finding Extremes (Min/Max) in a List

Given a list of integers, find and print both the largest and the smallest numbers.
"""

nums = [45, 2, 89, 12, 7]

print("Largest: ", max(nums))
print("Smallest: ", min(nums))


# Exercise 11
""" 
Removing Duplicates from a List

Write a script that takes a list containing duplicate items and returns a new list with only unique elements.
"""

data = [1, 2, 2, 3, 4, 4, 4, 5]

print(list(set(data)))

# Exercise 12
""" 
List Comparison and Boolean Logic

Write a function to return True if the first and last number of a given list is the same. If the numbers are different, return False.
"""

numbers_x = [10, 20, 30, 40, 10]
numbers_y = [75, 65, 35, 75, 30]

def is_numbers_matched(num:list):
    return num[0] == num[-1]

print(f"Given list: {numbers_x} | result is {is_numbers_matched(numbers_x)}")
print(f"Given list: {numbers_y} | result is {is_numbers_matched(numbers_y)}")

# Exercise 13
""" 
Filtering Lists with Conditional Logic

Iterate through a given list of numbers and print only those numbers which are divisible by 5.
"""

num_list = [10, 20, 33, 46, 55]

for i in num_list:
    if i % 5 == 0:
        print(i)