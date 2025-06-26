/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Machine Learning Engineer'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;

/*
DevOps Hybrids = $325K+
    Chef/Ansible pay the most—master ML + infrastructure automation for top salaries.
Big Data & Niche Languages Win
    Scala ($252K) & Golang ($300K) outperform Python ($150K)—specialize in high-performance or distributed systems.
Production ML > Pure Modeling
    Kubernetes/Docker/Airflow ($170K–$194K) pay more than TensorFlow/PyTorch—focus on deployment, not just algorithms.
*/