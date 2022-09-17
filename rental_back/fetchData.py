import sqlStatements as sqls
import initDB

db = initDB.DB_CONNECT()


def fetchAll(sql_query=sqls.sql_query_all):
    db.cur.execute(sql_query)
    return db.cur.fetchall()


def fetchByOne(id=None, sql_query=sqls.sql_query_by_one):
    db.cur.execute(sql_query, [id])
    return db.cur.fetchall()


def fetchDataPreview(sql_query=sqls.sql_query_preview):
    db.cur.execute(sql_query)
    return db.cur.fetchall()


if __name__ == '__main__':
    print('Must be run only for testing !!')
