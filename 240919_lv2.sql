# HR_DEPARTMENT, HR_EMPLOYEES, HR_GRADE 테이블에서 2022년도 한해 평가 점수가 가장 높은 사원 정보를 조회하려 합니다. 
# 2022년도 평가 점수가 가장 높은 사원들의 점수, 사번, 성명, 직책, 이메일을 조회하는 SQL문을 작성해주세요.
# 2022년도의 평가 점수는 상,하반기 점수의 합을 의미하고, 평가 점수를 나타내는 컬럼의 이름은 SCORE로 해주세요. 

select sort.SCORE
     , sort.EMP_NO
     , sort.EMP_NAME
     , sort.POSITION
     , sort.EMAIL
  from
        (
        select sum(grd.SCORE) as SCORE
             , emp.EMP_NO
             , emp.EMP_NAME
             , emp.POSITION
             , emp.EMAIL
          from HR_EMPLOYEES  emp
             , HR_GRADE      grd
         where grd.YEAR = 2022
           and grd.EMP_NO = emp.EMP_NO
         group by emp.EMP_NO
         order by 1 desc
        ) sort
  limit 1
  ;

