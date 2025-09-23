-- Subqueries -  query nested inside a larger query, used in SELECT, FROM, WHERE AND HAVING clauses

SELECT*
FROM ( -- subquery starts
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;  -- subquery ends


SELECT 
    company_id,
    name AS company_name
FROM
    company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = true
    ORDER BY
        company_id
)


/*
    Common Table Expressions : define a temporary result set which we can reference
    - can be referenced within a SELECT, INSERT, UPDATE or DELETE statement
    - defined with WITH
*/

WITH january_jobs AS( -- CTE definition starts here
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here
SELECT *
FROM january_jobs;


WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)
SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs 
FROM
    company_dim
LEFT JOIN company_job_count ON company_dim.company_id = company_job_count.company_id
ORDER BY
    total_jobs DESC;



-- Practice problems

WITH skill_job_count AS(
    SELECT 
        skill_id,
        COUNT(*) AS total_jobs
    FROM
        skills_job_dim
    GROUP BY
        skill_id
)
SELECT 
    skills AS skill_name,
    total_jobs
FROM skills_dim 
LEFT JOIN skill_job_count ON skills_dim.skill_id = skill_job_count.skill_id
ORDER BY
    total_jobs  DESC
LIMIT 5;



SELECT
    company_dim.name,
    CASE  
        WHEN total_jobs < 10 THEN 'Small'
        WHEN total_jobs >= 10 AND total_jobs<50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs

    FROM
        job_postings_fact
    GROUP BY
        company_id
) AS job_counts
    INNER JOIN company_dim ON job_counts.company_id = company_dim.company_id;
    

-- top 5 remote job skills
WITH remote_job_count AS(
    SELECT
        sjd.skill_id,
        COUNT(*) AS skill_count
    FROM 
        job_postings_fact AS jbs
    INNER JOIN skills_job_dim AS sjd
        ON jbs.job_id = sjd.job_id
    WHERE
        jbs.job_work_from_home = true
        AND jbs.job_title_short = 'Data Analyst '
    GROUP BY
        sjd.skill_id
)
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    rjb.skill_count
FROM remote_job_count as rjb 
INNER JOIN skills_dim ON
    skills_dim.skill_id = rjb.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;



