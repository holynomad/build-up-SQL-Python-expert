-- 문제) USED_GOODS_BOARD와 USED_GOODS_REPLY 테이블에서 2022년 10월에 작성된 게시글 제목, 게시글 ID, 댓글 ID, 댓글 작성자 ID, 댓글 내용, 댓글 작성일을 조회하는 SQL문을 작성해주세요. 
-- 결과는 댓글 작성일을 기준으로 오름차순 정렬해주시고, 댓글 작성일이 같다면 게시글 제목을 기준으로 오름차순 정렬해주세요.

select ugb.TITLE
     , ugr.BOARD_ID
     , ugr.REPLY_ID
     , ugr.WRITER_ID
     , ugr.CONTENTS
     , DATE_FORMAT(ugr.CREATED_DATE, '%Y-%m-%d') as CREATED_DATE
 from USED_GOODS_BOARD as ugb
   inner join USED_GOODS_REPLY as ugr 
   on ugb.BOARD_ID = ugr.BOARD_ID
where DATE_FORMAT(ugb.CREATED_DATE, '%Y-%m') = '2022-10'
order by ugr.CREATED_DATE asc, ugb.TITLE asc;
