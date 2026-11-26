

-- Q1: Revenue Leakage & Subscription Patterns
-- Analyze churned MRR by plan tier and billing frequency

SELECT
    plan_tier,
    billing_frequency,
    SUM(mrr_amount) AS mrr_lost
FROM subscriptions
WHERE churn_flag = 'True'
GROUP BY
    plan_tier,
    billing_frequency
ORDER BY mrr_lost DESC;


          
-- Q5: High-Risk Segment Identification
-- Average Time to Churn by Industry and Referral Source

SELECT
    s.industry,
    s.referral_source,
    AVG(DATEDIFF(c.churn_date, s.signup_date)) AS avg_time_to_churn
FROM accounts s
JOIN churn_events c
    ON s.account_id = c.account_id
WHERE c.churn_date >= s.signup_date
GROUP BY
    s.industry,
    s.referral_source
ORDER BY avg_time_to_churn ASC;


















