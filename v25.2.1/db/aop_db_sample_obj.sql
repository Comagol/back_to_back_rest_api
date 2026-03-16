  CREATE TABLE  "AOP_AUTOMATED_TEST" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(4000), 
	"DATA_TYPE" VARCHAR2(20), 
	"TEMPLATE_TYPE" VARCHAR2(20), 
	"OUTPUT_TYPE" VARCHAR2(20), 
	"OUTPUT_FILENAME" VARCHAR2(200), 
	"OUTPUT_BLOB" BLOB, 
	"EXPECTED_BYTES" NUMBER, 
  "EXPECTED_PROCESSING_SECONDS" NUMBER, 
	"EXPECTED_OUTPUT_BLOB" BLOB, 
	"RECEIVED_BYTES" NUMBER, 
	"RESULT" VARCHAR2(4000), 
	"PROCESSING_SECONDS" NUMBER, 
	"SEQ_NR" NUMBER, 
	"DATA_SOURCE" VARCHAR2(4000), 
	"TEMPLATE_SOURCE" VARCHAR2(4000), 
	"FILENAME" VARCHAR2(221), 
	"OUTPUT_TYPE_ITEM_NAME" VARCHAR2(100), 
	"OUTPUT_TO" VARCHAR2(100), 
	"SPECIAL" VARCHAR2(100), 
	"PROCEDURE_" VARCHAR2(100), 
	"CREATED_DATE" DATE DEFAULT sysdate, 
	"RUN_DATE" DATE, 
	"APP_ID" NUMBER, 
	"PAGE_ID" NUMBER, 
	"INIT_CODE" VARCHAR2(4000 CHAR), 
	"ACTIVE" VARCHAR2(1), 
	"OUTPUT_SPLIT" VARCHAR2(10 CHAR), 
	"PREPEND_FILES_SQL" CLOB, 
	"APPEND_FILES_SQL" CLOB, 
	"SUB_TEMPLATES_SQL" CLOB, 
	"PLUGIN_TYPE" VARCHAR2(30), 
  "MIME_TYPE" VARCHAR2(150),
	 CONSTRAINT "AOP_AUTOMATED_TEST_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/


  CREATE TABLE "AOP_OUTPUT" 
   (	"ID" NUMBER, 
	"OUTPUT_BLOB" BLOB, 
	"FILENAME" VARCHAR2(200), 
	"MIME_TYPE" VARCHAR2(200), 
	"LAST_UPDATE_DATE" DATE, 
	 CONSTRAINT "AOP_OUTPUT_PK" PRIMARY KEY ("ID")
   ) ;


  CREATE TABLE "AOP_OUTPUT_ASYNC" 
   (	"ID" NUMBER, 
    async_status  VARCHAR2(4000),
    async_message VARCHAR2(4000),
    async_url     VARCHAR2(500), 
	"OUTPUT_BLOB" BLOB, 
	"FILENAME" VARCHAR2(200), 
	"MIME_TYPE" VARCHAR2(200), 
	"LAST_UPDATE_DATE" DATE, 
	 CONSTRAINT "AOP_OUTPUT_ASYNC_PK" PRIMARY KEY ("ID")
   ) ;


  CREATE TABLE "AOP_TEMPLATE" 
   (	"ID" NUMBER, 
	"TEMPLATE_BLOB" BLOB, 
	"FILENAME" VARCHAR2(200), 
	"MIME_TYPE" VARCHAR2(200), 
	"LAST_UPDATE_DATE" DATE, 
	"TEMPLATE_TYPE" VARCHAR2(20), 
	"DESCRIPTION" VARCHAR2(4000), 
	 CONSTRAINT "AOP_TEMPLATE_PK" PRIMARY KEY ("ID")
   ) ;


  CREATE TABLE "AOP_DEBUG" 
   (ID NUMBER, 
	DEBUG_DATE DATE DEFAULT SYSDATE, 
	p_message     varchar2(4000), 
  p0            varchar2(4000), 
  p1            varchar2(4000), 
  p2            varchar2(4000), 
  p3            varchar2(4000), 
  p4            varchar2(4000), 
  p5            varchar2(4000), 
  p6            varchar2(4000), 
  p7            varchar2(4000), 
  p8            varchar2(4000), 
  p9            varchar2(4000), 
  p10           varchar2(4000), 
  p11           varchar2(4000), 
  p12           varchar2(4000), 
  p13           varchar2(4000), 
  p14           varchar2(4000), 
  p15           varchar2(4000), 
  p16           varchar2(4000), 
  p17           varchar2(4000), 
  p18           varchar2(4000), 
  p19           varchar2(4000), 
  p_level       number(1), 
  p_description clob, 
	 CONSTRAINT "AOP_DEBUG_PK" PRIMARY KEY ("ID")
   ) ;


