# 월별 잡은 물고기의 수와 월을 출력하는 SQL문을 작성해주세요.
# 잡은 물고기 수 컬럼명은 FISH_COUNT, 월 컬럼명은 MONTH로 해주세요.
# 결과는 월을 기준으로 오름차순 정렬해주세요.
# 단, 월은 숫자형태 (1~12) 로 출력하며 9 이하의 숫자는 두 자리로 출력하지 않습니다. 잡은 물고기가 없는 월은 출력하지 않습니다.

select  count(*) as FISH_COUNT
     ,  convert(date_format(TIME, '%m'), signed) as MONTH
  from  FISH_INFO
 group  by convert(date_format(TIME, '%m'), signed)
 order by MONTH
 ;


# FISH_INFO에서 평균 길이가 33cm 이상인 물고기들을 종류별로 분류하여 잡은 수, 최대 길이, 물고기의 종류를 출력하는 SQL문을 작성해주세요. 
# 결과는 물고기 종류에 대해 오름차순으로 정렬해주시고, 10cm이하의 물고기들은 10cm로 취급하여 평균 길이를 구해주세요.
# 컬럼명은 물고기의 종류 'FISH_TYPE', 잡은 수 'FISH_COUNT', 최대 길이 'MAX_LENGTH'로 해주세요.

 select  count(ofi.FISH_TYPE) as FISH_COUNT
      ,  max(ofi.LENGTH) as MAX_LENGTH
      ,  ofi.FISH_TYPE
   from  (select avg(LENGTH) as AVG_LENGTH
               , FISH_TYPE
            from FISH_INFO
           group by FISH_TYPE
        ) afi,
        FISH_INFO ofi
  where afi.AVG_LENGTH >= 33
    and afi.FISH_TYPE = ofi.FISH_TYPE
  group by ofi.FISH_TYPE
  order by ofi.FISH_TYPE
  ;


# DEVELOPERS 테이블에서 Python이나 C# 스킬을 가진 개발자의 정보를 조회하려 합니다. 조건에 맞는 개발자의 ID, 이메일, 이름, 성을 조회하는 SQL 문을 작성해 주세요.
# 결과는 ID를 기준으로 오름차순 정렬해 주세요.

# 아래코드는 테스트결과는 성공이지만, 채점실패 (why ??)
select  dev.ID
     ,  dev.EMAIL
     ,  dev.FIRST_NAME
     ,  dev.LAST_NAME
  from  DEVELOPERS  dev
     ,  SKILLCODES  ski
 where  (
            (ski.CODE & dev.SKILL_CODE) = 256 or
            (ski.CODE & dev.SKILL_CODE) = 1024
        )
 order by dev.ID;

# 최종 채점성공...
-- SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
-- FROM DEVELOPERS
-- WHERE (SKILL_CODE & 256) > 0 OR (SKILL_CODE & 1024) > 0
-- ORDER BY ID;

SELECT distinct D.ID
     , D.EMAIL
     , D.FIRST_NAME
     , D.LAST_NAME
  FROM DEVELOPERS D
  JOIN SKILLCODES S ON (D.SKILL_CODE & S.CODE) > 0
 WHERE S.NAME IN ('Python', 'C#') -- 왜 S.NAME in (256, 1024)는 실패뜨지 ?
 ORDER BY D.ID;
