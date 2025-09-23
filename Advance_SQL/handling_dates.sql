/*
    how to create a database
    1. download CSV & SQL files
    2. create tables in the database
    3. Load data into tables
    ** for scripts of these above steps , refer to sql_load folder
*/

-- checking all tables are loaded and data is copied in them
SELECT * FROM job_postings_fact limit 100;

-- Advance functions

-- 1.Typecasting operator (::)- used to covert datatypes
SELECT
        '2023-02-19'::DATE,
        '123'::INT,
        'true'::BOOLEAN,
        '3.14'::REAL;

--Handling Dates

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date -- converting to date type
FROM
    job_postings_fact;

-- using AT TIME ZONE assumes the machine's time zone for conversion; specify it, or the default is UTC
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact
LIMIT
    5;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT
    5;


SELECT
    COUNT(job_id) as job_count,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    date_month
ORDER BY
    job_count DESC;


-- Practice problems
SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS year_avg,
    AVG(salary_hour_avg) AS hour_avg
    
FROM
    job_postings_fact
WHERE 
    EXTRACT(MONTH FROM job_posted_date) >= 6
    AND EXTRACT(YEAR FROM job_posted_date) >= 2023
GROUP BY
    job_schedule_type;


-- Creating the table from filtered data from other table
CREATE TABLE jan_2023_jobs AS
SELECT*
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 1;


CREATE TABLE feb_2023_jobs AS
SELECT*
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 2;


CREATE TABLE mar_2023_jobs AS
SELECT*
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 3;


