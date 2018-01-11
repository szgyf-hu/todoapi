USE todoapi;

CALL addUser('Teszt Elek', 't.elek@matav.hu', SHA2('telek', 256));
CALL addUser('Kerékgyártó Emil', 'kamil@freemail.hu', SHA2('kamilka123', 256));
CALL addUser('Dékány Szabi', 'lol@lol.hu', SHA2('semmmi',256));

INSERT INTO usergroup (id, name)
VALUES
(1, 'egy'),
(2, 'ketto'),
(3, 'csipkebokorvesszo');

INSERT INTO user_usergroup (user_id, usergroup_id)
VALUES
(1, 1),
(1, 2),
(3, 2),
(2, 3),
(3, 3);

INSERT INTO todo (id, note, priority, timestamp)
VALUES
(4, "Valaki cseréljen égőt", 7, CURRENT_TIMESTAMP);

CALL addUserTodo(0, "Ültesd el a muskátlit", 1, CURRENT_TIMESTAMP);
CALL addUserTodo(1, "Vegyél kenyeret", 0, CURRENT_TIMESTAMP);
CALL addUserTodo(2, "Vegyél levegőt", 2, CURRENT_TIMESTAMP);

INSERT INTO todo_usergroup( todo_id, usergroup_id)
VALUES
(4, 3);