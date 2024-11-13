# 11/7 (목)
# CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 자동차 종류가 '세단'인 자동차들 중 10월에 대여를 시작한 기록이 있는 자동차 ID 리스트를 출력하는 SQL문을 작성해주세요. 
# 자동차 ID 리스트는 중복이 없어야 하며, 자동차 ID를 기준으로 내림차순 정렬해주세요.

select distinct crcc.CAR_ID
  from CAR_RENTAL_COMPANY_CAR crcc
  left join CAR_RENTAL_COMPANY_RENTAL_HISTORY crcrh on crcc.CAR_ID = crcrh.CAR_ID
 where crcc.CAR_TYPE = '세단'
   and date_format(crcrh.START_DATE, '%m') = '10'
 order by crcc.CAR_ID desc
 ;
   
# 11/13 (수)
# 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 
# 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
# 이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.
# 본 문제는 Kaggle의 "Austin Animal Center Shelter Intakes and Outcomes"에서 제공하는 데이터를 사용하였으며 ODbL의 적용을 받습니다.

select ao.ANIMAL_ID
     , ao.NAME
  from ANIMAL_OUTS ao
  join ANIMAL_INS ai on ao.ANIMAL_ID = ai.ANIMAL_ID
 where ao.DATETIME < ai.DATETIME
 order by ai.DATETIME asc
 ;
