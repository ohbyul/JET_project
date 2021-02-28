<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	--jet 멤버
	DROP TABLE JET_Member;
	CREATE TABLE JET_Member(
	    JET_member_no NUMBER(8),
	    JET_member_id VARCHAR2(100),
	    JET_member_pw VARCHAR2(100),
	    JET_member_name VARCHAR2(100),
	    JET_member_nick VARCHAR2(100),
	    JET_member_sex VARCHAR2(20),
	    JET_member_phone VARCHAR2(100),
	    JET_member_kakao VARCHAR2(100),
	    JET_member_grade NUMBER(30),
	    JET_member_credit NUMBER(30),
	    JET_member_joindate DATE,
	    JET_member_dropoutdate DATE
	);
	DROP SEQUENCE JET_member_seq;
	CREATE SEQUENCE JET_member_seq;
	
	DROP TABLE JET_interest;
	CREATE TABLE JET_interest(
	    JET_interest_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_interest_name VARCHAR2(40)
	);
	
	DROP SEQUENCE JET_interest_seq;
	CREATE SEQUENCE JET_interest_seq;
	
	-- jet 자유게시판
	DROP TABLE JET_board_free;
	CREATE TABLE JET_board_free(
	    JET_board_free_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_board_free_title VARCHAR2(400),
	    JET_board_free_content VARCHAR2(2000),
	    JET_board_free_readcount NUMBER(8),
	    JET_board_free_writedate DATE,
	    JET_board_free_category_no NUMBER(8)
	);
	DROP SEQUENCE JET_board_free_seq;
	CREATE SEQUENCE JET_board_free_seq;
	--자게 리플 테이블
	DROP TABLE Jet_board_free_reple;
	CREATE TABLE Jet_board_free_reple(
	    JET_board_free_reple_no NUMBER(8),
	    JET_board_free_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_board_free_reple_content VARCHAR2(1000),
	    JET_board_free_reple_writedate DATE
	);
	
	DROP SEQUENCE Jet_board_free_reple_seq;
	CREATE SEQUENCE Jet_board_free_reple_seq;
	
	DROP TABLE Jet_board_free_like;
	CREATE TABLE Jet_board_free_like(
	    JET_board_free_like_no NUMBER(8),
	    JET_board_free_no NUMBER(8),
	    JET_member_no NUMBER(8)
	);
	
	DROP SEQUENCE Jet_board_free_like_seq;
	CREATE SEQUENCE Jet_board_free_like_seq;
	
	-- 자게 카테고리 테이블
	DROP TABLE Jet_board_free_category;
	CREATE TABLE Jet_board_free_category(
	    JET_board_free_category_no NUMBER(8),
	    JET_board_free_category_name VARCHAR2(400)
	);
	
	DROP SEQUENCE Jet_board_free_category_seq;
	CREATE SEQUENCE Jet_board_free_category_seq;
	--자게 이미지 테이블
	DROP TABLE Jet_board_free_image;
	CREATE TABLE Jet_board_free_image(
	    JET_board_free_image_no NUMBER(8),
	    JET_board_free_no NUMBER(8),
	    JET_board_free_image_link VARCHAR2(2000)
	);
	
	DROP SEQUENCE Jet_board_free_image_seq;
	CREATE SEQUENCE Jet_board_free_image_seq;
	
	--문의게시판(오별담당)
	DROP TABLE JET_board_m_cs;
	CREATE TABLE JET_board_m_cs(
	    jet_board_m_cs_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_m_cs_title VARCHAR2(100),
	    jet_board_m_cs_content VARCHAR2(2000),
	    jet_board_m_cs_readcount NUMBER(8),
	    jet_board_m_cs_customeremail VARCHAR2(100),
	    jet_board_m_cs_writedate DATE,
	    jet_board_m_cs_category_no NUMBER(8)
	);
	DROP SEQUENCE JET_board_m_cs_seq;
	CREATE SEQUENCE JET_board_m_cs_seq;
	
	--문의게시판 이미지 _m_ 안들어감 ㅜㅜ 넘버랑 링크에
	DROP TABLE JET_board_m_cs_image;
	CREATE TABLE JET_board_m_cs_image(
	    jet_board_cs_image_no NUMBER(8),
	    jet_board_m_cs_no NUMBER(8),
	    jet_board_cs_image_link VARCHAR2(2000)
	);
	DROP SEQUENCE JET_board_m_cs_image_seq;
	CREATE SEQUENCE JET_board_m_cs_image_seq;
	--문의게시판 카테고리
	DROP TABLE JET_board_m_cs_category;
	CREATE TABLE JET_board_m_cs_category(
	    jet_board_m_cs_category_no NUMBER(8),
	    jet_board_m_cs_category_name VARCHAR2(500)
	);
	DROP SEQUENCE JET_board_m_cs_category_seq;
	CREATE SEQUENCE JET_board_m_cs_category_seq;
	
	--CsBoardAnswerVo 관리자답변글 _cs_조회수 빠짐 ㅜㅜ
	DROP TABLE JET_board_a_cs;
	CREATE TABLE JET_board_a_cs(
	    jet_board_a_cs_no NUMBER(8),
	    jet_member_no NUMBER(8), --관리자 본인
	    jet_board_m_cs_no NUMBER(8), --오리지날 넘버 FK
	    jet_board_a_cs_title VARCHAR2(100),
	    jet_board_a_cs_content VARCHAR2(2000),
	    jet_board_a_readcount NUMBER(8),
	    jet_board_a_cs_writedate DATE
	);
	DROP SEQUENCE JET_board_a_cs_seq;
	CREATE SEQUENCE JET_board_a_cs_seq;
	
	--공지사항 게시판
	DROP TABLE JET_board_notice;
	CREATE TABLE JET_board_notice(
	    jet_board_notice_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_notice_title VARCHAR2(100),
	    jet_board_notice_content VARCHAR2(2000),
	    jet_board_notice_readcount NUMBER(8),
	    jet_board_notice_writedate DATE
	);
	DROP SEQUENCE JET_board_notice_seq;
	CREATE SEQUENCE JET_board_notice_seq;
	--공지사항 리플
	DROP TABLE JET_board_notice_reple;
	CREATE TABLE JET_board_notice_reple(
	    jet_notice_reple_no NUMBER(8),
	    jet_board_notice_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_notice_reple_content VARCHAR2(2000),
	    jet_notice_reple_writedate DATE
	);
	DROP SEQUENCE JET_board_notice_reple_seq;
	CREATE SEQUENCE JET_board_notice_reple_seq;
	--공지사항 추천 좋아요 테이블
	DROP TABLE JET_board_notice_like;
	CREATE TABLE JET_board_notice_like(
	    jet_board_notice_like_no NUMBER(8),
	    jet_board_notice_no NUMBER(8),
	    jet_member_no NUMBER(8)
	);
	DROP SEQUENCE JET_board_notice_like_seq;
	CREATE SEQUENCE JET_board_notice_like_seq;
	--공지사항 이미지..
	DROP TABLE JET_board_notice_image;
	CREATE TABLE JET_board_notice_image(
	    jet_board_notice_image_no NUMBER(8),
	    jet_board_notice_no NUMBER(8),
	    jet_board_notice_image_link VARCHAR2(2000)
	);
	DROP SEQUENCE JET_board_notice_image_seq;
	CREATE SEQUENCE JET_board_notice_image_seq;
	
	--배정 테이블 관리자...
	DROP TABLE JET_assign;
	CREATE TABLE JET_assign (
	    jet_assign_no NUMBER(8),
	    jet_board_m_cs_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_assign_date DATE
	);
	DROP SEQUENCE JET_assign_seq;
	CREATE SEQUENCE JET_assign_seq;
	
	
	--팁과 노하우 쿼리
	-- 노하우 게시판 생성
	DROP TABLE JET_board_knowhow;
	CREATE TABLE JET_board_knowhow (
	    JET_board_knowhow_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_board_knowhow_title VARCHAR2(400),
	    JET_board_knowhow_content VARCHAR2(2000),
	    JET_board_knowhow_readcount NUMBER(8),
	    JET_board_knowhow_writedate DATE,
	    jet_board_knowhow_category_no NUMBER(8)
	);
	DROP SEQUENCE JET_board_knowhow_seq;
	CREATE SEQUENCE JET_board_knowhow_seq;
	
	-- 노하우 게시판 리플
	DROP TABLE jet_board_knowhow_reple;
	CREATE TABLE jet_board_knowhow_reple (
	    jet_board_knowhow_reple_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_knowhow_no NUMBER(8),
	    jet_board_knowhow_reple_cont VARCHAR2(1000),
	    jet_board_knowhow_reple_date DATE
	);
	
	DROP SEQUENCE jet_board_knowhow_reple_seq;
	CREATE SEQUENCE jet_board_knowhow_reple_seq;
	
	-- 노하우게시글 카테고리
	DROP TABLE jet_board_knowhow_category;
	CREATE TABLE jet_board_knowhow_category(
	    jet_board_knowhow_category_no NUMBER(8),
	    jet_board_knowhow_category_nam VARCHAR2(100)
	);
	DROP SEQUENCE jet_board_knowhow_category_seq;
	CREATE SEQUENCE jet_board_knowhow_category_seq;
	
	INSERT INTO jet_board_knowhow_category VALUES (
	    1,
	    '꿀팁'
	);
	
	INSERT INTO jet_board_knowhow_category VALUES (
	    2,
	    '노하우'
	);
	
	INSERT INTO jet_board_knowhow_category VALUES (
	    3,
	    '기타'
	);
	-- 노하우게시판 좋아요 테이블
	DROP TABLE jet_board_knowhow_like;
	CREATE TABLE jet_board_knowhow_like (
	    jet_board_knowhow_like_no NUMBER(8),
	    jet_board_knowhow_no NUMBER(8),
	    jet_member_no NUMBER(8)
	);
	
	DROP SEQUENCE jet_board_knowhow_like_seq;
	CREATE SEQUENCE jet_board_knowhow_like_seq;
	
	-- 이미지 테이블 생성
	DROP TABLE JET_board_knowhow_image;
	CREATE TABLE JET_board_knowhow_image(
	    JET_board_knowhow_image_no NUMBER(8),
	    JET_board_knowhow_no NUMBER(8),
	    JET_board_knowhow_image_link VARCHAR2(400)
	);
	
	DROP SEQUENCE JET_board_knowhow_image_seq;
	CREATE SEQUENCE JET_board_knowhow_image_seq;
	
	--여행지 리뷰 테이블
	DROP TABLE JET_board_review;
	CREATE TABLE JET_board_review(
	    JET_board_review_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_board_review_title VARCHAR2(400),
	    JET_board_review_content VARCHAR2(2000),
	    JET_board_review_readcount NUMBER(8),
	    JET_board_review_writedate DATE,
	    JET_board_review_category_no NUMBER(8)
	);
	
	DROP SEQUENCE JET_board_review_seq;
	CREATE SEQUENCE JET_board_review_seq;
	--여행지 리뷰 테이블 댓글
	DROP TABLE JET_board_review_reple;
	CREATE TABLE JET_board_review_reple(
	    JET_board_review_reple_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_board_review_no NUMBER(8),
	    JET_board_review_reple_content VARCHAR2(2000),
	    JET_board_review_reple_date DATE
	);
	DROP SEQUENCE JET_board_review_reple_seq;
	CREATE SEQUENCE JET_board_review_reple_seq;
	
	--여행지 리뷰 테이블 사진
	DROP TABLE JET_board_review_image;
	CREATE TABLE JET_board_review_image(
	    jet_board_review_image_no NUMBER(8),
	    jet_board_review_no NUMBER(8),
	    jet_board_review_image_link VARCHAR(2000)
	);
	DROP SEQUENCE JET_board_review_image_seq;
	CREATE SEQUENCE JET_board_review_image_seq;
	
	--리뷰 좋아요
	DROP TABLE JET_board_review_like;
	CREATE TABLE JET_board_review_like(
	    jet_board_review_like_no NUMBER(8),
	    jet_board_review_no NUMBER(8),
	    jet_member_no NUMBER(8)
	);
	DROP SEQUENCE JET_board_review_like_seq;
	CREATE SEQUENCE JET_board_Review_like_seq;
	
	--리뷰 지도
	DROP TABLE JET_board_review_map;
	CREATE TABLE JET_board_review_map(
	    jet_board_review_map_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_review_no NUMBER(8),
	    jet_board_review_map_latitude NUMBER(30),
	    jet_board_review_map_longitude NUMBER(30)
	);
	
	DROP SEQUENCE JET_board_review_map_seq;
	CREATE SEQUENCE JET_board_review_map_seq;
	--리뷰 카테고리
	DROP TABLE JET_board_review_category;
	CREATE TABLE JET_board_review_category(
	    jet_board_review_category_no NUMBER(8),
	    jet_board_review_category_name VARCHAR2(40)
	);
	
	DROP SEQUENCE JET_board_review_category_seq;
	CREATE SEQUENCE JET_board_review_category_seq;
	
	
	-- 쪽지 테이블
	DROP TABLE JET_message;
	CREATE TABLE JET_message(
	    JET_message_no NUMBER(8),
	    JET_member_sender NUMBER(8),
	    JET_member_receiver NUMBER(8),
	    JET_message_title VARCHAR2(200),
	    JET_message_content VARCHAR2(3000),
	    JET_message_senddate DATE,
	    JET_message_opendate DATE
	);
	
	DROP SEQUENCE JET_message_seq;
	CREATE SEQUENCE JET_message_seq;
	
	--친구 추가, 삭제 관련 테이블
	DROP TABLE JET_friends;
	CREATE TABLE JET_friends(
	    JET_friends_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_friends_member_no NUMBER(8),
	    JET_friends_addDate DATE
	);
	
	DROP SEQUENCE JET_friends_seq;
	CREATE SEQUENCE JET_friends_seq;
	
	--여행 계획 디테일
	DROP TABLE JET_board_tp_detail;
	CREATE TABLE JET_board_tp_detail(
	    jet_board_tp_detail_no NUMBER(8),   --PK
	    jet_board_travelplan_no NUMBER(8), --FK
	    jet_board_tp_detail_ctgr_no NUMBER(8),
	    jet_board_tp_detail_latitude NUMBER, --위도
	    jet_board_tp_detail_longitude NUMBER,    --경도
	    jet_board_tp_detail_day NUMBER(8),
	    jet_board_tp_detail_starthours NUMBER(8),
	    jet_board_tp_detail_startmin NUMBER(8),
	    jet_board_tp_detail_placename VARCHAR2(100),
	    jet_board_tp_detail_adress VARCHAR2(1000),
	    jet_board_tp_detail_content VARCHAR2(2000)
	);
	
	DROP SEQUENCE JET_board_tp_detail_seq;
	CREATE SEQUENCE JET_board_tp_detail_seq;
	DROP SEQUENCE JET_board_tp_detail_seq;
	CREATE SEQUENCE JET_board_tp_detail_seq;
	commit;
	--여행계획 한줄 카테고리 뜯어낸거
	DROP TABLE JET_board_tp_detail_ctgr;
	CREATE TABLE JET_board_tp_detail_ctgr(
	    jet_board_tp_detail_ctgr_no NUMBER(8),
	    jet_board_tp_detail_ctgr_name VARCHAR2(100)
	);
	DROP SEQUENCE JET_board_tp_detail_ctgr_seq;
	CREATE SEQUENCE JET_board_tp_detail_ctgr_seq;
	
	INSERT INTO jet_board_tp_detail_ctgr VALUES(1,'관광지');
	INSERT INTO jet_board_tp_detail_ctgr VALUES(2,'액티비티');
	INSERT INTO jet_board_tp_detail_ctgr VALUES(3,'맛집');
	INSERT INTO jet_board_tp_detail_ctgr VALUES(4,'카페');
	INSERT INTO jet_board_tp_detail_ctgr VALUES(5,'힐링');
	INSERT INTO jet_board_tp_detail_ctgr VALUES(6,'숙소');
	--여행 계획 게시물 (30글자 안넘어서 생성완료)
	DROP TABLE JET_board_travelplan;
	CREATE TABLE JET_board_travelplan(--Y, N을 만들고 프라이머리 키 가지고 엮는 방식으로 공유
	    jet_board_travelplan_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_travelplan_title VARCHAR2(100),
	    jet_travelplan_sharestatus VARCHAR2(10),
	    jet_board_travelplan_writedate DATE
	);
	DROP SEQUENCE JET_board_travelplan_seq;
	CREATE SEQUENCE JET_board_travelplan_seq;
	UPDATE jet_board_travelplan SET JET_travelplan_sharestatus = 'N' WHERE JET_board_travelplan_no = 2;
	SELECT * FROM JET_board_travelplan;
	SELECT * FROM jet_board_shareplan;
	SELECT * FROM jet_board_travelplan WHERE jet_travelplan_sharestatus = 'Y' ORDER BY jet_board_travelplan_no DESC;
	commit;
	
	--여행 파티 찾기 
	DROP TABLE JET_board_party;
	CREATE TABLE JET_board_party(
	    jet_board_party_no NUMBER(8),
	    jet_member_no NUMBER(8),    --FK
	    jet_board_travelplan_no NUMBER(8),  --FK
	    jet_board_party_title VARCHAR2(100),
	    jet_board_party_content VARCHAR2(2000),
	    jet_board_party_readcount NUMBER(8),
	    jet_board_party_headcount NUMBER(8),
	    jet_board_party_fixcount NUMBER(8),
	    jet_board_party_startgather DATE,
	    jet_board_party_endgather DATE,
	    jet_board_party_tsday DATE,
	    jet_board_party_writedate DATE
	);
	DROP SEQUENCE JET_board_party_seq;
	CREATE SEQUENCE JET_board_party_seq;
	--여행 파티 찾기 이미지
	DROP TABLE JET_board_party_image;
	CREATE TABLE JET_board_party_image(
	    jet_board_party_image_no NUMBER(8),
	    jet_board_party_no NUMBER(8),
	    jet_board_party_image_link VARCHAR2(2000)
	);
	DROP SEQUENCE JET_board_party_image_seq;
	CREATE SEQUENCE JET_board_party_image_seq;
	--여행 파티 찾기 참여 (댓글) 글자수 초과로 _board_뺏습니다.
	DROP TABLE JET_party_attend;
	CREATE TABLE JET_party_attend( 
	    jet_party_attend_no NUMBER(8),
	    jet_board_party_no NUMBER(8),   --FK
	    jet_member_no NUMBER(8),    --FK
	    jet_party_attend_content VARCHAR2(2000),
	    jet_party_attend_state_no NUMBER(8),
	    jet_party_attend_writedate DATE
	);
	DROP SEQUENCE JET_party_attend_seq;
	CREATE SEQUENCE JET_party_attend_seq;
	--여행 파티 찾기 참여 상태  글자수 초과로 _board_뺏습니다.
	DROP TABLE JET_party_attend_state;
	CREATE TABLE JET_party_attend_state(
	    jet_party_attend_state_no NUMBER(8),
	    jet_party_attend_state_name VARCHAR2(1000)
	);
	DROP SEQUENCE JET_party_attend_state_seq;
	CREATE SEQUENCE JET_party_attend_state_seq;
	
	--추가 쿼리
	INSERT INTO JET_party_attend_state VALUES(1,'Hold');
	INSERT INTO JET_party_attend_state VALUES(2,'Y');
	INSERT INTO JET_party_attend_state VALUES(3,'N');
	commit;
	--공유 게시판
	DROP TABLE JET_board_shareplan;
	CREATE TABLE JET_board_shareplan(
	    JET_board_shareplan_no NUMBER(8),
	    JET_member_no NUMBER(8),
	    JET_board_travelplan_no NUMBER(8),
	    JET_board_shareplan_title VARCHAR2(200),
	    JET_board_shareplan_content VARCHAR2(2000),
	    JET_board_shareplan_readcount NUMBER(30),
	    JET_board_shareplan_writedate DATE,
	    JET_board_shareplan_category NUMBER(8)
	);
	
	DROP SEQUENCE JET_board_shareplan_seq;
	CREATE SEQUENCE JET_board_shareplan_seq;
	
	DROP TABLE JET_board_shareplan_image;
	CREATE TABLE JET_board_shareplan_image(
	    JET_board_shareplan_image_no NUMBER(8),
	    JET_board_shareplan_no NUMBER(8),
	    JET_board_shareplan_image_link VARCHAR2(200)
	);
	DROP SEQUENCE JET_board_shareplan_image_seq;
	CREATE SEQUENCE JET_board_shareplan_image_seq;
	
	
	DROP TABLE JET_board_shareplan_reple;
	CREATE TABLE JET_board_shareplan_reple(
	    jet_shareplan_reple_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_shareplan_no NUMBER(8),
	    jet_shareplan_reple_content VARCHAR(2000),
	    jet_shareplan_reple_writedate DATE    
	);
	DROP SEQUENCE JET_board_shareplan_reple_seq;
	CREATE SEQUENCE JET_board_shareplan_reple_seq;
	
	DROP TABLE JET_board_shareplan_like;
	CREATE TABLE JET_board_shareplan_like(
	    JET_board_shareplan_like_no NUMBER(8),
	    JET_board_shareplan_no NUMBER(8),
	    JET_member_no NUMBER(8)
	);
	DROP SEQUENCE JET_board_shareplan_like_seq;
	CREATE SEQUENCE JET_board_shareplan_like_seq;
	
	-- 원데이 클래스 
	DROP TABLE jet_class;
	CREATE TABLE jet_class (
	    jet_class_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_class_category_no NUMBER(8),
	    jet_class_name VARCHAR2(400),
	    jet_class_content VARCHAR2(2000),
	    jet_class_latitude NUMBER,
	    jet_class_longitude NUMBER,
	    jet_class_price NUMBER,
	    jet_class_totaltime NUMBER,
	    jet_class_max_headcount NUMBER,
	    jet_class_address VARCHAR2 (400),
	    jet_class_writedate DATE
	    
	);
	
	DROP SEQUENCE jet_class_seq;
	CREATE SEQUENCE jet_class_seq;
	
	DROP TABLE jet_class_reservation;
	CREATE TABLE jet_class_reservation(
	    jet_class_reservation_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_class_detail_no NUMBER(8),
	    jet_class_reservation_date DATE
	);
	
	DROP SEQUENCE jet_class_reservation_seq;
	CREATE SEQUENCE jet_class_reservation_seq;
	
	DROP TABLE jet_class_detail;
	CREATE TABLE jet_class_detail(
	    jet_class_detail_no NUMBER(8),
	    jet_class_no NUMBER(8),
	    jet_class_detail_date DATE
	);
	
	DROP SEQUENCE jet_class_detail_seq;
	CREATE SEQUENCE jet_class_detail_seq;
	
	DROP TABLE jet_class_image;
	CREATE TABLE jet_class_image (
	   jet_class_image_no NUMBER(8),
	   jet_class_no NUMBER(8),
	   jet_class_image_link VARCHAR2(800)
	);
	
	DROP SEQUENCE jet_class_image_seq;
	CREATE SEQUENCE jet_class_image_seq;
	
	DROP TABLE jet_class_category;
	CREATE TABLE jet_class_category(
	    jet_class_category_no NUMBER(8),
	    jet_class_category_name VARCHAR2(400)
	);
	DROP SEQUENCE jet_class_category_seq;
	CREATE SEQUENCE jet_class_category_seq;
	select * from jet_class_category;
	insert into jet_class_category values(1,'관광지');
	insert into jet_class_category values(2,'액티비티');
	insert into jet_class_category values(3,'올레길 걷기');
	--클래스 신고
	DROP TABLE jet_board_class_singo;
	CREATE TABLE jet_board_class_singo(
	    jet_board_class_singo_no NUMBER(8),
	    jet_board_class_detail_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_class_singo_reason VARCHAR2(2000),
	    jet_board_class_singo_date DATE
	);
	DROP SEQUENCE jet_board_class_singo_seq;
	CREATE SEQUENCE jet_board_class_singo_seq;
	--찜하기
	DROP TABLE JET_board_pick;
	CREATE TABLE JET_board_pick(
	    jet_board_pick_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_shareplan_no NUMBER(8)
	);
	DROP SEQUENCE JET_board_pick_seq;
	CREATE SEQUENCE JET_board_pick_seq;
	
	INSERT INTO jet_board_free_category VALUES( 1, '일상');
	INSERT INTO jet_board_free_category VALUES( 2, '잡담');
	INSERT INTO jet_board_free_category VALUES( 3, '수다');
	INSERT INTO JET_party_attend_state VALUES(1,'hold');
	INSERT INTO JET_party_attend_state VALUES(2,'approve');
	INSERT INTO JET_party_attend_state VALUES(3,'reject');
	
	--파티찾기 신고
	DROP TABLE JET_board_party_singo;
	CREATE TABLE JET_board_party_singo(
	    jet_board_party_singo_no NUMBER(8),
	    jet_board_party_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_party_singo_reason VARCHAR2(2000),
	    jet_board_party_singo_date DATE
	);
	DROP SEQUENCE JET_board_party_singo_seq;
	CREATE SEQUENCE JET_board_party_singo_seq;
	
	--공지사항 신고
	DROP TABLE JET_board_notice_singo;
	CREATE TABLE JET_board_notice_singo(
	    jet_board_notice_singo_no NUMBER(8),
	    jet_board_notice_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_notice_singo_reason VARCHAR2(2000),
	    jet_board_notice_singo_date DATE
	);
	DROP SEQUENCE JET_board_notice_singo_seq;
	CREATE SEQUENCE JET_board_notice_singo_seq;
	-- 원데이클래스 리뷰 테이블
	DROP TABLE jet_class_review;
	CREATE TABLE jet_class_review (
	    jet_class_review_no NUMBER(8),
	    jet_class_detail_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_class_review_star_rating NUMBER(2,1),
	    jet_class_review_content VARCHAR2(800),
	    jet_class_review_writedate DATE
	);
	
	DROP SEQUENCE jet_class_review_seq;
	CREATE SEQUENCE jet_class_review_seq;
	--회원 관리 활동 상태
	DROP TABLE jet_member_status;--memberStatusVo
	CREATE TABLE jet_member_status(
	    jet_member_status_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_member_status_active VARCHAR2(20),--활동중 N Y
	    jet_stopstate_period_no NUMBER,--정지됨 <- 기간 연결
	    jet_stopstate_reason_no NUMBER, --정지 사유
	    jet_member_status_updateday DATE
	);
	DROP SEQUENCE jet_member_status_seq;
	CREATE SEQUENCE jet_member_status_seq;
	
	-- 회원 관리 정지 사유
	DROP TABLE jet_stopstate_reason;
	CREATE TABLE jet_stopstate_reason(--memberStopReasonVo
	    jet_stopstate_reason_no NUMBER,
	    jet_stopstate_reason_detail VARCHAR2(1000)
	);
	
	DROP SEQUENCE jet_stopstate_reason_seq;
	CREATE SEQUENCE jet_stopstate_reason_seq;
	INSERT INTO jet_stopstate_reason VALUES(0,'사유 없음');
	INSERT INTO jet_stopstate_reason VALUES(1,'비정상적인 접근 및 사용');
	INSERT INTO jet_stopstate_reason VALUES(2,'다수의 성희롱 행위 적발');
	INSERT INTO jet_stopstate_reason VALUES(3,'다수의 폭력적인 언어 사용 적발');
	INSERT INTO jet_stopstate_reason VALUES(4,'무분별한 게시물 도배');
	
	--정지기간
	DROP TABLE jet_stopstate_period;
	CREATE TABLE jet_stopstate_period(--memberStopPeriodVo
	    jet_stopstate_period_no NUMBER,
	    jet_stopstate_period_name VARCHAR2(20)
	);
	DROP SEQUENCE jet_stopstate_period_seq;
	CREATE SEQUENCE jet_stopstate_period_seq;
	
	INSERT INTO jet_stopstate_period VALUES(0,'정지 해제');
	INSERT INTO jet_stopstate_period VALUES(1,'1일 정지');
	INSERT INTO jet_stopstate_period VALUES(7,'7일 정지');
	INSERT INTO jet_stopstate_period VALUES(30,'30일 정지');
	INSERT INTO jet_stopstate_period VALUES(999,'영구 정지');
	
	
	--멤버 프로필 이미지 테이블
	DROP TABLE JET_member_image;
	CREATE TABLE JET_member_image(
	    jet_member_image_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_member_image_link VARCHAR2(2000)
	);
	
	DROP SEQUENCE JET_member_image_seq;
	CREATE SEQUENCE JET_member_image_seq;
	--파티 채팅 테이블
	DROP TABLE JET_party_chat;
	CREATE TABLE JET_party_chat(
	    jet_party_chat_no NUMBER(8),
	    jet_member_no NUMBER(8), --fk
	    jet_board_party_no NUMBER(8),   --fk
	    jet_party_chat_content VARCHAR2(2000),
	    jet_party_chat_writedate DATE
	);
	DROP SEQUENCE JET_party_chat_seq;
	CREATE SEQUENCE JET_party_chat_seq;
	-- 노하우게시판 신고
	DROP TABLE JET_board_knowhow_singo;
	CREATE TABLE JET_board_knowhow_singo(
	    jet_board_knowhow_singo_no NUMBER(8),
	    jet_board_knowhow_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_knowhow_singo_reason VARCHAR2(2000),
	    jet_board_knowhow_singo_date DATE
	);
	DROP SEQUENCE JET_board_knowhow_singo_seq;
	CREATE SEQUENCE JET_board_knowhow_singo_seq;
	
	DROP TABLE jet_member_upgrade;
	CREATE TABLE jet_member_upgrade(
	    jet_member_upgrade_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_member_upgrade_date date,
	    jet_member_upgrade_check VARCHAR2(40)
	);
	DROP SEQUENCE jet_member_upgrade_seq;
	CREATE SEQUENCE jet_member_upgrade_seq;
	
	--자유게시판 신고 테이블
	DROP TABLE JET_board_free_report;
	CREATE TABLE JET_board_free_report(
	    jet_board_free_report_no NUMBER(8),
	    jet_board_free_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_free_report_reason VARCHAR2(2000),
	    jet_board_free_report_date DATE
	);
	DROP SEQUENCE jet_board_free_report_seq;
	CREATE SEQUENCE jet_board_free_report_seq;
	
	--원데이클래스 찜 기능
	DROP TABLE JET_class_pick;
	CREATE TABLE JET_class_pick(
	    jet_class_pick_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_class_detail_no NUMBER(8)
	);
	DROP SEQUENCE JET_class_pick_seq;
	CREATE SEQUENCE JET_class_pick_seq;
	DROP TABLE JET_board_shareplan_report;
	CREATE TABLE JET_board_shareplan_report(
	    jet_board_share_report_no NUMBER(8),
	    jet_board_shareplan_no NUMBER(8),
	    jet_member_no NUMBER(8),
	    jet_board_share_report_reason VARCHAR2 (2000),
	    jet_board_share_report_date DATE
	);
	DROP SEQUENCE JET_board_shareplan_report_seq;
	CREATE SEQUENCE JET_board_shareplan_report_seq;