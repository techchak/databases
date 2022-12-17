
create database employees_db




--create database employees_db
use Employees_db
CREATE TABLE REGIONS
    ( region_id      FLOAT 
       CONSTRAINT  region_id_nn NOT NULL 
    , region_name    VARCHAR(25) 
    );
--CREATE UNIQUE INDEX reg_id_pk ON regions (region_id);
ALTER TABLE regions ADD CONSTRAINT reg_id_pk PRIMARY KEY NONCLUSTERED  (region_id);

CREATE TABLE COUNTRIES 
    ( 	country_id      CHAR(2)  CONSTRAINT  country_id_nn NOT NULL, 
		country_name    VARCHAR(40), 
		region_id       FLOAT, 
		CONSTRAINT     	country_c_id_pk  
						PRIMARY KEY (country_id) 
    ); 

CREATE TABLE LOCATIONS
    ( 	
        location_id    SMALLINT , 
		street_address VARCHAR(40),
		postal_code    VARCHAR(12), 
		city       VARCHAR(30)	CONSTRAINT loc_city_nn  NOT NULL, 
		state_province VARCHAR(25), 
		country_id     CHAR(2),
		CONSTRAINT loc_id_pk PRIMARY KEY (location_id)
    );

CREATE TABLE departments
    ( department_id    SMALLINT
    , department_name  VARCHAR(30)
	CONSTRAINT  dept_name_nn  NOT NULL
    , manager_id       INT
    , location_id      SMALLINT
    ) ;

CREATE TABLE jobs
    ( job_id         VARCHAR(10)
    , job_title      VARCHAR(35)
	CONSTRAINT     job_title_nn  NOT NULL
    , min_salary     INT
    , max_salary     INT
    ) ;	
	
CREATE TABLE employees
    ( 	employee_id    INT, 
		first_name     VARCHAR(20), 
		last_name      VARCHAR(25) CONSTRAINT     emp_last_name_nn  NOT NULL, 
		email          VARCHAR(25) CONSTRAINT     emp_email_nn  NOT NULL, 
		phone_number   VARCHAR(20), 
		hire_date      DATE CONSTRAINT     emp_hire_date_nn  NOT NULL, 
		job_id         VARCHAR(10) CONSTRAINT     emp_job_nn  NOT NULL, 
		salary         DECIMAL(8,2), 
		commission_pct DECIMAL(2,2), 
		manager_id     INT, 
		department_id  SMALLINT
    ) ;	
	
CREATE TABLE job_history
    ( 	employee_id   INT CONSTRAINT    jhist_employee_nn  NOT NULL, 
		start_date    DATE CONSTRAINT    jhist_start_date_nn  NOT NULL, 
		end_date      DATE CONSTRAINT    jhist_end_date_nn  NOT NULL, 
		job_id        VARCHAR(10) CONSTRAINT    jhist_job_nn  NOT NULL, 
		department_id SMALLINT
	) ;


	INSERT INTO regions VALUES ( 1 , 'Europe' );
INSERT INTO regions VALUES ( 2 , 'Americas' ); 
INSERT INTO regions VALUES ( 3 , 'Asia' ); 
INSERT INTO regions VALUES ( 4 , 'Middle East and Africa' );

INSERT INTO countries VALUES ( 'IT' , 'Italy' , 1 );
INSERT INTO countries VALUES ( 'JP' , 'Japan' , 3 ); 
INSERT INTO countries VALUES ( 'US' , 'United States of America' , 2 );
INSERT INTO countries VALUES ( 'CA' , 'Canada' , 2 );
INSERT INTO countries VALUES ( 'CN' , 'China' , 3 );
INSERT INTO countries VALUES ( 'IN' , 'India' , 3 ); 
INSERT INTO countries VALUES ( 'AU' , 'Australia' , 3 ); 
INSERT INTO countries VALUES ( 'ZW' , 'Zimbabwe' , 4 );
INSERT INTO countries VALUES ( 'SG' , 'Singapore' , 3 );
INSERT INTO countries VALUES ( 'UK' , 'United Kingdom' , 1 ); 
INSERT INTO countries VALUES ( 'FR' , 'France' , 1 ); 
INSERT INTO countries VALUES ( 'DE' , 'Germany' , 1 );
INSERT INTO countries VALUES ( 'ZM' , 'Zambia' , 4 );
INSERT INTO countries VALUES ( 'EG' , 'Egypt' , 4 );
INSERT INTO countries VALUES ( 'BR' , 'Brazil' , 2 );
INSERT INTO countries VALUES ( 'CH' , 'Switzerland' , 1 );
INSERT INTO countries VALUES ( 'NL' , 'Netherlands' , 1 );
INSERT INTO countries VALUES ( 'MX' , 'Mexico' , 2 ); 
INSERT INTO countries VALUES ( 'KW' , 'Kuwait' , 4 );
INSERT INTO countries VALUES ( 'IL' , 'Israel' , 4 );
INSERT INTO countries VALUES ( 'DK' , 'Denmark' , 1 );
INSERT INTO countries VALUES ( 'ML' , 'Malaysia' , 3 );
INSERT INTO countries VALUES ( 'NG' , 'Nigeria' , 4 );
INSERT INTO countries VALUES ( 'AR' , 'Argentina' , 2 ); 
INSERT INTO countries VALUES ( 'BE' , 'Belgium' , 1 );

