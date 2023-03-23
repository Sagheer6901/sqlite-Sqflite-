
const createTableUserProfile = '''
CREATE TABLE IF NOT EXISTS user_profile (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email_id TEXT ,password TEXT)
''';

const createTableBlogPosts = '''
CREATE TABLE IF NOT EXISTS blog_posts (id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT NOT NULL, description TEXT NOT NULL, author_name TEXT NOT NULL, author_email TEXT NOT NULL, image BLOB ,posted_date INTEGER ) 
''';

const createTableBookMarks = '''
CREATE TABLE IF NOT EXISTS book_marks (id INTEGER PRIMARY KEY AUTOINCREMENT ,post_id INTEGER NOT NULL, title TEXT NOT NULL, description TEXT NOT NULL, author_name TEXT NOT NULL, author_email TEXT NOT NULL, image BLOB ,posted_date INTEGER  ) 
''';



