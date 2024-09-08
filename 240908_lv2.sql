# 아이템의 희귀도가 'RARE'인 아이템들의 모든 다음 업그레이드 아이템의 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME), 아이템의 희귀도(RARITY)를 출력하는 SQL 문을 작성해 주세요. 
# 이때 결과는 아이템 ID를 기준으로 내림차순 정렬주세요.
# 아이템의 희귀도가 'RARE'인 아이템은 'ITEM_A', 'ITEM_B', 'ITEM_D', 'ITEM_E' 입니다.
# 이 중 'ITEM_A' 는 'ITEM_B', 'ITEM_C' 로 업그레이드가 가능하며 'ITEM_B' 는 'ITEM_D' , 'ITEM_E' 로 업그레이드가 가능합니다. 
# 'ITEM_D' 와 'ITEM_E'는 더 이상 업그레이드가 가능하지 않습니다. 따라서 결과는 다음과 같이 나와야 합니다.

select ii.ITEM_ID
     , ii.ITEM_NAME
     , ii.RARITY
  from ITEM_TREE it 
     , ITEM_INFO ii
 where it.PARENT_ITEM_ID is not null
   and it.ITEM_ID = ii.ITEM_ID
 order by ii.ITEM_ID desc
 ;