create table aop_log 
( id                       number not null enable, 
  start_date               date default sysdate not null enable, 
  p_data_type              varchar2(100),
  p_data_source            clob,
  p_template_type          varchar2(100),
  p_template_source        clob,
  p_output_type            varchar2(100),
  p_output_filename        varchar2(200),
  p_output_type_item_name  varchar2(100),
  p_output_to              varchar2(200),
  p_procedure              varchar2(4000),
  p_binds                  varchar2(4000),
  p_special                varchar2(4000),
  p_aop_remote_debug       varchar2(100),
  p_output_converter       varchar2(100),
  p_aop_url                varchar2(200),
  p_api_key                varchar2(100),
  p_aop_mode               varchar2(50), 
  p_app_id                 number,
  p_page_id                number,
  p_user_name              varchar2(100),
  p_init_code              clob,
  p_output_encoding        varchar2(100),
  p_output_split           varchar2(5),
  p_output_merge           varchar2(5),
  p_failover_aop_url       varchar2(200),
  p_failover_procedure     varchar2(4000),
  p_prepend_files_sql      clob,
  p_append_files_sql       clob,
  p_media_files_sql        clob,
  p_sub_templates_sql      clob,
  apex_session             number,
  apex_app_id              number, 
  apex_app_page_id         number, 
  apex_app_user            varchar2(200), 
  apex_user_agent          varchar2(2000), 
  apex_ip_address          varchar2(200), 
  apex_ip_address2         varchar2(200), 
  end_date                 date,   
  status                   varchar2(100), 
  aop_json                 clob,
  aop_error                varchar2(4000), 
  ora_sqlcode              number, 
  ora_sqlerrm              varchar2(4000), 
  constraint aop_log_pk primary key (id)
);

alter table aop_log add (
    p_output_even_page varchar2(4000),
    p_output_merge_making_even varchar2(4000),
    p_log_procedure varchar2(4000),
    p_compare_files_sql clob,
    p_attachments_sql clob,
    p_ref_cursor clob,
    p_sql_array clob,
    p_ig_selected_pks varchar2(4000)    
);

create or replace trigger aop_log_iutrg 
before insert on aop_log
 for each row begin  
   if :new.id is null 
   then 
     :new.id := to_number(sys_guid(),'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');  
   end if; 
 end;
/


CREATE OR REPLACE  TRIGGER "AOP_OUTPUT_IUTRG" 
before insert on AOP_OUTPUT
for each row 
begin  
   if :new.id is null 
   then 
     :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');  
   end if; 
end;
/

CREATE OR REPLACE  TRIGGER "AOP_OUTPUT_ASYNC_IUTRG" 
before insert on AOP_OUTPUT_ASYNC
for each row 
begin  
   if :new.id is null 
   then 
     :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');  
   end if; 
end;
/

CREATE OR REPLACE  TRIGGER "AOP_DEBUG_IUTRG" 
before insert on AOP_DEBUG
for each row 
begin  
   if :new.id is null 
   then 
     :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');  
   end if; 
end;
/

CREATE OR REPLACE  TRIGGER "AOP_TEMPLATE_IUTRG" 
  before insert ON aop_template FOR EACH ROW
BEGIN
  if :new.id is null 
  then 
     :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');  
  end if;     
END;
/

CREATE OR REPLACE TRIGGER "AOP_AUTOMATED_TEST_IUTRG" 
before insert on AOP_AUTOMATED_TEST
 for each row begin  
   if :new.id is null 
   then 
     :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');  
   end if; 
end;
/

