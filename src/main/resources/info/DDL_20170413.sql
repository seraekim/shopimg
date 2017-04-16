SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS TB_ERR_FILE_INFO;
DROP TABLE IF EXISTS TB_COL_RESULT;
DROP TABLE IF EXISTS TB_CATEGORY_INFO;
DROP TABLE IF EXISTS TB_SEL_SHOP_LIST;
DROP TABLE IF EXISTS TB_MEMBER_CONFIG;
DROP TABLE IF EXISTS TB_MEMBER_INFO;
DROP TABLE IF EXISTS TB_SERVICE_INFO;




/* Create Tables */

CREATE TABLE TB_CATEGORY_INFO
(
	CATEGORY_ID varchar(25) NOT NULL,
	CATEGORY_NAME varchar(50),
	CATEGORY_URL varchar(1024),
	SERVICE_ID varchar(20) NOT NULL,
	PAGE_NO int DEFAULT 1,
	PRIMARY KEY (CATEGORY_ID)
) DEFAULT CHARSET=utf8;


CREATE TABLE TB_COL_RESULT
(
	CATEGORY_ID varchar(25) NOT NULL,
	-- yyyyMMdd
	COL_DD varchar(8) NOT NULL COMMENT 'yyyyMMdd',
	-- HH
	COL_HH char(2) NOT NULL COMMENT 'HH',
	-- 1 : 등록대기
	-- 2 : 등록중
	-- 9 : 등록에러
	-- 0 : 등록완료
	REG_STATUS char(1) COMMENT '1 : 등록대기
2 : 등록중
9 : 등록에러
0 : 등록완료',
	PRIMARY KEY (CATEGORY_ID, COL_DD, COL_HH)
) DEFAULT CHARSET=utf8;


CREATE TABLE TB_ERR_FILE_INFO
(
	CATEGORY_ID varchar(25) NOT NULL,
	-- yyyyMMdd
	COL_DD varchar(8) NOT NULL COMMENT 'yyyyMMdd',
	-- HH
	COL_HH char(2) NOT NULL COMMENT 'HH',
	-- 0 : browser 이미지 파일
	-- 1 : win 이미지 파일
	-- 2 : HTML 파일
	-- 
	FILE_KIND char(1) NOT NULL COMMENT '0 : browser 이미지 파일
1 : win 이미지 파일
2 : HTML 파일
',
	-- 00 : 정상
	-- 01 : 파일없음
	-- 99 : 기타에러
	FILE_ST char(2) COMMENT '00 : 정상
01 : 파일없음
99 : 기타에러',
	PRIMARY KEY (CATEGORY_ID, COL_DD, COL_HH, FILE_KIND)
) DEFAULT CHARSET=utf8;


CREATE TABLE TB_MEMBER_CONFIG
(
	MEMBER_ID varchar(20) NOT NULL,
	-- M:월별,D:일별
	DATETIME_KIND char(1) DEFAULT 'D' COMMENT 'M:월별,D:일별',
	-- 월별 선택 월
	M_DATE char(6) COMMENT '월별 선택 월',
	-- 일별조회 시 시작일자
	S_DATE char(8) COMMENT '일별조회 시 시작일자',
	-- 일별 종료 일자
	E_DATE char(8) COMMENT '일별 종료 일자',
	PRIMARY KEY (MEMBER_ID)
) DEFAULT CHARSET=utf8;


CREATE TABLE TB_MEMBER_INFO
(
	MEMBER_ID varchar(20) NOT NULL,
	MEMBER_NM varchar(50),
	PRIMARY KEY (MEMBER_ID)
) DEFAULT CHARSET=utf8;


CREATE TABLE TB_SEL_SHOP_LIST
(
	MEMBER_ID varchar(20) NOT NULL,
	SERVICE_ID varchar(20) NOT NULL,
	PRIMARY KEY (MEMBER_ID, SERVICE_ID)
) DEFAULT CHARSET=utf8;


