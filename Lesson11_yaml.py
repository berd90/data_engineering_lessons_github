#pip install pyyaml
import yaml

import yaml


#write
# l_connections = [
#     {
#         "user_name": "etl_user",
#         "password": "123",
#         "host": "127.0.0.1"
#     },
#     {
#         "user_name": "test_user",
#         "password": "456"
#     }
# ]
#
# with open(r'connections.yaml', 'w') as file:
#     documents = yaml.dump(l_connections, file)

###################################################################
#reading
with open('connections.yaml') as file:
    # The FullLoader parameter handles the conversion from YAML
    # scalar values to Python the dictionary format
    connections = yaml.load(file, Loader=yaml.FullLoader)
    print(connections)
    print(type(connections))

# with open(r'E:\data\fruits.yaml') as file:
#     # The FullLoader parameter handles the conversion from YAML
#     # scalar values to Python the dictionary format
#     fruits_list = yaml.load(file, Loader=yaml.FullLoader)
#
#     print(fruits_list)
