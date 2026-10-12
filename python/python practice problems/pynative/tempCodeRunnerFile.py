count = 0
sentence = "Learning Python is fun!"

for each_char in sentence:
    if each_char in 'aeiou':
        count += 1

print(count)