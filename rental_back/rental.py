from flask_restful import Resource
from flask import Flask  # , jsonify
import config
import pandas as pd
from flask import Blueprint, render_template, g
from db_utility import FetchData
import sqlStatements as sqls
from datetime import datetime

rental_bp = Blueprint('rental', __name__)
db = FetchData(True)


class Rental(Resource):
    @rental_bp.route('/rental/all',
                     methods=['GET'])
    def getAll():
        db.db_connect()
        fdata = db.fetch_data(sql_query=sqls.sql_query_all)
        db.db_close()
        fdata = [dict(item) for item in fdata]
        return {'data': fdata, 'message': 'Hello world'}, 200

    @rental_bp.route('/rental/preview',
                     methods=['GET'])
    def getPreview():
        db.db_connect()
        fdata = db.fetch_data(sql_query=sqls.sql_query_preview)
        db.db_close()
        fdata = [dict(item) for item in fdata]
        return {'data': fdata}, 200

    @rental_bp.route('/rental/<int:carid>',
                     methods=['GET'])
    def getOneById(carid):
        db.db_connect()
        fdata = db.fetch_data(sql_query=sqls.sql_query_by_one, arg=carid)
        db.db_close()

        if fdata != []:
            return {'data': dict(fdata[0]), 'message': 'Hello world'}, 200
        else:
            return {'data': None, 'message': f"'{carid}' does not exist"}, 404

    @rental_bp.route('/rental/booking/client_<int:clientid>&&car_<int:carid>&&sdate_<string:sdate>&&edate_<string:edate>',
                     methods=['GET', 'POST'])
    def bookingCar(clientid, carid, sdate, edate):
        columns = (clientid, carid, sdate, edate)
        db.db_connect()
        fdata = db.fetch_data(sqls.sql_booking_check, arg=carid)
        pdata = db.post_data(
            sql_query=sqls.sql_insert_booking, columns=columns)
        db.db_close()
        if pdata is None:
            return {'data': None, 'message': f'Booking of {carid} for client {clientid} is done !'}, 200
        else:
            return {'data': pdata.pgerror, 'message': f'client {clientid} session is not created yet!'}, 200

    @rental_bp.route('/rental/session/fname_<string:fname>&&lname_<string:lname>\
        &&birthday_<string:birthday>&&address_1_<string:address_1>&&address_2_<string:address_2>\
            &&address_3_<string:address_3>&&city_<string:city>&&zip_code_<string:zip_code>\
                &&country_<string:country>&&email_<string:email>&&phone_<string:phone>\
                    &&pass_<string:password>',
                     methods=['GET', 'POST'])
    def clientSession(fname, lname, birthday, address_1, address_2, address_3, city, zip_code,
                      country, email, phone, password):
        columns = (fname, lname, birthday, address_1, address_2,
                   address_3, city, zip_code, country, email, phone, password)
        db.db_connect()
        pdata = db.post_data(sql_query=sqls.sql_insert_client, columns=columns)
        db.db_close()
        if pdata is None:
            return {'data': None, 'message': f'Client session created sucessfully !!'}, 200
        else:
            return {'data': pdata.pgerror, 'message': 'Unable to create this client please check data'}, 200

    @rental_bp.route('/rental/promo/car_<int:carid>&&sdate_<string:sdate>&&edate_<string:edate>&&rate_<float:rate>',
                     methods=['GET', 'POST'])
    def promotion(carid, sdate, edate, rate):
        columns = (carid, sdate, edate, rate)
        db.db_connect()
        fdata = db.fetch_data(
            sql_query=sqls.sql_promo_check, arg=carid)
        if fdata == []:
            pdata = db.post_data(
                sql_query=sqls.sql_insert_promo, columns=columns)
            db.db_close()
            return {'data': None, 'message': f'New promotion on car {carid} is added!'}, 200
        else:
            if fdata[0]['end_day'] < datetime.strptime(edate, "%Y-%m-%d").date():
                pdata = db.post_data(
                    sql_query=sqls.sql_insert_promo, columns=columns)
                db.db_close()
                if pdata is None:
                    return {'data': fdata, 'message': f'promotion on car {carid} is updated !'}, 200
                else:
                    return {'data': pdata.pgerror, 'message': f'unable to create the promotion'}, 200
            elif fdata[0]['end_day'] >= datetime.strptime(sdate, "%Y-%m-%d").date() and float(fdata[0]['rate']) < rate:
                print("I'm There")
                pdata = db.post_data(
                    sql_query=sqls.sql_insert_promo, columns=columns)
                db.db_close()
                return {'data': None, 'message': f'promotion on car {carid} is updated !'}
            else:
                print(fdata[0]['end_day'])
                print(datetime.strptime(sdate, "%Y-%m-%d").date())
                print("Finally I'm here !!!!!!")
                return {'data': fdata, 'message': f'promotion on car {carid} is already created !'}, 200


if __name__ == '__main__':
    print('Must be run only for testing !!')
