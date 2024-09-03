# 낚시앱에서 사용하는 FISH_INFO 테이블은 잡은 물고기들의 정보를 담고 있습니다. 
# FISH_INFO 테이블의 구조는 다음과 같으며 ID, FISH_TYPE, LENGTH, TIME은 각각 잡은 물고기의 ID, 물고기의 종류(숫자), 잡은 물고기의 길이(cm), 물고기를 잡은 날짜를 나타냅니다.
# 단, 잡은 물고기의 길이가 10cm 이하일 경우에는 LENGTH 가 NULL 이며, LENGTH 에 NULL 만 있는 경우는 없습니다.
# FISH_NAME_INFO 테이블은 물고기의 이름에 대한 정보를 담고 있습니다. FISH_NAME_INFO 테이블의 구조는 다음과 같으며, FISH_TYPE, FISH_NAME 은 각각 물고기의 종류(숫자), 물고기의 이름(문자) 입니다.
# FISH_INFO 테이블에서 잡은 BASS와 SNAPPER의 수를 출력하는 SQL 문을 작성해주세요.
# 컬럼명은 'FISH_COUNT'로 해주세요.

select  count(*) as FISH_COUNT
  from  FISH_INFO fi
        inner join FISH_NAME_INFO fni 
        on fi.FISH_TYPE = fni.FISH_TYPE
 where  fni.FISH_NAME in ('BASS', 'SNAPPER')
;


# 대장균 개체의 ID(ID)와 자식의 수(CHILD_COUNT)를 출력하는 SQL 문을 작성해주세요. 
# 자식이 없다면 자식의 수는 0으로 출력해주세요. 이때 결과는 개체의 ID 에 대해 오름차순 정렬해주세요.

select  par.ID
     ,  case when chi.PARENT_ID is null then 0
             else count(chi.PARENT_ID) end as CHILD_COUNT
  from  ECOLI_DATA par
        left join ECOLI_DATA chi 
        on par.ID = chi.PARENT_ID
 group  by par.ID
 order  by par.ID
 ;


# 대장균 개체의 크기가 100 이하라면 'LOW', 100 초과 1000 이하라면 'MEDIUM', 1000 초과라면 'HIGH' 라고 분류합니다. 
# 대장균 개체의 ID(ID) 와 분류(SIZE)를 출력하는 SQL 문을 작성해주세요.이때 결과는 개체의 ID 에 대해 오름차순 정렬해주세요.

select  ID
     ,  case when SIZE_OF_COLONY <= 100 then 'LOW'
             when SIZE_OF_COLONY > 100 and SIZE_OF_COLONY <= 1000 then 'MEDIUM'
             else 'HIGH' end as SIZE
  from  ECOLI_DATA
 order  by ID
 ;