CREATE TABLE "AOP_ERROR_LOOKUP" 
   (	"CONSTRAINT_NAME" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"MESSAGE" VARCHAR2(4000 CHAR) NOT NULL ENABLE, 
	"LANGUAGE_CODE" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	 CONSTRAINT "AOP_ERROR_LOOKUP_PK" PRIMARY KEY ("CONSTRAINT_NAME")
);

  CREATE TABLE "AOP_ERROR" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"ERR_TIME" TIMESTAMP (6) WITH LOCAL TIME ZONE DEFAULT localtimestamp NOT NULL ENABLE, 
	"APP_ID" NUMBER, 
	"APP_PAGE_ID" NUMBER, 
	"APP_USER" VARCHAR2(512 CHAR), 
	"USER_AGENT" VARCHAR2(4000 CHAR), 
	"IP_ADDRESS" VARCHAR2(512 CHAR), 
	"IP_ADDRESS2" VARCHAR2(512 CHAR), 
	"MESSAGE" VARCHAR2(4000 CHAR), 
	"PAGE_ITEM_NAME" VARCHAR2(255 CHAR), 
	"REGION_ID" NUMBER, 
	"COLUMN_ALIAS" VARCHAR2(255 CHAR), 
	"ROW_NUM" NUMBER, 
	"APEX_ERROR_CODE" VARCHAR2(255 CHAR), 
	"ORA_SQLCODE" NUMBER, 
	"ORA_SQLERRM" VARCHAR2(4000 CHAR), 
	"ERROR_BACKTRACE" VARCHAR2(4000 CHAR), 
	"ARG1_NAME" VARCHAR2(255 CHAR), 
	"ARG1_VAL" VARCHAR2(4000 CHAR), 
	"ARG2_NAME" VARCHAR2(255 CHAR), 
	"ARG2_VAL" VARCHAR2(4000 CHAR), 
	"ARG3_NAME" VARCHAR2(255 CHAR), 
	"ARG3_VAL" VARCHAR2(4000 CHAR), 
	"ARG4_NAME" VARCHAR2(255 CHAR), 
	"ARG4_VAL" VARCHAR2(4000 CHAR), 
	"ARG5_NAME" VARCHAR2(255 CHAR), 
	"ARG5_VAL" VARCHAR2(4000 CHAR), 
	"ARG6_NAME" VARCHAR2(255 CHAR), 
	"ARG6_VAL" VARCHAR2(4000 CHAR), 
	"ARG7_NAME" VARCHAR2(255 CHAR), 
	"ARG7_VAL" VARCHAR2(4000 CHAR), 
	"ARG8_NAME" VARCHAR2(255 CHAR), 
	"ARG8_VAL" VARCHAR2(4000 CHAR), 
	"ARG9_NAME" VARCHAR2(255 CHAR), 
	"ARG9_VAL" VARCHAR2(4000 CHAR), 
	"ARG10_NAME" VARCHAR2(255 CHAR), 
	"ARG10_VAL" VARCHAR2(4000 CHAR), 
	"PROCEDURE_NAME" VARCHAR2(255 CHAR), 
	 CONSTRAINT "AOP_ERROR_PK" PRIMARY KEY ("ID")) ;

  CREATE OR REPLACE TRIGGER "AOP_ERROR_IUTRG" 
before insert on AOP_ERROR
 for each row begin  
   if :new.id is null 
   then 
     :new.id := to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');  
   end if; 
 end;
/


SET DEFINE OFF;   


