# FOOD_ORDER 테이블에서 2022년 5월 1일을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부를 조회하는 SQL문을 작성해주세요. 
# 출고여부는 2022년 5월 1일까지 출고완료로 이 후 날짜는 출고 대기로 미정이면 출고미정으로 출력해주시고, 결과는 주문 ID를 기준으로 오름차순 정렬해주세요.

select ORDER_ID
     , PRODUCT_ID
     , date_format(OUT_DATE, '%Y-%m-%d') as OUT_DATE
     , case when date_format(OUT_DATE, '%Y-%m-%d') <= '2022-05-01' then '출고완료'
            when date_format(OUT_DATE, '%Y-%m-%d') > '2022-05-01' then '출고대기'
            else '출고미정' end as '출고여부'
  from FOOD_ORDER
 order by ORDER_ID
 ;


# 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 
# 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
# 이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.

TBD
