-- 01-init.sql

-- The MySQL image entrypoint script will connect as root, so we can create the database
-- We use IF NOT EXISTS to make the script idempotent (safe to run multiple times)
CREATE DATABASE IF NOT EXISTS snippetbox CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Switch to the new database
USE snippetbox;

-- Create a `snippets` table.
CREATE TABLE snippets (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created DATETIME NOT NULL,
    expires DATETIME NOT NULL);

-- Add an index on the created column.
CREATE INDEX idx_snippets_created ON snippets(created);

-- Add some dummy records
INSERT INTO snippets (title, content, created, expires) VALUES (
    'An old silent pond',
    'An old silent pond...\nA frog jumps into the pond,\nsplash! Silence again.\n\n– Matsuo Bashō',
    UTC_TIMESTAMP(),
    DATE_ADD(UTC_TIMESTAMP(), INTERVAL 365 DAY));

INSERT INTO snippets (title, content, created, expires) VALUES (
    'Over the wintry forest',
    'Over the wintry\nforest, winds howl in rage\nwith no leaves to blow.\n\n– Natsume Soseki',
    UTC_TIMESTAMP(),
    DATE_ADD(UTC_TIMESTAMP(), INTERVAL 365 DAY));

INSERT INTO snippets (title, content, created, expires) VALUES (
    'First autumn morning',
    'First autumn morning\nthe mirror I stare into\nshows my father''s face.\n\n– Murakami Kijo',
    UTC_TIMESTAMP(),
    DATE_ADD(UTC_TIMESTAMP(), INTERVAL 7 DAY));

-- Create web user that can connect from any host (% wildcard)
-- Also create for localhost for connections from within the container
CREATE USER IF NOT EXISTS 'web'@'%' IDENTIFIED BY 'pass';
CREATE USER IF NOT EXISTS 'web'@'localhost' IDENTIFIED BY 'pass';

-- Grant limited permissions (SELECT, INSERT, UPDATE, DELETE) but NOT DROP, GRANT, etc.
GRANT SELECT, INSERT, UPDATE, DELETE ON snippetbox.* TO 'web'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON snippetbox.* TO 'web'@'localhost';

-- Ensure changes take effect
FLUSH PRIVILEGES;