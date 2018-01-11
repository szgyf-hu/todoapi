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
	name like "%Dé%" 