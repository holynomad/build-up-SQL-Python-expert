# 더 이상 업그레이드할 수 없는 아이템의 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력하는 SQL 문을 작성해 주세요. 
# 이때 결과는 아이템 ID를 기준으로 내림차순 정렬해 주세요.

select ii.ITEM_ID
     , ii.ITEM_NAME
     , ii.RARITY
  from ITEM_INFO ii
  left join (
       select distict PARENT_ITEM_ID as EXCEPT_ITEM_ID
         from ITEM_TREE
        where PARENT_ITEM_ID is not null
  ) it
  on ii.ITEM_ID = it.EXCEPT_ITEM_ID
  where it.EXCEPT_ITEM_ID is null
  order by ii.ITEM_ID desc
  ;
