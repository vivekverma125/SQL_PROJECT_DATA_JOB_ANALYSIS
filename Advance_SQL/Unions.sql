 /* 
    Union : combines result from two or more SELECT statements
    - need to have same amount of columns and the data type must match
    (all rows are unique in result)

    Union All - same as union but returns all rows including duplicate ones
*/

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    jan_2023_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    feb_2023_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    mar_2023_jobs


-- practice problem
SELECT 
    quarter1_jobs.job_title_short,
    quarter1_jobs.job_location,
    quarter1_jobs.job_via,
    quarter1_jobs.job_posted_date::DATE,
    quarter1_jobs.salary_year_avg
FROM (
    SELECT*
    FROM jan_2023_jobs
    UNION ALL
    SELECT*
    FROM feb_2023_jobs
    UNION ALL
    SELECT*
    FROM mar_2023_jobs
) AS quarter1_jobs
WHERE
    quarter1_jobs.salary_year_avg>70000 AND
    quarter1_jobs.job_title_short= 'Data Analyst'
ORDER BY
    quarter1_jobs.salary_year_avg DESC;


