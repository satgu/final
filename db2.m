javaaddpath 'mysql-connector-java-5.1.6-bin.jar';

conn=database('face_recognition', 'root', '', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost/');
e = exec(conn,'SELECT * FROM boylee');