import psycopg2
import psycopg2.extras
import config


class DB_CONNECT():
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
            self.cursor_factory = psycopg2.extras.DictCursor if self.extras == True else None
            self.cur = self.conn.cursor(cursor_factory=self.cursor_factory)

        except Exception as Error:
            return Error

    def db_close(self):
        if self.cur is not None:
            self.cur.close()
        if self.conn is not None:
            self.conn.close()


if __name__ == '__main__':
    print('Must be run only for testing !!')
