



l1 = [1, 2, 3, 4, 5, 6, 7, 8]

v_sum = 0
for one_element in l1:
    if one_element % 2 == 0:
        v_sum += one_element
print(v_sum)

l2 = [100, 200, 1]

v_sum = 0
for one_element in l2:
    v_sum = v_sum + one_element
print(v_sum)

# for one in l2:
#     print(one)
#     print(one * 10)

d1 = {
    'one': 123,
    'two': 456
}

# for one_key in d1.keys():
#     print(one_key, d1.get(one_key))

i = 0
d2 = dict()

print(d2)

for one_element in l1:
    d2[i] = one_element
    i = i + 1

print(d2)


i = 0
import time
# for one_element in [1, 2, 3]:
#     for i in [1, 2, 3, 4, 5]:
#         print(f'one element = {str(one_element)}')
#         print('hello!', i)
#         i += 1 #i = i + 1
#         time.sleep(1)

i = 0
while True:
    print('hello!', i)
    i += 1
    if i > 100:
        break