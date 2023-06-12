--1. soru

/*
CREATE TABLE IF NOT EXISTS employee (
	id INTEGER,
	name VARCHAR(50),
	birthday DATE,
	email VARCHAR(100)
);
*/

-- 2. soru

/*
insert into employee (id, name, email, birthday) values (1, 'Darsie Traher', 'dtraher0@unc.edu', '2022-11-17');
insert into employee (id, name, email, birthday) values (2, 'Antonina Messum', 'amessum1@upenn.edu', '2022-07-27');
insert into employee (id, name, email, birthday) values (3, 'Garry Bearman', 'gbearman2@nsw.gov.au', '2023-03-01');
insert into employee (id, name, email, birthday) values (4, 'Arlee Luton', 'aluton3@marriott.com', '2023-03-04');
insert into employee (id, name, email, birthday) values (5, 'Rasla Danilovic', 'rdanilovic4@storify.com', '2023-05-30');
insert into employee (id, name, email, birthday) values (6, 'Cesaro Larrad', 'clarrad5@indiegogo.com', '2023-01-05');
insert into employee (id, name, email, birthday) values (7, 'Wesley Backshill', 'wbackshill6@over-blog.com', '2023-01-09');
insert into employee (id, name, email, birthday) values (8, 'Alexandro Redington', 'aredington7@naver.com', '2023-01-02');
insert into employee (id, name, email, birthday) values (9, 'Nevsa Biggadike', 'nbiggadike8@fotki.com', '2022-08-07');
insert into employee (id, name, email, birthday) values (10, 'Terence Locard', 'tlocard9@1und1.de', '2023-01-09');
insert into employee (id, name, email, birthday) values (11, 'Thorpe Kaley', 'tkaleya@boston.com', '2022-10-08');
insert into employee (id, name, email, birthday) values (12, 'Inez Tritten', 'itrittenb@narod.ru', '2023-01-04');
insert into employee (id, name, email, birthday) values (13, 'Audrye Doige', 'adoigec@irs.gov', '2022-11-07');
insert into employee (id, name, email, birthday) values (14, 'Archaimbaud MacDonell', 'amacdonelld@icio.us', '2023-03-17');
insert into employee (id, name, email, birthday) values (15, 'Cortie Ayree', 'cayreee@twitter.com', '2023-04-15');
insert into employee (id, name, email, birthday) values (16, 'Raimund Dorney', 'rdorneyf@nydailynews.com', '2022-11-28');
insert into employee (id, name, email, birthday) values (17, 'Ruttger Sipson', 'rsipsong@wordpress.org', '2023-04-20');
insert into employee (id, name, email, birthday) values (18, 'Seamus Chaudrelle', 'schaudrelleh@state.gov', '2022-10-06');
insert into employee (id, name, email, birthday) values (19, 'Codie Vousden', 'cvousdeni@sciencedirect.com', '2022-08-22');
insert into employee (id, name, email, birthday) values (20, 'Sasha Tanzer', 'stanzerj@oakley.com', '2022-07-02');
insert into employee (id, name, email, birthday) values (21, 'Tobey Monro', 'tmonrok@bizjournals.com', '2022-08-18');
insert into employee (id, name, email, birthday) values (22, 'Riccardo Dawbery', 'rdawberyl@gravatar.com', '2022-12-20');
insert into employee (id, name, email, birthday) values (23, 'Selia Josovich', 'sjosovichm@miitbeian.gov.cn', '2022-11-21');
insert into employee (id, name, email, birthday) values (24, 'Barbaraanne Ende', 'benden@slashdot.org', '2022-07-02');
insert into employee (id, name, email, birthday) values (25, 'Quent Copnar', 'qcopnaro@seesaa.net', '2023-01-02');
insert into employee (id, name, email, birthday) values (26, 'Lennard Gulston', 'lgulstonp@alexa.com', '2022-08-13');
insert into employee (id, name, email, birthday) values (27, 'Yvon Brandham', 'ybrandhamq@meetup.com', '2023-05-27');
insert into employee (id, name, email, birthday) values (28, 'Tirrell Saddleton', 'tsaddletonr@wikipedia.org', '2023-03-08');
insert into employee (id, name, email, birthday) values (29, 'Bryn Fluck', 'bflucks@state.tx.us', '2022-07-06');
insert into employee (id, name, email, birthday) values (30, 'Papageno Lamb', 'plambt@csmonitor.com', '2022-07-01');
insert into employee (id, name, email, birthday) values (31, 'Mick Haggish', 'mhaggishu@cisco.com', '2023-02-20');
insert into employee (id, name, email, birthday) values (32, 'Dew Hammer', 'dhammerv@independent.co.uk', '2022-06-16');
insert into employee (id, name, email, birthday) values (33, 'Ulrika Wainman', 'uwainmanw@upenn.edu', '2023-03-11');
insert into employee (id, name, email, birthday) values (34, 'Aimil Hixley', 'ahixleyx@friendfeed.com', '2023-02-07');
insert into employee (id, name, email, birthday) values (35, 'Hoebart Pudding', 'hpuddingy@pbs.org', '2023-03-04');
insert into employee (id, name, email, birthday) values (36, 'Olva Malling', 'omallingz@about.me', '2023-06-05');
insert into employee (id, name, email, birthday) values (37, 'Hyatt Sergeaunt', 'hsergeaunt10@moonfruit.com', '2023-01-26');
insert into employee (id, name, email, birthday) values (38, 'Selle McCluney', 'smccluney11@cyberchimps.com', '2022-11-01');
insert into employee (id, name, email, birthday) values (39, 'Ardine Humphrys', 'ahumphrys12@ow.ly', '2022-07-20');
insert into employee (id, name, email, birthday) values (40, 'Nils Meadmore', 'nmeadmore13@quantcast.com', '2023-05-19');
insert into employee (id, name, email, birthday) values (41, 'Paolo Ertelt', 'pertelt14@elpais.com', '2022-08-06');
insert into employee (id, name, email, birthday) values (42, 'Tomas Luker', 'tluker15@mac.com', '2022-07-04');
insert into employee (id, name, email, birthday) values (43, 'Else Larratt', 'elarratt16@deliciousdays.com', '2022-08-31');
insert into employee (id, name, email, birthday) values (44, 'Hermione Blofeld', 'hblofeld17@unesco.org', '2022-11-23');
insert into employee (id, name, email, birthday) values (45, 'Laurie Matkovic', 'lmatkovic18@printfriendly.com', '2022-10-07');
insert into employee (id, name, email, birthday) values (46, 'Andreana Giamo', 'agiamo19@aol.com', '2023-05-11');
insert into employee (id, name, email, birthday) values (47, 'Alexandr Schanke', 'aschanke1a@cpanel.net', '2022-08-13');
insert into employee (id, name, email, birthday) values (48, 'Juditha Faragher', 'jfaragher1b@dyndns.org', '2022-12-26');
insert into employee (id, name, email, birthday) values (49, 'Eugenie Peddel', 'epeddel1c@timesonline.co.uk', '2023-05-27');
insert into employee (id, name, email, birthday) values (50, 'Annabel Crust', 'acrust1d@goo.ne.jp', '2022-11-02');
*/

--3. soru

/*
UPDATE employee SET name = 'John Doe', email = 'johndoe@cpanel.net', birthday = '1997-11-11' WHERE id = 1;
UPDATE employee SET name = 'Micheal B Jordan', email = 'micheal@cpanel.net', birthday = '1982-09-23' WHERE id = 2;
UPDATE employee SET name = 'Jane Doe', email = 'janedoe@cpanel.net', birthday = '1973-08-31' WHERE id = 3;
UPDATE employee SET name = 'İrem 2', email = 'irem2@cpanel.net', birthday = '1997-07-17' WHERE id = 4;
UPDATE employee SET name = 'İrem Cüneyt', email = 'iremc@cpanel.net', birthday = '2023-07-23' WHERE id = 5;
*/

--4. soru

/*
DELETE FROM employee WHERE id = 1;
DELETE FROM employee WHERE id = 2;
DELETE FROM employee WHERE id = 3;
DELETE FROM employee WHERE id = 4;
DELETE FROM employee WHERE id = 5;
*/

SELECT * FROM employee ORDER BY id;