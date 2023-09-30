insert into signer (nickname) values
	('Louis Armstrong'),
	('Сплин'),
	('Zivert'),
	('The Beatles'),
	('Агата Кристи'),
	('Bob Marley');

insert into genre (genre_name) values
	('Jazz'),
	('Pop music'),
	('Rock'),
	('Reggae'),
	('Indie');


insert into singing (signer_id, genres_id) values
	(1, 1),
	(2, 3),
	(3, 2),
	(4, 2),
	(5, 3),
	(6, 4);


insert into album (title, release_date) values
	('What A Wonderful World', '1967-01-01'),
	('Satchmo Serenades', '1952-01-01'),
	('Пыльная быль', '1994-05-01'),
	('Фонарь под глазом', '1997-04-01'),
	('Life', '2018-11-29'),
	('Сияй', '2018-04-06'),
	('Let It Be', '1970-05-08'),
	('The Beatles', '1968-11-22'),
	('Опиум', '1995-01-01'),
	('Ураган', '1997-10-01'),
	('The Best of Bob Marley', '1973-04-13'),
	('Live Forever', '2011-02-01');

insert into recording (signer_id, album_id) values
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(3, 6),
	(4, 7),
	(4, 8),
	(5, 9),
	(5, 10),
	(6, 11),
	(6, 12);


insert into track (title, duration, album_id) values
	('What a Wonderful World', 132, 1), 
	('Cabaret', 148, 1),
	('The Home Fire', 190, 1),
	('Dream a Little Dream of Me', 190, 1),
	('Cold, Cold Heart', 186, 2),
	('Because of You', 188, 2),
	('Vie en Rose (Single)', 194, 2),
	('Ramona', 146, 2),
	('Мне сказали слово', 185, 3),
	('Холодные зимы', 78, 3),
	('Гроза', 206, 3),
	('Война', 138, 3),
	('Бонни и Клайд', 144, 4),
	('За стеной', 76, 4),
	('Моя любовь', 202, 4),
	('Life', 185, 5),
	('Зелёные волны', 206, 6),
	('Океан', 194, 6),
	('Сияй', 194, 6),
	('Two of Us', 201, 7),
	('Dig a Pony', 213, 7),
	('I Me Mine', 135, 7),
	('Ob-La-Di, Ob-La-Da', 185, 8),
	('Julia', 152, 8),
	('Good Night', 187, 8),
	('Черная Луна', 214, 9),
	('Ураган', 213, 10),
	('Моряк', 201, 10),
	('Серое небо', 190, 10),
	('Is This Love', 210, 11),
	('Jamming', 199, 11),
	('Zimbabwe', 203, 12);


insert into composition (title, release_date) values
	('Hits of the 90s', '2001-01-01'),
	('Music collection', '1998-04-05'),
	('Musical news', '2019-05-03'),
	('Rock hits', '2001-05-07');

insert into music (composition_id, track_id) values
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29), 
	(1, 13),
	(1, 14), 
	(1, 15),
	(2, 1), 
	(2, 2), 
	(2, 3), 
	(2, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(2, 23),
	(2, 24),
	(2, 30), 
	(2, 31),
	(3, 16),
	(3, 17),
	(3, 18), 
	(3, 19),
	(3, 32),
	(4, 9), 
	(4, 10),
	(4, 11),
	(4, 12),
	(4, 26),
	(4, 27),
	(4, 28);


insert into composition (title, release_date) values
	('Russian hits', '2019-05-01'),
	('Reggae', '2020-08-01');

insert into music (composition_id, track_id) values
	(5, 9),
	(5, 10),
	(5, 11),
	(5, 12),
	(6, 31),
	(6, 32);


insert into album (title, release_date) values
	('Vinyl #1', '2019-09-26'),
	('Вира и майна', '2020-12-11');

insert into track (title, duration, album_id) values
	('Призрак', 249, 14),
	('Джин', 241, 14),
	('Кофейня', 152, 14),
	('Beverly Hills', 203, 13),
	('Credo', 182, 13);
	
insert into recording (signer_id, album_id) values
	(2, 14),
	(3, 13);

insert into singing (signer_id, genres_id) values
	(4, 3),
	(5, 2);