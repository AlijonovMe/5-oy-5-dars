-- 1

CREATE TABLE IF NOT EXISTS authors (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	bio TEXT,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM authors;

-- 2

CREATE TABLE IF NOT EXISTS books (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	title VARCHAR(100) NOT NULL,
	summary TEXT,
	published_date DATE,
	metadata JSON,
	update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM books;

-- 3

CREATE TABLE IF NOT EXISTS publishers (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name VARCHAR(100) NOT NULL,
	country CHAR(2) NOT NULL,
	founded_year INTEGER,
	details JSON,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM publishers;

-- 4

CREATE TABLE IF NOT EXISTS libraries (
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name VARCHAR(100) NOT NULL,
	location TEXT NOT NULL,
	open_time TIME,
	close_time TIME,
	facilities JSON,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM libraries;

-- 5

-- 5.1

CREATE TABLE IF NOT EXISTS author_book (
	author_id UUID REFERENCES authors(id),
	book_id UUID REFERENCES books(id)
);

SELECT * FROM author_book;

-- 5.2

CREATE TABLE IF NOT EXISTS book_publisher (
	book_id UUID REFERENCES books(id),
	publisher_id UUID REFERENCES publishers(id)
);

SELECT * FROM book_publisher;

-- 5.3


CREATE TABLE IF NOT EXISTS library_book (
	library_id UUID REFERENCES libraries(id),
	book_id UUID REFERENCES books(id)
);

SELECT * FROM library_book;

-- end --