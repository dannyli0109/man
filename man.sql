create database man;
man# created

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(400),
  password_digest TEXT,
  name VARCHAR(400)
);

CREATE TABLE hobby_types(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(400)
);

INSERT INTO hobby_types (name)
VALUES ('Sports');

INSERT INTO hobby_types (name)
VALUES ('Gaming');

INSERT INTO hobby_types (name)
VALUES ('Arts and Culture');

INSERT INTO hobby_types (name)
VALUES ('DIY');


CREATE TABLE hobbies(
  id SERIAL4 PRIMARY KEY,
  hobby_type_id INTEGER,
  user_id INTEGER
);

INSERT INTO hobbies (hobby_type_id, user_id)
VALUES (2,1);



CREATE TABLE meetups (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  name TEXT,
  type_id INTEGER,
  attendees TEXT
);

CREATE TABLE attendees (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  meetup_id INTEGER
);

CREATE TABLE meet_types (
  id SERIAL4 PRIMARY KEY,
  meetup_id INTEGER,
  name VARCHAR(400)
);
