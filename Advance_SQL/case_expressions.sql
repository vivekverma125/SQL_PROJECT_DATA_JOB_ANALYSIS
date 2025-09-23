/*
    CASE - begins the expression
    WHEN - specifies the condition to look at
    THEN - what to do when the condition is true
    ELSE -(optional) provides output of none of the WHEN condition is met
    END  - concludes the case expression
*/

SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
job_postings_fact;


SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;


-- Practice problems
SELECT 
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg <= 244500 THEN 'low salary'
        WHEN salary_year_avg >245000 AND salary_year_avg<=723750 THEN 'standard salary'
        WHEN salary_year_avg > 244500 THEN 'high salary'
        ELSE 'Not specified'
    END AS salary_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;

