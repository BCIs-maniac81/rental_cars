import psycopg2
import psycopg2.extras
import config
import sqlStatements as sqls

cur = None
conn = None
extras = True
cursor_factory = None

conn = psycopg2.connect(
    host=config.hostname,
    dbname=config.database,
    user=config.username,
    password=config.pwd,
    port=config.port
)

if extras == True:
    cursor_factory = psycopg2.extras.DictCursor
else:
    cursor_factory = None

cur = conn.cursor(cursor_factory=cursor_factory)


def fetch_data(sql_query=None, id=None):
    try:
        if id is None:
            cur.execute(sql_query)
            return cur.fetchall()
        else:
            try:
                cur.execute(sql_query, [id])
                return cur.fetchall()
            except Exception as error:
                print("id must be an integer !")
                return error
    except Exception as error:
        return error


#data = fetch_data(sqls.sql_query_by_one, 100)
# print(data)


def post_data(sql_query=None, columns=None):
    try:
        cur.execute(sql_query, columns)
        conn.commit()
    except Exception as error:
        return error


post_data(sqls.sql_insert_promo, columns=(
    101, '2022-11-02', '2023-02-15', 0.8))

if cur is not None:
    cur.close()
if conn is not None:
    conn.close()
