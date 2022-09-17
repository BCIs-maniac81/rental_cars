import requests

base = 'http://127.0.0.1:5000'

# response1 = requests.get(base + '/rental/all')
# response2 = requests.get(base + '/rental/preview')
# response3 = requests.get(base + '/rental/100')
# response4 = requests.post(
#     base + '/rental/booking/client_1&&car_103&&sdate_2022-10-01&&edate_2023-10-14')

# response5 = requests.post(base + '/rental/session/fname_joe&&lname_bill\
#          &&birthday_1980-05-11&&address_1_NY&&address_2_NA\
#              &&address_3_NA&&city_NY&&zip_code_8989\
#                  &&country_UK&&email_jb@email.com&&phone_787878787\
#                      &&pass_1234')

response6 = requests.post(
    base + '/rental/promo/car_103&&sdate_2022-09-01&&edate_2022-10-11&&rate_0.6')

print(response6.json())
