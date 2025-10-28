SELECT
  u.name,
  u.email,
  o.total
FROM users AS u
JOIN orders AS o
  ON o.user_id = u.id
ORDER BY u.id, o.id;

-- Run by using `make challenge_1` while in /postgres