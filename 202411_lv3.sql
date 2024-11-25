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

# 11/15 (금)
# USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 완료된 중고 거래의 총금액이 70만 원 이상인 사람의 회원 ID, 닉네임, 총거래금액을 조회하는 SQL문을 작성해주세요. 
# 결과는 총거래금액을 기준으로 오름차순 정렬해주세요.

select grp.USER_ID
     , grp.NICKNAME
     , grp.TOTAL_SALES
from (
        select ugu.USER_ID
             , ugu.NICKNAME
             , sum(ugb.PRICE) as TOTAL_SALES
          from USED_GOODS_USER ugu
          join USED_GOODS_BOARD ugb 
            on ugu.USER_ID = ugb.WRITER_ID
           and ugb.STATUS = 'DONE'
         group by ugu.USER_ID
                , ugu.NICKNAME
     ) grp
where grp.TOTAL_SALES >= 700000
order by grp.TOTAL_SALES
 ;


# 11/23 (토)
# REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요. 
# 이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.

-- 방법 1: Window Function을 사용한 방법
with RankedRestaurants as (
    select 
        FOOD_TYPE,
        REST_ID,
        REST_NAME,
        FAVORITES,
        RANK() OVER (PARTITION by FOOD_TYPE order by FAVORITES desc) as rnk
    from REST_INFO
)
select 
    FOOD_TYPE,
    REST_ID,
    REST_NAME,
    FAVORITES
from RankedRestaurants
where rnk = 1
order by FOOD_TYPE desc;

-- 방법 2: Correlated Subquery를 사용한 방법
select 
    r1.FOOD_TYPE,
    r1.REST_ID,
    r1.REST_NAME,
    r1.FAVORITES
from REST_INFO r1
where r1.FAVORITES = (
    select MAX(r2.FAVORITES)
      from REST_INFO r2
     where r2.FOOD_TYPE = r1.FOOD_TYPE
)
order by r1.FOOD_TYPE desc;
