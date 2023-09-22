-- 고객정보 CUSTOMER
CREATE TABLE CUSTOMER(
    USER_NUMBER NUMBER(10) PRIMARY KEY,
    USER_ID VARCHAR2(8) UNIQUE CHECK(LENGTH(USER_ID)<=8 AND LENGTH(USER_ID)>=5),
    USER_PW VARCHAR2(12) CHECK(LENGTH(USER_PW)<=12 AND LENGTH(USER_PW)>=8),
    NAME VARCHAR2(20) NOT NULL,
    RRN CHAR(14) UNIQUE,
    CREDIT_SCORE_N NUMBER(4) NOT NULL,
    CREDIT_SCORE_K NUMBER(4) NOT NULL,
    PHONE_NUM CHAR(13),
    EMAIL VARCHAR2(30),
    JOB VARCHAR2(15) NOT NULL,
    INCOME NUMBER(10) NOT NULL,
    BANK VARCHAR2(20) NOT NULL,
    ACCOUNT NUMBER(20) NOT NULL
);


-- 고객번호 부여 시퀀스 
CREATE SEQUENCE USER_NUMBER
INCREMENT BY 1
START WITH 1000
NOCYCLE
NOCACHE;

-- 기존 고객 15명 생성 

INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'zzangu11','z12345678', '신짱구', '950101-1234567', 820, 800 ,'010-1234-5678', 'zzanguzz@naver.com', '직장인', 3500, '우리은행', 1002541425);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'yuri0110','dbfl1122', '차유리', '010921-2222452', 780, 777 ,'010-5689-1478', 'yuri11@google.com', '개인사업자', 2800, '국민은행', 1145268752);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'ccccsu89','ceolsu0502', '김철수', '890808-1245785', 970, 963 ,'010-4577-1112', 'cccsu89@naver.com', '전문직', 10000, '신한은행', 7895842561);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'choihh00','huunnni11', '최훈이', '000920-1457889', 520, 500 ,'010-5568-1254', 'huni00@daum.net', '무직', 600, '하나은행', 5425698874);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'songmg','930707sz', '송맹구', '940920-1225458', 888, 820 ,'010-7874-9293', 'mang09@naver.com', '직장인', 8000, '신한은행', 7721547852);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'mimi0224','alal2244', '봉미선', '770224-2245771', 810, 786 ,'010-3722-0224', 'mimi0224@daum.net', '무직', 2400, '우리은행', 1002225556);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'shinhs55','gudtlr112', '신형식', '750505-1125789', 832, 805 ,'010-3722-0505', 'hs0505@naver.com', '직장인', 6000, '우리은행', 1002222478);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'white01','gmlsenddl1', '이흰둥', '980101-1233569', 890, 857 ,'010-6259-7593', 'white0101@naver.com', '무직', 3600, '하나은행', 5456552111);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'nanana22','alfl0325', '나미리', '931101-2234567', 757, 699 ,'010-6525-7784', 'miri22@google.com', '직장인', 3000, '우리은행', 1002541568);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'zzanga22','za12345678', '신짱아', '970201-2256125', 840, 831 ,'010-1234-5573', 'zzangazz@naver.com', '직장인', 2600, '우리은행', 1002255698);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'suzy1993','930707sz', '김수지', '930707-2255124', 839, 768 ,'010-7854-0707', 'szlove@naver.com', '개인사업자', 5000, '신한은행', 7789554658);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'cahsaa86','sungaaa86', '채성아', '860407-2254665', 869, 832 ,'010-8686-5667', 'sunga86@hanmail.net', '공무원', 2830, '국민은행', 1111542582);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'osuu0921','suuuuu2121', '오오수', '830921-1145789', 630, 580 ,'010-0921-1371', 'osu1@naver.com', '무직', 1200, '신한은행', 2585889745);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'jeongh11','park11112', '박정훈', '871111-1244587', 750, 720 ,'010-2554-9980', 'jh1111@naver.com', '공무원', 4000, '신한은행', 8896657845);
INSERT INTO CUSTOMER(USER_NUMBER, USER_ID, USER_PW, NAME, RRN, CREDIT_SCORE_N, CREDIT_SCORE_K, PHONE_NUM, EMAIL,JOB, INCOME, BANK, ACCOUNT)
VALUES (USER_NUMBER.NEXTVAL, 'mimikim','rlaalal1', '김미미', '901108-2236598', 899, 920 ,'010-2554-1108', 'szlove@naver.com', '공무원', 2400, '신한은행', 8745879544);


SELECT * FROM CUSTOMER;


