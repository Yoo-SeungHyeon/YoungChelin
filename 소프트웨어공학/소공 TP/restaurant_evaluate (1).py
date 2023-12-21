import pymysql
import numpy as np
import pandas as pd

def get_mean_taste():
    conn = pymysql.connect(host = "localhost",
                user= "root", password = "1234", charset = "utf8")
    cursor = conn.cursor()
    cursor.execute("select menu_id, restaurant_id,AVG(flavor) from young_cheline.evaluate group by menu_id, restaurant_id;")
    res = cursor.fetchall()
    return res

def get_count():
    conn = pymysql.connect(host = "localhost",
                user= "root", password = "1234", charset = "utf8")
    cursor = conn.cursor()
    cursor.execute("select count(*) from young_cheline.evaluate group by menu_id;")
    g_menu_id = cursor.fetchall()

    cursor.execute('''SELECT menu_id, COUNT(CASE WHEN couple LIKE '0' THEN 1 END) AS specific_count
        FROM young_cheline.evaluate
        GROUP BY menu_id;''')
    
    couple = cursor.fetchall()
    
    cursor.execute('''SELECT menu_id, COUNT(CASE WHEN family LIKE '1' THEN 1 END) AS specific_count
        FROM young_cheline.evaluate
        GROUP BY menu_id;''')
    
    family = cursor.fetchall()

    cursor.execute('''SELECT menu_id, COUNT(CASE WHEN solo LIKE '2' THEN 1 END) AS specific_count
        FROM young_cheline.evaluate
        GROUP BY menu_id;''')
    
    solo = cursor.fetchall()

    cursor.execute('''SELECT menu_id, COUNT(CASE WHEN drink LIKE '3' THEN 1 END) AS specific_count
                    FROM young_cheline.evaluate
                    GROUP BY menu_id;''')
    
    drink = cursor.fetchall()

    cursor.execute('''SELECT menu_id, COUNT(CASE WHEN friend LIKE '4' THEN 1 END) AS specific_count
        FROM young_cheline.evaluate
        GROUP BY menu_id;''')
    
    friend = cursor.fetchall()

    cursor.execute('''SELECT menu_id, AVG(NULLIF(cleaning, '')),AVG(NULLIF(plating, '')),AVG(NULLIF(price, '')),AVG(NULLIF(service, ''))
        FROM young_cheline.evaluate
        GROUP BY menu_id;''')
    
    avg_exxtra = cursor.fetchall()

    cursor.execute('''SELECT menu_name FROM young_cheline.menu;''')
    menu_name = cursor.fetchall()

    eva = get_mean_taste()

    for menu_id in range(len(g_menu_id)):
        menu_count =g_menu_id[menu_id][0] #메뉴별 평가 갯수
        
        menu = eva[menu_id][0]
        restaurant_id = eva[menu_id][1]
        avg_flavor = eva[menu_id][2]
        avg_flavor = round(avg_flavor)
        in_menu_name = menu_name[menu_id][0]

        cleaning = avg_exxtra[menu_id][1]
        cleaning = round(cleaning) if isinstance(cleaning, float) else cleaning

        plating = avg_exxtra[menu_id][2]
        plating = round(cleaning) if isinstance(cleaning, float) else cleaning

        price = avg_exxtra[menu_id][3]
        price = round(cleaning) if isinstance(cleaning, float) else cleaning
        
        service = avg_exxtra[menu_id][4]
        service = round(cleaning) if isinstance(cleaning, float) else cleaning

        ## mood
        solo2 = 2 if  (solo[menu_id][1]/ menu_count) >0.8 else None
        couple0 = 0 if  (couple[menu_id][1]/ menu_count) >0.8 else None
        drink3 = 3 if  (drink[menu_id][1]/ menu_count) >0.8 else None
        family1 = 1 if  (family[menu_id][1]/ menu_count) >0.8 else None
        friend4 = 4 if  (friend[menu_id][1]/ menu_count) >0.8 else None

        cursor.execute('''INSERT INTO young_cheline.restaurant_evaluate
            (menu_id,menu_name, cleaning, plating, price, restaurant_id, service, flavor, couple, drink, family, friend, solo)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)''',
                       (menu, in_menu_name,cleaning, plating, price, restaurant_id, service, avg_flavor, couple0, drink3, family1, friend4, solo2))

    
    conn.commit()

        
        

if __name__ == "__main__":
    res = get_count()