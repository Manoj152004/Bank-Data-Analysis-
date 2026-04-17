--Retrive the data shape ?
SELECT COUNT(*) AS total_rows FROM bank;

--Retrive the total loan amount by gender ?
SELECT gender,ROUND(SUM(loan_amount_requested)::numeric,1)AS total_amount
FROM bank GROUP BY gender ORDER BY total_amount DESC;

-- Count the pepole whose credit score greater then 850 ?
SELECT credit_score, COUNT(applicant_name) AS total_pepole
FROM bank GROUP BY credit_score HAVING credit_score >= 850 ORDER BY credit_score DESC LIMIT 5;

--find how many loan approved,rejected and pending years wise 


select * from bank limit 5;