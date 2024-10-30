CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE word_lists (
    list_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    list_name VARCHAR(100) NOT NULL
);

CREATE TABLE words (
    word_id SERIAL PRIMARY KEY,
    list_id INT REFERENCES word_lists(list_id) ON DELETE CASCADE,
    word VARCHAR(100) NOT NULL,
    translation VARCHAR(100) NOT NULL,
    example TEXT
);

CREATE TABLE user_progress (
    progress_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    word_id INT REFERENCES words(word_id) ON DELETE CASCADE,
    familiarity_score INT DEFAULT 0
);

INSERT INTO users (username, email, password_hash)
VALUES ('john_doe', 'john@example.com', 'hashed_password');

INSERT INTO word_lists (user_id, list_name)
VALUES (1, 'French Basics');

INSERT INTO words (list_id, word, translation, example)
VALUES 
    (1, 'Bonjour', 'Hello', 'Bonjour, comment ça va?'),
    (1, 'Merci', 'Thank you', 'Merci pour votre aide.');

INSERT INTO user_progress (user_id, word_id, familiarity_score)
VALUES (1, 1, 3);

