-- goods 시퀀스 생성
CREATE SEQUENCE SEQ_GOODS
START WITH 6
INCREMENT BY 1;

-- goods 시퀀스 제거
DROP SEQUENCE SEQ_GOODS;

-- DB commit
COMMIT;

-- 최근에 커밋한 상태로 되돌리기
ROLLBACK;

-- 상품 목록 조회 (번호 내림차순)
SELECT NO, COVER, TITLE, PRICE FROM GOODS ORDER BY NO DESC;

-- 상품 등록
INSERT INTO "GOODS" VALUES(SEQ_GOODS.NEXTVAL, '피카츄', '10', 'http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/pikachu.png');

-- 상품 검색
SELECT NO, COVER, TITLE, PRICE FROM GOODS WHERE TITLE LIKE '%' || '카' || '%' ORDER BY NO ASC;

-- 상품 삭제
DELETE FROM GOODS WHERE NO = 7;

-- 상품 수정
select * from goods;
rollback;
update goods set title='왕뚜껑 라면', price='11', cover='http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/shop/shop5.png' where no=22;