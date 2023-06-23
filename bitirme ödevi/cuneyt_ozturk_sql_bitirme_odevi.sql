-- bütün tabloların oluşturulması varsa sil komutu ile sağlama yapıldı.
--yorun satırlarındaki numaralar Veri yapısı ve kısıtlama numarasını temsl etmektedir.

--categories tablosu oluştur
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    --1. id bilgilerine SERIAL PRIMARY KEY eklendi, FOREİGN KEY bağlantıları REFERENCES komutu ile sağlandı
    category_id INT PRIMARY KEY UNIQUE NOT NULL,
    --3. - 8. UNIQUE ve NOT NULL ile kısıtlama sağlandı
    name VARCHAR(50) UNIQUE NOT NULL,
    --2. a creation_date bilgisi eğer INSERT sorgusunda belirtilmez ise otomatik olarak verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir(TIMESTAMP DEFAULT CURRENT_TIMESTAMP).
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- users tablosu oluşturuldu 
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    --1. id bilgilerine SERIAL PRIMARY KEY eklendi, FOREİGN KEY bağlantıları REFERENCES komutu ile sağlandı
    user_id SERIAL PRIMARY KEY, 
    --3. - 8. UNIQUE ve NOT NULL ile kısıtlama sağlandı
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    --2. a creation_date bilgisi eğer INSERT sorgusunda belirtilmez ise otomatik olarak verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir(TIMESTAMP DEFAULT CURRENT_TIMESTAMP).
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--posts tablosu oluştur
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    --1. id bilgilerine SERIAL PRIMARY KEY eklendi, FOREİGN KEY bağlantıları REFERENCES komutu ile sağlandı
    post_id SERIAL PRIMARY KEY, 
    --6. - 7. - 10. NOT NULL ile bilgi zorunluluğu getirildi 
    user_id INT REFERENCES users(user_id) NOT NULL,
    --6. - 7. - 10. NOT NULL ile bilgi zorunluluğu getirildi 
    category_id INT REFERENCES categories(category_id) NOT NULL,
    --4.VARCHAR(50) Karakter sayısını sağladı, NOT NULL giriş zorunluluğunu sağladı
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    --5. DEFAULT 0 ile kayıt olmaması durumunda 0 başlangıç sayısı eklendi
    view_count INT DEFAULT 0 NOT NULL,
    --2. a creation_date bilgisi eğer INSERT sorgusunda belirtilmez ise otomatik olarak verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir(TIMESTAMP DEFAULT CURRENT_TIMESTAMP).
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_published BOOLEAN
);


DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    --1. id bilgilerine SERIAL PRIMARY KEY eklendi, FOREİGN KEY bağlantıları REFERENCES komutu ile sağlandı
    comment_id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(post_id),
    --11. comment için user_id kısmında not null demeyerek bu kısıtlama sağlandı
    user_id INT REFERENCES users(user_id),
    --6. - 7. - 10. NOT NULL ile bilgi zorunluluğu getirildi 
    comment TEXT NOT NULL,
    --2. a creation_date bilgisi eğer INSERT sorgusunda belirtilmez ise otomatik olarak verinin eklendiği andaki tarih ve zaman bilgisini eklemelidir(TIMESTAMP DEFAULT CURRENT_TIMESTAMP).
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_confirmed BOOLEAN
);

-- user verileri eklendi

insert into users (user_id, username, email, creation_date) values (1, 'rburnage0', 'edorney0@etsy.com', '2022-12-05');
insert into users (user_id, username, email, creation_date) values (2, 'vcankett1', 'eweinberg1@whitehouse.gov', '2023-04-08');

