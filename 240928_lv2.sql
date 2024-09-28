# FISH_NAME_INFO에서 물고기의 종류 별 물고기의 이름과 잡은 수를 출력하는 SQL문을 작성해주세요.

# 물고기의 이름 컬럼명은 FISH_NAME, 잡은 수 컬럼명은 FISH_COUNT로 해주세요.
# 결과는 잡은 수 기준으로 내림차순 정렬해주세요.

select count(fi.ID) as FISH_COUNT
     , fni.FISH_NAME as FISH_NAME
  from
       FISH_INFO fi
  join FISH_NAME_INFO fni on fi.FISH_TYPE = fni.FISH_TYPE
 group by fni.FISH_NAME
 order by 1 desc
 ;


# AIR_POLLUTION 테이블에서 수원 지역의 연도 별 평균 미세먼지 오염도와 평균 초미세먼지 오염도를 조회하는 SQL문을 작성해주세요. 
# 이때, 평균 미세먼지 오염도와 평균 초미세먼지 오염도의 컬럼명은 각각 PM10, PM2.5로 해 주시고, 값은 소수 셋째 자리에서 반올림해주세요.
# 결과는 연도를 기준으로 오름차순 정렬해주세요.

select YEAR(ap.YM) as YEAR
     , round(avg(ap.PM_VAL1), 2) as PM10
     , round(avg(ap.PM_VAL2), 2) as `PM2.5`
  from AIR_POLLUTION ap
 where ap.LOCATION2 = '수원'
 group by YEAR(ap.YM)
 order by YEAR(ap.YM)
 ;
