CREATE DATABASE library_management;

CREATE SCHEMA library;

CREATE TABLE library.Members (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    birth_date DATE,
    address TEXT,
    status VARCHAR(10) CHECK (status IN ('active','inactive')),
    join_date DATE NOT NULL
);

CREATE TABLE library.Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE library.Books (
    book_id SERIAL PRIMARY KEY,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    title VARCHAR(200) NOT NULL,
    publish_year INT,
    publisher VARCHAR(100),
    total_copies INT CHECK (total_copies >= 0),
    available_copies INT CHECK (available_copies >= 0),
    category_id INT NOT NULL,
    Foreign Key (category_id) REFERENCES library.Categories(category_id)
);

CREATE TABLE library.Authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    bio TEXT
);

CREATE TABLE library.BookAuthors (
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES library.Books(book_id),
    FOREIGN KEY (author_id) REFERENCES library.Authors(author_id),
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE library.Borrowings (
    borrowing_id SERIAL PRIMARY KEY,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES library.Members(member_id)
);

CREATE TABLE library.BorrowingDetails (
    borrowing_detail_id SERIAL PRIMARY KEY,
    quantity INT CHECK (quantity > 0),
    borrowing_id INT,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES  library.Borrowings(borrowing_id),
    FOREIGN KEY (borrowing_id) REFERENCES library.Books(book_id)
);