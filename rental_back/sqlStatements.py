# Here, we find all SQL statements to be used in the project
sql_query_all = '''
    SELECT car.vehicleid, car.name, brand.brand, car.air_cond, car.heating, car.fuel, category.category
        FROM car 
            INNER JOIN brand ON car.brand_id = brand.id
            INNER JOIN category ON car.category_id = category.id;
    '''

sql_query_by_one = '''
    SELECT car.vehicleid, car.name, brand.brand, car.air_cond, car.heating, car.fuel, category.category
        FROM car 
            INNER JOIN brand ON car.brand_id = brand.id
            INNER JOIN category ON car.category_id = category.id
                WHERE car.vehicleid = %s;
    '''

sql_query_preview = '''
    SELECT car.vehicleid, car.name, brand.brand
        FROM car 
            INNER JOIN brand ON car.brand_id = brand.id
            INNER JOIN category ON car.category_id = category.id;
    '''

sql_insert_booking = '''
    INSERT INTO booking (client_id, vehicleid, start_day, end_day) VALUES (%s, %s, %s, %s);
    '''

sql_insert_client = '''
    INSERT INTO client (first_name, last_name, birthday, address_1, address_2, address_3,
        city, zip_code, country, email, phone_number, password)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
    '''

sql_insert_promo = '''
    INSERT INTO promo (vehicleid, start_day, end_day, rate) VALUES (%s, %s, %s, %s);
    '''

sql_promo_check = '''
    SELECT * FROM promo WHERE id = (SELECT MAX(id) FROM promo WHERE promo.vehicleid = %s);
    '''
