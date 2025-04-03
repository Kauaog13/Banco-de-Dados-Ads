import mysql.connector
from mysql.connector import errorcode

try:

    db_connection = mysql.connector.connect(host='localhost',user='root',password='',port='3307')
    print("Conexão Bem Sucedida")
except mysql.connector.Error as error:
    if error.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database não existe")
    elif error.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("username ou password incorreto")
    else:
        print(error)
else:
    db_connection.close()