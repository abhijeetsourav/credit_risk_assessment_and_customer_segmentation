-- How is our loan portfolio distributed across risk segments?
SELECT
    risk_segment,
    COUNT(*) AS total_loans,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS pct_of_portfolio
FROM credit_portfolio
GROUP BY risk_segment
ORDER BY total_loans DESC;


-- Where is our loan exposure concentrated?
SELECT
    risk_segment,
    ROUND(AVG(is_default), 3) AS default_rate
FROM credit_portfolio
GROUP BY risk_segment
ORDER BY default_rate DESC;


-- Where is our loan exposure concentrated?
SELECT
    risk_segment,
    SUM(loan_amnt) AS total_exposure,
    ROUND(AVG(loan_amnt), 0) AS avg_loan_size
FROM credit_portfolio
GROUP BY risk_segment
ORDER BY total_exposure DESC;


-- Where is our loan exposure concentrated?
SELECT
    risk_segment,
    SUM(loan_amnt) AS total_exposure,
    ROUND(AVG(loan_amnt)::numeric, 0) AS avg_loan_size
FROM credit_portfolio
GROUP BY risk_segment
ORDER BY total_exposure DESC;


-- Which risk segments contribute most to expected losses?
SELECT
    risk_segment,
    ROUND(AVG(is_default)::numeric, 3) AS pd,
    SUM(loan_amnt) AS exposure,
    ROUND(AVG(is_default) * SUM(loan_amnt)::numeric, 0) AS expected_loss_proxy
FROM credit_portfolio
GROUP BY risk_segment
ORDER BY expected_loss_proxy DESC;


-- Are we pricing risk appropriately?
SELECT
    risk_segment,
    ROUND(AVG(int_rate)::numeric, 2) AS avg_interest_rate,
    ROUND(AVG(is_default)::numeric, 3) AS default_rate
FROM credit_portfolio
GROUP BY risk_segment
ORDER BY avg_interest_rate DESC;


-- what happens if we reject all loans with DTI > 40?
SELECT
    CASE
        WHEN dti > 40 THEN 'Would be Rejected'
        ELSE 'Would be Approved'
    END AS policy_outcome,
    COUNT(*) AS loans,
    ROUND(AVG(is_default)::numeric, 3) AS default_rate
FROM credit_portfolio
GROUP BY policy_outcome;


-- who should we focus on for long-term profit?
SELECT
    risk_segment,
    COUNT(*) AS customers,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(default), 3) AS default_rate
FROM credit_portfolio
WHERE risk_segment IN ('Low Risk', 'Very Low Risk')
GROUP BY risk_segment;

