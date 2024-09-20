# HR_DEPARTMENT, HR_EMPLOYEES, HR_GRADE 테이블을 이용해 사원별 성과금 정보를 조회하려합니다. 
# 평가 점수별 등급과 등급에 따른 성과금 정보가 아래와 같을 때, 사번, 성명, 평가 등급, 성과금을 조회하는 SQL문을 작성해주세요.
# 평가등급의 컬럼명은 GRADE로, 성과금의 컬럼명은 BONUS로 해주세요.
# 결과는 사번 기준으로 오름차순 정렬해주세요.

select avgrd.EMP_NO
     , emp.EMP_NAME
     , avgrd.GRADE
     , case when avgrd.GRADE = 'S' then emp.SAL * 0.2
            when avgrd.GRADE = 'A' then emp.SAL * 0.15
            when avgrd.GRADE = 'B' then emp.SAL * 0.1
            else 0 end as BONUS
from
    (
    select grd.EMP_NO
         , case when avg(grd.SCORE) >= 96 then 'S'
                when avg(grd.SCORE) >= 90 then 'A'
                when avg(grd.SCORE) >= 80 then 'B'
                else 'C' end as GRADE
      from HR_GRADE grd
     group by grd.EMP_NO
    ) avgrd
    , HR_EMPLOYEES emp
where avgrd.EMP_NO = emp.EMP_NO
order by avgrd.EMP_NO
;


# HR_DEPARTMENT와 HR_EMPLOYEES 테이블을 이용해 부서별 평균 연봉을 조회하려 합니다. 
# 부서별로 부서 ID, 영문 부서명, 평균 연봉을 조회하는 SQL문을 작성해주세요.
# 평균연봉은 소수점 첫째 자리에서 반올림하고 컬럼명은 AVG_SAL로 해주세요.
# 결과는 부서별 평균 연봉을 기준으로 내림차순 정렬해주세요.

select avgdept.DEPT_ID
     , avgdept.DEPT_NAME_EN
     , round(avgdept.AVG_SAL, 0) as AVG_SAL
  from 
        (
            select dept.DEPT_ID
                 , dept.DEPT_NAME_EN
                 , avg(emp.SAL) as AVG_SAL
              from HR_DEPARTMENT dept 
                   inner join HR_EMPLOYEES emp on dept.DEPT_ID = emp.DEPT_ID
             group by dept.DEPT_ID
        ) avgdept
 order by AVG_SAL desc
 ;