-- 대출 상품 LOAN_PRODUCT
CREATE TABLE LOAN_PRODUCT (
  PRODUCT_NUMBER NUMBER(10) PRIMARY KEY,
  PRODUCT_NAME VARCHAR2(50) NOT NULL,
  BANK_NAME VARCHAR2(20),
  RATE NUMBER(5),
  MAX_LOAN NUMBER(10),
  MAX_MONTH NUMBER(2),
  JOB VARCHAR2(15) NOT NULL,
  DETAIL VARCHAR2(4000) NOT NULL
);

-- 대출 상품 번호 부여 시퀀스
CREATE SEQUENCE PRODUCT_NUMBER
INCREMENT BY 1
START WITH 1
NOCYCLE
NOCACHE;

INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '주거래직장인대출', '우리', 5, 200, 60, '직장인', '상품 특징 : 급여소득자 고객을 위한 우리은행 대표 신용대출, 대출 대상 : 1. 건강보험 직장 가입자로 등록. 2. 건강보험 동일 사업장 6개월이상 납부, 대출 한도 : 연소득의 150% 범위내 최대 2억 가능 , 대출 기간 : 최대 5년, 대출 금리 : 최고 금리 5%, 연체이자율 적용금리+연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 : 요율 고정금리 0.7% / 변동금리 0.6%, 고객부담비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '비상금대출', '우리', 6.9, 3, 12, '무직', '상품 특징 : 통신 등급을 활용하여 직장, 소득 따지지 않는 비상금 대출, 대출 대상 : 통신 등급 산출 가능한 통신 3사 고객(무직, 주부, 학생 가능), 대출 한도 : 최대 3백만원, 대출 기간 : 최대 1년, 대출 금리 : 6.9%, 연체이자율 적용금리+연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  없음, 대출 비용 :  없음 ');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '사잇돌중금리대출', '우리', 7.12, 20, 60, '무직', '상품 특징 : 스마트뱅킹을 통해 대출 신청 가능, 중도상환해약금 없이 자유롭게 상환 가능, 대출 대상 : 직장인, 무직도 가능, 대출 한도 : 최소 1백만원 ~ 최대 2천만원, 대출 기간 : 최대 5년, 대출 금리 : 7.12 %, 연체이자율 적용금리 + 연3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  면제 , 대출 비용 : 없음 ');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '홈마스터론', '우리', 6.05, 10, 60, '무직', '상품 특징 : 소득없이 거래 실적만으로 대출 가능한 우리은행 주거래 고객 대상 상품, 대출 대상 : 소득 증빙 없어도 우리은행 주거래 고객이라면 가능(무직 가능) , 대출 한도 : 최소 3백만원 ~ 최대 1천만원, 대출 기간 : 최대 5년, 대출 금리 : 6.05%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  요율 : 고정금리 0.7% / 변동금리 0.6%, 대출 비용: 없음 ');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '새희망홀씨2', '우리', 6.7, 35, 84, '직장인', '상품 특징 : 중/저신용자도 대출 가능한 우리은행 대표 서민금융상품, 대출 대상 : 연소득 4000만원 이하 직장인, 개인사업자 가능 , 대출 한도 : 최저 1백만원이상 ~ 최대 3500만원 가능, 대출 기간 : 최대 7년 , 대출 금리 : 6.7%, 연체이자율 :  적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  면제, 대출 비용 : 없음');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '쏠편한직장인대출S', '신한', 6.3, 100, 60, '직장인', '상품 특징 :  재직중인 직장인에게 한도와 금리를 우대해드리는 신용대출, 대출 대상 : 6개월이상 재직, 연환산소득 2800만원 이상, 건강보험료로 추정 소득이 2800만원 이상인 고객, 대출 한도 : 최대 1억, 대출 기간 : 최대 5년, 대출 금리 : 6.3%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  중도상환금액X중도상환해약금률X(대출잔여일수/대출기간) 중도상환해약금률: 고정금리대출: 0.8% / 변동금리대출: 0.7%, 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '쏠편한직장인대출', '신한', 7, 50, 60, '직장인', '상품 특징 : 재직중인 직장인에게 한도와 금리를 우대해드리는 신용대출, 대출 대상 : 1년이상 재직, 연소득 2200만원 이상, 건강보험료로 추정 소득이 2200만원 이상인 고객, 대출 한도 : 최대 5천만원, 대출 기간 : 최대 5년, 대출 금리 : 7%, 연체이자율 :  적용금리 +연3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :   중도상환금액X중도상환해약금률X(대출잔여일수/대출기간) 중도상환해약금률: 고정금리대출: 0.8% / 변동금리대출: 0.7%, 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '쏠편한포켓론', '신한', 8.5, 5, 48, '무직', '상품 특징 : 신용카드를 보유중인 내국인, 대출 대상 : 신용카드 거래중인 고객 (직업 무관) , 대출 한도 : 최소 50만원 ~ 최대 5백만원, 대출 기간 : 최대 4년 , 대출 금리 : 8.5%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  없음, 대출 비용 : 없음 ');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '쏠편한일반공무원대출', '신한', 5.5, 70, 60, '공무원', '상품 특징 : 대한민국 공무원을 응원하는 넉넉한 한도의 신용대출, 대출 대상 : 4개월 이상 재직중인 공무원 대상 전부, 대출 한도 : 최대 7000만원, 대출 기간 : 최대 5년, 대출 금리 : 5.5%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  중도상환금액X중도상환해약금률X(대출잔여일수/대출기간) 중도상환해약금률: 고정금리대출: 0.8% / 변동금리대출: 0.7%, 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'SOHOCSS사이버론', '신한', 6.7, 50, 60, '개인사업자', '상품 특징 : 개인사업자가 인터넷상 대출가능고객 대상여부를 확인하고 바로 실행 가능한 상품, 대출 대상 : 사업기간 1년 이상 개인사업자 , 대출 한도 : 최대 5000만원, 대출 기간 : 최대 5년, 대출 금리 : 6.7%, 연체이자율 : 적용금리 + 연 3% , 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  중도상환대출금X중도상환해약금률X대출잔여일수/대출기간 중도상환해약금률: 고정금리대출: 0.8% / 변동금리대출: 0.7%, 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '하나원큐새희망홀씨2', '하나', 5.5, 100, 60, '직장인', '상품 특징 : 근로소득자를 위한 무보증, 무담보, 신용대출로 최대 1억까지 이용 가능, 대출 대상 : 6개월 이상 재직, 연소득 4000만원 이상 직장인, 대출 한도 : 최저 1백만원 ~ 최대 1억 , 대출 기간 : 최대 5년, 대출 금리 : 5.5%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  면제, 대출 비용 : 없음 ');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'AI대출', '하나', 7.5, 30, 60, '무직', '상품 특징 : 1분이면 한도조회 OK! , 대출 대상 : 하나은행과 6개월이상 거래한 고객(직업 무관), 대출 한도 : 최저 3백만 ~ 최대 3천만원, 대출 기간 : 최대 5년, 대출 금리 : 7.5%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 : 중도상환대출금액 × 중도상환해약금률 0.7% × (중도상환 약정잔여일수 ÷ 중도상환약정기간), 대출 비용 : 없음 ');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '핀크생활비대출', '하나', 13.9, 5, 48, '무직','상품 특징 : 급전이 필요할 때 최대 5백만원까지 가능, 대출 대상 : 만 19세이상 내국인, 무직 가능(주부, 학생 등), 대출 한도 : 최소 50만원 ~ 최대 5백만원, 대출 기간 : 최대 4년 , 대출 금리 : 13.9% , 상환 방법 : 원리금분할상환대출, 중도상환해약금 : 없음, 대출 비용 : 없음');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'BEST신용대출', '하나', 6.8, 50, 60, '직장인', '상품 특징 : 소득이 있는 국민으로 신용평가 양호한 손님을 위한 신용대출 , 대출 대상 : 3개월이상 재직, 연소득 2200만원 이상 직장인 , 대출 한도 : 최대 5천만원, 대출 기간 : 최대 5년 , 대출 금리 : 6.8%, 연체이자율 : 적용금리 + 연 3% , 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  중도상환해약금 : 중도상환대출금액 X 중도상환해약금율* X 대출잔여일수 ÷ 대출기간,  중도상환해약금율 : 0.7%, 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, '전문직클럽대출', '하나', 7, 300, 120, '전문직','상품 특징 : 전문직(약사, 회계사, 세무사 등)에 종사하는 손님을 위한 신용대출, 대출 대상 : 의사, 공인회계사, 변리사, 세무사, 감정평가사, 공인노무사, 법무사, 기술사, 약사, 건축사, 보험계리사, 지정대학 교수, 대출 한도 : 최대 3억, 대출 기간 : 최대 10년, 대출 금리 : 7%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출 , 중도상환해약금 : 중도상환대출금액 X 중도상환해약금율* X 대출잔여일수 ÷ 대출기간, 중도상환해약금율 : 0.7%(단,인터넷/모바일 신청&약정시 0.5%), 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'KB직장인든든신용대출', '국민', 6, 300, 60, '직장인','상품 특징 : 직장인이라면 신청 가능, 대출 대상 : 재직 3개월이상 직장인, 대출 한도 : 최대 3억 (단 1년 미만 사회초년생은 최대 5천만원까지 가능), 대출 기간 : 최대 5년 , 대출 금리 : 6%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출 , 중도상환해약금 :  중도상환원금 X 수수료율(0.6%) X 잔존일수 ÷ 대출기간, 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'KB새희망홀씨2', '국민', 8, 50, 36, '무직','상품 특징 : 서민층 긴급자금을 지원하는 상품 , 대출 대상 : 직업 무관(무직 신청 가능), 대출 한도 : 최대 5천만원, 대출 기간 : 최대 3년, 대출 금리 : 8%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  면제, 대출 비용 : 인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'KB국민ONE대출', '국민', 7, 20, 48, '무직', '상품 특징 : KB국민 우수 고객님은 대출도 ONE샷! , 대출 대상 : 입증소득 및 재직증빙 없이 당행 거래실적 충족한 고객, 직업 무관 , 대출 한도 : 최소 1백만원 ~ 최대 2천만원, 대출 기간 : 최대 4년, 대출 금리 : 7%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 :  중도상환수수료는 “중도상환원금 X 수수료율(0.6%) X 잔존일수 ÷ 대출기간, 수수료율 0.6% 적용, 대출 비용 : 없음 ');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'KB온국민신용대출(갈아타기)', '국민', 6, 100, 36, '직장인','상품 특징 : 근로소득이 발생되는 국민 누구나 !, 대출 대상 : 증빙소득 발생 직장인, 개인사업자 누구나 가능 , 대출 한도 : 최대 1억, 대출 기간 : 최대 3년, 대출 금리 : 6%, 연체이자율 : 적용금리 + 연 3%, 상환 방법 : 원리금분할상환대출, 중도상환해약금 : 중도상환원금 X 수수료율(0.6%) X 잔존일수 ÷ 대출기간, 대출 비용 :  인지세 5천만원이하 면제, 5천만원~1억: 7만원(각 3만5천원)');
INSERT INTO LOAN_PRODUCT(PRODUCT_NUMBER, PRODUCT_NAME, BANK_NAME, RATE, MAX_LOAN, MAX_MONTH, JOB, DETAIL)
VALUES (PRODUCT_NUMBER.NEXTVAL, 'KB공무원우대대출', '국민', 5, 10, 72, '공무원','상품 특징 : 공무원 모두를 위한 대출 상품, 대출 대상 : 현직 공무원(군무원포함, 현역 군인 및 사립학교 교직원 제외), 대출 한도 : 최대 1천만원, 대출 기간 : 최대 6년 , 대출 금리 : (연체금리 포함시키기), 상환 방법 : 원리금분할상환대출, 중도상환해약금 : 면제, 대출 비용 : 없음 ');

