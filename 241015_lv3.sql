# 2022년 1월의 카테고리 별 도서 판매량을 합산하고, 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 출력하는 SQL문을 작성해주세요.
# 결과는 카테고리명을 기준으로 오름차순 정렬해주세요.

select b.CATEGORY
     , sum(bs.SALES) as TOTAL_SALES
  from BOOK_SALES bs
  join BOOK b on bs.BOOK_ID = b.BOOK_ID 
 where date_format(bs.SALES_DATE, '%Y-%m') = '2022-01'
 group by b.CATEGORY
 order by b.CATEGORY
 ;



# 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
# 이때 결과는 보호 시작일 순으로 조회해야 합니다.

# 본 문제는 Kaggle의 "Austin Animal Center Shelter Intakes and Outcomes"에서 제공하는 데이터를 사용하였으며 ODbL의 적용을 받습니다.

select ai.NAME
     , ai.DATETIME
  from ANIMAL_INS ai
  left join ANIMAL_OUTS ao on ai.ANIMAL_ID = ao.ANIMAL_ID
 where ao.DATETIME is null
 order by ai.DATETIME
 limit 3
 ;
       
