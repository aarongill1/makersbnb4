require 'pg'

conn = PG.connect(dbname: 'postgres')
conn.exec("CREATE DATABASE makersbnb")
conn.exec("CREATE DATABASE makersbnb_test")