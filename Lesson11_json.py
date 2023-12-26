import json

# Data to be written
dictionary = {
    "name": "sathiyajith",
    "rollno": 56,
    "cgpa": 8.6,
    "phonenumber": "9976770500"
}

# Serializing json
json_object = json.dumps(dictionary, indent=4)
print(type(json_object))
print(json_object)

# Writing to sample.json
with open("sample.json", "w") as outfile:
    outfile.write(json_object)

# with open("sample.json", "w") as outfile:
#     json.dump(dictionary, outfile)


#reading
# Opening JSON file
with open('sample.json', 'r') as openfile:
    # Reading from json file
    json_object = json.load(openfile)

print(json_object)
print(type(json_object))