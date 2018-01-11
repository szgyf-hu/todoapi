USE todoapi;
DELIMITER $

DROP PROCEDURE IF EXISTS addUser$

CREATE PROCEDURE addUser(
	name nvarchar(200),
    username nvarchar(45),
    password nvarchar(100)
)
BEGIN
	INSERT INTO user (name, username, password)
	VALUES
		(name, username, SHA2(password, 256));
END$

DROP PROCEDURE IF EXISTS addUserTodo$

CREATE PROCEDURE addUserTodo(
	user_id 	int,
    note		varchar(45),
    priority	int,
    timestamp	datetime(6),
    OUT todo_id		int
)
BEGIN
    
	INSERT INTO todo (note, priority, timestamp)
	VALUES
		(note, priority, timestamp);
        
	SET todo_id = LAST_INSERT_ID();
        
	INSERT INTO user_todo (user_id, todo_id)
    VALUES
		(user_id, todo_id);        
        
END$
    
CALL addUserTodo(3, CURRENT_TIMESTAMP, 0, CURRENT_TIMESTAMP)$

DELIMITER ;
    
    