Insert into AOP_AUTOMATED_TEST (ID,DESCRIPTION,DATA_TYPE,TEMPLATE_TYPE,OUTPUT_TYPE,OUTPUT_FILENAME,EXPECTED_BYTES,RECEIVED_BYTES,RESULT,PROCESSING_SECONDS,SEQ_NR,DATA_SOURCE,TEMPLATE_SOURCE,OUTPUT_TYPE_ITEM_NAME,OUTPUT_TO,SPECIAL,PROCEDURE_,CREATED_DATE,RUN_DATE,APP_ID,PAGE_ID) values (79154343032776274722465249329506393396,'Page:   25: Print Column Chart (multi-serie) Pptx','SQL','APEX','pptx','p25_output_multiple_charts',33925,33925,'ok',0,41,'with both_lines as
(
SELECT 
   ''line 1'' line_name, 
   NULL    AS LINK,
       rownum        AS x,
       o.order_total AS y
        FROM aop_sample_customers c,
          aop_sample_orders o
        WHERE c.customer_id = o.customer_id
union all
SELECT 
  ''line 2'' line_name, 
   NULL                AS LINK,
    rownum                    AS x,
    o.order_total*1.21/rownum AS y
  FROM aop_sample_customers c,
    aop_sample_orders o
  WHERE c.customer_id = o.customer_id
),
lines as (select ''line 1'' line_name from dual
          union all
          select  ''line 2'' line_name from dual),
both_columns as
(
SELECT 
   ''column 1'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total)                          as y
                  from aop_sample_customers c, aop_sample_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
union all
SELECT 
  ''column 2'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total*1.21/rownum)                          as y
                  from aop_sample_customers c, aop_sample_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
    order by 2
),
columns as (select ''column 1'' column_name from dual
          union all
          select  ''column 2'' column_name from dual)          
SELECT ''file1'' AS "filename",
  CURSOR
  (SELECT CURSOR
    (SELECT ''line''                 AS "type",
      ''My Multi-Series Line Chart'' AS "name",
      CURSOR
      (SELECT line_name AS "name",
        CURSOR
        (select link, x as "x", y as "y"
           from both_lines bl 
          where bl.line_name = l.line_name
        ) AS "data"
      FROM lines l
      ) AS "lines"
    FROM dual
    ) AS "line_chart",
    cursor(select
            ''column'' as "type",
            ''My Column Chart'' as "name",   
            cursor
            (select
                576     as "width" ,
                336     as "height",
                ''Title'' as "title in chart" ,
                ''true''  as "grid"  ,
                ''true''  as "border"
              from dual
            ) as "options",
            cursor(select
                column_name as "name",
                cursor
                (select null as link, x as "x", y as "y"
           from both_columns bl 
          where bl.column_name = l.column_name                
                ) as "data"
              from columns l
                  ) as "columns"
          from dual) as "column_chart"
  FROM dual
  ) AS "data"
FROM dual
','aop_template_multiple_charts.pptx',null,null,null,null,to_date('02/09/16','DD/MM/RR'),to_date('06/09/16','DD/MM/RR'),232,25);
Insert into AOP_AUTOMATED_TEST (ID,DESCRIPTION,DATA_TYPE,TEMPLATE_TYPE,OUTPUT_TYPE,OUTPUT_FILENAME,EXPECTED_BYTES,RECEIVED_BYTES,RESULT,PROCESSING_SECONDS,SEQ_NR,DATA_SOURCE,TEMPLATE_SOURCE,OUTPUT_TYPE_ITEM_NAME,OUTPUT_TO,SPECIAL,PROCEDURE_,CREATED_DATE,RUN_DATE,APP_ID,PAGE_ID) values (79154343032777483648284863958681099572,'Page:   16: Print Column Chart (multi-serie) PDF','SQL','APEX','pdf','p16_output_column_chart_multi',64623,64623,'ok',2,42,'select
    ''file1'' as "filename",
    cursor(select
        cursor(select
            c.cust_first_name || '' '' || c.cust_last_name as "customer",
            c.cust_city                                  as "city"    ,
            o.order_total                                as "total"   ,
            o.order_timestamp                            as "timestamp"
          from aop_sample_customers c, aop_sample_orders o
          where c.customer_id = o.customer_id
          order by c.cust_first_name || '' '' || c.cust_last_name               
        ) as "orders",
        cursor(select
            ''column'' as "type",
            ''My Column Chart'' as "name",   
            cursor
            (select
                576     as "width" ,
                336     as "height",
                ''Title'' as "title in chart" ,
                ''true''  as "grid"  ,
                ''true''  as "border"
              from dual
            ) as "options",
            cursor(select
                ''column '' || to_char(nbr) as "name",
                cursor
                (select
                    c.cust_first_name || '' '' || c.cust_last_name as "x",
                    sum(o.order_total) * nbr                          as "y"
                  from aop_sample_customers c, aop_sample_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
                  order by c.cust_first_name || '' '' || c.cust_last_name                 
                ) as "data"
              from (select 1 as nbr from dual union select 1.21 as nbr from dual)
                  ) as "columns"
          from dual) as "chart"
      from dual) as "data"
  from dual ','aop_template_chart_with_data.docx',null,null,null,null,to_date('02/09/16','DD/MM/RR'),to_date('06/09/16','DD/MM/RR'),232,16);
Insert into AOP_AUTOMATED_TEST (ID,DESCRIPTION,DATA_TYPE,TEMPLATE_TYPE,OUTPUT_TYPE,OUTPUT_FILENAME,EXPECTED_BYTES,RECEIVED_BYTES,RESULT,PROCESSING_SECONDS,SEQ_NR,DATA_SOURCE,TEMPLATE_SOURCE,OUTPUT_TYPE_ITEM_NAME,OUTPUT_TO,SPECIAL,PROCEDURE_,CREATED_DATE,RUN_DATE,APP_ID,PAGE_ID) values (79154343032778692574104478587855805748,'Page:   25: Print Column Chart (multi-serie) Docx','SQL','APEX','docx','p25_output_multiple_charts',86800,86800,'ok',0,43,'with both_lines as
(
SELECT 
   ''line 1'' line_name, 
   NULL    AS LINK,
       rownum        AS x,
       o.order_total AS y
        FROM aop_sample_customers c,
          aop_sample_orders o
        WHERE c.customer_id = o.customer_id
union all
SELECT 
  ''line 2'' line_name, 
   NULL                AS LINK,
    rownum                    AS x,
    o.order_total*1.21/rownum AS y
  FROM aop_sample_customers c,
    aop_sample_orders o
  WHERE c.customer_id = o.customer_id
),
lines as (select ''line 1'' line_name from dual
          union all
          select  ''line 2'' line_name from dual),
both_columns as
(
SELECT 
   ''column 1'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total)                          as y
                  from aop_sample_customers c, aop_sample_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
union all
SELECT 
  ''column 2'' column_name, 
                    c.cust_first_name || '' '' || c.cust_last_name as x,
                    sum(o.order_total*1.21/rownum)                          as y
                  from aop_sample_customers c, aop_sample_orders o
                  where c.customer_id = o.customer_id
                  group by c.cust_first_name || '' '' || c.cust_last_name
    order by 2
),
columns as (select ''column 1'' column_name from dual
          union all
          select  ''column 2'' column_name from dual)          
SELECT ''file1'' AS "filename",
  CURSOR
  (SELECT CURSOR
    (SELECT ''line''                 AS "type",
      ''My Multi-Series Line Chart'' AS "name",
      CURSOR
      (SELECT line_name AS "name",
        CURSOR
        (select link, x as "x", y as "y"
           from both_lines bl 
          where bl.line_name = l.line_name
        ) AS "data"
      FROM lines l
      ) AS "lines"
    FROM dual
    ) AS "line_chart",
    cursor(select
            ''column'' as "type",
            ''My Column Chart'' as "name",   
            cursor
            (select
                576     as "width" ,
                336     as "height",
                ''Title'' as "title in chart" ,
                ''true''  as "grid"  ,
                ''true''  as "border"
              from dual
            ) as "options",
            cursor(select
                column_name as "name",
                cursor
                (select null as link, x as "x", y as "y"
           from both_columns bl 
          where bl.column_name = l.column_name                
                ) as "data"
              from columns l
                  ) as "columns"
          from dual) as "column_chart"
  FROM dual
  ) AS "data"
FROM dual
','aop_template_multiple_charts.docx',null,null,null,null,to_date('02/09/16','DD/MM/RR'),to_date('06/09/16','DD/MM/RR'),232,25);

commit;

Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (1,'aop_template_d01.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document',to_date('26/06/15','DD/MM/RR'),'docx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (2,'aop_template_p01.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',to_date('26/06/15','DD/MM/RR'),'pptx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (3,'aop_template_x01.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',to_date('09/12/15','DD/MM/RR'),'xlsx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (4,'aop_template_p02.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',to_date('02/08/15','DD/MM/RR'),'pptx',null);
Insert into AOP_TEMPLATE (ID,FILENAME,MIME_TYPE,LAST_UPDATE_DATE,TEMPLATE_TYPE,DESCRIPTION) values (5,'aop_template_p03.pptx','application/vnd.openxmlformats-officedocument.presentationml.presentation',to_date('02/08/15','DD/MM/RR'),'pptx',null);

commit;

update aop_template t
   set t.template_blob = (select a.blob_content
                            from apex_application_files a 
                           where a.filename = t.filename
                             and rownum < 2
                         )
 where t.template_blob is null;
 
commit; 

create or replace view aop_shared_component_templates
as 
select a.application_id,
       lower(a.attribute_07) as file_name, 
       case 
       when f.file_name is null 
       then 'File does not exists in Shared Components' 
       else 'OK'
       end as existance
  from apex_application_page_da_acts a
  left join apex_application_static_files f on lower(a.attribute_07) = lower(f.file_name) 
                                               and f.application_id = a.application_id
 where a.attribute_07 is not null
   and a.attribute_06 = 'APEX'
   and a.action_code = 'PLUGIN_BE.APEXRND.AOP_DA' 
union
select a.application_id,
       lower(a.attribute_07) as file_name, 
       case 
       when f.file_name is null 
       then 'File does not exists in Shared Components' 
       else 'OK'
       end as existance
  from apex_application_page_proc a
  left join apex_application_static_files f on lower(a.attribute_07) = lower(f.file_name) 
                                               and f.application_id = a.application_id
 where a.attribute_07 is not null
   and a.attribute_06 = 'APEX'
   and a.process_type_code = 'PLUGIN_BE.APEXRND.AOP' 
union all
select f.application_id,
       lower(f.file_name),
       'File not used' as existance
  from apex_application_static_files f
 where f.file_name is not null
   and lower(f.file_name) not in (select lower(a.attribute_07) 
                                    from apex_application_page_da_acts a
                                   where lower(a.attribute_07) is not null
                                     and a.application_id = f.application_id 
                                  union
                                  select lower(a.attribute_07) 
                                    from apex_application_page_proc a
                                   where lower(a.attribute_07) is not null
                                     and a.application_id = f.application_id 
                                 )
   and f.mime_type in ('application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                       'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                       'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                       'text/html',
                       'text/markdown',
                       'text/plain',
                       'text/csv',
                       'application/vnd.ms-word.document.macroenabled.12',
                       'application/vnd.ms-excel.sheet.macroenabled.12',
                       'application/vnd.ms-powerpoint.presentation.macroenabled.12',
                       'text/calendar'
                    )
 order by application_id, file_name;  
   
CREATE TABLE  "AOP_PDF_FORM" 
   (	"ID" NUMBER, 
	"FORM_ITEM" VARCHAR2(100), 
	"ITEM_TYPE" VARCHAR2(100), 
	"ITEM_NAME" VARCHAR2(100), 
	"ITEM_VALUE" VARCHAR2(4000), 
	"TEXT" VARCHAR2(4000), 
	"HEIGHT" NUMBER, 
	"WIDTH" NUMBER, 
	"PARENT_ID" NUMBER, 
	 CONSTRAINT "AOP_PDF_FORM_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

ALTER TABLE  "AOP_PDF_FORM" ADD CONSTRAINT "AOP_PDF_FORM_FK" FOREIGN KEY ("PARENT_ID")
	  REFERENCES  "AOP_PDF_FORM" ("ID") ENABLE  
/

CREATE SEQUENCE   "AOP_PDF_FORM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 CACHE 20
/

CREATE OR REPLACE TRIGGER  "BI_AOP_PDF_FORM" 
  before insert on "AOP_PDF_FORM"               
  for each row  
begin   
  if :NEW."ID" is null then 
    select "AOP_PDF_FORM_SEQ".nextval into :NEW."ID" from sys.dual; 
  end if; 
end;
/

ALTER TRIGGER  "BI_AOP_PDF_FORM" ENABLE
/

insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (1,'checkbox','checkbox','Agree','false','I agree',10,100,null);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (2,'first_name','text','First Name',null,null,15,100,null);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (3,'last_name','text','Last Name',null,null,15,100,null);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (4,'radiolist','list','radiolist',null,null,null,null,null);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (5,null,'radio','radiolist','List A','List option A',10,100,4);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (6,null,'radio','radiolist','List B','List option B',10,100,4);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (7,'radio','list','radio',null,null,null,null,null);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (8,'a','radio','radio','A','Option B',15,100,7);
insert into aop_pdf_form (id, form_item, item_type, item_name, item_value, text, height, width, parent_id) values (9,'b','radio','radio','B','Option A',15,100,7);

commit;
