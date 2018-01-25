USE todoapi;

CALL addUser('Teszt Elek', 't.elek@matav.hu', SHA2('telek', 256));
CALL addUser('Kerékgyártó Emil', 'kamil@freemail.hu', SHA2('kamilka123', 256));
CALL addUser('Dékány Szabi', 'lol@lol.hu', SHA2('semmmi',256));

INSERT INTO usergroup (name)
VALUES
('egy'),
('ketto'),
('csipkebokorvesszo');

Select * From todoapi.usergroup;


INSERT INTO user_usergroup (user_id, usergroup_id)
VALUES
(0, 0),
(0, 1),
(2, 1),
(1, 2),
(2, 2);

CALL addUserTodo(0, "Ültesd el a muskátlit", 1, CURRENT_TIMESTAMP, @todo_id);
CALL addUserTodo(1, "Vegyél kenyeret", 0, CURRENT_TIMESTAMP, @todo_id);
CALL addUserTodo(2, "Vegyél levegőt", 2, CURRENT_TIMESTAMP, @todo_id);

CALL addUserGroupTodo(2, "Valaki cseréljen égőt", 7, CURRENT_TIMESTAMP, @todo_id);

INSERT INTO todo_usergroup( todo_id, usergroup_id)
VALUES
(3, 2);