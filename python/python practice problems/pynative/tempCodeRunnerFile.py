str_x = "Emma is good developer. Emma is a writer"

count = 0
for i in str_x.split(" "):
    if 'Emma' == i:
        count += 1

print(count)

print(str_x.count("Emma"))