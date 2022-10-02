DROP TABLE IF EXISTS REGISTERED;
DROP TABLE IF EXISTS RESERVATION;

CREATE TABLE REGISTERED(  
    roomname VARCHAR(20) NOT NULL primary key,
    location VARCHAR(20) ,
    capacity int(10),
    airconditioner VARCHAR(5),
    board VARCHAR(5)
);

CREATE TABLE RESERVATION(  
    roomname VARCHAR(20) ,
    user_name VARCHAR(20) NOT NULL primary key,
    start_date DATE,
    end_date DATE,
    purpose VARCHAR(30),
    people int(10)
);


Insert into REGISTERED values("room 1", "CS-1004", 10, "O", "O"), 
                             ("room 2", "CS-2067", 45, "X", "X"),
                             ("room 3", "CS-1000", 5, "O", "X"),
                             ("room 4", "CS-1022", 30, "X", "O"),
                             ("room 5", "CS-2012", 20, "O", "X"),
                             ("room 6", "CS-1313", 5, "O", "X"),
                             ("room 234", "EE-123", 35, "X", "O"),
                             ("room 345", "EE-192", 10, "O", "X"),
                             ("room 7", "CS-3445", 20, "O", "O"),
                             ("room 8", "CS-4556", 15, "O", "X");


Insert into RESERVATION values("room 1", "junseon kim", "2021-10-11", "2021-10-12", "study", 10), 
                             ("room 2", "seongjin ahn", "2021-10-15", "2021-10-16", "meeting", 7),
                             ("room 3", "jungmo kang", "2021-10-13", "2021-10-15", "seminar", 30);