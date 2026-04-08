-- QUERIES

-- Checking integrity
SELECT 
    COUNT(s.game) AS total_sales_records,
    COUNT(r.game) AS records_with_reviews,
    ROUND((COUNT(r.game)::numeric / COUNT(s.game)::numeric) * 100, 2) AS match_percentage
FROM game_sales s
LEFT JOIN reviews r ON s.game = r.game;

-- Publisher performance analysis
SELECT 
    s.publisher, 
    COUNT(s.game) AS games_released, 
    SUM(s.games_sold) AS total_sales,
    ROUND(AVG(r.critic_score::numeric), 2) AS avg_critic_score
FROM game_sales s
INNER JOIN reviews r ON s.game = r.game
GROUP BY s.publisher
HAVING COUNT(s.game) > 10 -- Filter for established publishers
ORDER BY total_sales DESC
LIMIT 10;

-- Critics vs users
SELECT 
    game, 
    critic_score, 
    user_score,
    ABS(critic_score - user_score) AS score_gap
FROM reviews
WHERE critic_score IS NOT NULL AND user_score IS NOT NULL
ORDER BY score_gap DESC
LIMIT 10;

-- Platform longevity trends
SELECT 
    platform, 
    MIN(year) AS launch_year, 
    MAX(year) AS last_release_year,
    (MAX(year) - MIN(year)) AS years_active,
    SUM(games_sold) AS platform_total_sales
FROM game_sales
GROUP BY platform
ORDER BY years_active DESC;
