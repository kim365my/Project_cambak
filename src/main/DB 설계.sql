/*
   프로젝트명 : Project_cambak
   작업명 : 프론트엔드 기반 웹작업 및 백엔드 기반 CRUD 구현
   회원가입 테이블명 : cb_user
   후기등록 테이블명 : cb_review
   캠핑카 등록 테이블명 : cb_campingcar
 */

-- 1. 회원가입 테이블
CREATE TABLE cb_user(
    user_id          VARCHAR2(30)            PRIMARY KEY, -- 유저아이디
    user_pw          VARCHAR2(30)            NOT NULL, -- 유저비번
    user_email      VARCHAR2(60)            NOT NULL, -- 유저이메일
    user_tel          VARCHAR2(30)           NOT NULL -- 유저전화번호
);

-- 2. 캠핑카 등록 테이블
CREATE TABLE cb_campingcar(
    campingcar_no              NUMBER      PRIMARY KEY,
    campingcar_name         VARCHAR2(30), -- 상품명
    campingcar_infos          VARCHAR2(200), -- 소개
    campingcar_tel              VARCHAR2(30), -- 전화번호
    campingcar_address       VARCHAR2(200), -- 주소
    campingcar_website       VARCHAR2(200), -- 웹사이트 주소
    campingcar_img             varchar2(2000), -- 사진 주소
    campingcar_option          varchar2(2000), -- 기본 보유시설
    campingcar_rider             number, --동승가능인원
    campingcar_sleeper          number, -- 취침가능인원
    campingcar_release_time  varchar2(200), -- 대여일 출고시간
    campingcar_return_time      varchar2(200), --반납일 반납시간
    campingcar_license              varchar2(200), -- 면허종류
    campingcar_wd_fare          number          NOT NULL, -- 주중요금
    campingcar_ph_fare          number, -- 공휴일 요금
    campingcar_detail           varchar2(2000), -- 상세정보
    user_id  varchar2(30) NOT NULL, -- 유저아이디
        foreign key(user_id) references cb_user(user_id),
    campingcar_cnt number, -- 조회수
    campingcar_regdate varchar2(200) default sysdate, -- 생성일,
    campingcar_imgFolder varchar2(200) -- 이미지 폴더
);
-- 캠핑카 등록 넘버 시퀀스
CREATE SEQUENCE campingcar_no_seq INCREMENT by 1 START with 101;

-- 3. 후기등록 테이블
CREATE TABLE cb_review(
    review_no      NUMBER      PRIMARY KEY, -- 리뷰번호
    review_score  NUMBER      not null, -- 리뷰별점
    review_content    VARCHAR2(2000)  NOT NULL, -- 리뷰내용
    user_id        VARCHAR2(30)      NOT NULL, -- 유저 아이디
        foreign key(user_id) references cb_user(user_id),
    campingcar_no NUMBER NOT NULL, -- 캠핑카 번호
        foreign key(campingcar_no) references cb_campingcar(campingcar_no)
);
-- 리뷰글 번호 시퀀스
CREATE SEQUENCE review_no_seq INCREMENT by 1 START with 1001;

-- 4. 뷰 생성 : 캠핑카 + 리뷰 테이블
Create view cd_deshBoard_view AS
select
    a1.campingcar_no, --게시글 번호
    a1.campingcar_regdate, -- 생성일
    Round(AVG(a2.review_score), 0)  as review_score, -- 평점
    a1.campingcar_cnt, -- 조회수
    a1.user_id,
    a1.campingcar_name,
    a1.campingcar_img, -- 사진 주소
    a1.campingcar_imgFolder
from cb_campingcar a1
    left join cb_review a2 on a1.campingcar_no = a2.campingcar_no
group by a1.campingcar_no, a1.campingcar_regdate, a1.campingcar_cnt, a1.user_id, a1.campingcar_name, a1.campingcar_img, a1.campingcar_imgFolder
ORDER by a1.campingcar_no DESC;


-- 조회구문
select * from cb_user;
select * from cb_review;
select review_no_seq.nextval from dual; 
-- 시퀀스 조회시마다 1씩 증가하니까 수정구문 필요
ALTER SEQUENCE review_no_seq INCREMENT BY -1;

select * from cb_campingcar;
desc cb_campingcar;
select max(campingcar_no) from cb_campingcar;
select CAMPINGCAR_NO_SEQ.nextval from dual;
ALTER SEQUENCE CAMPINGCAR_NO_SEQ INCREMENT BY -1;

select * from cd_deshBoard_view; -- view 조회

-- 삭제구문
drop table cb_user;
drop table cb_review;
drop table cb_campingcar;
drop SEQUENCE review_no_seq;
drop SEQUENCE CAMPINGCAR_NO_SEQ;
drop view cd_deshBoard_view;

