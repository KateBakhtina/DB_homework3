-- ЗАДАНИЕ 2

-- 2.1 Название и продолжительность самого длительного трека.

SELECT  title, duration 
  FROM  track t 
 WHERE  duration IN ( 
		SELECT  max(duration)
  		  FROM  track t);

-- 2.2 Название треков, продолжительность которых не менее 3,5 минут.

SELECT  title 
  FROM  track
 WHERE  duration >= 210;

-- 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.

SELECT  title, release_date
  FROM  composition c 
 WHERE  release_date BETWEEN '2018-01-01' AND '2020-12-31';

-- 2.4 Исполнители, чьё имя состоит из одного слова.

SELECT  *
  FROM  signer s 
 WHERE  nickname NOT LIKE '% %'; 

-- 2.5 Название треков, которые содержат слово «мой» или «my».

SELECT  track_id, title
  FROM  track t 
 WHERE  (title ILIKE '%моя%' OR title ILIKE '%me%')
        AND (title NOT LIKE '%me%' AND title NOT LIKE '%моя%');

-- ЗАДАНИЕ 3

-- 3.1 Количество исполнителей в каждом жанре.

   SELECT  g.genre_id, g.genre_name, count(s.signer_id) AS signers
     FROM  genre g 
LEFT JOIN  singing s ON  g.genre_id = s.genres_id 
    GROUP  BY g.genre_id, g.genre_name 
    ORDER  BY signers DESC;

-- 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.

   SELECT  a.album_id, a.title, a.release_date, count(track_id) as tracks
     FROM  album a 
LEFT JOIN  track t ON  a.album_id = t.album_id 
    WHERE  a.release_date BETWEEN '2019-01-01' AND '2020-12-31'
    GROUP  BY a.album_id, a.title, a.release_date;

-- 3.3 Средняя продолжительность треков по каждому альбому.
   
   SELECT  a.album_id, a.title, round(avg(t.duration), 1) 
     FROM  album a 
LEFT JOIN  track t ON  a.album_id = t.album_id 
    GROUP  BY a.album_id, a.title;
 
-- 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT  *
  FROM  signer s 
 WHERE  signer_id NOT IN (
        SELECT  r.signer_id 
          FROM  album a 
          JOIN  recording r ON  a.album_id = r.album_id 
         WHERE  release_date BETWEEN '2020-01-01' AND '2020-12-31');
  
-- 3.5 Названия сборников, в которых присутствует конкретный исполнитель
-- (выберите его сами).
  
SELECT  c.composition_id, c.title, s.nickname 
  FROM  composition c 
  JOIN  music m ON c.composition_id = m.composition_id
  JOIN  track t ON m.track_id = t.track_id 
  JOIN  recording r ON t.album_id = r.recording_id 
  JOIN  signer s ON r.signer_id = s.signer_id 
 WHERE  s.nickname = 'Сплин';


-- ЗАДАНИЕ 4

-- 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

SELECT  a.title  
  FROM  singing s 
  JOIN  genre g ON s.genres_id = g.genre_id 
  JOIN  signer s2 ON s.signer_id = s2.signer_id 
  JOIN  recording r ON s2.signer_id = r.signer_id 
  JOIN  album a ON r.album_id = a.album_id  
 GROUP  BY a.album_id 
HAVING  COUNT(DISTINCT g.genre_id) > 1; 

-- 4.2 Наименования треков, которые не входят в сборники.
       
   SELECT  t.track_id, t.title
     FROM  track t 
LEFT JOIN  music m ON  t.track_id = m.track_id 
    WHERE  m.composition_id IS NULL;

-- 4.3 Исполнитель или исполнители, написавшие самый короткий 
-- по продолжительности трек, — теоретически таких треков может быть несколько.

SELECT  s.nickname, t.duration   
  FROM  track t 
  JOIN  recording r ON t.album_id = r.album_id
  JOIN  signer s ON r.signer_id = s.signer_id 
 WHERE  t.duration IN (
        SELECT  MIN(duration)
          FROM  track t);
          
-- 4.4 Названия альбомов, содержащих наименьшее количество треков.
         
SELECT  a.title
  FROM  track t2 
  JOIN  album a ON t2.album_id = a.album_id 
 GROUP  BY a.album_id 
HAVING  COUNT(t2.track_id) IN (
        SELECT  COUNT(track_id)
          FROM  track t  
         GROUP  BY album_id 
         ORDER  BY COUNT(track_id)
         LIMIT  1);




 
