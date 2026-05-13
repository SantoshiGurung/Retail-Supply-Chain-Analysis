-- QUERY 1: THE STOCK-OUT CRISIS
-- Goal: Identify products where stock has fallen below the safety "Red Line."

SELECT 
    product_id, 
    quantity_in_stock, 
    reorder_level 
FROM inventory 
WHERE quantity_in_stock < reorder_level 
ORDER BY quantity_in_stock ASC;


-- QUERY 2: FINANCIAL IMPACT OF RESTOCKING
-- Calculates the exact cost to bring each at-risk item back to safety levels.
SELECT 
    product_id, 
    (reorder_level - quantity_in_stock) * unit_price AS restock_cost 
FROM inventory 
WHERE quantity_in_stock < reorder_level;

-- QUERY 3: EXECUTIVE SUMMARY BY CATEGORY
-- Provides the total financial requirement to restock each department.

SELECT 
    category, 
    SUM((reorder_level - quantity_in_stock) * unit_price) AS total_category_cost 
FROM inventory 
WHERE quantity_in_stock < reorder_level 
GROUP BY category;

-- QUERY 4: SUPPLIER PERFORMANCE ANALYSIS
-- Goal: Identify categories with the slowest replenishment cycles.

SELECT 
    category_supplied, 
    AVG(lead_time_days) AS avg_delivery_time 
FROM suppliers 
GROUP BY category_supplied
ORDER BY avg_delivery_time DESC;
