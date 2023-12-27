import requests
# URL = f"https://www.googleapis.com/oauth2/v3/userinfo"
# token= ""
# headers_param = {"Authorization": f"Bearer {token}"}
# r = requests.get(url=URL, headers=headers_param)
# result = r.json()


# URL = f"https://robotfastapi.digitalberd.com/"
# r = requests.get(url=URL)
# result = r.json()
#
# if r.status_code == 200:
#     print(result)
#     print(type(result))
#     print(r.text)
#     print(r.status_code)
#     print(result.get('data'))
# else:
#     print('was error')
#     print(r.status_code)
#     print(r.text)


api_key = '1bbd0e4feae573037172783bf5a5ac2b'
curr = 'RUB,GBP,EUR'
start_date = '2023-12-01'
end_date = '2023-12-01'
URL = f'http://api.currencylayer.com/change?access_key={api_key}&currencies={curr}&start_date={start_date}&end_date={end_date}'
r = requests.get(url=URL)
result = r.json()
print(result)
print(result.get('quotes').get('USDRUB'))
print(result.get('quotes').get('USDGBP'))
print(result.get('quotes').get('USDEUR'))
