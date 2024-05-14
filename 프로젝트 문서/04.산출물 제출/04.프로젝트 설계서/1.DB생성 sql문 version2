SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS file;
DROP TABLE IF EXISTS icmtReply;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS cinemaReplyLike;
DROP TABLE IF EXISTS cinemaReply;
DROP TABLE IF EXISTS ticketDetail;
DROP TABLE IF EXISTS screen;
DROP TABLE IF EXISTS cinema;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS screenSeat;
DROP TABLE IF EXISTS screenHall;
DROP TABLE IF EXISTS theater;

-- 게시물정보
CREATE TABLE board
(
	bno int unsigned NOT NULL AUTO_INCREMENT COMMENT '게시물번호',
	btitle varchar(50) NOT NULL COMMENT '게시물제목',
	bcontent text NOT NULL COMMENT '게시물내용',
	brdate timestamp DEFAULT now() NOT NULL COMMENT '게시물등록일',
	bhit int unsigned DEFAULT 0 NOT NULL COMMENT '게시물조회수',
	btype varchar(2) NOT NULL COMMENT '게시물타입',
	bdelyn tinyint unsigned DEFAULT 0 NOT NULL COMMENT '게시물삭제여부',
	mno int unsigned NOT NULL COMMENT '회원번호',
	PRIMARY KEY (bno)
) COMMENT = '게시물정보';


-- 영화정보
CREATE TABLE cinema
(
	cno int unsigned NOT NULL AUTO_INCREMENT COMMENT '영화번호',
	ccode varchar(255) NOT NULL COMMENT '영화코드',
	cname varchar(255) unique NOT NULL COMMENT '영화제목',
	cnameEn varchar(255) COMMENT '영화제목영문',
	cintro text NOT NULL COMMENT '영화소개',
	cprdtYear varchar(15) NOT NULL COMMENT '제작년도',
	cshowTime varchar(15) NOT NULL COMMENT '상영시간',
	copenDate varchar(15) NOT NULL COMMENT '개봉연도',
	cprdtStatNm varchar(50) NOT NULL COMMENT '제작상태',
	cnationNm varchar(255) NOT NULL COMMENT '제작국가명',
	cgenreNm varchar(255) NOT NULL COMMENT '장르명',
	cdirectorNm varchar(255) NOT NULL COMMENT '감독명',
	cdirectorNmEn varchar(255) COMMENT '감독명영문',
	cactorNm varchar(255) NOT NULL COMMENT '배우명',
	cactorNmEn varchar(255) COMMENT '배우명영문',
	ccompanyNm varchar(255) NOT NULL COMMENT '영화사명',
	ccompanyNmEn varchar(255) COMMENT '영화사명영문',
	cwatchGradeNm varchar(50) NOT NULL COMMENT '관람등급',
	crank varchar(5) COMMENT '박스오피스 순위',
	cposter text COMMENT '포스터',
	PRIMARY KEY (cno)
) COMMENT = '영화정보';


-- 영화댓글정보
CREATE TABLE cinemaReply
(
	ccmtno int unsigned NOT NULL AUTO_INCREMENT COMMENT '댓글번호',
	ccmtContent text NOT NULL COMMENT '댓글내용',
	ccmtRdate timestamp DEFAULT now() NOT NULL COMMENT '댓글등록일',
	ccmtLikeCnt int unsigned DEFAULT 0 NOT NULL COMMENT '댓글좋아요개수',
	ccmtDelyn tinyint unsigned DEFAULT 0 NOT NULL COMMENT '댓글삭제여부',
	cno int unsigned NOT NULL COMMENT '영화번호',
	mno int unsigned NOT NULL COMMENT '회원번호',
	PRIMARY KEY (ccmtno)
) COMMENT = '영화댓글정보';


