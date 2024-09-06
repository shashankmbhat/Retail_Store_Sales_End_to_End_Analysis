CREATE DATABASE RETAILS;
USE RETAILS;
use schema PUBLIC;

CREATE DATABASE RETAILS;
USE RETAILS;
use schema PUBLIC;

CREATE OR REPLACE TABLE demographic_RAW
(AGE_DESC	CHAR(20),
MARITAL_STATUS_CODE	CHAR(5),
INCOME_DESC	VARCHAR(40),
HOMEOWNER_DESC	VARCHAR(40),
HH_COMP_DESC	VARCHAR(50),
HOUSEHOLD_SIZE_DESC	VARCHAR(50),
KID_CATEGORY_DESC	VARCHAR(40),
household_key INT PRIMARY KEY
);

CREATE OR REPLACE TABLE CAMPAIGN_DESC_RAW
(DESCRIPTION CHAR(10),	
CAMPAIGN	INT ,
START_DAY	INT,
END_DAY INT,
PRIMARY KEY (DESCRIPTION),
UNIQUE (CAMPAIGN));




CREATE OR REPLACE TABLE CAMPAIGN_RAW
(DESCRIPTION	CHAR(10) ,
household_key	INT,
CAMPAIGN INT,
FOREIGN KEY (DESCRIPTION) references CAMPAIGN_DESC_RAW(DESCRIPTION) ,
FOREIGN KEY (CAMPAIGN) references CAMPAIGN_DESC_RAW(CAMPAIGN),
FOREIGN KEY (household_key) references demographic_RAW(household_key)
);

CREATE OR REPLACE TABLE PRODUCT_RAW
(PRODUCT_ID	INT PRIMARY KEY,
MANUFACTURER 	INT,
DEPARTMENT	VARCHAR(50),
BRAND	VARCHAR(30),
COMMODITY_DESC	VARCHAR(65),
SUB_COMMODITY_DESC VARCHAR(65)	,
CURR_SIZE_OF_PRODUCT VARCHAR(15)
);


CREATE OR REPLACE TABLE COUPON_RAW
(COUPON_UPC	INT,
PRODUCT_ID	INT,
CAMPAIGN INT,
FOREIGN KEY (PRODUCT_ID) references PRODUCT_RAW(PRODUCT_ID),
FOREIGN KEY (CAMPAIGN) references CAMPAIGN_DESC_RAW(CAMPAIGN)
);


CREATE OR REPLACE TABLE COUPON_REDEMPT_RAW
(household_key	INT,
DAY	INT,
COUPON_UPC	INT,
CAMPAIGN INT,
FOREIGN KEY (household_key) references demographic_RAW(household_key),
FOREIGN KEY (CAMPAIGN) references CAMPAIGN_DESC_RAW(CAMPAIGN)
);

DROP TABLE COUPON_REDEMPT_RAW;


CREATE OR REPLACE TABLE TRANSACTION_RAW 
(household_key	INT,
BASKET_ID	INT,
DAY	INT,
PRODUCT_ID	INT,
QUANTITY	INT,
SALES_VALUE	FLOAT,
STORE_ID	INT,
RETAIL_DISC	FLOAT,
TRANS_TIME	INT,
WEEK_NO	INT,
COUPON_DISC	INT,
COUPON_MATCH_DISC INT,
FOREIGN KEY (PRODUCT_ID) references PRODUCT_RAW(PRODUCT_ID),
FOREIGN KEY (household_key) references demographic_RAW(household_key)
);