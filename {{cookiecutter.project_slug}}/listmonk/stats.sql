-- WITH l AS (
--     SELECT type, COUNT(id) AS count FROM lists GROUP BY type
-- ),
-- subs AS (
--     SELECT status, COUNT(id) AS count FROM subscribers GROUP by status
-- ),
-- subscrips AS (
--     SELECT status, COUNT(subscriber_id) AS count FROM subscriber_lists GROUP by status
-- ),
-- orphans AS (
--     SELECT COUNT(id) AS count FROM subscribers LEFT JOIN subscriber_lists ON (subscribers.id = subscriber_lists.subscriber_id)
--     WHERE subscriber_lists.subscriber_id IS NULL
-- ),
-- camps AS (
--     SELECT status, COUNT(id) AS count FROM campaigns GROUP by status
-- )
-- SELECT t3.*, t5.* FROM l t1
-- LEFT JOIN LATERAL (
--     SELECT JSON_AGG(t2.*) AS lists
--     FROM (SELECT * FROM l) t2
-- ) t3 ON TRUE
-- LEFT JOIN LATERAL (
--     SELECT JSON_AGG(t4.*) AS subs
--     FROM (SELECT * FROM subs) t4
-- ) t5 ON TRUE;