from datetime import datetime

date_s = "2021-01-01"
date_e = "2022-01-01"
format_ = "%Y-%m-%d"

date_object_1 = datetime.strptime(date_s, format_).date()
date_object_2 = datetime.strptime(date_e, format_).date()

print(dir(date_object_2 - date_object_1))
print((date_object_2 - date_object_1).days)