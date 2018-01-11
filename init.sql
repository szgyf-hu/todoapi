USE todoapi;

INSERT INTO user (id, name, username, password)
VALUES
(1, 'Teszt Elek', 't.elek@matav.hu', SHA2('telek', 256)),
(2, 'Kerékgyártó Emil', 'kamil@freemail.hu', SHA2('kamilka123', 256)),
(3, 'Dékány Szabi', 'lol@lol.hu', SHA2('semmmi',256));

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
(1, "Vegyél kenyeret", 0, CURRENT_TIMESTAMP),
(2, "Vegyél levegőt", 2, CURRENT_TIMESTAMP),
(3, "Ültesd el a muskátlit", 1, CURRENT_TIMESTAMP),
(4, "Valaki cseréljen égőt", 7, CURRENT_TIMESTAMP);

INSERT INTO user_todo (user_id, todo_id)
VALUES
(1, 3),
(2, 1),
(3, 2);

INSERT INTO todo_usergroup( todo_id, usergroup_id)
VALUES
(4, 3);