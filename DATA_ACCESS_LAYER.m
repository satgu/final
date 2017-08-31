function [ msg ] = DatabaseConnection( username, password )

 
%DB Service Port, Username, Password
host = 'localhost';
hostusername = 'root';
hostpassword = '';
 
%Database Name
databasename = 'face_recognition';
 
%JDBC Parameters
jdbcString = sprintf('jdbc:mysql://%s/%s', host, databasename);
jdbcDriver = 'com.mysql.jdbc.Driver';
 
%Path to mysql Connector
javaaddpath = ('mysql-connector-java-5.1.8-bin.jar');
%javaclasspath = ('C:\Users\USER\Downloads\mysql-connector-java-5.0.8-bin.jar');
 
%Now making DB connection Object
dbConn = database(databasename, hostusername, hostpassword, jdbcDriver, jdbcString);
 
%checking Connection Status
dbStatus = isopen(dbConn);
if (dbStatus==0)
    msg = sprintf('Failed To Establish Connection.\nReason: %s', dbConn.Message);
    msgbox(msg);
    return
else 
    msg='DataBase Connection is Successful';
    
    msgbox(msg);
end
 

 
%CLosing Connection
close(dbConn);
 
 
end