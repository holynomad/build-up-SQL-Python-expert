# 상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 아이스크림의 총주문량을 총주문량이 작은 순서대로 조회하는 SQL 문을 작성해주세요. 
# 이때 총 주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정해주세요.

select ii.INGREDIENT_TYPE
     , sum(fh.TOTAL_ORDER) as TOTAL_ORDER
  from FIRST_HALF fh
  join ICECREAM_INFO ii on fh.FLAVOR = ii.FLAVOR
 group by ii.INGREDIENT_TYPE
 order by 2
 ;


# CAR_RENTAL_COMPANY_CAR 테이블에서 '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차가 자동차 종류 별로 몇 대인지 출력하는 SQL문을 작성해주세요. 
# 이때 자동차 수에 대한 컬럼명은 CARS로 지정하고, 결과는 자동차 종류를 기준으로 오름차순 정렬해주세요.

