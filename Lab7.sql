1.Таблиця статтей:
CREATE TABLE articles (
    article_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id));

2.Таблиця категорій:
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE);

3.Таблиця коментарів:
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    comment_text TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (article_id) REFERENCES articles(article_id));

4.Таблиця оцінок:
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    UNIQUE (article_id, ip_address),
    FOREIGN KEY (article_id) REFERENCES articles(article_id));


SQL-запити:

Додавання статті:
INSERT INTO articles (category_id, title, content)
VALUES (1, 'Заголовок новини', 'Текст новини про політику');

Додавання нової категорії:
INSERT INTO categories (category_name)
VALUES ('Політика'), ('Технології'), ('Спорт');

Вибірка статей з категорією:
SELECT a.article_id, a.title, a.content, c.category_name
FROM articles a
JOIN categories c ON a.category_id = c.category_id;

Додавання коментаря:
INSERT INTO comments (article_id, user_name, comment_text)
VALUES (1, 'Користувач', 'Дуже цікава новина!');

Додавання оцінки:
INSERT INTO ratings (article_id, ip_address, rating)
VALUES (1, '192.168.0.1', 5);

Оновлення оцінки:
UPDATE ratings
SET rating = 4
WHERE article_id = 1 AND ip_address = '192.168.0.1';

Вибірка середнього рейтингу для статті:
SELECT article_id, AVG(rating) AS average_rating
FROM ratings
WHERE article_id = 1
GROUP BY article_id;


