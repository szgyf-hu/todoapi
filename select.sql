USE todoapi;
SELECT
	*
FROM
	user
    INNER JOIN
    user_todo
    ON
		user.id = user_todo.user_id
	INNER JOIN
    todo
    ON
		user_todo.todo_id = todo.id
WHERE
	name like "%Dé%";
    
SELECT
	*
FROM
	user
    INNER JOIN
    user_usergroup
    ON
		user.id = user_usergroup.user_id
    INNER JOIN
    todo_usergroup
    ON
		user_usergroup.usergroup_id = todo_usergroup.usergroup_id
	INNER JOIN
    todo
	ON
		todo_usergroup.todo_id = todo.id
WHERE
		name LIKE '%Dé%';
    
SELECT
	user.id,
    count(*)
FROM
	user
    INNER JOIN
    user_todo
    ON
		user.id = user_todo.user_id
	INNER JOIN
    todo
    ON
		user_todo.todo_id = todo.id
GROUP BY
	user.id;
    
    
    
    
    /*
SELECT
	todo.*
FROM
	user
    INNER JOIN
    user_usergroup
    ON
		user.id = user_usergroup.user_id
	INNER JOIN
    usergroup
    ON
		user_usergroup.usergroup_id = usergroup.id
	INNER JOIN
    todo_usergroup
    ON
		usergroup.id = todo_usergroup.usergroup_id
	INNER JOIN
    todo
    ON
		todo.id = todo_usergroup.todo_id
WHERE
	user.name like "%Dé%";*/
    
