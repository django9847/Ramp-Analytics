SELECT 
    DATE(t1.transaction_time) AS transaction_date,
    ROUND(AVG(t2.transaction_amount)::numeric, 2) AS rolling_3_day_avg
FROM 
    transactions t1
JOIN 
    transactions t2
ON 
    t2.transaction_time BETWEEN t1.transaction_time - INTERVAL '2 days' AND t1.transaction_time
WHERE 
    DATE(t1.transaction_time) BETWEEN '2021-01-01' AND '2021-01-31'
GROUP BY 
    DATE(t1.transaction_time)
ORDER BY 
    DATE(t1.transaction_time);
