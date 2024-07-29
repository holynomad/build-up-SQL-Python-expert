-- 문제) 각 세대별 자식이 없는 개체의 수(COUNT)와 세대(GENERATION)를 출력하는 SQL문을 작성해주세요. 이때 결과는 세대에 대해 오름차순 정렬해주세요. 단, 모든 세대에는 자식이 없는 개체가 적어도 1개체는 존재합니다.

-- 각 세대별 대장균의 ID는 다음과 같습니다.

-- 1 세대 : ID 1, ID 2
-- 2 세대 : ID 3, ID 4, ID 5
-- 3 세대 : ID 6, ID 7
-- 4 세대 : ID 8

-- 이 때 각 세대별 자식이 없는 대장균의 ID는 다음과 같습니다.

-- 1 세대 : ID 1
-- 2 세대 : ID 3, ID 5
-- 3 세대 : ID 7
-- 4 세대 : ID 8

-- 따라서 결과를 세대에 대해 오름차순 정렬하면 다음과 같아야 합니다.

WITH RECURSIVE generation_cte AS (
    -- 최초의 대장균 개체는 세대 1로 설정
    SELECT 
        ID,
        PARENT_ID,
        1 AS generation
    FROM 
        ECOLI_DATA
    WHERE 
        PARENT_ID IS NULL

    UNION ALL

    -- 각 자식 개체의 세대는 부모 개체의 세대 + 1
    SELECT 
        e.ID,
        e.PARENT_ID,
        g.generation + 1
    FROM 
        ECOLI_DATA e
    INNER JOIN 
        generation_cte g ON e.PARENT_ID = g.ID
)
-- 세대 정보를 얻은 후, 자식이 없는 개체를 찾기 위한 CTE
, no_children_cte AS (
    SELECT 
        g.ID,
        g.generation
    FROM 
        generation_cte g
    LEFT JOIN 
        ECOLI_DATA e ON g.ID = e.PARENT_ID
    WHERE 
        e.PARENT_ID IS NULL
)
-- 세대별 자식이 없는 개체의 수 집계
SELECT 
    COUNT(ID) AS COUNT,
    generation
    
FROM 
    no_children_cte
GROUP BY 
    generation
ORDER BY 
    generation;

