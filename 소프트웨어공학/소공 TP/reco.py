import pymysql
import pandas as pd
from sklearn.metrics.pairwise import cosine_similarity
from datetime import datetime

def get_data():
    conn = pymysql.connect(host = "localhost",
                user= "root", password = "0000", charset = "utf8")
    cursor = conn.cursor()
    cursor.execute("SELECT flavor, menu_id, user_name FROM young_cheline.evaluate;")
    res = cursor.fetchall()
    return res

def make_ptable(df):
    ptable = df.pivot_table(values = 'flavor', index = 'menu_id', columns = 'user_name') 
    
    return ptable

def cosine(ptable):
    ptable = ptable.fillna(0)
    menu_id = ptable.index

    cos = cosine_similarity(ptable)
    cos = pd.DataFrame(data = cos, index=menu_id, columns=menu_id)
    return cos

def search_cos(cos,pt, user_id: str):
    ex = pt.assign(menu=pt.index.to_list())

    pt=ex.loc[ex[user_id].notnull(), [user_id, 'menu']] 
    user_cos=cos[pt['menu']] ## cos 확인 
    user_cos=user_cos[~user_cos.isin(user_cos.loc[pt['menu']])].dropna()
    X_vector = pt.iloc[:,[0]].values/10+1
    Y_matrix= user_cos.to_numpy()
    Matrix_product=Y_matrix.dot(X_vector)
    user_cos['Sum']=Matrix_product
    user_recomand=user_cos.sort_values('Sum',ascending=False).head(10).index.to_list()
    return user_recomand

def data_open():
    data = get_data()
    df = pd.DataFrame(data, columns=['flavor', 'menu_id','user_name'])
    df['flavor'] = df['flavor'].astype(int)
    return df

def recommand(user_id):
    df=data_open()
    ptable = make_ptable(df)
    cos = cosine(ptable)
    a = search_cos(cos,ptable, user_id=user_id)
    print(user_id,a)
    return user_id, a

def insert_db(list):
    conn = pymysql.connect(host = "localhost",
                user= "root", password = "0000", charset = "utf8")
    cursor = conn.cursor()

    for a in list:
        menu_id = a[0]
        user_name = a[1]
        current_time = datetime.now()
        cursor.execute('''INSERT INTO young_cheline.recommend (menu_id,user_name,time)
                        VALUES (%s, %s,%s);''',(menu_id, user_name,current_time))
    conn.commit()

if __name__ == '__main__':
    evaluate_df = get_data()
    p_table = make_ptable(evaluate_df)
    cosine_df = cosine(p_table)
    search_cos(cosine_df)
    