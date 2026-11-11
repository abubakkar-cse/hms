CREATE DATABASE library_design_lab;
USE library_design_lab;


CREATE TABLE categories (
    category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(80) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE books (
    book_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_id INT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    edition VARCHAR(30) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    INDEX ix_books_title (title)
) ENGINE=InnoDB;

CREATE TABLE authors (
    author_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(150) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE book_authors (
    book_id INT UNSIGNED NOT NULL,
    author_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
) ENGINE=InnoDB;

CREATE TABLE book_copies (
    copy_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    book_id INT UNSIGNED NOT NULL,
    barcode VARCHAR(30) NOT NULL UNIQUE,
    copy_state ENUM('IN_SERVICE', 'REPAIR', 'LOST')
        NOT NULL DEFAULT 'IN_SERVICE',
    FOREIGN KEY (book_id) REFERENCES books(book_id)
) ENGINE=InnoDB;

CREATE TABLE members (
    member_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    card_no VARCHAR(30) NOT NULL UNIQUE,
    full_name VARCHAR(150) NOT NULL,
    member_status ENUM('ACTIVE', 'INACTIVE')
        NOT NULL DEFAULT 'ACTIVE'
) ENGINE=InnoDB;

CREATE TABLE loans (
    loan_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    copy_id INT UNSIGNED NOT NULL,
    member_id INT UNSIGNED NOT NULL,
    issued_on DATE NOT NULL,
    due_on DATE NOT NULL,
    returned_on DATE NULL,
    open_copy_id INT UNSIGNED GENERATED ALWAYS AS
        (CASE WHEN returned_on IS NULL THEN copy_id END) STORED,
    UNIQUE KEY uq_loans_open_copy (open_copy_id),
    INDEX ix_loans_member_open (member_id, returned_on),
    INDEX ix_loans_open_due (returned_on, due_on),
    FOREIGN KEY (copy_id) REFERENCES book_copies(copy_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT ck_loans_due CHECK (due_on >= issued_on),
    CONSTRAINT ck_loans_return
        CHECK (returned_on IS NULL OR returned_on >= issued_on)
) ENGINE=InnoDB;

-- 1. Categories
INSERT INTO categories (category_id, category_name) VALUES
    (1, 'Computer Science'),
    (2, 'Literature'),
    (3, 'History'),
    (4, 'Science');

-- 2. Books
INSERT INTO books (book_id, category_id, title, edition, isbn) VALUES
   
    (2, 1, 'Practical MySQL',      '2nd Edition', '9780000000026'),
    (3, 1, 'Learning Python',      '1st Edition', '9780000000033'),
    (4, 2, 'Stories by the River', '1st Edition', '9780000000040'),
    (5, 3, 'History of Bengal',    '1st Edition', '9780000000057'),
    (6, 4, 'Exploring the Stars',  '1st Edition', NULL);
SELECT * FROM books;
-- 3. Authors
INSERT INTO authors (author_id, author_name) VALUES
    (1, 'Farhan Ahmed'),
    (2, 'Nusrat Jahan'),
    (3, 'Sadia Rahman'),
    (4, 'Mahmud Hasan'),
    (5, 'Tanjila Akter');
SELECT * FROM authors;
-- 4. Book–author relationships
INSERT INTO book_authors (book_id, author_id) VALUES
    (1, 1), (1, 2),
    (2, 1), (2, 2),
    (3, 2),
    (4, 3),
    (5, 4),
    (6, 5);

-- 5. Physical copies
INSERT INTO book_copies (copy_id, book_id, barcode, copy_state) VALUES
    
    (12, 3, 'LIB-00045', 'IN_SERVICE');
 
    SELECT * FROM book_copies;

-- 6. Members
INSERT INTO members (member_id, card_no, full_name, member_status) VALUES
    (1, 'MEM-001', 'Arafat Hossain', 'ACTIVE'),
    (2, 'MEM-002', 'Samia Islam',    'ACTIVE'),
    (3, 'MEM-003', 'Tanvir Ahmed',   'ACTIVE'),
    (4, 'MEM-004', 'Mim Akter',      'INACTIVE'),
    (5, 'MEM-005', 'Rafi Karim',     'ACTIVE');

-- 7. Loans
SELECT * FROM loans;
SET @seed_date = CURRENT_DATE();

INSERT INTO loans (loan_id, copy_id, member_id, issued_on, due_on, returned_on) VALUES
    -- Returned on time
   -- (1, 1, 1, @seed_date - INTERVAL 35 DAY, @seed_date - INTERVAL 21 DAY,
         --     @seed_date - INTERVAL 23 DAY)
    -- Same copy borrowed again and currently overdue
    
              -- (2, 1, 2, @seed_date - INTERVAL 18 DAY, @seed_date - INTERVAL 4 DAY, NULL),
    -- Open loan, due in 9 days
    (3, 3, 1, @seed_date - INTERVAL 5 DAY, @seed_date + INTERVAL 9 DAY, NULL),
    -- Open loan, due today
    (4, 5, 2, @seed_date - INTERVAL 14 DAY, @seed_date, NULL),
    -- Returned late
    (5, 6, 3, @seed_date - INTERVAL 30 DAY, @seed_date - INTERVAL 16 DAY,
              @seed_date - INTERVAL 12 DAY),
    -- Historical loan for the currently inactive member
    (6, 8, 4, @seed_date - INTERVAL 45 DAY, @seed_date - INTERVAL 31 DAY,
              @seed_date - INTERVAL 33 DAY);
              
              
              
SELECT books.title, books.isbn, categories.category_name FROM books RIGHT JOIN categories ON books.category_id = categories.category_id;


SELECT books.book_id, books.title as Book_Name, books.isbn as ISBN ,categories.category_name AS Category ,authors.author_name as Writer FROM books 
LEFT JOIN book_authors ON books.book_id=book_authors.book_id
Join authors on authors.author_id = book_authors.author_id
JOIN categories ON books.category_id = categories.category_id
WHERE books.isbn IS NOT NULL
ORDER  BY books.isbn;
;

SELECT COUNT(book_copies.copy_id) As total_copy, books.book_id, books.title FROM book_copies
JOIN books ON book_copies.book_id = books.book_id
 GROUP BY books.book_id, books.title;
        
SELECT * FROM loans;
SELECT COUNT(loans.loan_id) AS Lona_num, members.member_id, members.full_name 
 FROM loans RIGHT JOIN members ON loans.member_id = members.member_id 
 GROUP BY members.member_id;
              
              
              

