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
   
