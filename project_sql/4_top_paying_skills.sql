/*
    QUESTION: What are the top skills based on salary.
        - Look at the average salary associated with each skill for Data Analyst positions.
        - Focuses on roles with specified salaries, regardless of location.
        - Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve. 
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id  = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25


/*
    Based on the data, here are some quick insights into the trends for top-paying data analyst jobs.

    1. High-Value Niche Skills
    The highest-paying skills are often highly specialized and go beyond traditional data analysis. The top skill, SVN, with an average salary of $400,000, is a version control system typically associated with software development and DevOps roles. Similarly, Solidity, a programming language for writing smart contracts, commands a high salary of $179,000, reflecting the growing value of blockchain and decentralized application skills.

    2. DevOps and Machine Learning Skills are Gaining Ground
    A significant trend is the inclusion of skills related to DevOps and Machine Learning Operations (MLOps). These include tools like Terraform, GitLab, Puppet, Ansible, and Airflow. This indicates that top-paying data analyst roles are not just about analysis and visualization; they require a deeper understanding of infrastructure, automation, and deploying data-driven solutions.

    Furthermore, machine learning frameworks like Keras, PyTorch, and TensorFlow, as well as platforms like Hugging Face, are present in the top-paying skill list. This suggests a shift toward roles that combine data analysis with machine learning model development and deployment.

    3. Shift from General to Specialized
    While fundamental skills like SQL and Python are often required for most data analyst roles, the highest-paying jobs are looking for skills that are more specialized and less common. The average salary for the top 25 skills is $144,889.96, which is significantly higher than the average for the most common data analyst skills. This highlights that to earn a top salary, analysts may need to branch out into niche areas of technology, like DevOps, blockchain, or specific machine learning frameworks.
*/