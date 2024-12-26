-- (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
--
-- For the full copyright and license information, please view the LICENSE
-- file that was distributed with this source code.

--
-- XPATH
-- XPATH_EXISTS
--      https://www.postgresql.org/docs/17/functions-xml.html#FUNCTIONS-XML-PROCESSING
--
-- https://stackoverflow.com/a/25676146

WITH DISHES AS (
    SELECT
        DISH_ID::INT
        , TOTAL_GUESTS::INT
    FROM (
        
        SELECT
            UNNEST(XPATH('/menu/dishes/dish/food_item_id/text()', CM.MENU_DATA))::TEXT AS DISH_ID
            , (XPATH('/menu/total_count/text()', CM.MENU_DATA))[1]::TEXT AS TOTAL_GUESTS
        FROM CHRISTMAS_MENUS CM
        WHERE XPATH_EXISTS('/menu[@version="1.0"]/text()', CM.MENU_DATA)
        
        UNION 
        
        SELECT
            UNNEST(XPATH('/menu/dishes/dish_entry/food_item_id/text()', CM.MENU_DATA))::TEXT AS DISHES_ID
            , (XPATH('/menu/total_guests/text()', CM.MENU_DATA))[1]::TEXT AS TOTAL_GUESTS
        FROM CHRISTMAS_MENUS CM
        WHERE XPATH_EXISTS('/menu[@version="2.0"]/text()', CM.MENU_DATA)
        
        UNION
        
        SELECT
            UNNEST(XPATH('/menu/foodList/foodEntry/food_item_id/text()', CM.MENU_DATA))::TEXT AS DISHES_ID
            , (XPATH('/menu/guestCount/text()', CM.MENU_DATA))[1]::TEXT AS TOTAL_GUESTS
        FROM CHRISTMAS_MENUS CM
        WHERE XPATH_EXISTS('/menu[@version="beta"]/text()', CM.MENU_DATA)
        
    ) T
)
SELECT DISTINCT
    DISH_ID
    , COUNT(DISH_ID) OVER(PARTITION BY DISH_ID) AS FREQUENCY
FROM DISHES
WHERE TOTAL_GUESTS > 78
ORDER BY FREQUENCY DESC
LIMIT 1
