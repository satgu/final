conn = database.ODBCConnection('localhost','root','')
curs = exec(conn,'select Output from boyleeTable');
curs = fetch(curs)




