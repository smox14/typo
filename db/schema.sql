CREATE DATABASE typo_db;
\c typo_db
 
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE accounts(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    unit TEXT,
    visibility TEXT,
    theme TEXT,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE average_speeds(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    wpm INTEGER,
    accuracy INTEGER,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE tests(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    paragraph_id INTEGER,
    wpm INTEGER,
    test_time timestamp DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(paragraph_id) REFERENCES paragraphs(id)
);

CREATE TABLE paragraphs(
    id SERIAL PRIMARY KEY,
    paragraph TEXT,
    attempts INTEGER,
    higest_score INTEGER, 
    avg_accuracy INTEGER
);


 