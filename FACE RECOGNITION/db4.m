% Database Server
host = 'localhost';

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

% Check to make sure that we successfully connected
if isconnection(dbConn)
    % Fetch the symbol, market cap, and last close for the 10 largest
    % market cap ETFs
    result = get(fetch(exec(dbConn, 'SELECT * FROM boylee')));
    disp(result);


% If the connection failed, print the error message
else
    disp(sprintf('Connection failed: %s', dbConn.Message));
end

% Close the connection so we don't run out of MySQL threads
close(dbConn);