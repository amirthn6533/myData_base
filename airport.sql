create database music_streaming_service;
use music_streaming_service;
create table users(
user_id int auto_increment primary key,
username varchar(255) not null,
email varchar(255) not null,
password varchar(255) not null,
subscription_type enum('Free','Premium') not null,
subscription_expiry_date date,
registration_date timestamp default current_timestamp,
unique(email)
);
create table Albums(
album_id int auto_increment primary key,
title varchar(255) not null,
artist_id int not null,
release_date date,
cover_image_url varchar(255),
foreign key (artist_id) references artists(artist_id)
);
create table songs(
song_id int auto_increment primary key,
title varchar(255) not null,
artist_id int not null,
album_id int not null,
genre varchar(100),
duration time,
release_date date,
file_path varchar(255),
foreign key(artist_id) references artists(artist_id),
foreign key(album_id) references Albums(album_id)
);
create table User_playlists(
playlist_id int auto_increment primary key,
user_id int not null,
playlist_name varchar(255) not null,
description text,
created_date timestamp default current_timestamp,
foreign key(user_id)references users(user_id)
);
create table playlist_songs(
playlist_id int not null,
song_id int not null,
position int not null,
primary key (playlist_id, song_id),
foreign key (playlist_id) references User_playlists(playlist_id),
foreign key (song_id) references songs(song_id)
);
create table playback_history(
playback_date timestamp default current_timestamp,
playback_duration time,
foreign key (user_id) references songs(song_id)
);
create table genres(
genre_id int auto_increment primary key,
genre_name varchar(100) not null unique
);
create table song_genres(
song_id int not null,
genre_id int not null,
primary key (song_id, genre_id),
foreign key(song_id) references songs(song_id),
foreign key(genre_id) references genres(genre_id)
);
create table favorites(
favorite_id int auto_increment primary key,
user_id int not null,
song_id int not null, added_date timestamp default current_timestamp,
foreign key (user_id) references users(user_id),
foreign key (song_id) references songs(song_id)
);