SELECT * FROM LOAN_PRODUCT;

-- 고객 대출 정보 LOAN_INFO
CREATE TABLE LOAN_INFO(
  LOAN_NUMBER NUMBER(10) PRIMARY KEY,
  USER_NUMBER NUMBER(10) REFERENCES CUSTOMER(USER_NUMBER),
  NAME VARCHAR2(20) NOT NULL,
  PRODUCT_NUMBER NUMBER(10) REFERENCES LOAN_PRODUCT(PRODUCT_NUMBER),
  LOAN_PRODUCT VARCHAR2(50),
  RATE NUMBER(5),
  MAX_LOAN NUMBER(10),
  PERIOD NUMBER(2)
);

-- 게시판 목록 BOARD
CREATE TABLE BOARD (
  BOARD_NUMBER NUMBER(10) PRIMARY KEY,
  BOARD_NAME VARCHAR2(30) UNIQUE 
);

-- 고객의 소리(게시판) WRITE
CREATE TABLE WRITE (
  WRT_NUM NUMBER(10) PRIMARY KEY,
  BOARD_NAME VARCHAR2(30) REFERENCES BOARD(BOARD_NAME),
  TITLE VARCHAR2(30) NOT NULL,
  CONTENTS VARCHAR2(50),
  WRT_DATE DATE,
  USER_ID VARCHAR2(8) REFERENCES CUSTOMER(USER_ID)
);

-- 댓글 REPLY
CREATE TABLE REPLY (
COMMENT_NUM NUMBER(10) PRIMARY KEY,
WRT_NUM NUMBER(10) REFERENCES WRITE(WRT_NUM),
COMMNET_CON VARCHAR2(50),
USER_ID VARCHAR2(8) REFERENCES CUSTOMER(USER_ID)
);
