/*
QUESTION: 
What are the top-10-paying Data Analyst jobs?

OBJECTIVE: 
This query aims to retrieve information about the top 10 highest-paying "Data Analyst" jobs with a location of "Remote" from a database.
    - Focuses on job postings with specified salaries (excluding null values.)
*/

SELECT 
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;