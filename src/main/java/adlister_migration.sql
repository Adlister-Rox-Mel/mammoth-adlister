USE adlister_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255)
);


DROP TABLE IF EXISTS ads;

CREATE TABLE ads (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  title VARCHAR(255) NOT NULL,
  description TEXT
);

INSERT into users(username, password, email)
VALUES ('user1', '123', 'user1@gmail.com');

INSERT into ads(title, description, user_id)
    VALUES ('playstation for sale','This is a slightly used playstation', '1');