INSERT INTO locations VALUES ( 1000 , '1297 Via Cola di Rie' , '00989' , 'Roma' , NULL , 'IT' );
INSERT INTO locations VALUES ( 1100 , '93091 Calle della Testa' , '10934' , 'Venice' , NULL , 'IT' );
INSERT INTO locations VALUES ( 1200 , '2017 Shinjuku-ku' , '1689' , 'Tokyo' , 'Tokyo Prefecture' , 'JP' );
INSERT INTO locations VALUES ( 1300 , '9450 Kamiya-cho' , '6823' , 'Hiroshima' , NULL , 'JP' );
INSERT INTO locations VALUES ( 1400 , '2014 Jabberwocky Rd' , '26192' , 'Southlake' , 'Texas' , 'US' );
INSERT INTO locations VALUES ( 1500 , '2011 Interiors Blvd' , '99236' , 'South San Francisco' , 'California' , 'US' );
INSERT INTO locations VALUES ( 1600 , '2007 Zagora St' , '50090' , 'South Brunswick' , 'New Jersey' , 'US' );
INSERT INTO locations VALUES ( 1700 , '2004 Charade Rd' , '98199' , 'Seattle' , 'Washington' , 'US' );
INSERT INTO locations VALUES ( 1800 , '147 Spadina Ave' , 'M5V 2L7' , 'Toronto' , 'Ontario' , 'CA' );
INSERT INTO locations VALUES ( 1900 , '6092 Boxwood St' , 'YSW 9T2' , 'Whitehorse' , 'Yukon' , 'CA' );
INSERT INTO locations VALUES ( 2000 , '40-5-12 Laogianggen' , '190518' , 'Beijing' , NULL , 'CN' );
INSERT INTO locations VALUES ( 2100 , '1298 Vileparle (E)' , '490231' , 'Bombay' , 'Maharashtra' , 'IN' );
INSERT INTO locations VALUES ( 2200 , '12-98 Victoria Street' , '2901' , 'Sydney' , 'New South Wales' , 'AU' );
INSERT INTO locations VALUES ( 2300 , '198 Clementi North' , '540198' , 'Singapore' , NULL , 'SG' );
INSERT INTO locations VALUES ( 2400 , '8204 Arthur St' , NULL , 'London' , NULL , 'UK' );
INSERT INTO locations VALUES ( 2500 , 'Magdalen Centre, The Oxford Science Park' , 'OX9 9ZB' , 'Oxford' , 'Oxford' , 'UK' );
INSERT INTO locations VALUES ( 2600 , '9702 Chester Road' , '09629850293' , 'Stretford' , 'Manchester' , 'UK' );
INSERT INTO locations VALUES ( 2700 , 'Schwanthalerstr. 7031' , '80925' , 'Munich' , 'Bavaria' , 'DE' );
INSERT INTO locations VALUES ( 2800 , 'Rua Frei Caneca 1360 ' , '01307-002' , 'Sao Paulo' , 'Sao Paulo' , 'BR' );
INSERT INTO locations VALUES ( 2900 , '20 Rue des Corps-Saints' , '1730' , 'Geneva' , 'Geneve' , 'CH' );
INSERT INTO locations VALUES ( 3000 , 'Murtenstrasse 921' , '3095' , 'Bern' , 'BE' , 'CH' );
INSERT INTO locations VALUES ( 3100 , 'Pieter Breughelstraat 837' , '3029SK' , 'Utrecht' , 'Utrecht' , 'NL' );
INSERT INTO locations VALUES ( 3200 , 'Mariano Escobedo 9991' , '11932' , 'Mexico City' , 'Distrito Federal,' , 'MX' );

