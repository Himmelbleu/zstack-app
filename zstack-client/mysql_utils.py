import pymysql

from pojos import TempHu, Abt

HOST = "localhost"
USER = "root"
PWD = "123456"
DATABASE = "emqxdata"


# 连接数据库
def connect_mysql():
    return pymysql.connect(host=HOST, user=USER, password=PWD, database=DATABASE)


# 开始事务
def exe_sql(sql, params):
    d = connect_mysql()
    c = d.cursor()
    try:
        c.execute(sql, params)
        d.commit()
    except Exception as e:
        print(e)
        d.rollback()
    finally:
        c.close()
        d.close()


def insert_temhu(data: TempHu):
    sql = "insert into temhu (temp, humi, date, state, led_state, name, sno) values(%s, %s, %s, %s, %s, %s, %s)"
    exe_sql(sql, tuple(data))


def insert_abt(data: Abt):
    sql = "insert into abt (state, date, msg, led_state, name, sno) values(%s, %s, %s, %s, %s, %s)"
    exe_sql(sql, tuple(data))
