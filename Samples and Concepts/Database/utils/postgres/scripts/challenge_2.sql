\set ON_ERROR_STOP on
\echo '--- challenge_2.sql START ---'
\conninfo
\echo 'Current time: ' :HOST ':' :PORT

BEGIN;

INSERT INTO users (name, email) VALUES
  ('User7', 'user7@example.com'),
  ('User8', 'user8@example.com')
ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO orders (user_id, total)
SELECT u.id, v.total
FROM (VALUES
        ('user7@example.com', 2100.00),
        ('user7@example.com', 2200.00),
        ('user8@example.com', 2300.00),
        ('user8@example.com', 2400.00)
     ) AS v(email, total)
JOIN users u ON u.email = v.email
LEFT JOIN orders o ON o.user_id = u.id AND o.total = v.total
WHERE o.id IS NULL;

\echo 'Joined rows for user7 & user8:'
SELECT u.name, u.email, o.total
FROM users u
JOIN orders o ON o.user_id = u.id
WHERE u.email IN ('user7@example.com','user8@example.com')
ORDER BY u.email, o.id;

COMMIT;

\echo '--- challenge_2.sql END ---'
