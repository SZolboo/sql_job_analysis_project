/*
QUESTION:
What are the most in-demand skills for Data Analysts/Data Scientists?
*/

-- All job postings around the world.
SELECT 
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short IN ('Data Analyst', 'Data Scientist')
GROUP BY skills_dim.skills
ORDER BY demand_count DESC
LIMIT 10;

-- In Australia.
SELECT 
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count_aus
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short IN ('Data Analyst', 'Data Scientist') AND 
    job_country = 'Australia'
GROUP BY skills_dim.skills
ORDER BY demand_count_aus DESC
LIMIT 10;