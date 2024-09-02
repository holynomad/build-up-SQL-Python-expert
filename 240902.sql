# 자동차 종류는 '세단', 'SUV', '승합차', '트럭', '리무진' 이 있습니다. 자동차 옵션 리스트는 콤마(',')로 구분된 키워드 리스트(옵션 리스트 값 예시: '열선시트', '스마트키', '주차감지센서')로 되어있으며, 
# 키워드 종류는 '주차감지센서', '스마트키', '네비게이션', '통풍시트', '열선시트', '후방카메라', '가죽시트' 가 있습니다.
# CAR_RENTAL_COMPANY_CAR 테이블에서 '네비게이션' 옵션이 포함된 자동차 리스트를 출력하는 SQL문을 작성해주세요. 
# 결과는 자동차 ID를 기준으로 내림차순 정렬해주세요.

SELECT  CAR_ID
     ,  CAR_TYPE
     ,  DAILY_FEE
     ,  OPTIONS
  from  CAR_RENTAL_COMPANY_CAR
 where  LOCATE('네비게이션', OPTIONS) > 0
 order  by CAR_ID desc
 ;

# CAR_RENTAL_COMPANY_CAR 테이블에서 자동차 종류가 'SUV'인 자동차들의 평균 일일 대여 요금을 출력하는 SQL문을 작성해주세요. 
# 이때 평균 일일 대여 요금은 소수 첫 번째 자리에서 반올림하고, 컬럼명은 AVERAGE_FEE 로 지정해주세요.

SELECT  round(avg(DAILY_FEE), 0) as AVERAGE_FEE
  from  CAR_RENTAL_COMPANY_CAR
 where  CAR_TYPE = 'SUV'
