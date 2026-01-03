CREATE INDEX idx_uniform_stockcode
ON online_retail_uniform(stockcode);

CREATE INDEX idx_skewed_stockcode
ON online_retail_skewed(stockcode);

SELECT
    tablename,
    indexname
FROM pg_indexes
WHERE indexname IN (
    'idx_uniform_stockcode',
    'idx_skewed_stockcode'
);


EXPLAIN ANALYZE
SELECT *
FROM online_retail_uniform
WHERE stockcode = '85123A';

EXPLAIN ANALYZE
SELECT *
FROM online_retail_skewed
WHERE stockcode = '85123A';

--Based on Low-Frequency Candidates result, StockCode '23634' is selected as cold key.
--Run cold-key point queries
EXPLAIN ANALYZE
SELECT *
FROM online_retail_uniform
WHERE stockcode = '23634';

EXPLAIN ANALYZE
SELECT *
FROM online_retail_skewed
WHERE stockcode = '23634';

--Identify range
SELECT MIN(stockcode), MAX(stockcode)
FROM online_retail_clean;

--Range query on uniform dataset
EXPLAIN ANALYZE
SELECT *
FROM online_retail_uniform
WHERE stockcode BETWEEN '22000' AND '23000';

--Range query on skewed dataset
EXPLAIN ANALYZE
SELECT *
FROM online_retail_skewed
WHERE stockcode BETWEEN '22000' AND '23000';

--No-Index Baseline
--1. Drop indexes
DROP INDEX IF EXISTS idx_uniform_stockcode;
DROP INDEX IF EXISTS idx_skewed_stockcode;

--2. Repeat key queries WITHOUT index
--For hotkey
EXPLAIN ANALYZE
SELECT *
FROM online_retail_uniform
WHERE stockcode = '85123A';

--For coldkey
EXPLAIN ANALYZE
SELECT *
FROM online_retail_uniform
WHERE stockcode = '23634';

--Range query
EXPLAIN ANALYZE
SELECT *
FROM online_retail_uniform
WHERE stockcode BETWEEN '22000' AND '23000';

--For hotkey (skewed)
EXPLAIN ANALYZE
SELECT *
FROM online_retail_skewed
WHERE stockcode = '85123A';

--For coldkey (skewed)
EXPLAIN ANALYZE
SELECT *
FROM online_retail_skewed
WHERE stockcode = '23634';

--Range query (skewed)
EXPLAIN ANALYZE
SELECT *
FROM online_retail_skewed
WHERE stockcode BETWEEN '22000' AND '23000';

--Re-create Indexes (Restore Environment)
CREATE INDEX idx_uniform_stockcode
ON online_retail_uniform(stockcode);

CREATE INDEX idx_skewed_stockcode
ON online_retail_skewed(stockcode);
