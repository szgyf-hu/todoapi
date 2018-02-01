USE todoapi;

CALL addUser('Teszt Elek', 't.elek@matav.hu', SHA2('telek', 256));
CALL addUser('Kerékgyártó Emil', 'kamil@freemail.hu', SHA2('kamilka123', 256));
CALL addUser('Dékány Szabi', 'lol@lol.hu', SHA2('semmmi',256));
SELECT * FROM user;

INSERT INTO usergroup (name)
VALUES
('egy'),
('ketto'),
('csipkebokorvesszo');
SELECT * FROM todoapi.usergroup;

INSERT INTO user_usergroup (user_id, usergroup_id)
VALUES
(1, 1),
(1, 2),
(3, 2),
(2, 3),
(3, 3);

CALL addUserTodo(1, "Ültesd el a muskátlit", 1, CURRENT_TIMESTAMP, @todo_id);
CALL addUserTodo(2, "Vegyél kenyeret", 0, CURRENT_TIMESTAMP, @todo_id);
CALL addUserTodo(3, "Vegyél levegőt", 2, CURRENT_TIMESTAMP, @todo_id);

CALL addUserGroupTodo(2, "Valaki cseréljen égőt", 7, CURRENT_TIMESTAMP, @todo_id);