-- 영화댓글좋아요정보
CREATE TABLE cinemaReplyLike
(
	likeno int unsigned NOT NULL AUTO_INCREMENT COMMENT '영화댓글좋아요번호',
	likedelyn tinyint unsigned DEFAULT 0 NOT NULL COMMENT '좋아요취소여부',
	mno int unsigned NOT NULL COMMENT '회원번호',
	ccmtno int unsigned NOT NULL COMMENT '댓글번호',
	PRIMARY KEY (likeno)
) COMMENT = '영화댓글좋아요정보';


-- 파일정보
CREATE TABLE file
(
	fno int unsigned NOT NULL AUTO_INCREMENT COMMENT '파일번호',
	frealNm varchar(255) NOT NULL COMMENT '실제파일이름',
	foriginNm varchar(255) NOT NULL COMMENT '원본파일이름',
	frdate timestamp DEFAULT now() NOT NULL COMMENT '파일등록일',
	bno int unsigned NOT NULL COMMENT '게시물번호',
	PRIMARY KEY (fno)
) COMMENT = '파일정보';


-- 문의댓글정보
CREATE TABLE icmtReply
(
	icmtno int unsigned NOT NULL AUTO_INCREMENT COMMENT '문의번호',
	icmtContent text NOT NULL COMMENT '문의댓글내용',
	icmtRdate timestamp DEFAULT now() NOT NULL COMMENT '문의댓글등록일',
	icmtDelyn tinyint unsigned DEFAULT 0 NOT NULL COMMENT '문의댓글삭제여부',
	bno int unsigned NOT NULL COMMENT '게시물번호',
	mno int unsigned NOT NULL COMMENT '회원번호',
	PRIMARY KEY (icmtno)
) COMMENT = '문의댓글정보';


-- 회원정보
CREATE TABLE member
(
	mno int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '회원번호',
	mid varchar(200) NOT NULL COMMENT '아이디',
	mpw varchar(300) NOT NULL COMMENT '비밀번호',
	mnickNm varchar(200) NOT NULL COMMENT '닉네임',
	mname varchar(200) NOT NULL COMMENT '이름',
	mbirth varchar(10) NOT NULL COMMENT '생년월일',
	memail varchar(45) NOT NULL COMMENT '이메일',
	mphone varchar(20) NOT NULL COMMENT '휴대전화번호',
    	mgender varchar(5) NOT NULL COMMENT '성별',
	authority varchar(20) DEFAULT 'ROLE_USER' NOT NULL COMMENT '일반유권한',
	enabled tinyint unsigned DEFAULT 0 NOT NULL COMMENT '활성화여부', 
	mjoinDate timestamp DEFAULT now() NOT NULL COMMENT '가입일',
	isWithdrawn tinyint unsigned DEFAULT 0 NOT NULL COMMENT '탈퇴여부'
) COMMENT = '회원정보';


-- 상영정보(영화상영관브릿지)
CREATE TABLE screen
(
	sno int unsigned NOT NULL AUTO_INCREMENT COMMENT '상영번호',
	sstartTime varchar(50) NOT NULL COMMENT '상영시작시간',
    sendTime varchar(50) NOT NULL COMMENT '상영종료시간',
	cno int unsigned NOT NULL COMMENT '영화번호',
	shallno int unsigned NOT NULL COMMENT '상영관번호',
    sday DATE NOT NULL COMMENT '상영날짜',
	PRIMARY KEY (sno)
) COMMENT = '상영정보(영화상영관브릿지)';


-- 상영관정보
CREATE TABLE screenHall
(
	shallno int unsigned NOT NULL AUTO_INCREMENT COMMENT '상영관번호',
	shallType varchar(20) NOT NULL COMMENT '상영관타입',
	shallLocation varchar(20) NOT NULL COMMENT '상영관위치',
	shallSeat varchar(20) NOT NULL COMMENT '상영관날짜',
	tno int unsigned NOT NULL COMMENT '극장번호',
	PRIMARY KEY (shallno)
) COMMENT = '상영관정보';

