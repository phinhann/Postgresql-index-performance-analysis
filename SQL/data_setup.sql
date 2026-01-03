CREATE TABLE online_retail_raw (
    invoiceno     VARCHAR(20),
    stockcode     VARCHAR(20),
    description   TEXT,
    quantity      INTEGER,
    invoicedate   TIMESTAMP,
    unitprice     NUMERIC,
    customerid    VARCHAR(20),
    country       VARCHAR(50)
);

SELECT COUNT(*) FROM online_retail_raw;

SELECT * FROM online_retail_raw LIMIT 5;

SELECT COUNT(*) 
FROM online_retail_raw 
WHERE stockcode IS NULL;

SELECT COUNT(*) 
FROM online_retail_raw 
WHERE invoiceno LIKE 'C%';

SELECT COUNT(*) 
FROM online_retail_raw 
WHERE quantity <= 0;

SELECT COUNT(*) 
FROM online_retail_raw 
WHERE unitprice <= 0;

CREATE TABLE online_retail_clean AS
SELECT *
FROM online_retail_raw
WHERE
    invoiceno NOT LIKE 'C%'
    AND quantity > 0
    AND unitprice > 0;

SELECT COUNT(*) FROM online_retail_clean;

SELECT COUNT(*) FROM online_retail_clean WHERE invoiceno LIKE 'C%';
SELECT COUNT(*) FROM online_retail_clean WHERE quantity <= 0;
SELECT COUNT(*) FROM online_retail_clean WHERE unitprice <= 0;

-- Number of distinct StockCodes
SELECT COUNT(DISTINCT stockcode)
FROM online_retail_clean;

-- Frequency distribution (top 10)
SELECT stockcode, COUNT(*) AS frequency
FROM online_retail_clean
GROUP BY stockcode
ORDER BY frequency DESC
LIMIT 10;




SELECT COUNT(*) FROM online_retail_uniform;
SELECT COUNT(*) FROM online_retail_skewed;

--Inspect Frequency Distribution
SELECT
    MIN(cnt) AS min_freq,
    MAX(cnt) AS max_freq,
    AVG(cnt) AS avg_freq
FROM (
    SELECT stockcode, COUNT(*) AS cnt
    FROM online_retail_clean
    GROUP BY stockcode
) t;

--Find Low-Frequency Candidates (Not Too Small)
SELECT stockcode, COUNT(*) AS frequency
FROM online_retail_clean
GROUP BY stockcode
HAVING COUNT(*) BETWEEN 5 AND 20
ORDER BY frequency ASC
LIMIT 10;
