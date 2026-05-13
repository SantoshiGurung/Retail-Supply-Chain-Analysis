-- QUERY 1: THE STOCK-OUT CRISIS
-- Goal: Identify products where stock has fallen below the safety "Red Line."

SELECT 
    product_id, 
    quantity_in_stock, 
    reorder_level 
FROM inventory 
WHERE quantity_in_stock < reorder_level 
ORDER BY quantity_in_stock ASC;