-- 데이터 삽입
-- 유저 데이터
insert into cb_user values('ezon', '1111', 'ezon@eamil.com', '01055555555');
-- 리뷰 데이터
insert into cb_review values(review_no_seq.nextval, 5, '리뷰', 'ezon', 106);
insert into cb_review values(review_no_seq.nextval, 5, '리뷰', 'ezon', 103);
insert into cb_review values(review_no_seq.nextval, 1, '리뷰', 'ezon', 107);
insert into cb_review values(review_no_seq.nextval, 5, '리뷰', 'ezon', 107);
insert into cb_review values(review_no_seq.nextval, 5, '리뷰', 'ezon', 107);
insert into cb_review values(review_no_seq.nextval, 1, '리뷰', 'ezon', 107);

-- 캠핑카 데이터
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '캠핑카', '멋진 캠핑카', '01052555555', '주소지','http://naver.com','이미지링크','옵션',1,1,'07:00','18:00','운전면허',1,1,'상세페이지파일링크','ezon', 2, sysdate, 101);
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '캠핑카', '멋진 캠핑카', '01052555555', '주소지','http://naver.com','이미지링크','옵션',1,1,'07:00','18:00','운전면허',1,1,'상세페이지파일링크','ezon', 0, sysdate, 102);
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '캠핑카', '멋진 캠핑카', '01052555555', '주소지','http://naver.com','이미지링크','옵션',1,1,'07:00','18:00','운전면허',1,1,'상세페이지파일링크','ezon', 0, sysdate, 103);

insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '2인승 로디 캠핑카', '2인 캠퍼에게 최적화된 레이 캠핑카', '01052555555', '대한민국 경기도 하남시','http://naver.com','realtime01.jpg, realtime01-detail01.jpg, realtime01-detail02.jpg, realtime01-detail03.jpg, realtime01-detail04.jpg, realtime01-detail05.jpg','옵션1, 옵션2, 옵션3',2,2,'07:00','18:00','2종 보통',95000,95000,'상세페이지파일링크','ezon', 2, sysdate, 101);
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '2인승 로디 캠핑카', '2인 캠퍼에게 최적화된 레이 캠핑카', '01052555555', '대한민국 경기도 하남시','http://naver.com','realtime02.jpg, realtime01-detail01.jpg, realtime01-detail02.jpg, realtime01-detail03.jpg, realtime01-detail04.jpg, realtime01-detail05.jpg','옵션1, 옵션2, 옵션3',2,2,'07:00','18:00','2종 보통',95000,95000,'상세페이지파일링크','ezon', 5, sysdate, 102);
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '2인승 로디 캠핑카', '2인 캠퍼에게 최적화된 레이 캠핑카', '01052555555', '대한민국 경기도 하남시','http://naver.com','realtime03.png, realtime01-detail01.jpg, realtime01-detail02.jpg, realtime01-detail03.jpg, realtime01-detail04.jpg, realtime01-detail05.jpg','옵션1, 옵션2, 옵션3',2,2,'07:00','18:00','2종 보통',95000,95000,'상세페이지파일링크','ezon', 3, sysdate, 103);
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '2인승 로디 캠핑카', '2인 캠퍼에게 최적화된 레이 캠핑카', '01052555555', '대한민국 경기도 하남시','http://naver.com','realtime04.png, realtime01-detail01.jpg, realtime01-detail02.jpg, realtime01-detail03.jpg, realtime01-detail04.jpg, realtime01-detail05.jpg','옵션1, 옵션2, 옵션3',2,2,'07:00','18:00','2종 보통',95000,95000,'상세페이지파일링크','ezon', 7, sysdate, 104);
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '2인승 로디 캠핑카', '2인 캠퍼에게 최적화된 레이 캠핑카', '01052555555', '대한민국 경기도 하남시','http://naver.com','realtime05.jpeg, realtime01-detail01.jpg, realtime01-detail02.jpg, realtime01-detail03.jpg, realtime01-detail04.jpg, realtime01-detail05.jpg','옵션1, 옵션2, 옵션3',2,2,'07:00','18:00','2종 보통',95000,95000,'상세페이지파일링크','ezon', 50, sysdate, 105);
insert into cb_campingcar values(CAMPINGCAR_NO_SEQ.nextval, '2인승 로디 캠핑카', '2인 캠퍼에게 최적화된 레이 캠핑카', '01052555555', '대한민국 경기도 하남시','http://naver.com','realtime06.jpg, realtime01-detail01.jpg, realtime01-detail02.jpg, realtime01-detail03.jpg, realtime01-detail04.jpg, realtime01-detail05.jpg','옵션1, 옵션2, 옵션3',2,2,'07:00','18:00','2종 보통',95000,95000,'상세페이지파일링크','ezon', 1, sysdate, 106);

-- 유저 로그인 정보 조회
select count(max(user_id)) from cb_user where user_id='ezon' and user_pw='111' group by user_id;

delete from cb_review where review_no = 1034;
commit;

-- up
update cb_user set  user_pw = '1111' where user_id = 'ezon';
