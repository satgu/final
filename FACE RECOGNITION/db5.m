

datasource = 'MySQL';
conn = database(datasource,'root','');

conn.Message

Name = 'boylee.5';
sqlquery = ['SELECT * FROM boylee ' ...
    'WHERE Name = ' '''' Name ''''];
curs = exec(conn,sqlquery);
curs = fetch(curs);
curs.Data



