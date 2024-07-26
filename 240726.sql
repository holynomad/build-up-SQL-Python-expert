-- Q) 분화된 연도(YEAR), 분화된 연도별 대장균 크기의 편차(YEAR_DEV), 대장균 개체의 ID(ID) 를 출력하는 SQL 문을 작성해주세요. 
-- 분화된 연도별 대장균 크기의 편차는 분화된 연도별 가장 큰 대장균의 크기 - 각 대장균의 크기로 구하며 결과는 연도에 대해 오름차순으로 정렬하고 
-- 같은 연도에 대해서는 대장균 크기의 편차에 대해 오름차순으로 정렬해주세요.

-- 삽질 코드 (group by 오류...)
 select year(DIFFERENTIATION_DATE) as YEAR
      , case year(DIFFERENTIATION_DATE)
            when 2019 then max(SIZE_OF_COLONY) - SIZE_OF_COLONY
            when 2020 then max(SIZE_OF_COLONY) - SIZE_OF_COLONY
            when 2021 then max(SIZE_OF_COLONY) - SIZE_OF_COLONY
        end as YEAR_DEV
      , ID 
   from ECOLI_DATA
  group by year(DIFFERENTIATION_DATE), SIZE_OF_COLONY
  order by 1, 2
  ;

-- 올바른 코드 
 select year(DIFFERENTIATION_DATE) as YEAR
      , max(SIZE_OF_COLONY) over (partition by year(DIFFERENTIATION_DATE)) - SIZE_OF_COLONY as YEAR_DEV
      , ID 
   from ECOLI_DATA
  where year(DIFFERENTIATION_DATE) in (2019, 2020, 2021)
  order by 1, 2
  ;


-- Q) 2번 형질이 보유하지 않으면서 1번이나 3번 형질을 보유하고 있는 대장균 개체의 수(COUNT)를 출력하는 SQL 문을 작성해주세요. 
-- 1번과 3번 형질을 모두 보유하고 있는 경우도 1번이나 3번 형질을 보유하고 있는 경우에 포함합니다.
-- 각 대장균 별 형질을 2진수로 나타내면 다음과 같습니다.

-- ID 1 : 1000₍₂₎
-- ID 2 : 1111₍₂₎
-- ID 3 : 1₍₂₎
-- ID 4 : 1101₍₂₎

-- 각 대장균 별 보유한 형질을 다음과 같습니다.

-- ID 1 : 4
-- ID 2 : 1, 2, 3, 4
-- ID 3 : 1
-- ID 4 : 1, 3, 4

-- 따라서 2번 형질이 없는 대장균 개체는 ID 1, ID 3, ID 4 이며 이 중 1번이나 3번 형질을 보유한 대장균 개체는 ID 3, ID 4 입니다.

-- 올바른 코드
select COUNT(*) AS COUNT
  from ECOLI_DATA
 where  
        (GENOTYPE & 2) = 0  
                            -- 비트 AND 연산을 사용하여 2번 형질(2진수로 10₍₂₎)을 보유하지 않은 개체를 선택
                            -- 2와의 비트 AND 연산 결과가 0이면 2번 형질이 없는 것
        AND 
        (GENOTYPE & 5) > 0; -- 1번 또는 3번 형질을 보유 (1 + 4 = 5)
                            -- 비트 AND 연산을 사용하여 1번 형질(1₍₂₎) 또는 3번 형질(100₍₂₎)을 보유한 개체를 선택
                            -- 1 (1번째 형질) + 4 (3번째 형질) = 5이므로, 5와의 비트 AND 연산 결과가 0보다 크면 
                            -- 1번이나 3번 형질 중 하나 이상을 보유한 것입니다.