INSERT INTO departments VALUES ( 10 , 'Administration' , 200 , 1700 ); 
INSERT INTO departments VALUES ( 20 , 'Marketing' , 201 , 1800 );
INSERT INTO departments VALUES ( 30 , 'Purchasing' , 114 , 1700 );
INSERT INTO departments VALUES ( 40 , 'Human Resources' , 203 , 2400 );
INSERT INTO departments VALUES ( 50 , 'Shipping' , 121 , 1500 );
INSERT INTO departments VALUES ( 60 , 'IT' , 103 , 1400 );
INSERT INTO departments VALUES ( 70 , 'Public Relations' , 204 , 2700 );
INSERT INTO departments VALUES ( 80 , 'Sales' , 145 , 2500 );
INSERT INTO departments VALUES ( 90 , 'Executive' , 100 , 1700 );
INSERT INTO departments VALUES ( 100 , 'Finance' , 108 , 1700 );
INSERT INTO departments VALUES ( 110 , 'Accounting' , 205 , 1700 );
INSERT INTO departments VALUES ( 120 , 'Treasury' , NULL , 1700 );
INSERT INTO departments VALUES ( 130 , 'Corporate Tax' , NULL , 1700 );
INSERT INTO departments VALUES ( 140 , 'Control And Credit' , NULL , 1700 );
INSERT INTO departments VALUES ( 150 , 'Shareholder Services' , NULL , 1700 );
INSERT INTO departments VALUES ( 160 , 'Benefits' , NULL , 1700 );
INSERT INTO departments VALUES ( 170 , 'Manufacturing' , NULL , 1700 );
INSERT INTO departments VALUES ( 180 , 'Construction' , NULL , 1700 ); 
INSERT INTO departments VALUES ( 190 , 'Contracting' , NULL , 1700 );
INSERT INTO departments VALUES ( 200 , 'Operations' , NULL , 1700 ); 
INSERT INTO departments VALUES ( 210 , 'IT Support' , NULL , 1700 );
INSERT INTO departments VALUES ( 220 , 'NOC' , NULL , 1700 );
INSERT INTO departments VALUES ( 230 , 'IT Helpdesk' , NULL , 1700 );
INSERT INTO departments VALUES ( 240 , 'Government Sales' , NULL , 1700 );
INSERT INTO departments VALUES ( 250 , 'Retail Sales' , NULL , 1700 );
INSERT INTO departments VALUES ( 260 , 'Recruiting' , NULL , 1700 );
INSERT INTO departments VALUES ( 270 , 'Payroll' , NULL , 1700 );

INSERT INTO jobs VALUES ( 'AD_PRES' , 'President' , 20080 , 40000 );
INSERT INTO jobs VALUES ( 'AD_VP' , 'Administration Vice President' , 15000 , 30000 );
INSERT INTO jobs VALUES ( 'AD_ASST' , 'Administration Assistant' , 3000 , 6000 );
INSERT INTO jobs VALUES ( 'FI_MGR' , 'Finance Manager' , 8200 , 16000 );
INSERT INTO jobs VALUES ( 'FI_ACCOUNT' , 'Accountant' , 4200 , 9000 );
INSERT INTO jobs VALUES ( 'AC_MGR' , 'Accounting Manager' , 8200 , 16000 );
INSERT INTO jobs VALUES ( 'AC_ACCOUNT' , 'Public Accountant' , 4200 , 9000 );
INSERT INTO jobs VALUES ( 'SA_MAN' , 'Sales Manager' , 10000 , 20080 );
INSERT INTO jobs VALUES ( 'SA_REP' , 'Sales Representative' , 6000 , 12008 );
INSERT INTO jobs VALUES ( 'PU_MAN' , 'Purchasing Manager' , 8000 , 15000 ); 
INSERT INTO jobs VALUES ( 'PU_CLERK' , 'Purchasing Clerk' , 2500 , 5500 );
INSERT INTO jobs VALUES ( 'ST_MAN' , 'Stock Manager' , 5500 , 8500 );
INSERT INTO jobs VALUES ( 'ST_CLERK' , 'Stock Clerk' , 2008 , 5000 );
INSERT INTO jobs VALUES ( 'SH_CLERK' , 'Shipping Clerk' , 2500 , 5500 ); 
INSERT INTO jobs VALUES ( 'IT_PROG' , 'Programmer' , 4000 , 10000 );
INSERT INTO jobs VALUES ( 'MK_MAN' , 'Marketing Manager' , 9000 , 15000 );
INSERT INTO jobs VALUES ( 'MK_REP' , 'Marketing Representative' , 4000 , 9000 );
INSERT INTO jobs VALUES ( 'HR_REP' , 'Human Resources Representative' , 4000 , 9000 );
INSERT INTO jobs VALUES ( 'PR_REP' , 'Public Relations Representative' , 4500 , 10500 );

