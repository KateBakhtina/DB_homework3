create table if not exists genre(
	genre_id   SERIAL      primary key,
	genre_name varchar(30) not null unique
);

create table if not exists signer(
	signer_id SERIAL       primary key,
	nickname  varchar(30)  not null unique
);

create table if not exists singing(
	singing_id SERIAL      primary key,
	signer_id  integer     not null references signer(signer_id),
	genres_id  integer     not null references genre(genre_id)
);

create table if not exists album(
	album_id     serial      primary key,
	title        varchar(50) not null unique,
	release_date date        check( release_date <= current_date )
);

create table if not exists recording(
	recording_id serial   primary key,
	signer_id    integer  not null references signer(signer_id),
	album_id     integer  not null references album(album_id)
);

create table if not exists track(
	track_id serial      primary key,
	title    varchar(50) not null,
	duration integer     check( duration <= 300 ),
	album_id integer     not null references album(album_id)
);

create table if not exists composition(
	composition_id serial      primary key,
	title          varchar(30) not null,
	release_date   date        check( release_date <= current_date )
	); 

create table if not exists music(
	music_id       serial  primary key,
	composition_id integer not null references composition(composition_id),
	track_id       integer not null references track(track_id)
);

