# ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. ANIMAL_OUTS 테이블 구조는 다음과 같으며, 
# ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 각각 동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다. 
# ANIMAL_OUTS 테이블의 ANIMAL_ID는 ANIMAL_INS의 ANIMAL_ID의 외래 키입니다.
# 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.
# 본 문제는 Kaggle의 "Austin Animal Center Shelter Intakes and Outcomes"에서 제공하는 데이터를 사용하였으며 ODbL의 적용을 받습니다.

SELECT  outs.ANIMAL_ID
     ,  outs.NAME
  FROM  ANIMAL_INS  ins
 INNER JOIN ANIMAL_OUTS outs 
         ON ins.ANIMAL_ID = outs.ANIMAL_ID 
        AND ins.ANIMAL_TYPE = outs.ANIMAL_TYPE
 ORDER  BY  datediff(outs.DATETIME, ins.DATETIME) DESC
 LIMIT  2
 ;


# 다음은 어느 의류 쇼핑몰에서 판매중인 상품들의 정보를 담은 PRODUCT 테이블입니다. 
# PRODUCT 테이블은 아래와 같은 구조로 되어있으며, PRODUCT_ID, PRODUCT_CODE, PRICE는 각각 상품 ID, 상품코드, 판매가를 나타냅니다.
# 상품 별로 중복되지 않는 8자리 상품코드 값을 가지며, 앞 2자리는 카테고리 코드를 의미합니다.
# PRODUCT 테이블에서 상품 카테고리 코드(PRODUCT_CODE 앞 2자리) 별 상품 개수를 출력하는 SQL문을 작성해주세요. 결과는 상품 카테고리 코드를 기준으로 오름차순 정렬해주세요.

SELECT  substring(prd.PRODUCT_CODE, 1, 2) as CATEGORY
     ,  COUNT(*) as PRODUCTS
  FROM  PRODUCT prd
 GROUP  BY substring(prd.PRODUCT_CODE, 1, 2)
 ORDER  BY CATEGORY
 ;