/* posts verileri eklendi
    post verilerinde 
        - content lorem ipsumdan mockaroo ile belirli karakterde alındı
        - title ise mockaroo'dan movie title'lardan random alındı
*/
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (1, 2, 1, 'Comedy|Drama|Romance', 'tiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 45, '2022-11-08', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (2, 2, 1, 'Crime|Drama', 'orbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien p', 8, '2022-06-20', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (3, 1, 1, 'Crime|Documentary', 'ed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tem', 18, '2023-02-04', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (4, 2, 3, 'Comedy|Drama|Musical|Romance', 'am dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at d', 36, '2023-06-13', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (5, 1, 3, 'Action|Adventure|Drama|Thriller', 'orbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasel', 39, '2023-02-03', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (6, 2, 1, 'Comedy|Drama|Romance', 'liquam non mauris.', 24, '2023-06-03', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (7, 2, 1, 'Drama|Romance|Western', 'orbi ut odio.', 19, '2023-03-17', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (8, 2, 1, 'Drama', 'ulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea', 27, '2022-11-17', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (9, 1, 3, 'Action|Crime', 'urabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 49, '2023-02-01', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (10, 2, 2, 'Horror|Thriller', 't tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit', 33, '2022-08-19', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (11, 2, 1, 'Comedy|Drama', 'uspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean ', 40, '2023-03-09', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (12, 1, 3, 'Documentary|Musical', 'onec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibu', 28, '2022-09-18', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (13, 2, 2, 'Drama', 'ed vel enim sit amet nunc viverra dapibus.', 17, '2022-09-27', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (14, 1, 1, 'Comedy|Documentary', 'am ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac null', 50, '2022-12-18', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (15, 1, 2, 'Comedy', 'orbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasel', 6, '2023-06-06', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (16, 1, 1, 'Crime|Thriller', 'uspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non m', 13, '2023-01-06', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (17, 2, 1, 'Comedy|Drama', 'ras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget ', 5, '2023-03-15', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (18, 2, 1, 'Comedy|Romance', 'n hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum jus', 50, '2023-03-02', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (19, 2, 3, 'Drama', 'estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus', 5, '2023-01-30', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (20, 1, 1, 'Action|Thriller', 'auris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi ', 27, '2022-08-28', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (21, 2, 3, 'Drama|Romance', 'am congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero qui', 14, '2022-12-28', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (22, 1, 2, 'Comedy|Crime', 'tiam pretium iaculis justo.', 15, '2022-10-10', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (23, 2, 2, 'Comedy|Drama', 'roin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 0, '2022-07-03', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (24, 2, 1, 'Drama', 'aecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condi', 29, '2022-09-29', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (25, 1, 1, 'Drama|Mystery', 'n sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lec', 5, '2022-07-08', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (26, 2, 2, 'Documentary', 'urabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidun', 19, '2022-08-01', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (27, 2, 1, 'Comedy|Crime|Mystery', 'uisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 45, '2022-07-05', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (28, 1, 1, 'Comedy', 'ulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis ', 14, '2023-03-10', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (29, 2, 3, 'Adventure|Children|Comedy|Musical', 'am congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero qui', 24, '2023-06-04', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (30, 2, 1, 'Action|Crime|Thriller', 'auris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobor', 4, '2022-08-16', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (31, 2, 3, 'Drama', 'onec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in', 6, '2022-08-06', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (32, 1, 3, 'Comedy', 'orbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 27, '2022-12-22', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (33, 2, 2, 'Drama', 'uis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac ', 50, '2023-01-14', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (34, 1, 2, 'Action|Thriller', 'roin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis', 15, '2023-05-30', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (35, 2, 2, 'Documentary', 'estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetr', 24, '2022-10-16', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (36, 1, 2, 'Comedy|Crime', 'auris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis ', 11, '2023-01-03', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (37, 1, 3, 'Horror', 'tiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nu', 24, '2023-05-11', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (38, 1, 3, 'Drama', 'ullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Mor', 17, '2022-07-06', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (39, 1, 1, 'Horror', 't at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vita', 38, '2022-09-16', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (40, 2, 1, 'Drama|Musical|Romance', 'ulla tellus. In sagittis dui vel nisl.', 47, '2023-01-28', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (41, 2, 3, 'Drama', 'ivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euism', 8, '2022-12-03', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (42, 2, 2, 'Drama|Musical|Romance', 'n est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', 31, '2022-11-20', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (43, 1, 2, 'Comedy|Crime|Drama|Romance', 'ivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euism', 36, '2022-12-07', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (44, 2, 1, 'Comedy|Drama', 'unc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede jus', 33, '2023-06-12', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (45, 2, 2, 'Action|Comedy|Sci-Fi', 'onec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit ', 28, '2022-10-17', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (46, 2, 1, 'Documentary', 'aecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitu', 15, '2023-02-16', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (47, 1, 2, 'Action|Sci-Fi', 'ullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Mor', 40, '2022-12-23', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (48, 1, 3, 'Documentary|War', 'uisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 6, '2022-10-03', false);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (49, 2, 2, 'Thriller', 'hasellus in felis.', 5, '2022-08-08', true);
insert into posts (post_id, user_id, category_id, title, content, view_count, creation_date, is_published) values (50, 2, 3, 'Documentary', 'auris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, di', 29, '2023-01-01', true);

/* categories verileri eklendi
    categories verilerinde 
        - isimler first name'den random alındı
*/

insert into categories (category_id, name, creation_date) values (1, 'Fielding', '2022-01-01');
insert into categories (category_id, name, creation_date) values (2, 'Irving', '2023-04-11');
insert into categories (category_id, name, creation_date) values (3, 'Farah', '2023-11-30');

/* comments verileri eklendi
    comments verilerinde
        - comment'ler sentences ile belirli karakter sayısında lorem ipsum'dan alındı
*/ 

insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (1, 14, 1, 'roin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vest', '2022-07-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (2, 16, 1, 'am dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at d', '2022-11-14', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (3, 42, 2, 'orbi vel lectus in quam fringilla rhoncus.', '2023-05-10', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (4, 33, 2, 'aecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condi', '2023-05-09', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (5, 50, 2, 'urabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vi', '2022-11-10', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (6, 48, 1, 'onec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum ', '2022-10-06', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (7, 43, 1, 'tiam pretium iaculis justo. In hac habitasse platea dictumst.', '2023-03-20', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (8, 46, 2, 'estibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacin', '2022-06-17', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (9, 21, 1, 'liquam erat volutpat. In congue. Etiam justo.', '2022-10-23', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (10, 43, 2, 'nteger non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum a', '2023-03-26', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (11, 24, 1, 'tiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl', '2023-01-28', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (12, 19, 2, 'ullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at', '2023-02-17', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (13, 41, 1, 'orem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesq', '2022-10-25', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (14, 18, 1, 'orbi a ipsum.', '2023-05-12', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (15, 44, 2, 'n eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincid', '2023-05-11', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (16, 16, 1, 'estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetr', '2022-08-27', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (17, 35, 1, 'um sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue', '2023-06-06', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (18, 37, 2, 'unc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis l', '2023-02-05', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (19, 29, 1, 'ed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mat', '2022-06-22', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (20, 30, 1, 'raesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, male', '2022-12-06', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (21, 10, 1, 'ed accumsan felis. Ut at dolor quis odio consequat varius.', '2023-06-06', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (22, 47, 1, 'liquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante v', '2022-11-17', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (23, 6, 1, 'raesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '2023-05-17', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (24, 26, 1, 'uspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non m', '2022-08-17', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (25, 30, 2, 'orem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesq', '2023-02-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (26, 38, 1, 'estibulum quam sapien, varius ut, blandit non, interdum in, ante.', '2022-08-21', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (27, 16, 2, 'estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetr', '2023-03-22', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (28, 36, 2, 'n tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec', '2022-12-06', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (29, 6, 1, 'estibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien ur', '2022-10-04', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (30, 33, 1, 'urabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus ', '2022-07-28', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (31, 15, 2, 'nteger non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.', '2023-06-02', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (32, 25, 1, 'unc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis l', '2023-05-30', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (33, 39, 2, 'liquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante v', '2023-05-12', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (34, 31, 1, 'liquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci ', '2022-09-08', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (35, 9, 1, 'orbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrice', '2023-01-26', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (36, 36, 1, 'liquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante v', '2022-11-13', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (37, 40, 1, 'ras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes', '2023-06-04', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (38, 36, 2, 'ivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, v', '2022-07-10', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (39, 23, 2, 'nteger pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. ', '2023-01-27', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (40, 7, 1, 'hasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in', '2022-10-13', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (41, 33, 1, 'urabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidun', '2023-04-12', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (42, 39, 2, 'ullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lect', '2022-09-06', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (43, 41, 1, 'ellentesque eget nunc.', '2022-08-14', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (44, 13, 1, 'uspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa qui', '2023-03-10', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (45, 32, 1, 'enean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in l', '2023-02-13', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (46, 12, 2, 'enean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in l', '2022-06-27', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (47, 4, 2, 'unc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis l', '2023-05-07', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (48, 3, 2, 'n hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum jus', '2023-02-19', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (49, 10, 2, 'tiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urn', '2022-06-22', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (50, 11, 2, 'tiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl', '2022-11-07', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (51, 30, 1, 'estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverr', '2023-01-12', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (52, 39, 2, 'orbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagi', '2022-07-31', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (53, 28, 1, 'ed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tel', '2023-04-11', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (54, 15, 1, 'ullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lect', '2022-12-22', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (55, 29, 1, 'roin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', '2023-01-24', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (56, 13, 1, 'ellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla ', '2022-09-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (57, 10, 2, 'ellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa ', '2022-11-18', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (58, 13, 1, 'uisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam', '2023-03-17', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (59, 27, 2, 'enean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, el', '2023-04-13', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (60, 16, 2, 'nteger aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu', '2022-08-29', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (61, 15, 2, 'ras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget ', '2022-08-22', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (62, 2, 2, 'orbi vel lectus in quam fringilla rhoncus.', '2023-03-15', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (63, 36, 2, 'ivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, v', '2022-08-27', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (64, 49, 2, 'tiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl', '2022-06-29', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (65, 36, 1, 'aecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2022-06-21', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (66, 18, 1, 'orbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien p', '2023-03-21', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (67, 42, 1, 'uspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean ', '2022-08-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (68, 20, 1, 'enean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in l', '2023-02-19', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (69, 41, 2, 'raesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante i', '2022-10-02', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (70, 23, 2, 'auris sit amet eros.', '2022-09-18', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (71, 38, 1, 'tiam pretium iaculis justo. In hac habitasse platea dictumst.', '2022-10-08', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (72, 37, 2, 'ulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus', '2022-10-09', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (73, 8, 1, 'n hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulp', '2023-03-02', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (74, 5, 1, 'n eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincid', '2023-01-19', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (75, 34, 1, 'nteger aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu', '2022-10-26', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (76, 33, 2, 'n blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2022-06-26', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (77, 48, 1, 'raesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morb', '2023-04-06', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (78, 15, 1, 'aecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitu', '2022-07-28', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (79, 9, 1, 'tiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nu', '2022-07-26', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (80, 26, 1, 'orbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus', '2022-11-06', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (81, 29, 2, 'usce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2023-02-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (82, 8, 1, 'n hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molesti', '2022-09-13', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (83, 19, 1, 'ed sagittis.', '2023-05-07', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (84, 18, 2, 'raesent lectus.', '2022-07-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (85, 50, 1, 'aecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitu', '2022-06-17', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (86, 8, 2, 'ed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tem', '2022-12-18', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (87, 40, 1, 'orbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien p', '2022-12-08', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (88, 39, 2, 'enean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ', '2022-10-17', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (89, 15, 1, 'n eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincid', '2022-11-13', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (90, 14, 1, 'nteger a nibh. In quis justo.', '2023-05-22', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (91, 5, 1, 'n sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lec', '2022-10-12', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (92, 15, 2, 'nteger tincidunt ante vel ipsum. Praesent blandit lacinia erat.', '2023-05-04', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (93, 3, 1, 'nteger pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. ', '2023-03-31', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (94, 41, 1, 'um sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibu', '2022-09-13', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (95, 15, 1, 'ulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi v', '2022-06-28', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (96, 16, 2, 'ullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '2022-12-31', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (97, 48, 2, 'um sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue', '2023-03-16', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (98, 8, 1, 'uspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fu', '2023-05-01', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (99, 27, 2, 'am congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero qui', '2022-12-13', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (100, 31, 1, 'am ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac null', '2022-07-12', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (101, 37, 2, 'estibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacini', '2023-05-29', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (102, 42, 1, 'orbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie ', '2023-06-14', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (103, 19, 1, 'orbi non lectus.', '2023-02-04', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (104, 30, 1, 'ullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lect', '2022-08-04', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (105, 29, 1, 'ellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus ', '2022-12-08', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (106, 49, 1, 'unc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede jus', '2023-05-16', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (107, 5, 1, 'ed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend p', '2022-11-14', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (108, 18, 1, 'usce consequat.', '2022-12-18', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (109, 2, 1, 'aecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitu', '2022-07-19', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (110, 40, 2, 'uis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id p', '2023-03-30', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (111, 40, 1, 'ed sagittis.', '2022-09-20', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (112, 19, 1, 'ullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Mor', '2023-06-14', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (113, 43, 2, 'nteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo', '2022-06-24', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (114, 36, 2, 'ulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in portti', '2023-02-06', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (115, 21, 2, 'aecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam', '2022-10-03', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (116, 49, 1, 'estibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacin', '2022-07-11', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (117, 9, 1, 'am nulla.', '2022-11-19', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (118, 36, 2, 'estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus', '2022-09-01', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (119, 23, 2, 'onec posuere metus vitae ipsum.', '2022-10-25', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (120, 7, 2, 'am nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem ', '2023-03-11', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (121, 5, 2, 'estibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien ur', '2023-04-23', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (122, 8, 2, 'liquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tinc', '2023-02-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (123, 42, 2, 'roin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputa', '2022-12-01', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (124, 32, 1, 'roin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis', '2022-07-04', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (125, 45, 2, 'estibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien ur', '2023-04-22', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (126, 26, 2, 'orbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie ', '2022-11-15', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (127, 14, 2, 'ed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend p', '2022-08-30', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (128, 22, 2, 'enean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, el', '2022-09-06', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (129, 48, 2, 'onec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum ', '2022-12-02', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (130, 14, 2, 'ed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend p', '2023-02-06', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (131, 24, 2, 'estibulum ac est lacinia nisi venenatis tristique.', '2022-10-04', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (132, 37, 2, 'ras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes', '2022-11-15', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (133, 26, 1, 'orbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, trist', '2022-07-21', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (134, 23, 1, 'orem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesq', '2022-10-20', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (135, 10, 1, 'roin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', '2022-08-23', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (136, 48, 2, 'am dui.', '2023-04-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (137, 31, 2, 'nteger a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices al', '2023-06-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (138, 19, 1, 'uspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean ', '2022-11-07', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (139, 28, 1, 'unc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede jus', '2022-10-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (140, 14, 1, 'orbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien p', '2023-06-06', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (141, 43, 1, 'n hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum jus', '2023-05-08', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (142, 15, 1, 'ulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus', '2022-09-20', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (143, 28, 1, 'orbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien p', '2023-05-17', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (144, 39, 2, 'ulla nisl. Nunc nisl.', '2023-01-31', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (145, 15, 1, 'uisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', '2022-12-02', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (146, 7, 1, 'ellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus ', '2023-05-01', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (147, 22, 1, 'orbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lac', '2022-07-11', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (148, 39, 1, 'orbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien p', '2023-05-28', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (149, 11, 2, 'liquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tinc', '2022-10-05', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (150, 41, 2, 'hasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, ', '2023-05-16', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (151, 45, 2, 'n blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum ma', '2023-03-09', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (152, 37, 1, 'enean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, el', '2022-12-22', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (153, 48, 2, 'uspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2023-05-20', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (154, 32, 2, 'n hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molesti', '2022-10-25', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (155, 20, 1, 'raesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morb', '2022-09-09', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (156, 31, 1, 'ras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes', '2022-06-19', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (157, 30, 2, 'orem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '2022-08-21', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (158, 8, 2, 'uisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc', '2022-09-24', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (159, 43, 2, 'uisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc', '2023-01-30', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (160, 42, 1, 'ullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vu', '2022-12-31', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (161, 4, 2, 'ullam molestie nibh in lectus. Pellentesque at nulla.', '2022-11-28', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (162, 20, 2, 'usce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. ', '2022-08-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (163, 35, 1, 'uspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non m', '2022-09-29', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (164, 31, 1, 'onec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum ', '2023-03-27', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (165, 11, 1, 'aecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2022-07-04', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (166, 37, 2, 'estibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in fa', '2023-03-10', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (167, 27, 2, 'estibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacini', '2022-07-14', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (168, 8, 2, 'ivamus vestibulum sagittis sapien.', '2023-01-04', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (169, 42, 2, 'raesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante i', '2023-02-27', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (170, 4, 1, 'onec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna', '2023-03-08', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (171, 19, 1, 'ulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', '2022-08-19', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (172, 43, 2, 'ulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi v', '2022-11-18', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (173, 36, 2, 'n est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.', '2023-03-26', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (174, 2, 2, 'ed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mat', '2023-04-14', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (175, 36, 2, 'ed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mat', '2023-04-24', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (176, 7, 2, 'raesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante i', '2022-12-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (177, 4, 2, 'roin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, ', '2022-06-29', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (178, 38, 2, 'ed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tel', '2022-12-02', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (179, 10, 1, 'orbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nu', '2023-04-22', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (180, 48, 1, 'uspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', '2022-09-28', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (181, 47, 2, 'liquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci ', '2022-11-28', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (182, 19, 2, 'unc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede jus', '2023-05-21', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (183, 23, 2, 'aecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cur', '2022-06-27', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (184, 44, 2, 'urabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', '2022-07-03', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (185, 9, 2, 'am nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem ', '2023-04-14', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (186, 12, 1, 'uisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam', '2023-06-07', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (187, 41, 2, 'ulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2022-09-29', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (188, 46, 2, 'ivamus in felis eu sapien cursus vestibulum. Proin eu mi.', '2022-08-19', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (189, 12, 2, 'aecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta ', '2022-07-18', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (190, 11, 1, 'roin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis', '2022-08-30', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (191, 8, 1, 'unc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, ', '2022-12-23', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (192, 1, 2, 't tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit', '2023-05-14', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (193, 13, 2, 'tiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urn', '2022-11-24', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (194, 49, 1, 'usce consequat. Nulla nisl. Nunc nisl.', '2023-04-25', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (195, 36, 1, 'usce consequat.', '2022-11-29', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (196, 33, 1, 'ivamus in felis eu sapien cursus vestibulum.', '2023-04-20', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (197, 32, 1, 'ulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2022-10-03', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (198, 35, 2, 'unc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis l', '2022-07-13', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (199, 26, 2, 'nteger a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', '2022-09-26', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (200, 15, 1, 'ras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget ', '2023-05-11', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (201, 33, 2, 'n est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', '2022-09-19', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (202, 43, 1, 'ulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse acc', '2022-09-02', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (203, 1, 2, 'ullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lect', '2022-11-10', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (204, 31, 2, 'ellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa ', '2023-04-20', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (205, 46, 2, 'ivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor conval', '2022-08-03', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (206, 21, 1, 'ulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus', '2022-08-03', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (207, 38, 1, 'auris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, di', '2022-10-23', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (208, 25, 2, 'unc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, ', '2022-10-02', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (209, 31, 1, 'onec dapibus. Duis at velit eu est congue elementum.', '2022-08-21', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (210, 25, 1, 'hasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, ', '2023-03-16', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (211, 22, 2, 'ras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem i', '2023-05-09', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (212, 47, 1, 'n eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincid', '2023-01-04', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (213, 16, 2, 'am congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero qui', '2023-05-25', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (214, 44, 2, 'ivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nas', '2023-05-05', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (215, 14, 1, 'am nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem ', '2022-09-29', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (216, 5, 1, 'roin risus. Praesent lectus.', '2022-08-28', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (217, 36, 2, 'estibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus', '2023-05-04', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (218, 25, 1, 'am ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac null', '2022-12-29', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (219, 7, 2, 'aecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitu', '2022-08-20', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (220, 40, 2, 'ivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nas', '2022-07-27', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (221, 36, 1, 'onec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venen', '2022-12-20', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (222, 27, 1, 'uspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa qui', '2023-01-31', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (223, 16, 1, 'uspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fu', '2023-04-09', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (224, 1, 2, 'liquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea d', '2022-07-24', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (225, 50, 2, 'roin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis', '2022-09-12', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (226, 25, 1, 'uspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fu', '2023-06-05', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (227, 11, 2, 'aecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', '2022-08-01', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (228, 4, 1, 'uisque ut erat.', '2022-11-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (229, 32, 2, 'ellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus ', '2023-04-27', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (230, 12, 1, 'liquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante v', '2023-04-13', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (231, 28, 2, 'orbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien p', '2022-12-08', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (232, 15, 2, 'n hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molesti', '2023-01-10', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (233, 6, 1, 'ellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2022-08-19', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (234, 23, 2, 'raesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam n', '2023-02-05', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (235, 32, 1, 'uspendisse accumsan tortor quis turpis.', '2023-02-11', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (236, 44, 1, 'enean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, el', '2023-02-24', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (237, 13, 2, 'roin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vest', '2022-12-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (238, 37, 2, 'n blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum ma', '2023-05-11', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (239, 21, 1, 'um sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue', '2022-10-16', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (240, 42, 1, 'liquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci ', '2022-11-27', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (241, 39, 1, 'ulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis ', '2023-02-22', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (242, 30, 2, 'ivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellente', '2023-06-13', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (243, 48, 1, 'urabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', '2023-04-01', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (244, 48, 2, 'ras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes', '2022-11-16', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (245, 33, 2, 'roin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', '2023-03-30', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (246, 7, 1, 'ras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes', '2022-11-13', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (247, 44, 2, 'ivamus vel nulla eget eros elementum pellentesque.', '2022-11-11', true);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (248, 21, 1, 'enean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, ju', '2022-07-25', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (249, 17, 1, 'uis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id p', '2022-10-24', false);
insert into comment (comment_id, post_id, user_id, comment, creation_date, is_confirmed) values (250, 3, 1, 'urabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vi', '2022-09-03', true);


-- Veri Tabanında gerçekleştirmek istediğimiz işlemler

--1.sorgu Tüm blog yazılarını başlıkları, yazarları ve kategorileriyle birlikte getirin.

SELECT posts.content, posts.title, users.username, categories.name FROM posts 
    -- user_id üzerinden birleştirme posts ve users bilrşetirmesi
    JOIN users ON posts.user_id = users.user_id 
        -- category id üzerinden birleştirilmiş tablo ile categories tablosu birleştirildi
        JOIN categories ON posts.category_id = categories.category_id;

--2.sorgu En son yayınlanan 5 blog yazısını başlıkları, yazarları ve yayın tarihleriyle birlikte
alın

SELECT posts.title, users.username, posts.creation_date FROM posts 
    JOIN users ON users.user_id = posts.user_id
    -- tarih alçalarak sıralanarak son yayınlanan seçildi
        ORDER BY posts.creation_date
    -- limit 5 ile 5 tanesi gösterildi
            LIMIT 5;

--3.sorgu Her blog yazısı için yorum sayısını gösterin.

SELECT posts.post_id, COUNT(comments.comment) FROM comments
    -- her bir yorum gönderi ile birleştirildi
    JOIN posts ON posts.post_id = comments.post_id 
        -- her bir post_id için gruplama yapıldı
        GROUP BY posts.post_id;

--4.sorgu Tüm kayıtlı kullanıcıların kullanıcı adlarını ve e-posta adreslerini gösterin
--               bu soru için teşekkürler    <3            --

SELECT username, email FROM users;

--5.sorgu En son 10 yorumu, ilgili gönderi başlıklarıyla birlikte alın

SELECT title, content FROM posts 
    -- tarihe göre alçalarak sıralanarak son yorumlar başa getirildi
    ORDER BY creation_date DESC 
        --10 tane gösterim ile limitlendi
        LIMIT 10;

--6.sorgu Belirli bir kullanıcı tarafından yazılan tüm blog yazılarını bulun
SELECT users.user_id, users.username, COUNT(posts.post_id) AS total_posts
    FROM users JOIN posts ON users.user_id = posts.user_id
        --belirli kullanıcı random user_id ile seçildi
        WHERE users.user_id = 1
            GROUP BY users.user_id, users.username;

--7.sorgu Her kullanıcının yazdığı toplam gönderi sayısını alın

--her bir kullanıcı (username) ve her bir gönderi sayısı (COUNT(content))
SELECT users.username, COUNT(posts.content) FROM users
    JOIN posts ON posts.user_id = users.user_id
        --username birleştirmesi yapıldı
        GROUP BY username;

-- 8.sorgu Her kategoriyi, kategorideki gönderi sayısıyla birlikte gösterin

SELECT categories.name, COUNT(posts.content) FROM categories 
    JOIN posts ON posts.category_id = categories.category_id 
        --birden fazla kategori adı gruplandı  
        GROUP BY categories.name;

-- 9.sorgu Gönderi sayısına göre en popüler kategoriyi bulun.

SELECT category_id, COUNT(*) FROM posts 
    --birden fazla aktegori id'si birleştirildi
    GROUP BY category_id 
        -- sayılmış satır sayısına göre alçalarak sıralandı
        ORDER BY COUNT(*) DESC 
            -- en fazla gönderi almış kategori üstte bırakıldı.
            LIMIT 1;

-- 10.sorgu . Gönderilerindeki toplam görüntülenme sayısına göre en popüler kategoriyi bulun

SELECT categories.category_id, SUM(posts.view_count) FROM posts 
    JOIN categories ON categories.category_id = posts.category_id 
        --görüntülenme sayısına göre sıralandı
        ORDER BY posts.view_count DESC 
            -- en fazla gönderi almış kategori üstte bırakıldı.
            LIMIT 1;

-- 11.sorgu En fazla yoruma sahip gönderiyi alın

SELECT COUNT(posts.post_id), comments.comment FROM comments 
    JOIN posts ON posts.post_id = comments.post_id 
        GROUP BY comment 
            -- birden fazla post id gruplandı
            ORDER BY COUNT(posts.post_id) DESC
                -- en fazla yorum almış gönderi üstte bırakıldı.
                LIMIT 1; ;

--12. sorgu Belirli bir gönderinin yazarının kullanıcı adını ve e-posta adresini gösterin

SELECT users.username, users.email, posts.content FROM posts
    JOIN users ON users.user_id = posts.user_id 
        --post_id üzerinden random seçim yapıldı
        WHERE posts.post_id = 12;

--13. sorgu Başlık veya içeriklerinde belirli bir anahtar kelime bulunan tüm gönderileri bulun

SELECT * FROM posts 
    WHERE 
    title ILIKE '%drama%' 
	    OR 
            content ILIKE '%drama%';

--14.sorgu Belirli bir kullanıcının en son yorumunu gösterin

SELECT users.username, comments.comment, comments.creation_date FROM comments
    JOIN users ON users.user_id = comments.user_id 
        --user_id üzerinden random seçim yapıldı
        WHERE users.user_id = 1
            ORDER BY comments.creation_date DESC
                LIMIT 1;

--15. sorgu Gönderi başına ortalama yorum sayısını bulun

--Ortalama seçildi
SELECT ROUND(AVG(total_comments)) AS average_comments_per_post
--ortalama'nın seçileceği subquery oluşturuldu
FROM (
    --comment_id üzerinden sayım gerçekleştirildi
    SELECT posts.post_id, COUNT(comments.comment_id) AS total_comments
        FROM posts
            JOIN comments ON posts.post_id = comments.post_id
                --post_id üzerinden gruplama yapıdlı
                GROUP BY posts.post_id
) AS avgComments;
-- Son satırda yeni quer için bir isim verilmediği takdirde hata verdiği tespit edildi nedeni tam anlışalamadı, saygılar

--16. sorgu Son 30 günde yayınlanan gönderileri gösterin

SELECT * FROM posts 
    -- son 30 gün koşulu yazıldı
    WHERE creation_date > '2023-05-16';

--17.sorgu Belirli bir kullanıcının yaptığı yorumları alın

SELECT users.username AS user, 
            comments.comment, 
                comments.comment_id 
FROM users 
    JOIN comments ON comments.user_id = users.user_id 
    --kullanıcı random id numarası ile seçildi
WHERE users.user_id = 1;

--18. sorgu Belirli bir kategoriye ait tüm gönderileri bulun.

SELECT categories.name AS category, 
            posts.content, 
                posts.category_id 
FROM categories 
    JOIN posts ON posts.category_id = categories.category_id
    --kategori random id numarası ile seçildi
WHERE categories.category_id = 3;

--19. sorgu 5'ten az yazıya sahip kategorileri bulun

-- 1. cevap senaryosu: (nişanlımdan destek aldım)
    -- with ile bir subquery zinciri oluşturabileceğimi öğrendim
With temp AS
--subquery bir için temp adını verdim ve subquery'de kategorideki gönderi sayılarını buldum
(SELECT categories.name AS name, COUNT(*) AS num FROM posts 
JOIN categories ON categories.category_id = posts.category_id
GROUP BY name)
--temp subquerysindeki sayının 5'ten az olduğu durumları çektim
SELECT * from temp
where num < 5;

--2. cevap senaryosu: kendim yaptım aynı senaryonun farklı syntax'lisi
SELECT * FROM (SELECT categories.name AS name, COUNT(*) AS num FROM posts 
JOIN categories ON categories.category_id = posts.category_id
GROUP BY name) AS temp WHERE num > 5 ;

--not bu sorguda benim sayılarımla sonuç gelmiyor çünkü 5'ten az gönderiye sahip bir kategorim yok.

--20. sorgu Hem bir yazı hem de bir yoruma sahip olan kullanıcıları gösterin.

SELECT posts.user_id, comments.user_id, users.username FROM posts 
    JOIN comments ON posts.user_id = comments.user_id
        JOIN users ON users.user_id = posts.user_id
            -- gönderi kalabalığı olmaması açısından gruplama yapıldı
            GROUP BY posts.user_id, comments.user_id, users.username;

--21. sorgu En az 2 farklı yazıya yorum yapmış kullanıcıları alın.

--comments.post_id kısmında benzersiz sayısı alınır
SELECT users.username, 
    COUNT(DISTINCT comments.post_id)
FROM users 
JOIN comments ON users.user_id = comments.user_id
GROUP BY users.user_id, users.username
        HAVING COUNT(DISTINCT comments.post_id) >= 2;

--22. sorgu En az 3 yazıya sahip kategorileri görüntüleyin

--sayıyı oluşturulan subquery'den alıp bu sayının 3'ten fazla olduğu durumlar bulunur
SELECT * FROM (
	SELECT categories.name, categories.category_id, COUNT(*) AS num FROM posts 
	JOIN categories ON categories.category_id = posts.category_id 
	GROUP BY categories.category_id) AS temp
        WHERE num > 3;

--23. sorgu 5'ten fazla blog yazısı yazan yazarları bulun

--sayıyı oluşturulan subquery'den alıp bu sayının 5'ten fazla olduğu durumlar bulunur
SELECT * FROM (
	SELECT users.user_id, users.username, 
		COUNT(*) AS num 
	FROM posts 
	JOIN users ON users.user_id = posts.user_id GROUP BY users.user_id) AS temp
WHERE num > 5;

--24 sorgu  Bir blog yazısı yazmış veya bir yorum yapmış kullanıcıların e-posta adreslerini görüntüleyin. (UNION kullanarak)

SELECT users.email FROM posts
JOIN users ON users.user_id = posts.user_id

UNION

SELECT users.email FROM comments
JOIN users ON users.user_id = comments.user_id;

--25. sorgu Bir blog yazısı yazmış ancak hiç yorum yapmamış yazarları bulun. (bu durum benim verilerimle uyuşmadığı için sonuç boş çıkıyor, çünkü sonuç boş :D )

SELECT users.username
FROM users
JOIN posts ON users.user_id = posts.user_id
JOIN comments ON posts.post_id = comments.post_id
WHERE comments.comment_id IS NULL;