-- 좌석정보
CREATE TABLE screenSeat
(
	sseatno int unsigned NOT NULL AUTO_INCREMENT COMMENT '좌석번호',
	sseatCol varchar(10) NOT NULL COMMENT '좌석 열 이름',
	sseatRow int unsigned NOT NULL COMMENT '좌석 행 번호',
	sseatType varchar(30) NOT NULL COMMENT '좌석타입',
	shallno int unsigned NOT NULL COMMENT '상영관번호',
	PRIMARY KEY (sseatno)
) COMMENT = '좌석정보';


-- 극장정보
CREATE TABLE theater
(
	tno int unsigned NOT NULL AUTO_INCREMENT COMMENT '극장번호',
	tname varchar(50) NOT NULL COMMENT '극장명',
	tnameEn varchar(255) COMMENT '극장명영문',
	taddr varchar(255) NOT NULL COMMENT '극장주소',
	tintro text NOT NULL COMMENT '극장소개',
	tcall varchar(20) NOT NULL COMMENT '극장전화번호',
	PRIMARY KEY (tno)
) COMMENT = '극장정보';


-- 예매정보(결제정보)
CREATE TABLE ticket
(
	ticketno int unsigned NOT NULL AUTO_INCREMENT COMMENT '예매번호',
	ticketTime varchar(50) NOT NULL COMMENT '예매시간',
	ticketDelyn tinyint unsigned DEFAULT 0 NOT NULL COMMENT '예매취소여부',
	mno int unsigned NOT NULL COMMENT '회원번호',
	PRIMARY KEY (ticketno)
) COMMENT = '예매정보(결제정보)';


-- 예매상세정보(결제정보)
CREATE TABLE ticketDetail
(
	ticketdetailno int unsigned NOT NULL AUTO_INCREMENT COMMENT '예매상세번호',
	ticketno int unsigned NOT NULL COMMENT '예매번호',
	sno int unsigned NOT NULL COMMENT '상영번호',
	sseatno int unsigned NOT NULL COMMENT '좌석번호',
	ticketDate DATE NOT NULL COMMENT '예매날짜',
	PRIMARY KEY (ticketdetailno)
) COMMENT = '예매상세정보(결제정보)';



/* Create Foreign Keys */

ALTER TABLE file
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE icmtReply
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE cinemaReply
	ADD FOREIGN KEY (cno)
	REFERENCES cinema (cno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE screen
	ADD FOREIGN KEY (cno)
	REFERENCES cinema (cno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE cinemaReplyLike
	ADD FOREIGN KEY (ccmtno)
	REFERENCES cinemaReply (ccmtno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE board
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE cinemaReply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE cinemaReplyLike
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE icmtReply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE ticket
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE ticketDetail
	ADD FOREIGN KEY (sno)
	REFERENCES screen (sno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE screen
	ADD FOREIGN KEY (shallno)
	REFERENCES screenHall (shallno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE screenSeat
	ADD FOREIGN KEY (shallno)
	REFERENCES screenHall (shallno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE ticketDetail
	ADD FOREIGN KEY (sseatno)
	REFERENCES screenSeat (sseatno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE screenHall
	ADD FOREIGN KEY (tno)
	REFERENCES theater (tno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE ticketDetail
	ADD FOREIGN KEY (ticketno)
	REFERENCES ticket (ticketno)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

-- 나의 예매내역 뷰 생성
CREATE VIEW MyTicketView AS
SELECT t.ticketno, t.ticketTime, t.ticketDelyn, t.mno,
		ss.sseatno, ss.sseatCol, ss.sseatRow, ss.sseatType,
        sh.shallno, sh.shallType, sh.shallLocation, 
	sc.sday, 
        th.tname, th.tno,
        c.cname, c.cno 
FROM ticket t
INNER JOIN ticketDetail td ON t.ticketno = td.ticketno
INNER JOIN screenSeat ss ON ss.sseatno = td.sseatno
INNER JOIN screen sc ON sc.sno = td.sno
INNER JOIN cinema c ON c.cno = sc.cno
INNER JOIN screenHall sh ON sh.shallno = ss.shallno
INNER JOIN theater th ON th.tno = sh.tno;

