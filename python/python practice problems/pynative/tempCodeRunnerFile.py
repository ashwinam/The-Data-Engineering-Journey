text = "apple banana apple cherry banana apple"

histogram = {}

for word in text.split(" "):
    if word in histogram:
        histogram[word] += 1
    else:
        histogram[word] = 1

print(histogram)