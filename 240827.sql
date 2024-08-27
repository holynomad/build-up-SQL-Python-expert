# DEVELOPER_INFOS 테이블에서 Python 스킬을 가진 개발자의 정보를 조회하려 합니다. Python 스킬을 가진 개발자의 ID, 이메일, 이름, 성을 조회하는 SQL 문을 작성해 주세요.
# 결과는 ID를 기준으로 오름차순 정렬해 주세요.

select  ID
     ,  EMAIL
     ,  FIRST_NAME
     ,  LAST_NAME
  from  DEVELOPER_INFOS
 where  case when SKILL_1 = 'Python' then 1=1
             when SKILL_2 = 'Python' then 1=1
             when SKILL_3 = 'Python' then 1=1
             else 1=0 end
 order  by ID
 ;
