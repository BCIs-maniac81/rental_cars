import psycopg2
import psycopg2.extras
import config
import sqlStatements as sqls


class FetchData():
    def __init__(self, extras=True):
        self.cur = None
        self.conn = None
        self.extras = extras
        self.cursor_factory = None

    def db_connect(self):
        try:
            self.conn = psycopg2.connect(
                host=config.hostname,
                dbname=config.database,
                # schema=config.schema, #TODO
                user=config.username,
                password=config.pwd,
                port=config.port
            )
            if self.extras == True:
                self.cursor_factory = psycopg2.extras.DictCursor
            else:
                self.cursor_factory = None
            #self.cursor_factory = psycopg2.extras.DictCursor if self.extras == True else None
            self.cur = self.conn.cursor(cursor_factory=self.cursor_factory)

        except Exception as Error:
            return Error

    def db_close(self):
        if self.cur is not None:
            self.cur.close()
        if self.conn is not None:
            self.conn.close()

    def fetch_data(self, sql_query=None, arg=None):
        try:
            if arg is None:
                self.cur.execute(sql_query)
                return self.cur.fetchall()
            else:
                try:
                    self.cur.execute(sql_query, [arg])
                    return self.cur.fetchall()
                except Exception as error:
                    print("id must be an integer !")
                    return error
        except Exception as error:
            return error

    def post_data(self, sql_query=None, columns=None):
        try:
            self.cur.execute(sql_query, columns)
            self.conn.commit()
        except Exception as error:
            return error


if __name__ == '__main__':
    print('Must be run only for testing !!')
