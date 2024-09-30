# MEMBER_PROFILE 테이블에서 생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요. 
# 이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고, 결과는 회원ID를 기준으로 오름차순 정렬해주세요.

select MEMBER_ID
     , MEMBER_NAME
     , GENDER
     , date_format(DATE_OF_BIRTH, '%Y-%m-%d') as DATE_OF_BIRTH
  from MEMBER_PROFILE
 where TLNO is not null
   and MONTH(DATE_OF_BIRTH) = 3
   and GENDER = 'W'
 order by MEMBER_ID
 ;


# '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 출력하는 SQL문을 작성해주세요.
# 결과는 출판일을 기준으로 오름차순 정렬해주세요.

select b.BOOK_ID
     , au.AUTHOR_NAME
     , date_format(b.PUBLISHED_DATE, '%Y-%m-%d') as PUBLISHED_DATE
  from BOOK b
  join AUTHOR au on b.AUTHOR_ID = au.AUTHOR_ID
 where b.CATEGORY = '경제'
 order by b.PUBLISHED_DATE
 ;


