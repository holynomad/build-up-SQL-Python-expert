-- 문제) 부모의 형질을 모두 보유한 대장균의 ID(ID), 대장균의 형질(GENOTYPE), 부모 대장균의 형질(PARENT_GENOTYPE)을 출력하는 SQL 문을 작성해주세요. 이때 결과는 ID에 대해 오름차순 정렬해주세요.

-- 각 대장균 별 형질을 2진수로 나타내면 다음과 같습니다.

-- ID 1 : 1₍₂₎
-- ID 2 : 1₍₂₎
-- ID 3 : 11₍₂₎
-- ID 4 : 10₍₂₎
-- ID 5 : 1000₍₂₎
-- ID 6 : 101₍₂₎
-- ID 7 : 101₍₂₎
-- ID 8 : 1101₍₂₎

-- 각 대장균 별 보유한 형질을 다음과 같습니다.

-- ID 1 : 1
-- ID 2 : 1
-- ID 3 : 1, 2
-- ID 4 : 2
-- ID 5 : 4
-- ID 6 : 1, 3
-- ID 7 : 1, 3
-- ID 8 : 1, 3, 4

-- 각 개체별로 살펴보면 다음과 같습니다.

-- ID 1 : 최초의 대장균 개체이므로 부모가 없습니다.
-- ID 2 : 부모는 ID 1 이며 부모의 형질인 1번 형질을 보유하고 있습니다.
-- ID 3 : 부모는 ID 1 이며 부모의 형질인 1번 형질을 보유하고 있습니다.
-- ID 4 : 부모는 ID 2 이며 부모의 형질인 1번 형질을 보유하고 있지 않습니다.
-- ID 5 : 부모는 ID 4 이며 부모의 형질인 2번 형질을 보유하고 있지 않습니다.
-- ID 6 : 부모는 ID 3 이며 부모의 형질 1, 2번 중 2 번 형질을 보유하고 있지 않습니다.
-- ID 7 : 부모는 ID 2 이며 부모의 형질인 1번 형질을 보유하고 있습니다.
-- ID 8 : 부모는 ID 6 이며 부모의 형질 1, 3번을 모두 보유하고 있습니다.

-- 따라서 부모의 형질을 모두 보유한 개체는 ID 2, ID 3, ID 7, ID 8 이며 결과를 ID 에 대해 오름차순 정렬하면 다음과 같아야 합니다.
select c.ID
     , c.GENOTYPE
     , p.GENOTYPE as PARENT_GENOTYPE 
  from ECOLI_DATA c
  inner join ECOLI_DATA p on c.PARENT_ID = p.ID
 where (p.GENOTYPE & c.GENOTYPE) = p.GENOTYPE  -- 부모와 자식 개체 형질 비트연산 결과는 부모 형질이어야 함
   and c.PARENT_ID is not null                 -- 자식 개체는 반드시 부모 개체 존재해야 함
 order by c.ID;                                -- ID 오름차순 출력


-- 문제) 대장균 개체의 크기를 내름차순으로 정렬했을 때 상위 0% ~ 25% 를 'CRITICAL', 26% ~ 50% 를 'HIGH', 51% ~ 75% 를 'MEDIUM', 76% ~ 100% 를 'LOW' 라고 분류합니다. 
-- 대장균 개체의 ID(ID) 와 분류된 이름(COLONY_NAME)을 출력하는 SQL 문을 작성해주세요. 이때 결과는 개체의 ID 에 대해 오름차순 정렬해주세요 . 
-- 단, 총 데이터의 수는 4의 배수이며 같은 사이즈의 대장균 개체가 서로 다른 이름으로 분류되는 경우는 없습니다.

select 
        ID
     ,  case NTILE(4) over (order by SIZE_OF_COLONY desc)
            when 1 then 'CRITICAL'
            when 2 then 'HIGH'
            when 3 then 'MEDIUM'
            when 4 then 'LOW'
        end as COLONY_NAME
  from 
        ECOLI_DATA
 order by
        ID;


-- 문제) 3세대의 대장균의 ID(ID) 를 출력하는 SQL 문을 작성해주세요. 이때 결과는 대장균의 ID 에 대해 오름차순 정렬해주세요.
-- PARENT ID 가 NULL 인 ID 1, ID 2가 1 세대이며 ID 1에서 분화된 ID 3, ID 2에서 분화된 ID 4, ID 5 가 2 세대입니다. ID 4 에서 분화된 ID 6, ID 3에서 분화된 ID 7 이 3 세대이며 ID 6에서 분화된 ID 8은 4 세대입니다.
-- 따라서 결과를 ID 에 대해 오름차순 정렬하면 다음과 같아야 합니다.

select 
        c.ID
     -- ,  p.ID
     -- ,  gp.ID
  from 
        ECOLI_DATA c
  inner join
        ECOLI_DATA p on c.PARENT_ID = p.ID
  inner join
        ECOLI_DATA gp on p.PARENT_ID = gp.ID
 where
        c.PARENT_ID is not null
   and  p.PARENT_ID is not null
   and  gp.PARENT_ID is null
 order by
        c.ID
