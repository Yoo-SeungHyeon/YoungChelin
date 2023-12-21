import pymysql
import pandas as pd
from datetime import datetime

def hot_menu():
    conn = pymysql.connect(host = "localhost",
                    user= "root", password = "1234", charset = "utf8")

    cursor = conn.cursor()

    cursor.execute('''SELECT menu_id, COUNT(*) AS CNT
                FROM young_cheline.evaluate
                WHERE DATE(time) between DATE_SUB(NOW(), INTERVAL 7 DAY) and (NOW())
                group by menu_id
                ORDER BY CNT DESC
                LIMIT 10;''')
    data = cursor.fetchall()
    time = datetime.now().strftime("%Y-%m-%d")

    for s in range(len(data)):
        id_menu = data[s][0]
        cursor.execute('''INSERT INTO young_cheline.hot_menu(menu_id, time)
                        VALUES (%s, %s);''',(id_menu,time))
    conn.commit()    


if __name__ == "__main__":
    hot_menu()
    
