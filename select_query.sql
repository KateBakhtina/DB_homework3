-- ЗАДАНИЕ 2

-- 2.1 Название и продолжительность самого длительного трека.

select  title, duration
  from  track 
 order  by duration desc
 limit  1;

-- 2.2 Название треков, продолжительность которых не менее 3,5 минут.

select  title 
  from  track
 where  uration >= 210;

-- 2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.

select  title, release_date
  from  composition c 
 where  release_date  between '2018-01-01' and '2020-12-31';

-- 2.4 Исполнители, чьё имя состоит из одного слова.

select  *
  from  signer s 
 where  nickname = split_part(nickname, ' ', 1); 

-- 2.5 Название треков, которые содержат слово «мой» или «my».

select  track_id, title
  from  track t 
 where  (title ilike '%моя%' 
        or title ilike '%me%') 
        and title not like '%me%';

-- ЗАДАНИЕ 3

-- 3.1 Количество исполнителей в каждом жанре.

   select  g.genre_id, g.genre_name, count(s.signer_id) as signers
     from  genre g 
left join  singing s 
       on  g.genre_id = s.genres_id 
    group  by g.genre_id, g.genre_name 
    order  by signers desc;

-- 3.2 Количество треков, вошедших в альбомы 2019–2020 годов.

   select  a.album_id, a.title, a.release_date, count(track_id) as tracks
     from  album a 
left join  track t 
       on  a.album_id = t.album_id 
    where  a.release_date between '2019-01-01' and '2020-12-31'
    group  by a.album_id, a.title, a.release_date;

-- 3.3 Средняя продолжительность треков по каждому альбому.
   
   select  a.album_id, a.title, round(avg(t.duration), 1) 
     from  album a 
left join  track t 
       on  a.album_id = t.album_id 
    group  by a.album_id, a.title;
 
-- 3.4 Все исполнители, которые не выпустили альбомы в 2020 году.

select  *
  from  signer s 
 where  signer_id not in (
        select  r.signer_id 
          from  album a 
          join  recording r
            on  a.album_id = r.album_id 
         where  release_date between '2020-01-01' and '2020-12-31');
  
-- 3.5 Названия сборников, в которых присутствует конкретный исполнитель
-- (выберите его сами).
  
select  c.composition_id, c.title, s.nickname 
  from  composition c 
  join  music m 
    on  c.composition_id = m.composition_id
  join  track t 
    on  m.track_id = t.track_id 
  join  recording r 
    on  t.album_id = r.recording_id 
  join  signer s 
    on  r.signer_id = s.signer_id 
 where  s.nickname = 'Сплин';


-- ЗАДАНИЕ 4

-- 4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.

select  a.album_id, a.title, r.signer_id  
  from  album a 
  join  recording r 
    on  a.album_id = r.album_id 
 where  r.signer_id in (
        select  signer_id
          from  singing s  
         group  by signer_id 
        having  count(genres_id) > 1
        );

-- 4.2 Наименования треков, которые не входят в сборники.
       
   select  t.track_id, t.title
     from  track t 
left join  music m 
       on  t.track_id = m.track_id 
    where  m.composition_id is null;

-- 4.3 Исполнитель или исполнители, написавшие самый короткий 
-- по продолжительности трек, — теоретически таких треков может быть несколько.
   
select  s.nickname, t.title as track, t.duration   
  from  track t 
  join  recording r 
    on  t.album_id = r.album_id
  join  signer s 
    on  r.signer_id = s.signer_id 
 order  by duration 
 limit  3
        
-- 4.4 Названия альбомов, содержащих наименьшее количество треков.
 
   select  a.title, count(track_id) as tracks 
     from  album a 
left join  track t 
       on  a.album_id = t.album_id 
    group  by a.album_id, a.title 
    order  by tracks
    limit  5
  


 
