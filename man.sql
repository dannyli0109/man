create database man;
man# created

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(400),
  password_digest TEXT,
  name VARCHAR(400)
);

CREATE TABLE questions (
  id SERIAL4 PRIMARY KEY,
  question VARCHAR(400)
);

INSERT INTO questions(question) VALUES ('Within the last week, how often did you feel lonely?');

INSERT INTO questions(question) VALUES ('In what areas would you like to improve?');

INSERT INTO questions(question) VALUES ('In what areas are your interests?');




-- havent put in yet
CREATE TABLE answers (
  id SERIAL4 PRIMARY KEY,
  question_id INTEGER,
  answer VARCHAR(400)
);


INSERT INTO answers(question_id,answer) VALUES (1,'Not at all');
INSERT INTO answers(question_id,answer) VALUES (1,'Several Times');
INSERT INTO answers(question_id,answer) VALUES (1,'Every Day');

INSERT INTO answers(question_id,answer) VALUES (2,'Physical');
INSERT INTO answers(question_id,answer) VALUES (2,'Emotional');
INSERT INTO answers(question_id,answer) VALUES (2,'Mental');



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
INSERT INTO hobbies (hobby_type_id, user_id)
VALUES (1,1);



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