INSERT INTO employees VALUES ( 101,'Neena','Kochhar','NKOCHHAR','515.123.4568',CONVERT(DATETIME, '9-21-2005'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES ( 102,'Lex','De Haan','LDEHAAN','515.123.4569',CONVERT(DATETIME, '1-13-2001'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES ( 103,'Alexander','Hunold','AHUNOLD','590.423.4567',CONVERT(DATETIME, '1-3-2006'),'IT_PROG',9000,NULL,102,60);
INSERT INTO employees VALUES ( 104,'Bruce','Ernst','BERNST','590.423.4568',CONVERT(DATETIME, '5-21-2007'),'IT_PROG',6000,NULL,103,60);
INSERT INTO employees VALUES ( 105,'David','Austin','DAUSTIN','590.423.4569',CONVERT(DATETIME, '6-25-2005'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES ( 106,'Valli','Pataballa','VPATABAL','590.423.4560',CONVERT(DATETIME, '2-5-2006'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES ( 107,'Diana','Lorentz','DLORENTZ','590.423.5567',CONVERT(DATETIME, '2-7-2007'),'IT_PROG',4200,NULL,103,60);
INSERT INTO employees VALUES ( 108,'Nancy','Greenberg','NGREENBE','515.124.4569',CONVERT(DATETIME, '8-17-2002'),'FI_MGR',12008,NULL,101,100);
INSERT INTO employees VALUES ( 109,'Daniel','Faviet','DFAVIET','515.124.4169',CONVERT(DATETIME, '8-16-2002'),'FI_ACCOUNT',9000,NULL,108,100);
INSERT INTO employees VALUES ( 110,'John','Chen','JCHEN','515.124.4269',CONVERT(DATETIME, '9-28-2005'),'FI_ACCOUNT',8200,NULL,108,100);
INSERT INTO employees VALUES ( 111,'Ismael','Sciarra','ISCIARRA','515.124.4369',CONVERT(DATETIME, '9-30-2005'),'FI_ACCOUNT',7700,NULL,108,100);
INSERT INTO employees VALUES ( 112,'Jose Manuel','Urman','JMURMAN','515.124.4469',CONVERT(DATETIME, '3-7-2006'),'FI_ACCOUNT',7800,NULL,108,100);
INSERT INTO employees VALUES ( 113,'Luis','Popp','LPOPP','515.124.4567',CONVERT(DATETIME, '12-7-2007'),'FI_ACCOUNT',6900,NULL,108,100);
INSERT INTO employees VALUES ( 114,'Den','Raphaely','DRAPHEAL','515.127.4561',CONVERT(DATETIME, '12-7-2002'),'PU_MAN',11000,NULL,100,30);
INSERT INTO employees VALUES ( 115,'Alexander','Khoo','AKHOO','515.127.4562',CONVERT(DATETIME, '5-18-2003'),'PU_CLERK',3100,NULL,114,30);
INSERT INTO employees VALUES ( 116,'Shelli','Baida','SBAIDA','515.127.4563',CONVERT(DATETIME, '12-24-2005'),'PU_CLERK',2900,NULL,114,30);
INSERT INTO employees VALUES ( 117,'Sigal','Tobias','STOBIAS','515.127.4564',CONVERT(DATETIME, '7-24-2005'),'PU_CLERK',2800,NULL,114,30);
INSERT INTO employees VALUES ( 118,'Guy','Himuro','GHIMURO','515.127.4565',CONVERT(DATETIME, '11-15-2006'),'PU_CLERK',2600,NULL,114,30);
INSERT INTO employees VALUES ( 119,'Karen','Colmenares','KCOLMENA','515.127.4566',CONVERT(DATETIME, '8-10-2007'),'PU_CLERK',2500,NULL,114,30);
INSERT INTO employees VALUES ( 120,'Matthew','Weiss','MWEISS','650.123.1234',CONVERT(DATETIME, '7-18-2004'),'ST_MAN',8000,NULL,100,50);
INSERT INTO employees VALUES ( 121,'Adam','Fripp','AFRIPP','650.123.2234',CONVERT(DATETIME, '4-10-2005'),'ST_MAN',8200,NULL,100,50);
INSERT INTO employees VALUES ( 122,'Payam','Kaufling','PKAUFLIN','650.123.3234',CONVERT(DATETIME, '5-1-2003'),'ST_MAN',7900,NULL,100,50);
INSERT INTO employees VALUES ( 123,'Shanta','Vollman','SVOLLMAN','650.123.4234',CONVERT(DATETIME, '10-10-2005'),'ST_MAN',6500,NULL,100,50);
INSERT INTO employees VALUES ( 124,'Kevin','Mourgos','KMOURGOS','650.123.5234',CONVERT(DATETIME, '11-16-2007'),'ST_MAN',5800,NULL,100,50);
INSERT INTO employees VALUES ( 125,'Julia','Nayer','JNAYER','650.124.1214',CONVERT(DATETIME, '7-16-2005'),'ST_CLERK',3200,NULL,120,50);
INSERT INTO employees VALUES ( 126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',CONVERT(DATETIME, '9-28-2006'),'ST_CLERK',2700,NULL,120,50);
INSERT INTO employees VALUES ( 127,'James','Landry','JLANDRY','650.124.1334',CONVERT(DATETIME, '1-14-2007'),'ST_CLERK',2400,NULL,120,50);
INSERT INTO employees VALUES ( 128,'Steven','Markle','SMARKLE','650.124.1434',CONVERT(DATETIME, '3-8-2008'),'ST_CLERK',2200,NULL,120,50);
INSERT INTO employees VALUES ( 129,'Laura','Bissot','LBISSOT','650.124.5234',CONVERT(DATETIME, '8-20-2005'),'ST_CLERK',3300,NULL,121,50);
INSERT INTO employees VALUES ( 130,'Mozhe','Atkinson','MATKINSO','650.124.6234',CONVERT(DATETIME, '10-30-2005'),'ST_CLERK',2800,NULL,121,50);
INSERT INTO employees VALUES ( 131,'James','Marlow','JAMRLOW','650.124.7234',CONVERT(DATETIME, '2-16-2005'),'ST_CLERK',2500,NULL,121,50);
INSERT INTO employees VALUES ( 132,'TJ','Olson','TJOLSON','650.124.8234',CONVERT(DATETIME, '4-10-2007'),'ST_CLERK',2100,NULL,121,50);
INSERT INTO employees VALUES ( 133,'Jason','Mallin','JMALLIN','650.127.1934',CONVERT(DATETIME, '6-14-2004'),'ST_CLERK',3300,NULL,122,50);
INSERT INTO employees VALUES ( 134,'Michael','Rogers','MROGERS','650.127.1834',CONVERT(DATETIME, '8-26-2006'),'ST_CLERK',2900,NULL,122,50);
INSERT INTO employees VALUES ( 135,'Ki','Gee','KGEE','650.127.1734',CONVERT(DATETIME, '12-12-2007'),'ST_CLERK',2400,NULL,122,50);
INSERT INTO employees VALUES ( 136,'Hazel','Philtanker','HPHILTAN','650.127.1634',CONVERT(DATETIME, '2-6-2008'),'ST_CLERK',2200,NULL,122,50);
INSERT INTO employees VALUES ( 137,'Renske','Ladwig','RLADWIG','650.121.1234',CONVERT(DATETIME, '7-14-2003'),'ST_CLERK',3600,NULL,123,50);
INSERT INTO employees VALUES ( 138,'Stephen','Stiles','SSTILES','650.121.2034',CONVERT(DATETIME, '10-26-2005'),'ST_CLERK',3200,NULL,123,50);
INSERT INTO employees VALUES ( 139,'John','Seo','JSEO','650.121.2019',CONVERT(DATETIME, '2-12-2006'),'ST_CLERK',2700,NULL,123,50);
INSERT INTO employees VALUES ( 140,'Joshua','Patel','JPATEL','650.121.1834',CONVERT(DATETIME, '4-6-2006'),'ST_CLERK',2500,NULL,123,50);
INSERT INTO employees VALUES ( 141,'Trenna','Rajs','TRAJS','650.121.8009',CONVERT(DATETIME, '10-17-2003'),'ST_CLERK',3500,NULL,124,50);
INSERT INTO employees VALUES ( 142,'Curtis','Davies','CDAVIES','650.121.2994',CONVERT(DATETIME, '1-29-2005'),'ST_CLERK',3100,NULL,124,50);
INSERT INTO employees VALUES ( 143,'Randall','Matos','RMATOS','650.121.2874',CONVERT(DATETIME, '3-15-2006'),'ST_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES ( 144,'Peter','Vargas','PVARGAS','650.121.2004',CONVERT(DATETIME, '7-9-2006'),'ST_CLERK',2500,NULL,124,50);
INSERT INTO employees VALUES ( 145,'John','Russell','JRUSSEL','011.44.1344.429268',CONVERT(DATETIME, '10-1-2004'),'SA_MAN',14000,.4,100,80);
INSERT INTO employees VALUES ( 146,'Karen','Partners','KPARTNER','011.44.1344.467268',CONVERT(DATETIME, '1-5-2005'),'SA_MAN',13500,.3,100,80);
INSERT INTO employees VALUES ( 147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',CONVERT(DATETIME, '3-10-2005'),'SA_MAN',12000,.3,100,80);
INSERT INTO employees VALUES ( 148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',CONVERT(DATETIME, '10-15-2007'),'SA_MAN',11000,.3,100,80);
INSERT INTO employees VALUES ( 149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',CONVERT(DATETIME, '1-29-2008'),'SA_MAN',10500,.2,100,80);
INSERT INTO employees VALUES ( 150,'Peter','Tucker','PTUCKER','011.44.1344.129268',CONVERT(DATETIME, '1-30-2005'),'SA_REP',10000,.3,145,80);
INSERT INTO employees VALUES ( 151,'David','Bernstein','DBERNSTE','011.44.1344.345268',CONVERT(DATETIME, '3-24-2005'),'SA_REP',9500,.25,145,80);
INSERT INTO employees VALUES ( 152,'Peter','Hall','PHALL','011.44.1344.478968',CONVERT(DATETIME, '8-20-2005'),'SA_REP',9000,.25,145,80);
INSERT INTO employees VALUES ( 153,'Christopher','Olsen','COLSEN','011.44.1344.498718',CONVERT(DATETIME, '3-30-2006'),'SA_REP',8000,.2,145,80);
INSERT INTO employees VALUES ( 154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',CONVERT(DATETIME, '12-9-2006'),'SA_REP',7500,.2,145,80);
INSERT INTO employees VALUES ( 155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',CONVERT(DATETIME, '11-23-2007'),'SA_REP',7000,.15,145,80);
INSERT INTO employees VALUES ( 156,'Janette','King','JKING','011.44.1345.429268',CONVERT(DATETIME, '1-30-2004'),'SA_REP',10000,.35,146,80);
INSERT INTO employees VALUES ( 157,'Patrick','Sully','PSULLY','011.44.1345.929268',CONVERT(DATETIME, '3-4-2004'),'SA_REP',9500,.35,146,80);
INSERT INTO employees VALUES ( 158,'Allan','McEwen','AMCEWEN','011.44.1345.829268',CONVERT(DATETIME, '8-1-2004'),'SA_REP',9000,.35,146,80);
INSERT INTO employees VALUES ( 159,'Lindsey','Smith','LSMITH','011.44.1345.729268',CONVERT(DATETIME, '3-10-2005'),'SA_REP',8000,.3,146,80);
INSERT INTO employees VALUES ( 160,'Louise','Doran','LDORAN','011.44.1345.629268',CONVERT(DATETIME, '12-15-2005'),'SA_REP',7500,.3,146,80);
INSERT INTO employees VALUES ( 161,'Sarath','Sewall','SSEWALL','011.44.1345.529268',CONVERT(DATETIME, '11-3-2006'),'SA_REP',7000,.25,146,80);
INSERT INTO employees VALUES ( 162,'Clara','Vishney','CVISHNEY','011.44.1346.129268',CONVERT(DATETIME, '11-11-2005'),'SA_REP',10500,.25,147,80);
INSERT INTO employees VALUES ( 163,'Danielle','Greene','DGREENE','011.44.1346.229268',CONVERT(DATETIME, '3-19-2007'),'SA_REP',9500,.15,147,80);
INSERT INTO employees VALUES ( 164,'Mattea','Marvins','MMARVINS','011.44.1346.329268',CONVERT(DATETIME, '1-24-2008'),'SA_REP',7200,.10,147,80);
INSERT INTO employees VALUES ( 165,'David','Lee','DLEE','011.44.1346.529268',CONVERT(DATETIME, '2-23-2008'),'SA_REP',6800,.1,147,80);
INSERT INTO employees VALUES ( 166,'Sundar','Ande','SANDE','011.44.1346.629268',CONVERT(DATETIME, '3-24-2008'),'SA_REP',6400,.10,147,80);
INSERT INTO employees VALUES ( 167,'Amit','Banda','ABANDA','011.44.1346.729268',CONVERT(DATETIME, '4-21-2008'),'SA_REP',6200,.10,147,80);
INSERT INTO employees VALUES ( 168,'Lisa','Ozer','LOZER','011.44.1343.929268',CONVERT(DATETIME, '3-11-2005'),'SA_REP',11500,.25,148,80);
INSERT INTO employees VALUES ( 169  ,'Harrison','Bloom','HBLOOM','011.44.1343.829268',CONVERT(DATETIME, '3-23-2006'),'SA_REP',10000,.20,148,80);
INSERT INTO employees VALUES ( 170,'Tayler','Fox','TFOX','011.44.1343.729268',CONVERT(DATETIME, '1-24-2006'),'SA_REP',9600,.20,148,80);
INSERT INTO employees VALUES ( 171,'William','Smith','WSMITH','011.44.1343.629268',CONVERT(DATETIME, '2-23-2007'),'SA_REP',7400,.15,148,80);
INSERT INTO employees VALUES ( 172,'Elizabeth','Bates','EBATES','011.44.1343.529268',CONVERT(DATETIME, '3-24-2007'),'SA_REP',7300,.15,148,80);
INSERT INTO employees VALUES ( 173,'Sundita','Kumar','SKUMAR','011.44.1343.329268',CONVERT(DATETIME, '4-21-2008'),'SA_REP',6100,.10,148,80);
INSERT INTO employees VALUES ( 174,'Ellen','Abel','EABEL','011.44.1644.429267',CONVERT(DATETIME, '5-11-2004'),'SA_REP',11000,.30,149,80);
INSERT INTO employees VALUES ( 175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266',CONVERT(DATETIME, '3-19-2005'),'SA_REP',8800,.25,149,80);
INSERT INTO employees VALUES ( 176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',CONVERT(DATETIME, '3-24-2006'),'SA_REP',8600,.20,149,80);
INSERT INTO employees VALUES ( 177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',CONVERT(DATETIME, '4-23-2006'),'SA_REP',8400,.20,149,80);
INSERT INTO employees VALUES ( 178,'Kimberely','Grant','KGRANT','011.44.1644.429263',CONVERT(DATETIME, '5-24-2007'),'SA_REP',7000,.15,149,NULL);
INSERT INTO employees VALUES ( 179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',CONVERT(DATETIME, '1-4-2008'),'SA_REP',6200,.10,149,80);
INSERT INTO employees VALUES ( 180,'Winston','Taylor','WTAYLOR','650.507.9876',CONVERT(DATETIME, '1-24-2006'),'SH_CLERK',3200,NULL,120,50);
INSERT INTO employees VALUES ( 181,'Jean','Fleaur','JFLEAUR','650.507.9877',CONVERT(DATETIME, '2-23-2006'),'SH_CLERK',3100,NULL,120,50);
INSERT INTO employees VALUES ( 182,'Martha','Sullivan','MSULLIVA','650.507.9878',CONVERT(DATETIME, '6-21-2007'),'SH_CLERK',2500,NULL,120,50);
INSERT INTO employees VALUES ( 183,'Girard','Geoni','GGEONI','650.507.9879',CONVERT(DATETIME, '2-3-2008'),'SH_CLERK',2800,NULL,120,50);
INSERT INTO employees VALUES ( 184,'Nandita','Sarchand','NSARCHAN','650.509.1876',CONVERT(DATETIME, '1-27-2004'),'SH_CLERK',4200,NULL,121,50);
INSERT INTO employees VALUES ( 185,'Alexis','Bull','ABULL','650.509.2876',CONVERT(DATETIME, '2-20-2005'),'SH_CLERK',4100,NULL,121,50);
INSERT INTO employees VALUES ( 186,'Julia','Dellinger','JDELLING','650.509.3876',CONVERT(DATETIME, '6-24-2006'),'SH_CLERK',3400,NULL,121,50);
INSERT INTO employees VALUES ( 187,'Anthony','Cabrio','ACABRIO','650.509.4876',CONVERT(DATETIME, '2-7-2007'),'SH_CLERK',3000,NULL,121,50);
INSERT INTO employees VALUES ( 188,'Kelly','Chung','KCHUNG','650.505.1876',CONVERT(DATETIME, '6-14-2005'),'SH_CLERK',3800,NULL,122,50);
INSERT INTO employees VALUES ( 189,'Jennifer','Dilly','JDILLY','650.505.2876',CONVERT(DATETIME, '8-13-2005'),'SH_CLERK',3600,NULL,122,50);
INSERT INTO employees VALUES ( 190,'Timothy','Gates','TGATES','650.505.3876',CONVERT(DATETIME, '7-11-2006'),'SH_CLERK',2900,NULL,122,50);
INSERT INTO employees VALUES ( 191,'Randall','Perkins','RPERKINS','650.505.4876',CONVERT(DATETIME, '12-19-2007'),'SH_CLERK',2500,NULL,122,50);
INSERT INTO employees VALUES ( 192,'Sarah','Bell','SBELL','650.501.1876',CONVERT(DATETIME, '2-4-2004'),'SH_CLERK',4000,NULL,123,50);
INSERT INTO employees VALUES ( 193,'Britney','Everett','BEVERETT','650.501.2876',CONVERT(DATETIME, '3-3-2005'),'SH_CLERK',3900,NULL,123,50);
INSERT INTO employees VALUES ( 194,'Samuel','McCain','SMCCAIN','650.501.3876',CONVERT(DATETIME, '7-1-2006'),'SH_CLERK',3200,NULL,123,50);
INSERT INTO employees VALUES ( 195,'Vance','Jones','VJONES','650.501.4876',CONVERT(DATETIME, '3-17-2007'),'SH_CLERK',2800,NULL,123,50);
INSERT INTO employees VALUES ( 196,'Alana','Walsh','AWALSH','650.507.9811',CONVERT(DATETIME, '4-24-2006'),'SH_CLERK',3100,NULL,124,50);
INSERT INTO employees VALUES ( 197,'Kevin','Feeney','KFEENEY','650.507.9822',CONVERT(DATETIME, '5-23-2006'),'SH_CLERK',3000,NULL,124,50);
INSERT INTO employees VALUES ( 198,'Donald','OConnell','DOCONNEL','650.507.9833',CONVERT(DATETIME, '6-21-2007'),'SH_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES ( 199,'Douglas','Grant','DGRANT','650.507.9844',CONVERT(DATETIME, '1-13-2008'),'SH_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES ( 200,'Jennifer','Whalen','JWHALEN','515.123.4444',CONVERT(DATETIME, '9-17-2003'),'AD_ASST',4400,NULL,101,10);
INSERT INTO employees VALUES ( 201,'Michael','Hartstein','MHARTSTE','515.123.5555',CONVERT(DATETIME, '2-17-2004'),'MK_MAN',13000,NULL,100,20);
INSERT INTO employees VALUES ( 202,'Pat','Fay','PFAY','603.123.6666',CONVERT(DATETIME, '8-17-2005'),'MK_REP',6000,NULL,201,20);
INSERT INTO employees VALUES ( 203,'Susan','Mavris','SMAVRIS','515.123.7777',CONVERT(DATETIME, '6-7-2002'),'HR_REP',6500,NULL,101,40);
INSERT INTO employees VALUES ( 204,'Hermann','Baer','HBAER','515.123.8888',CONVERT(DATETIME, '6-7-2002'),'PR_REP',10000,NULL,101,70);
INSERT INTO employees VALUES ( 205,'Shelley','Higgins','SHIGGINS','515.123.8080',CONVERT(DATETIME, '6-7-2002'),'AC_MGR',12008,NULL,101,110);
INSERT INTO employees VALUES ( 206,'William','Gietz','WGIETZ','515.123.8181',CONVERT(DATETIME, '6-7-2002'),'AC_ACCOUNT',8300,NULL,205,110);


INSERT INTO job_history VALUES (102,CONVERT(DATETIME, '01-13-2001'),CONVERT(DATETIME, '07-24-2006'),'IT_PROG',60);
INSERT INTO job_history VALUES (101,CONVERT(DATETIME, '09-21-1997'),CONVERT(DATETIME, '10-27-2001'),'AC_ACCOUNT',110);
INSERT INTO job_history VALUES (101,CONVERT(DATETIME, '10-28-2001'),CONVERT(DATETIME, '03-15-2005'),'AC_MGR',110);
INSERT INTO job_history VALUES (201,CONVERT(DATETIME, '02-17-2004'),CONVERT(DATETIME, '12-19-2007'),'MK_REP',20);
INSERT INTO job_history VALUES  (114,CONVERT(DATETIME, '03-24-2006'),CONVERT(DATETIME, '12-31-2007'),'ST_CLERK',50);
INSERT INTO job_history VALUES  (122,CONVERT(DATETIME, '01-01-2007'),CONVERT(DATETIME, '12-31-2007'),'ST_CLERK',50);
INSERT INTO job_history VALUES  (200,CONVERT(DATETIME, '09-17-1995'),CONVERT(DATETIME, '06-17-2001'),'AD_ASST',90);
INSERT INTO job_history VALUES  (176,CONVERT(DATETIME, '03-24-2006'),CONVERT(DATETIME, '12-31-2006'),'SA_REP',80);
INSERT INTO job_history VALUES  (176,CONVERT(DATETIME, '01-01-2007'),CONVERT(DATETIME, '12-31-2007'),'SA_MAN',80);
INSERT INTO job_history VALUES  (200,CONVERT(DATETIME, '07-01-2002'),CONVERT(DATETIME, '12-31-2006'),'AC_ACCOUNT',90);
