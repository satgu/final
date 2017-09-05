function [ msg ] = DatabaseConnection( username, password )




% Database Server
host = 'localhost:3306';

% Database Username/Password
user = 'root';
password = '';


% Database Name

dbName = 'face_recognition'; 



% JDBC Parameters
jdbcString = sprintf('jdbc:mysql://%s/%s', host, dbName);
jdbcDriver = 'com.mysql.jdbc.Driver';
% Set this to the path to your MySQL Connector/J JAR

javaaddpath('mysql-connector-java-5.1.6-bin.jar')

% Create the database connection object
dbConn = database(dbName, user , password, jdbcDriver, jdbcString);

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
 

%Selecting Query username
QUERY = ['select Admin_username from login where Admin_username = ' ++ ' "' ++  username  ++ '" ' ++ ' and Admin_password = ' ++ ' "' ++  password  ++ '" ' ];
disp(QUERY);
rs = fetch(dbConn, QUERY)
if isempty(rs)
%     msgbox('No Data Exist');
    msg = 0;
    u='';

else
%     boolean msg;
    msg = 0;
    u = rs;
end

%Selecting Query password
QUERY = ['select Admin_password from login where Admin_username = ' ++ ' "' ++  username  ++ '" ' ++ ' and Admin_password = ' ++ ' "' ++  password  ++ '" ' ];
disp(QUERY);
rs = fetch(dbConn, QUERY)

if isempty(rs)
%     msgbox('No Data Exist');
    msg = 0;
    p='';


else
%     boolean msg;
    p = rs;
end

%comparing Username and Password
v1 = strcmp(username,u);
v2 = strcmp(password,p);
    if v1 == 1 && v2 == 1
        msg = 1;
    else
        msg = 0;
    end

%CLosing Connection
close(dbConn);





 
 