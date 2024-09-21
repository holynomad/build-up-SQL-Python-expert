# 다음은 어느 의류 쇼핑몰의 온라인 상품 판매 정보를 담은 ONLINE_SALE 테이블 입니다. 
# ONLINE_SALE 테이블은 아래와 같은 구조로 되어있으며 
# ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE는 각각 온라인 상품 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일을 나타냅니다.

# ONLINE_SALE 테이블에서 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여, 재구매한 회원 ID와 재구매한 상품 ID를 출력하는 SQL문을 작성해주세요. 
# 결과는 회원 ID를 기준으로 오름차순 정렬해주시고 회원 ID가 같다면 상품 ID를 기준으로 내림차순 정렬해주세요.

select USER_ID
     , PRODUCT_ID
  from ONLINE_SALE
 group by USER_ID      -- 동일한 회원이
        , PRODUCT_ID   -- 동일한 상품에 대해
 having count(PRODUCT_ID) >= 2  -- 재구매한 이력 있음
 order by USER_ID
        , PRODUCT_ID desc
 ;
