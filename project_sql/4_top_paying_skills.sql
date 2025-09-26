/*
    What are the top skills based on salary?
    - Look at the avg salary associated with each skill for data analyst positions
    - Focuses on roles with specified salaries, regardless of location
    - Why? It reveals how different skills impact salary levels for data analysts and helps
        identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    --AND job_work_from_home = 'True'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;




/*
    The insights and trends for the top 25 paying skills for Data Analysts are driven by specialization, engineering, and advanced ML.

        Engineering Focus (↑ Salary): The highest salaries demand DevOps and Infrastructure-as-Code (IaC) skills (Terraform, VMware, Ansible, Puppet), showing the role requires building and maintaining data infrastructure.
        Advanced ML/AI is Standard: A significant portion of the list includes Machine Learning Frameworks (PyTorch, TensorFlow, Keras, Hugging Face) and AutoML (DataRobot), confirming top jobs involve advanced statistical modeling and ML deployment (MLOps).
        Data Pipelining: Skills like Airflow (workflow orchestration) and Kafka (data streaming) are essential, highlighting the requirement for managing complex, real-time data flows.
        Niche Tech Premium: The absolute top salaries are paid for highly specialized or niche skills, such as Solidity (Blockchain) and Couchbase (NoSQL), due to a scarce talent pool in high-budget domains.
        High-Performance Programming: Languages like Golang and Scala are valued for their role in building fast, scalable data processing systems, differentiating them from general-purpose languages.
        Collaboration Tools are Expected: Even at the highest salary tiers, Atlassian (Jira, Confluence) and Notion are necessary, proving that efficient documentation and team workflow are fundamental to high-value roles.
    

    [
          {
            "skills": "svn",
            "avg_salary": "400000"
          },
          {
            "skills": "solidity",
            "avg_salary": "179000"
          },
          {
            "skills": "couchbase",
            "avg_salary": "160515"
          },
          {
            "skills": "datarobot",
            "avg_salary": "155486"
          },
          {
            "skills": "golang",
            "avg_salary": "155000"
          },
          {
            "skills": "mxnet",
            "avg_salary": "149000"
          },
          {
            "skills": "dplyr",
            "avg_salary": "147633"
          },
          {
            "skills": "vmware",
            "avg_salary": "147500"
          },
          {
            "skills": "terraform",
            "avg_salary": "146734"
          },
          {
            "skills": "twilio",
            "avg_salary": "138500"
          },
          {
            "skills": "gitlab",
            "avg_salary": "134126"
          },
          {
            "skills": "kafka",
            "avg_salary": "129999"
          },
          {
            "skills": "puppet",
            "avg_salary": "129820"
          },
          {
            "skills": "keras",
            "avg_salary": "127013"
          },
          {
            "skills": "pytorch",
            "avg_salary": "125226"
          },
          {
            "skills": "perl",
            "avg_salary": "124686"
          },
          {
            "skills": "ansible",
            "avg_salary": "124370"
          },
          {
            "skills": "hugging face",
            "avg_salary": "123950"
          },
          {
            "skills": "tensorflow",
            "avg_salary": "120647"
          },
          {
            "skills": "cassandra",
            "avg_salary": "118407"
          },
          {
            "skills": "notion",
            "avg_salary": "118092"
          },
          {
            "skills": "atlassian",
            "avg_salary": "117966"
          },
          {
            "skills": "bitbucket",
            "avg_salary": "116712"
          },
          {
            "skills": "airflow",
            "avg_salary": "116387"
          },
          {
            "skills": "scala",
            "avg_salary": "115480"
          }
    ]

*/