CREATE TABLE TB_SERVICE_INFO
(
	SERVICE_ID varchar(20) NOT NULL,
	SERVICE_NAME varchar(50),
	-- 일자별로 생성되는 폴더 경로 지정
	-- ex) /xxx/lotte로 되어 있으면 /xxx/lotte 밑으로 2016081509 폴더가 생긴다
	COL_PATH varchar(255) COMMENT '일자별로 생성되는 폴더 경로 지정
ex) /xxx/lotte로 되어 있으면 /xxx/lotte 밑으로 2016081509 폴더가 생긴다',
	PRIMARY KEY (SERVICE_ID)
) DEFAULT CHARSET=utf8;

INSERT INTO tb_service_info (SERVICE_ID, SERVICE_NAME, COL_PATH) VALUES ('shplotte00109', '롯데닷컴', 'D:/shopimg/lotte/2016081509');
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000001', '카테고리 1', 'http://www.lotte.com/', 'shplotte00109', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000002', '카테고리 2', 'http://www.lotte.com/display/viewDispShop.lotte?disp_no=5505566&tracking=MH_CORNER_02', 'shplotte00110', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000003', '카테고리 3', 'http://www.lotte.com/main/viewMain.lotte?dpml_no=2&tracking=MH_CORNER_03', 'shplotte00111', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000004', '카테고리 4', 'http://www.lotte.com/main/viewMain.lotte?dpml_no=11&tracking=MH_CORNER_04', 'shplotte00112', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000005', '카테고리 5', 'http://www.lotte.com/planshop/viewPlanShopDetail.lotte?spdp_no=5381401&tracking=MH_CORNER_05', 'shplotte00113', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000006', '카테고리 6', 'http://www.lotte.com/display/viewRankingZoneMain.lotte?tracking=MH_CORNER_06', 'shplotte00114', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000007', '카테고리 7', 'http://www.lotte.com/event/viewEventZone.lotte?tracking=MH_CORNER_08', 'shplotte00115', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000008', '카테고리 8', 'http://www.lotte.com/event/viewSaunEventList.lotte?tracking=MH_CORNER_09', 'shplotte00116', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000009', '카테고리 9', 'http://www.lotte.com/eventViolet/viewBenefitOfTheMonthMain.lotte?tracking=MH_CORNER_10', 'shplotte00117', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000010', '카테고리 10', 'http://www.lotte.com/main/viewMain.lotte?dpml_no=4&tracking=GCB_MALLTAB_02', 'shplotte00118', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000011', '카테고리 11', 'http://www.lotte.com/main/viewMain.lotte?dpml_no=3&tracking=GCB_MALLTAB_03', 'shplotte00119', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000012', '카테고리 12', 'http://www.lotte.com/main/viewMain.lotte?dpml_no=12&tracking=GCB_MALLTAB_04', 'shplotte00120', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000013', '카테고리 13', 'http://www.lotte.com/main/viewMain.lotte?dpml_no=6&tracking=GCB_MALLTAB_06', 'shplotte00121', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000014', '카테고리 14', 'http://www.lotte.com/display/viewDispShop.lotte?disp_no=5413056&tracking=GCB_ITEMS_11_01', 'shplotte00122', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000015', '카테고리 15', 'http://www.lotte.com/display/viewDispShop.lotte?disp_no=5483896&tracking=GCB_ITEMS_11_11', 'shplotte00123', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000016', '카테고리 16', 'https://www.kokdeal.com/luser/main/Main.do', 'shplotte00124', 1);
INSERT INTO tb_category_info (CATEGORY_ID, CATEGORY_NAME, CATEGORY_URL, SERVICE_ID, PAGE_NO) VALUES ('shplotte0010900000017', '카테고리 17', 'http://www.lottesuper.co.kr/handler/Index-Start?CHL_NO=384215&AFCR_NO=110682', 'shplotte00125', 1);

COMMIT;
