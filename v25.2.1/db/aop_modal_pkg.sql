set define off verify off feedback off

declare 
  l_check number(1);  
begin

  -- TABLE: AOP_CONFIG
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_CONFIG';

  exception 
  when no_data_found then 
    begin
    execute immediate q'~
      create table aop_config (
        id                 number not null,  
        aop_url            varchar2(200) not null,
        api_key            varchar2(50),
        aop_mode           varchar2(15),
        failover_aop_url   varchar2(200),
        failover_procedure varchar2(200),
        debug              varchar2(10),
        converter          varchar2(100),
        settings_pkg       varchar2(100),
        logging_pkg        varchar2(100),
        email_from         varchar2(200),
        created          date not null,
        created_by       varchar2(255) not null,
        updated          date not null,
        updated_by       varchar2(255) not null,
        CONSTRAINT aop_config_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
        )
    ~';
    end;

    begin
    execute immediate q'~
      begin
        insert into aop_config (id, aop_url, created, created_by, updated, updated_by) values (1, 'https://api.apexofficeprint.com', sysdate, 'AOP', sysdate, 'AOP');
        commit;        
      end;
    ~';
    end;
  end;

  -- TABLE: AOP_DOWNSUBSCR_TEMPLATE
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_TEMPLATE';

  exception 
  when no_data_found then 
    execute immediate q'~
        create table aop_downsubscr_template (
        id               number not null,  
        title            varchar2(255) not null,
        description      clob, 
        template_blob    blob,
        template_url     varchar2(255),
        file_name        varchar2(255),
        mime_type        varchar2(255),
        last_update_date date,
        template_default number(3) default 0,
        report_types     varchar2(255), 
        output_types     varchar2(255), 
        created          date not null,
        created_by       varchar2(255) not null,
        updated          date not null,
        updated_by       varchar2(255) not null,
        CONSTRAINT aop_downsubscr_template_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
        )
    ~';
  end;    

  -- TABLE: AOP_DOWNSUBSCR_TEMPLATE_APP
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_TEMPLATE_APP';

  exception 
  when no_data_found then 
    execute immediate q'~
        create table aop_downsubscr_template_app (
        id                     number not null,  
        downsubscr_template_id number not null
                        constraint aop_downsubscr_template_app_fk references aop_downsubscr_template,
        app_id                 number,
        page_id                number,
        region_id              number,
        template_default       number(3),
        created                date not null,
        created_by             varchar2(255) not null,
        updated                date not null,
        updated_by             varchar2(255) not null,
        CONSTRAINT aop_downsubscr_template_app_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
        )
    ~';
  end;   

  -- TABLE: AOP_DOWNSUBSCR_TEMPLATE_APP
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_TEMPLATE_APP';

  exception 
  when no_data_found then 
    execute immediate q'~
        create table aop_downsubscr_template_app (
        id                     number not null,  
        downsubscr_template_id number not null
                        constraint aop_downsubscr_template_app_fk references aop_downsubscr_template,
        app_id                 number,
        page_id                number,
        region_id              number,
        template_default       number(3),
        created                date not null,
        created_by             varchar2(255) not null,
        updated                date not null,
        updated_by             varchar2(255) not null,
        CONSTRAINT aop_downsubscr_template_app_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
        )
    ~';
  end;   

  -- TABLE: AOP_DOWNSUBSCR
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR';

  exception 
  when no_data_found then 
    execute immediate q'~
      create table aop_downsubscr
      ( id                        number not null,  
        app_id                    number,
        page_id                   number,
        region_pipe_report_ids    varchar2(4000), 
        items_in_session          varchar2(4000),
        app_user                  varchar2(4000),
        template_type             varchar2(100),
        template_source           clob,  
        output_type               varchar2(4000),
        output_to                 varchar2(100),
        output_procedure          varchar2(100),  
        start_date                TIMESTAMP WITH LOCAL TIME ZONE,
        end_date                  TIMESTAMP WITH LOCAL TIME ZONE,
        repeat_every              number,
        repeat_interval           varchar2(100),
        repeat_days               varchar2(100),
        repeat_string             varchar2(255),
        email_from                varchar2(4000),
        email_to                  varchar2(4000),
        email_cc                  varchar2(4000),
        email_bcc                 varchar2(4000),
        email_subject             varchar2(4000),
        email_body_text           clob,
        email_body_html           clob,
        comments                  varchar2(4000),
        job_name                  varchar2(4000),
        init_code                 clob,
        email_download_link       varchar2(4000),
        email_blob_size           number,
        save_log                  varchar2(1), 
        created                   date not null,
        created_by                varchar2(255) not null,
        updated                   date not null,
        updated_by                varchar2(255) not null,
        CONSTRAINT aop_downsubscr_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';

    execute immediate q'~
      create sequence aop_downsubscr_seq
    ~';
  end;   

  -- TABLE: AOP_DOWNSUBSCR_ITEM
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_ITEM';

  exception 
  when no_data_found then 
    execute immediate q'~
      create table aop_downsubscr_item (
        id            number not null,  
        downsubscr_id number not null
                      constraint aop_downsubscr_item_report_fk references aop_downsubscr,
        item_name     varchar2(255),
        item_value    clob, 
        created       date not null,
        created_by    varchar2(255) not null,
        updated       date not null,
        updated_by    varchar2(255) not null,
        CONSTRAINT aop_downsubscr_item_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';
  end;   

  -- TABLE: AOP_DOWNSUBSCR_LOG
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_LOG';

  exception 
  when no_data_found then 
    execute immediate q'~
      create table aop_downsubscr_log
      ( id                        number not null,
        app_id                    number,
        page_id                   number,
        region_pipe_report_ids    varchar2(4000), 
        app_user                  varchar2(4000),
        output_filename           varchar2(300),
        output_mime_type          varchar2(250),
        downsubscr_id             number
                                  constraint aop_downsubscr_log_fk references aop_downsubscr,
        created                   date not null,
        created_by                varchar2(255) not null,
        CONSTRAINT aop_downsubscr_log_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';
  end;   

  -- TABLE: AOP_DOWNSUBSCR_OUTPUT
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_OUTPUT';

  exception 
  when no_data_found then 
    execute immediate q'~
      create table aop_downsubscr_output
      ( id                        number not null,
        app_id                    number,
        page_id                   number,
        app_user                  varchar2(4000),
        downsubscr_id             number 
                                  constraint aop_downsubscr_output_fk references aop_downsubscr,
        output_filename           varchar2(300),
        output_blob               blob,
        output_mime_type          varchar2(250),  
        created                   date not null,
        created_by                varchar2(255) not null,
        CONSTRAINT aop_downsubscr_output_pk PRIMARY KEY (ID)
        USING INDEX  ENABLE
      )
    ~';
  end;     

  -- TABLE: AOP_DOWNSUBSCR_MESSAGE
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_MESSAGE';

  exception 
  when no_data_found then 
    execute immediate q'~
      create table aop_downsubscr_message
      ( id                        number not null,
        name                      varchar2(100), 
        language                  varchar2(100), 
        message                   varchar2(4000), 
        created                   date not null,
        created_by                varchar2(255) not null,
        updated                   date not null,
        updated_by                varchar2(255) not null,
        constraint aop_downsubscr_message_pk primary key (id) using index enable,
        constraint aop_downsubscr_message_uk unique (name,language) using index enable
      )
    ~';
  end; 

  -- TABLE: AOP_DOWNSUBSCR_EXT_IN_OUT
  begin
    select 1
      into l_check
      from user_tables
     where table_name = 'AOP_DOWNSUBSCR_EXT_IN_OUT';

  exception 
  when no_data_found then 
    execute immediate q'~
      create table aop_downsubscr_ext_in_out (
          id                             number not null constraint aop_downsubscr_ext_id_pk primary key,
          in_ext                         varchar2(15),
          in_mime_type                   varchar2(255),
          out_ext                        varchar2(15),
          out_mime_type                  varchar2(255),
          description                    varchar2(4000),
          created                        date not null,
          created_by                     varchar2(255) not null,
          updated                        date not null,
          updated_by                     varchar2(255) not null,
          constraint aop_downsubscr_ext_in_out_uk UNIQUE (in_ext,out_ext)
      )    
    ~';
  end; 

  -- SEQUENCE: AOP_DOWNSUBSCR_ITEM_SEQ
  begin
    select 1
      into l_check
      from user_sequences
     where sequence_name = 'AOP_DOWNSUBSCR_ITEM_SEQ';

  exception 
  when no_data_found then 
    execute immediate q'~
      create sequence aop_downsubscr_item_seq start with 1 increment by 1 nocache nocycle  
    ~';
  end; 


end;
/

create or replace trigger aop_config_biu
    before insert or update 
    on aop_config
    for each row
begin
    if :new.id is null then
        :new.id := 1;
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_config_biu;
/

create or replace trigger aop_downsubscr_template_biu
    before insert or update 
    on aop_downsubscr_template
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_template_biu;
/

create or replace trigger aop_downsubscr_template_app_bi
    before insert or update 
    on aop_downsubscr_template_app
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_template_app_bi;
/

create or replace trigger aop_downsubscr_biu
    before insert or update 
    on aop_downsubscr
    for each row
begin
    if :new.id is null then
        $IF DBMS_DB_VERSION.VER_LE_11 $THEN
        :new.id := aop_downsubscr_seq.nextval;
        $ELSIF DBMS_DB_VERSION.VER_LE_12 $THEN
        :new.id := aop_downsubscr_seq.nextval;
        $ELSE
        :new.id := aop_downsubscr_seq.nextval;
        -- sometimes people still haven't enabled long names in 19c
        --:new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
        $END    
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_biu;
/

create or replace trigger aop_downsubscr_item_biu
    before insert or update 
    on aop_downsubscr_item
    for each row
begin
    if :new.id is null then
        :new.id := aop_downsubscr_item_seq.nextval;
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_item_biu;
/

/* -- only works when long names are supported
create or replace trigger aop_downsubscr_item_biu
    before insert or update 
    on aop_downsubscr_item
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_item_biu;
/
*/

create or replace trigger aop_downsubscr_log_biu
    before insert or update 
    on aop_downsubscr_log
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
end aop_downsubscr_log_biu;
/

create or replace trigger aop_downsubscr_output_biu
    before insert or update 
    on aop_downsubscr_output
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
end aop_downsubscr_output_biu;
/

create or replace trigger aop_downsubscr_message_biu
    before insert or update 
    on aop_downsubscr_message
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_message_biu;
/

create or replace trigger aop_downsubscr_ext_in_out_biu
    before insert or update 
    on aop_downsubscr_ext_in_out
    for each row
begin
    if :new.id is null then
        :new.id := to_number(sys_guid(), 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
    end if;
    if inserting then
        :new.created := sysdate;
        :new.created_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := nvl(sys_context('APEX$SESSION','APP_USER'),user);
end aop_downsubscr_ext_in_out_biu;
/

CREATE OR REPLACE FORCE VIEW "OUTPUTTO_COLLECTION" ("ID", "FILENAME", "MIMETYPE", "FILE_CONTENT") AS 
  select
  seq_id id,
  c001 filename,
  c002 mimetype,
  blob001 file_content
from
  apex_collections
where
  collection_name = 'OUTPUTTO_COLLECTION'
/

CREATE OR REPLACE PROCEDURE "AOP_OUTPUTTO_COLLECTION" (
  p_output_blob      in blob,
  p_output_filename  in varchar2,
  p_output_mime_type in varchar2
) is
  v_collection_name varchar2(100) := 'OUTPUTTO_COLLECTION';
begin

  if not apex_collection.collection_exists(v_collection_name)  then
    apex_collection.create_or_truncate_collection( v_collection_name );
  end if;

  APEX_COLLECTION.ADD_MEMBER (
    p_collection_name => v_collection_name,
    p_c001            => p_output_filename,
    p_c002            => p_output_mime_type,
    p_blob001         => p_output_blob
  );

end aop_outputto_collection;
/


create or replace procedure aop_outputto_email (
  p_output_blob      in blob,
  p_output_filename  in varchar2,
  p_output_mime_type in varchar2
) is
  l_mail_id              number;
  l_downsubscr_output_id aop_downsubscr_output.id%type;
  l_email_body_text      varchar2(4000);
begin
  -- the AOP Plug-in will store the email form in the AOP_OUTPUTTO collection
  for r in (select
              c001 as app_id,
              c002 as page_id,
              c003 as region_pipe_report_ids,
              c004 as app_user,
              c005 as template_type,
              c006 as template_source,
              c007 as output_type,
              c008 as output_to,
              c009 as output_procedure,
              c010 as email_from,
              c011 as email_to,
              c012 as email_cc,
              c013 as email_bcc,
              c014 as email_subject,
              c015 as email_body_text,
              c016 as email_body_html,
              c017 as email_download_link,
              c018 as email_blob_size,
              c019 as save_log,
              c020 as downsubscr_id
              from apex_collections
             where collection_name = 'AOP_OUTPUTTO')
  loop
    -- loop will happen only 1 time, for ease of coding used a for loop       

    -- for small files, send directly with email
    if dbms_lob.getlength(p_output_blob) < 500000
    then
      l_mail_id := apex_mail.send(
                      p_from  => r.email_from, 
                      p_to    => r.email_to, 
                      p_cc    => r.email_cc,
                      p_bcc   => r.email_bcc,
                      p_subj  => r.email_subject, 
                      p_body  => r.email_body_text
                  );
   
      -- we send the document as attachment
      apex_mail.add_attachment( 
          p_mail_id    => l_mail_id, 
          p_attachment => p_output_blob, 
          p_filename   => p_output_filename,  
          p_mime_type  => p_output_mime_type);      
    
    else
      -- for large files, we will send a link to the document.
      insert into aop_downsubscr_output(
        downsubscr_id, 
        output_filename, 
        output_blob, 
        output_mime_type
      ) values(
        r.downsubscr_id, 
        p_output_filename, 
        p_output_blob, 
        p_output_mime_type
      ) returning id into l_downsubscr_output_id;      

      if instr(r.email_body_text,'#DOWNLOAD_LINK#')>0
      then
          l_email_body_text := replace(r.email_body_text, '#DOWNLOAD_LINK#', r.email_download_link||'&aop_downsubscr_output_id=' || l_downsubscr_output_id);
      else 
          l_email_body_text := r.email_body_text || CHR(10) || ' <br/>As the file was too big, click to <a href="' || r.email_download_link||'&aop_downsubscr_output_id=' || l_downsubscr_output_id || '">download the file</a>.';
      end if;

      l_mail_id := apex_mail.send( 
                          p_from => r.email_from,  
                          p_to   => r.email_to,  
                          p_cc   => r.email_cc, 
                          p_bcc  => r.email_bcc, 
                          p_subj => r.email_subject,  
                          p_body => l_email_body_text); 
      -- no attachment
    end if; 

  end loop;

  -- push queue
  apex_mail.push_queue;   

end aop_outputto_email;
/

create or replace package aop_modal_api_pkg 
as  

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

  procedure subscribe_to_report(
    p_app_id                    in aop_downsubscr.app_id%type,
    p_page_id                   in aop_downsubscr.page_id%type,
    p_region_pipe_report_ids    in aop_downsubscr.region_pipe_report_ids%type, -- format: region_id|report_id
    p_items_in_session          in aop_downsubscr.items_in_session%type,       -- format: P1_X,P1_Y
    p_app_user                  in aop_downsubscr.app_user%type,
    p_report_format             in aop_downsubscr.output_type%type,
    p_template_sql              in aop_downsubscr.template_source%type,
    p_output_to                 in aop_downsubscr.output_to%type,
    p_output_procedure          in aop_downsubscr.output_procedure%type,
    p_email_from                in aop_downsubscr.email_from%type,
    p_email_to                  in aop_downsubscr.email_to%type,
    p_email_cc                  in aop_downsubscr.email_cc%type,
    p_email_bcc                 in aop_downsubscr.email_bcc%type,
    p_email_download_link       in varchar2,
    p_email_blob_size           in varchar2,
    p_save_log                  in varchar2,      
    p_subject                   in aop_downsubscr.email_subject%type,
    p_body_text                 in aop_downsubscr.email_body_text%type,
    p_body_html                 in aop_downsubscr.email_body_html%type,
    p_when                      in varchar2,  -- now or scheduled
    p_start_date                in aop_downsubscr.start_date%type,
    p_end_date                  in aop_downsubscr.end_date%type,
    p_repeat_every              in aop_downsubscr.repeat_every%type,
    p_repeat_interval           in aop_downsubscr.repeat_interval%type,
    p_repeat_days               in aop_downsubscr.repeat_days%type,
    p_init_code                 in aop_downsubscr.init_code%type,
    po_downsubscr_output_id     out aop_downsubscr_output.id%type,
    po_output_blob              out aop_downsubscr_output.output_blob%type,
    po_output_filename          out aop_downsubscr_output.output_filename%type,
    po_output_mime_type         out aop_downsubscr_output.output_mime_type%type,
    po_job_name                 out aop_downsubscr.job_name%type  
  );
  procedure run_scheduled_report(
    p_downsubscr_id in aop_downsubscr.id%type);

-- To force immediate job execution   
procedure execute_job (
  p_job_name in user_scheduler_jobs.job_name%type);  
   
-- Remove job from scheduler by name   
procedure remove_job (
  p_job_name in user_scheduler_jobs.job_name%type) ;  
   
-- Indicates whether the job is enabled (TRUE) or not (FALSE)  
function is_job_enabled (
  p_job_name in user_scheduler_jobs.job_name%type)   
return boolean;  
   
-- Enable job from scheduler by name   
procedure enable_job (
  p_job_name in user_scheduler_jobs.job_name%type);  
   
-- Disable job from scheduler by name   
procedure disable_job (
  p_job_name in user_scheduler_jobs.job_name%type);  
  
end aop_modal_api_pkg;
/
create or replace package aop_modal_pkg as   
 
  /**
  * @project: 
  *   United Codes APEX Office Print
  *
  * @description: 
  *   The package contains the plug-in PL/SQL code implementing dynamic action plug-in
  *
  * @author: 
  *  Bartosz Ostrowski
  *
  * @created: 
  *   Dimitri Gielis
  * 
  * United Codes
  * Copyright (C) 2015-2024 by United Codes
  *
  * Changelog:
  *   
  *   v21.2   2021-10-05 - form elements can be validated using the plug-in attribute Initialization JavaScript Code
  *                        function( pOptions ) {
  *                          pOptions.validation.scheduleDateStart = function( pStartDateValue, pStartDateVisible, pEndDateValue, pEndDateVisible ) {
  *                            if ( 1 == 1 ) {
  *                              //validation failed
  *                              return 'Custom validation message';  
  *                            }
  *                            //validation passed    
  *                            return null;
  *                          };
  *                            
  *                          pOptions.validation.emailTo = function( pValue ) {
  *                            if ( 1 == 1 ) {
  *                              //validation failed
  *                              return 'Custom validation message';  
  *                            }
  *                            
  *                            //validation passed
  *                            return null;
  *                          };
  *                        
  *                          return pOptions;
  *                        }    
  *                      - date start and date end has built in validation checking if start date is before the date end
  *
  *   v21.1.3 2021-09-14 - email from can be now specified using the plug-in attribute Initialization JavaScript Code
  *                        example code: 
  *                        function( pOptions ){ 
  *                          //pOptions.emailFrom = "ostrowski.bartosz@gmail.com"; // static assigment
  *                          //pOptions.emailFrom = apex.item('PX_ITEM_NAME');     // current value of a given APEX item
  *                          return pOptions;
  *                        }
  *
  */

  g_template_id_arr      apex_t_varchar2; 
  g_template_name_arr    apex_t_varchar2; 
  g_template_default_arr apex_t_varchar2;  
  g_template_type_arr    apex_t_varchar2; 
  g_mime_type_arr        apex_t_varchar2; 
  
  g_default_cnt_arr      apex_t_number;
  g_blob                 blob;
 
 
  function render(  
    p_dynamic_action in apex_plugin.t_dynamic_action,  
    p_plugin         in apex_plugin.t_plugin   
  ) return apex_plugin.t_dynamic_action_render_result; 
   
  function ajax( 
    p_dynamic_action in apex_plugin.t_dynamic_action, 
    p_plugin         in apex_plugin.t_plugin  
  ) return apex_plugin.t_dynamic_action_ajax_result;   
 
end aop_modal_pkg; 
/
create or replace package body aop_modal_api_pkg wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
9b15 2501
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

/
create or replace package body aop_modal_pkg wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
1822c 55ed
o+WbRbuDGVDFwIgw3aTQTQVny9Qwg80Q9sf9gPGPEItkTY87KN3L26gmB8bbhf3KUBqj4ftW
qxoa8PAeEeFint/ncKZpp58AtXPFHnOK4jkWMRkDC9SnUI2Tk2TY2M/LBZB4zdnnkChFu8xh
cWP+2d7fruokmmufrC97V921gF0PFvKG+S6YH7/rqp1KYLvrCPg4RomqUb+QEVdKW3M8+0R2
SoOc6nk62kDQxjIf7BsjwCPPz88lEahjatyD8P9klutS0khfdrX1OXORaLnQsy4Sd0I9HJA8
DyGP/kj1s7y57k8eKqwOQLPlzlE/+DQfMnPO/1vWh3e5TpqtvNza9FAF6swPsFa5jCPNEIl3
7E08bUhRGZkIsCwnsiE5qQh9e+bMKGoPoO6azJ0K69InRmm0BE+keI7sJ67htSYpc2xqn0mr
zVBP1tSMjO/4gIydGY/AVxjRBr9jc5B2hAdRnbXNhIkzQHkBsvix6sHi+1KiSWJFPtreEgTt
DCBRzKzEGlVBz6Swbm48+800gn2BUcsxlXMzXMMiGLZ5PIPWOL+lYZr9oJgNp9ta36qr7W17
sYZNq2A5ieBHNu+QUZ+DShYlzPXeSmSKNHcWdElpNZ8/ABzq6WA4doWHt8cP34PBgxE+Weyi
S+fW83BDEcaMzptlqwDL8HYx77MRcKTgKxMVHBZ6IKv0cx6HrohWycVzUoMplZB4Q0n+viK0
+s/fOr48JczwUZ/+EAHDHnoTPyYNoEyAeChMBv9NL1j/zJLNUs+2Y/qd/nxK7nAhPP5fGHgZ
+yB6xd2/vh28DEIZQABH988dv3B6PbAt71oDL5WNL5VE49HVqAk5eBwzcIKw5AsxHDq8qAhZ
Tigxas/Zn/3GNnr2X6yfE92Jqv8bqQcYNuZ83QytHNC0QGvvpJ+WNARP/GpxLiRNExXb0uKc
NJnaQQ1yTtfBZsNVNUmOPfWtPqKBJ889maKBUhIkluY9oUjmsCfCOsNGKeX9NMS5sOnjOVVS
FqHZKWEEXtNK3h0G6fPiOFfijZHiM4t2SoT+rycNc3GpvQ/OKR42SHv965r1WcpQtaCT0fJL
7oYpvJrc/RtheT+d7BcFbhyFDFYMsl7RtBrtU7XUp2O4txw4DFIsgjcIV7kPG4BngM/Lm9kI
+r9nWgwO2ruy/+sU+dCFYuyNa9oqUGzN/VPHlrNIfUGrfVEKn2gMlmDWCpBQAAt9FiILf1D/
twcUIhX2CFwnvXxcyXLdwTT75VlPrGQuRhGghsB6AyltEvdOAgRGu779D2gtoXQV/hXwILTW
bCl0Rczpz5q6zjmxhu4qGZbWkH34EwIoGV2JvEylc3Du77sLoIaSQXYKxi5+weMA7cWMA9Bb
IA39QrAbQghXRfKl4Br6gTpceuLjuSYqo7RW0dPWUD5H6WUSaMg+esMrVJJ1f2dGphvzx2vL
mspsu0JObFbbz3gienfFlvZ1WOZGe0mg8/kOD+ysQm9QB7t6nXeGYyiMq8TrNZ3B6bKcf0cS
BGNRrdhKQMgqqONDkokYfHGcj2oUK+jDQDfo6U171hmBXJoD3XKgvRourfWIEPUBn0yUXULJ
fOgSIqs0Lhrx+jo2JXeZoO0tg27WbQLLEsdOjZ8OZuahRMMa7f09RLgOuUKDYyhQJYawoJZn
59qN4FaNZT0zSF+QHpHY4w9jBN4S6Du4VtFoVN6qpWGKXCd2b3Q4UIAvbJDqzP6jzJacgnbL
7ua/Gbk0vnay4vhVaTnVqOciC0vD5GbEIp6x5j0O7ULSBOWfxAqebMuSQfyArnmWjZjfJZG4
APzOVO76/m8J6IEOcCLbBi3APyk4mnv+8836vMPBb1IAvYWmoj6KiUMMsfaQZKcezc7ZxcG2
fu9f4kDtM7TaH3Jx55UM16Ly4rKUC+cJ5M5OCxrZJm0aY4aHIn7qKAUIJWCAmlQBfXSHE5oX
A74surBepLoXBmqf4mvVEAe2fsG2JEU35dZiAQSOVdMhS0jPVAQQYip5Y3TxjwwcSKqXSbr9
YwwOlkMfnc9HH9/F/ykJdHqrSTjaIII6da4si0LC1zwFLvslTQ8Ozn9AR/dgbSYobG+ZBGs4
VuOMigbv5hFiFf2UCE7BhzR1cSgrRz5RMwSJkqI8MnBzr/QyiWSbfv0Ql7EPnuifjjj0U5om
RjrgkLWGqA9ZzzB/Fz9PjpttnZRpaNe8yALayE0gg+32ShNIfJ8K2mTAxgC5auYqt/8Alru9
NOUNpwertFjeLDzow1Uuozp9qDBTQSHIHKwperm/rxqIt4CkmBaGrGLOdwjJC2cVM9S7L+S6
xQ8y2gA297ZrP6GNQd6U2/QJl+TaANEABJVO+83+pXAMPT9VP5yHskXMI4jw9CM4esiXRFuV
liHkvzqfYde7eAVDi+4zPxt1yECn0Ki9p2t/o+KSVbQWanS0i5T4rU96Wt7m4IZmH+XAldyc
nVaL2V8tgBuGDwnYUk/KYVwJGNBqCFKMY9YWYKAYylLE8paR1cP7N7DiYt5vrDQcbtpob541
NsTcrDVoRVL92yr7PegxpxgMZ3wgfOkZZS+caf0h+9qpfSXeL4W++7amUW0CQ8rocKM5Bitz
b6xTFOaZ27Jr4xL7L0AhH+anqE0CqQQJVH2Plo46xabbyG7y0HWb0v3wNErcywTFEhZnlXzS
Qzsy4GoOA5yLrjKLM4C5NxEhq4+xki+a8Wp/F7+hXQ3PJABz+ZX+5WoEquhRnSBhHkMGuYBR
YRrQBp21jXNAyf2gQlSvIDqOeWdxT2K5UJYDzYDmpHsAInsA5oZsg1bBT8Cgc3ULyNeEShxv
VMuQ5NgLLIi0JNic/lECyhb6wc4CKrrRkWp+mExySAgqMBSOb5I29VuSdoqt+01KT/OIq1aL
D6sPv2VoAAAZ24+TKYdfWM2Svy2C35GOEfSqk23RRXfzOQi86SRZ1LDW06N+0XEzW3MWfmlz
bOD/31paEaXZfveu176M7GniEJgYtxS5Dzn/pByLJ/m4/pFhZ7dDBmqKuTiQr/FrPXtP/xsF
siO03aIuHEuKQtBNn1t5nC5G6vPXpf6VwB7vXwSoBXyKfwTYGIlLGziEYHd+fwX/wjqKnRZc
pc5uOwjD4w35pftky4clEUGawW3NYJO9kI78bmi+U1mvOkq7S6YJGT9HH8CGOXnHNDGlsc2c
G4qMRKMG66xhA63o+HySevrBBy71zp++QRWqZMKBcsqLHFF+f+kHj8v14xsx4VUG1lP6sJJX
w2rjl+Yd1DUp215cRfTMc6WY1zgdVYbpW2XfdsArUmZK9Qa+ytc85ucHNcE4Cm6aMj9bmDj4
AY1Pa7vfI5ZHiSe91PvtcYZVQLO/p140w3A4Hie7KK/YIY3aiFkRKAgGthnXXncbtgL0JN9p
6wyc3MibNCape/g++F+5CC9+ilWfGPNM25xjGCSWMymc6Z8kEw5fdKbu17i/nGQ36V3SNnvU
FKD53XQGRnbdS4cF6z7ypygeoUplPyWTJP0BEkiZ2o7VjiWopKdwllOq5LWI5HXXCKRaM6Rj
Whwfn6NJ2fi6cNbSNLcKY24u+4F1TxinoJkoH9YfrSTpEO4fiCF8YHu4HijZW0feIlaxuChI
CKMGARD0j4X4Ev0P8OXS34fRsxBhzhXc/ED/QAPaizQkWWS3Teag2y3on0UmsVeeiG/hndtM
RvLIo6g5dial/+PaeVcegJwp6SClb4ZdAC9yICAfmP7IX4yozWD8et0G6ZP/hSEn5UEUdLZs
8BUUmjjnlQs5tfzmzKyhNeZzaEW7f23w2hyxlqxAwgaMLbOnszWdbyWoL1AkoMhIzaRKOaTk
PKvpWtvQZ85aaLtgMINr6W7ItW6AGkngV4FGbo9bX8HZD9wpI2qMs7OumQLMAkMDgGwe9NBW
PMyZ3sPutUxx/imj9IucVMX96YYezA9uYiwQ2Ij1acQWJyPj9eQZuGnw+hGoVQyEE6K4LQpe
ZUB3mtEr59SdeKngm3M55Fwp9j2B2GPvZmKQDEJnncyUfC8/IRwN2lNOg7/9jsxVG3tulrtn
YFeiDejf55IGgTcLNekgGcMG26tRIAE25MyQX4BUGiTypWt2sTqOWuNtr+eVfGxJgIDTkk2C
U9QFO3jdwEc3wOh29ZC+Ee/VpHiz6xt7SCGUwvxSHQj3JQF2dAzJ4s99+aHGvz2bhPpuBZnF
y/tV9kAoyCMEfMt9WAdKLRBI/HgGRmL/FvLjpvlKLbvMd22DofXbjwgLgFO1PtdM+PcggMel
UrXgcH5TmM8Fh0NPIJuBOQ+wBzOOyiTxwr5JgtYvMsZd2ulKQPnT/sYd+aFY4UVzZyrYuXzf
bF2wPDcA87l5OwZ5UYPMsiDCHf7UqTg1MAYWmo9bR4iUG0c15c6rYvVpfNd+bRDWk4tHK1hK
b4ZAkiJ+QlOoSD32T4AA4l7jmL3BXx3otMa6mmj2LrMUG/xcgLa38J7XUW3w5h1LifOQj8vP
M8p+cv7CBc//mpwI9U60DKx3kHLEfBn8s02aufeIEZsPlB2ocynkRf45Lc7MwHrbs/NesYkk
LfrxwenafOVTY1QIWrfEZGY0isK+fvQ+Qj6VcRmmuxR5NiHIQmfmDQiuVLx+1m1/NoJtLAXB
1hNNPGlSXw/pMC9ZwESOz+ygKJEWMy8OoRUW/l5ZWi4l/4ERNsCzDMMSTyBXlKwKbXnwvkBu
g6dha/pJe5XibYVCJZ2SGcVTiV30eHJlqJoQm7cRzzH9bsQSaAaWy7w+GMZz5giY9FduqDe6
uAaYXbLQx2EIjP7AvDTXi3gxI6dV/07869A0tUalOB46rMRQUIFZzBzFGvQw40sguREsW99i
vIAOn1v+ialPg4+jVq69zl6kaCOdjakkgiN47zLy3U/a3T3dbtOlH8u4KsuwNuQSpGiemD77
tRPLSOkxiam1UAlrYmonf9L6UtmDISfnLr3S9Dl56YyJZ08nUCvPWb3S66cNycX7bFByowZL
rYbTjccmLGVEl8sk0meQ5WmfiWtb/CaeAdpZMA5BlAjyyCBJ2fg9wPeWYQnNSponb7BWouEw
uQmpriYuVkQNrahtJ+7IMreBICMyKBdqCWq/Drxz4jkg3VBKxApCRTrGenPGhLz50zwt+ra/
u3UFs2kwxsV4VTsL6BwftTb1fpvupIB6E8Ep37U0sru0XY8S9XoT4zUHn9il+QB7h9c4qi6n
63pTC0M8tDsLJ3QuxNml8xP+10ik1syJSldTC07ogzsLpbUrltipStcMSCg5FddtlATjwCS5
PH9vw6/McF4424s9RYar1phJGbo+Ms50owuGKxmGVz5qywDcl0ukpOuqlJqfMScqTy5Na6q7
+EgN8r5OEXtPYj/LVHoMU00iN1OxuuTioXgDtZcdxF9sbop3Hhv4ibBOQ6Seu1wfSJ/8jUZ1
Gtv4SaDqTFfAuYmbwfixzyJANBxtHIEzgpAib1wQgirlG4YzV7nbVXsS8AwkC/kvxEe4dKVa
IWxFyZt76oE8h1eDbAeMpxwuJLq9h7Fwu2vBjNQpRnUHhil4K0QwOrPFYzwew6vYLs+XUToh
KeCXRhykiBj1XTxR+G81XJkrs57AC4EMlbg7z6eYu2N7Vuhf1TiaGIfN9jtDucElYzDqw7iS
OBp//gke30rTiFQ3lUmbHO5JKyJpjhKRtxCJg8rGxn2kb/70Hqkn+sPraoj8MH0ntBwNZFFS
IfJ90jfWOREp23LmeGSFYUC3QHUKE9LhZodeMUmzfQaw/FIM9mdajSYEQtYG1g9H1DqzxrGY
4xFV3V0V+KVLQPI75e4YtB0SYKXnJ36Grk76errBW8+3EAlBJk/CgV0LYW+2xqtVBnPtL6bD
FgDIBYkS9uDos/VzR4eM/MT4MRDcHEPcqemflimYEHW1XxvZrVKhkGJhDETm2U4j9ZzFiRox
I1V03pdN1faWFstgdIyp1FFi86v8nhHNsQ+NHYEeZCoILlkQvHUlJDyXjkm/OmYPF4+46UFG
MUlWsKluphxf6+Qz7svXTq46du24BLc6QejcW4P/3omB2VFPEWTOOM6omtwi8iiHB5BMxFnx
ttfHqfFKHm6AKDv1hJaqd032l6fN9uSeyrM3XS6mYqhcOyUVcEmOnDqG+5BzwhIJexZkTs1q
I/eukPk2nCPIpL9pL85cljmuugYncPhlVCU+sIUQ3tWFvq0mHHhXnD7bdIUXN2oKrLbLifUX
DcwPlepW1yfp24pnnMxHVRhsn0h07aV4aqwVvfrWVtzlQrAvmG4z6w/czjhABXi8Eb7a04Ja
RvNSk3vajP63JZQ6r+v3peo+MethTgAI7PX/jH+ifxIwWlmeMCmFmL1lnK0PzidjC8MfnFcL
HDeu1TpepL0LfHZd1VaNZ+UgOqX48z3i2ibx7ATZrH8COypcaV9lyTlwBHpETLQ3W/V9e354
3KXy7ca7gMWf4djmeUmVFe/Hxjn8yzZJJEunGqlYybYCGDEhcLKFg5zYptfq5f8kVebgM6oD
+h9KM+BQFQ/EPM/kMZacwQDhgwuXFwK8ulnyv57u9abcqtEZbxnDL+/ywGVYP0oJYclyfF4J
PEZxs/L3HLLuIJhZNXDYINDJ6zkf499I9LgSoJB5wb4zFcwFrDQaDYssZ+2RDUAsPTzmIl5S
2ttHlbBCANrCkV4NJDO6hB5y0+D2IfAW41QN7AtXUM03juTLw0Lzd/UTBwXXkWLb6aBc/xiw
shYOadSjc5t/6howVKbP7APvHwT5w7UMhOAPZ1TZyZnZ6LTG3y56G1bxex3GLbijCipQ0H1U
hF7BMFM4qQY3od+4iC0ZNixHRZ60UNrKtVaxYO/jIaN6R8GSMNylj0kxG4CeIcxVHXj6JHLf
BS5MhEfgaMtfcbUN30EGSRF1VUPOJFasqZUj987793hh6DfTMRlnK6AYgjtikwy2bmIpR8Qa
ySAwbzxTQ2oAktp7XCLfEaI89JteIppdq1OtMuCS/FvoCWba4SoWuU87HcKj3VZ/vN391mnH
YIGCYE5ACwTi3Oow6RUSATvpxFk6AwuaCUnUI5a5cSGwVShZPfFFIdQorkGmsjGzfn9YJFlO
IbVZ+ZlK4A1UBcD/Kj3LKD97HBaqycQwO8OtXUWho1tBHjka9VdyoRdQsMSYw83ygkVRpcyU
xNoZDBnZoRn7zte6F0nPYcgg/h3EQfB2h4agi0/EPjmVbsayotBW+XRi+pLIsTT6BqvgPCZ7
CC35vbrmEjKjY+E2nCqXH72UGlpplFp42CJKymZD9UL7RgnbhRSrpnAUXFYZ8hIWpb5fUwPL
ZOUV/g5+ZQihFiJYQZFssu5LueyfpAqXjqU5SVa2IM8kXMtofgLkCWOEfk76ENw169UDviFf
QCtKnmKn2krD/ypum7H62bYuHD5utkrYK/kUmoseElYSyqXgygVHsAxquyLuR5BfgIGDWH/T
uR+p2iQdrhHkMbc4BAQf99v1Wx5VLRjXkXDfD0EcPW+ibND0xbbJpwJDnNzj+Bi4TWRtMrOS
PwWhMc089rqDcG18KN5E20L61RtQgFHWWi/McRxIo7bCOtdO4uXEPkGdp8onTdcobqrPVC9y
vVb3c/NJCX/tGgZ/kyG3/DVlSQN0WBLfrXgKJjP/TZxwn5vjzxTSGgdPzbV/gOQPtXyw17TF
0L5Mdh+iQ9moihy4QeinBIDSBT7mNbvOWp4X6YaTuaxhG/sCyNfmdphzXwd+wpmyBxhORmKA
uz5gu7ASskIrvTLYeKn9eGEJqGyKAXba8l1NCFpAmttn4/DJImW/aYymA5Ku2hCrX+WszB9b
i0KvojK9OB8o0jSdcTI48megw+JgiLe5OlzhSYHjapvW/NJ0LbcWU1Wixbz4cTilMGqe0Ps4
FpkIzr3QdJZR1s4R1wlkMYl50QUTLSf+cGAYY6T6TPTb11GywAhfPm4CCgkgf7evqq96Ab6X
sWGYCnBVi4dGwU2GEDwJZFFml0Nqnyj8NfOKnTAY9P4+tF/9EXdKt1rH44ycL2KWaHdR+pY5
jAozU9HTb8wXHAG3qZbFE46Vc6A4aJTQuXg28CGdiDB2ZJtyKd9DLydeP+IbmQbwahPRHLkg
TjIOliWROku0PHleSqwFKQeOXUiR97R3IieEYtKSLZ9Ai/jv+fXEhyLYj02OCWh7V+fAo1E1
kzlYYl1E35zWpv0kGLxt5Ilf7+mkRkgXVDbO2xBY8IJGz5w26O7NBf3sf30jdv5LBJRsgLgF
5mrbhphGk6z09K2xU4qa0VE3uZUlyqNXvQQagouuy8fnBjGnV0hrQ7DPTHuWWuMNI56OwaWO
mmvgq4VFyHaTQTTTeyOny0T6kAewUwdYs1xVPW9ObgOrJy8/igyP4jq+idMMROrP1Emt1wND
M6+/bKBvHgsYmcp9mTdrSKGILiQILl0eofWRU/kEIq0iwS/B+szkx6kN2IuqlV+0UqmekJJ0
wYuaY7aHMfU22u7e4pFoRK5LOcG/mzlcc/H16gAfoqU47wYduDjg5eAI77rgrhUfVnMKQ1+U
j6hbnVJrT/SS2wM7kXKtT4jIZDkM8urW0T8ay5px7AtIjZ1ldhZ0/BjpSDqi5IPTv1pfbU7p
sSWkwdpkUf/9mI2rwAnSwDWUcWizjHoDnhyjdEWPzSla1mqpigDuWrEuLEEl2D0sTQVqivQN
P46GpPrSNAVB5ciy6cBUgqtpFtlpJmGK2GmY8tE9LO1mX/NUrpu6mG56sX1pFKBs6hgwpXYj
mt9EnkrAbFvJkkE1PhyqAiMowHlNmird4ddb+/W5rmoLyKHwJyxIWC1UAD6aSriArwXzbfci
6BlpojoJshquWymFvWh3a3H8gMbHwhSwv2rdRRNh08yTooXpGEd+8lNKY1DicWHg/5VjSD2S
8ByPXq65kaU6UiPn1ZxTgCcroStk4PcqDMFCIVW3+f1XMtVp5DwrtdyWMi66ZOeJYakpc7EZ
X6E9hrvdbskskRl5p0NPR9EMN9EQu8/Gi391T1AeikfkM+6s4Dm1XUaqwBUkre7cblCPNzlb
dEvyAKepzjLhEjgUQZxAHgBm8ZZsISj5geN+8oHMJfDxMI4y6TJEmDn35UfcO8MZRGNo0E8n
Jjg7HaLx++WNgUr9/GIyhNXrCKINQf45Lu+J4+bqkZh6km1rYpvH9XfCqBK5GMg7j5Kc/uVO
uAn+VdHxTlO7MjvcDcHcJI/B8JfnW2WUeosMgbdAWX97aQa0cQzUKmKMrz01afG/PBhdRGnK
evT7kZm/yabNmEHs8GEh0yUsk3khdCclgtfTQ+XfO4QlOb1iY5TuvXgS36N2BECmFXOQBxUQ
C7Ui0eq/Lk/GmHEQLfcJvW8j200hJqfj7GJdMha33/RfIo3/kZRC/beP2qdDnHu03/rKIrOK
ctFgG1lYqyzon1mCMoL9Ce3ixNR6pnPO05AcA86EzQU+czxnVN1SrzhLYO9xhRQzcqxSFjk8
08RmAYfO+NZGqmezVuf+zleY+H18cdVJsOdzexN53ZCUQx6BwExnpbv8RnsnMRANhinAhZtZ
G0YwCL+MC8WNTmnSdOK4g+kAU5qbaLBVr0+AtXKMtfDQvIeVCNUP/w/Nzuqc5ZDqvIHTy1fO
SokK5bhNb5jv7XNC4rV6sZqL8sHpWrVNB0WSUiIhKHzVWt4PKQfQxw41DVb+7TswrU4wVsXR
Ahyynlf8+yOXbifs2l0cVkmJonRvWoxdDtq2MYjS4mSS7Dle1CzOQybFs1tgPJBQMiVfwWPH
7i3ad6Oe9gX2cGCO/9HWCZD2DFv1QXlaPloJ8rRFdknZOmpzrIDQMDCEgc0Y6fGkv1ZA2DTe
PeBQKgf+fumzGVGnbdKWanQX3dl2cXSaWCi+Fm+X8b3Io2HRGYv633HsEdnirB4uQB7sB1BI
RYtgmzLgLskRKBrR3KijsTwWeNo540QS6O3Fb+czfLj6o9kute4RevJT8SOcB71bSPe4D97d
YcuxY9ebtVr5aE1BbroryCIh1WksI89vLhxUOx/4EaczC0HZ3UEEunaqk5Qo6aFXDouAnDge
PUSmbHtMq5osMQPyj0Qdioz4YAQ+RIn7rSf35EyBH2kiaUdqQXQmFzAYX0Y1F/CkXygxfkGu
ExEYmrcNO7ugjk/GBoRNiIcs2f9hZMYX94HDcge2SerWP8Rz+WYcbAvkmq+VBRYjah29clvW
h3e5ut7GMbsVIRiTF6pLmDEllDvfBXFiH+uK2ZV+7TGfA5bWKCBO5MH8/wM9Lqcj5rhLIu0n
0PzOnUw0RB4Nhheuh8T4rtzQrq6P2/WYrqV0IkLQtTed3Kjf+uKvoReFl3YZ7Uj+d0UTd/43
/4sM9eWZB2XTzlHwKKljFyu6qR4jChiq+QBYfmk+z6m9B2LwtfkgPegTLVTGOSsFKIXPwCc9
EV/gIPzGg/P4dtEg4zv4dkIJb/B8NtvezwWsqSf6+yj8iQnokaHxPWPX5R01FpEx3LSxKZUO
sf00lSUTSxQfw1YyDaoA4/jMsf/xPw7IMCkKRYen5Q/VNOKPGLfSXGjNq0OaNseOWyWmTs5y
vYOuAciyLC0BvijRqyC60p3rQODPG2Ngv6KyS3vAeO04hWIj8L545V1U+QDYOh42JGXUZDn/
7a/6NFPdX6SdLXzWnRVbe6EPbcpSJI5C0bStTZA1NhwEzBKxsozQVMMOTVRo1ph78INzGrHo
y471MEF9niVl7fLRoVQ5sFCGsBT9A8RusGBhM0jMmSUfEj47TpUhD6pMqhTbHlsSngN7V380
HQdv+FxR2SH5DLoDLIF+iuKCBuWMBL+6iwrQ7dCokdLjSsbKwko0ju3kzHeEeWa7FqHVx11u
P8PsmKoMUZDtyf2emr2CMY4ikN5bF4c6rD45j0pNHnP34UPwYNWRVsP9FPInszZtfN3Xn3N8
MSLYpLsCBntaevVKRmdl5B5Dlofabczukg/3XG3UuOWeYqFqMOIKFPAG1Yu0iVGFA6B2BIdM
bg3FXPfTdyxQBhaiSmID+/ExsDqAmRfG7Cx1qGOrzqY+qw/pq2lx0lkDVFLNHAvlyCsSSXBm
U239JcKSVyB4BtpW3iJRN74j71Vc3N5Wt4H3sCr0DRL0J3PnLKzsYTZsJyRFOc4+pVLfkItt
ZgpRhGAGZCiELv+u4y6/ZVMcMlQw6FF0jsWJWpRNJf8RsGtZizHJghNLtF/mtrDR3fOUesgB
aagdGiptxhzvbb/9MX77f851Cs+XLPb1CFqT4nPGMr7+U7k8Ap/S3cxM/IwY5QmidJgo1XXg
UD5zfzuL5DQzIIMAVpwlNMU1CviFr2Ybv0uTAuLjCEzWjbkkxj3Et5igUy9tQUgX++OeLBFD
5w6IwaJj4YXS2WaYxnrI9Mr5e0JK7o5tBrnLymtwuB980+nIJY7Lihw2bFnP84DvGmxeOBjn
436Cgw12dYkYhnGexJQ8YiR3Pgfhr+hDeTN3Z+K0OZ7IJIIOfWiOpnp4mO6Va5lwh1NwDuLH
+0f+0QSI6w+mOngdCduyjt3kDtctxFX6LTf95R8fISRS2PRLqY7dkKu4eitNpttxP15AToQi
x9f1Z9By163VADu3Mv/P/VO9dlHuwjp2O4sov67JmQne77pZGBx6jziAEil0I37F0F0s631M
bl+2Uz+JLL3H9g5gUJipXtX6Gip/8nEKjz+xaQrS8GZp2YUPbtINNryXjtP2epCaJoSafvU9
uA+q+yYNr5MCljwQvHNTbuaI2is8/50Rn4qgh3cZ85sdlPoxwAIUamyf35OUq3Lw4MtOI9Pk
SrXvYu2fN4jNMRuEOVVYjWffeYbtocU7HsCcaeQxIBeuhMLZvgLy9u+ZVRVhJ96fPWZqcDGX
5n8SeQVSHO6aeZWeHWttjdArBO0mKs5M+lC4BI+N1rHnVE6xjl/W3P0MOv77tb86mRpqPUQt
LrODVJeOhNTpfeRF/jl/pwE+VM9gpFwF02/zKcxhiqhB/TX0cagVlOUw84zR5HUveDZBOlNA
GO+rD6cCIXvufy6q/jmEJ/JRTLl2rpJ8DNX8TGRAYUnlembf54I6mJjPLmhJUpnqy11mPMVV
EdKAVfO4hSFFr0f7LFNSIayGJuWIfbDLGVkg0j6xf+e9rl5t83QwydGWjMwjyzXorD021dVw
e6WBYZXrfFhyGyQfX3F4zDcLi2pdFrriDidyz1gu0Klk6I6T1/KUqo9pIXM8x9RZF/+tmYge
rhRz/LEs1W+BRbsKSo1VZ4OP5r82d7vmfP/txB1wZuNZ7VyluXchK+QOFUT3ck74zy1iFAj+
iTQakAnMAosd0Q81WMUEGYjQEgAT7AqeeNKfkGLfTkfHPhLC87ht0aFo+sETujj6cIFsHg0I
dMK7MnmP0vXkfdu0dx+FhaKljJAYDqgRphDWritp3zR5IEh7ncU5iw6gnuWV/WsA09WPxK0w
oXsXW5CPtZCsx9q9K/clrEHd3c6cb5SPqnHeOo7mLJUWEwbvABO3l0MHHQnJ07UIS1q01e57
BO+Vgoc8o/lxujeM02MU/5bWxtuhNSxwcDRTpINFCpEWOQ0VUggkbhe3T6h/geDFuZBVH1/l
+go7b795yd8C15s4TOTAkiySqfFOW3JNV6G9vg/0rgNssk8i7jtHX8rSYnMHWC4nMd4rq5vE
vmbZMSg7oxNQx7MJiJxDpOlMWnVjQeSrvx6oM85ABulKPw9/VkXULtiMl/AcYrhj8ZdSA0zm
GBczi7oRq8om/tIYt+jhYW3EjwTR6rgErsgGqQEnOPoU/STlk5g4yU2arQ+3wcaLv3rQsfcG
a0NSIPdde95AEDW9GZBo/wgIvTLECafDtT/lz+pWCSOMsPLvO6fjGYpYs1+IDtJgcgznI2tm
7ots7fr+ybZLGyku+cnfUhs4xrKqaaueWFr2wMDYIajlV6wMIIzcgnrT0mSwi+QIH0YZWZDJ
SKyzuk2CfrQwoEBy0AC6rt49FxPvcNZve4CEm5twlSg/Fir2038iDdu/jZji1EyV2sBnYcfm
6yAjaOAT8vZ0RwPPRaTgMiyhB1X+MvjokPVgCLhunsFCU1cielbnaiZ4+bqlfUMYegpLUzOW
gDrBebx1PMQeBzT0Qj1+66K1YjEb/t8AXqrbJNbt4T93d7IHMScBc+Oq/7sDMeThmU3Ohqjw
5RWWGH3lpP4JMGTkkvbNadY6sJvEqt8NP+o6F0BshdDzafbnWliCXzfvUOFiRv1+dwcfsry1
fDQ5P08g3zFMvC3GIpPc+nKsoBYpj7Uc7dzdycnzHsfFGxN0HAYbQ+esIyQgv83mQj4nTDAX
o4tqITwcqhOEFDtz2vnhP3T9muGUbjZXk5Hbb9QxIXYsANXTE0qKT1r92GFPsFgLdQMpqLT0
ocHLJChb7ZHkByIvBOKZFrWJlmF+yPt72sb/pqS0HopeYVjYFwp5WyCVhNxTDczRYkG9/qwV
InB4gxKEJPlGY9teYKDWsrqGehoorcYhXrH6hO4eza0Ty7WhwHqQbRsAxojGPrYyTB7hWEgo
LsPsgSUtjhN5YZAu4NwC+xSRwLFmBu/EiJa3BwX4MTNQRiHiRwaBa8diPBcH7iz58ddhH9mB
a7TZGbrDJN4GiXMDODoQ06IGTNbu/AbFBvC1k15B6QLMGtDzW8xvOe50C4YI86XKDvNxNDuk
vGAoh5CAa8wIoyb5TQIT9CyTFlhTjw1kVm6AOfDDshw9UaGb1zaaJvs9V2x+DXDTJEFJEY0l
jm8cxnjfD+VWxous2XlfZO2rD4H84CP9YpgqPxzSDg/5/RubPU350gdAzmpkncIkIXGueqEq
eghgGnX8WHJM0J+oRg0GaS674cO9PLKDxhnD64NvBySgzjPoTgVln8RZALIi/VSD0PjOzah4
O8JibYRYwk/CcqG88B8KBzvvJPrL3sSE5RXy6rfVK+TITwleDz/1WLxqKPBgOowsfJcjSOno
TOWCXL3KxZ/O+/mnBtRGPdBbVlA1PWO+NJGiRsPuFkFRYMhzQ+dMOCk33qZo/XFJD8A65tho
Ks+jSlyShqDI93+FJHlx1uLUNwypsdbH7htxVy6wPbApfxcpsEN5a9WlQbcab3jRGepmynh+
FRwXv4NU49xJBNmCSW9po02935dLeoDleXilTc8NHYTlYjbuKyvim1iijUUOE9FNHeyEA+Zb
fpUd2rTii6O9WCXLX9fK6nuP0ksV9OSP5Kq49Y9m4BjYylZykFQaUUl02ZnNpuUqzHbXlkqu
iYMWm4hmmMGLQbN9FiN41AkuTDu0KSdblV5TRt6BQCQnCCMaBKFEwK4ywD0l5bkzoIkMgNFA
1Nf1DBMLmbhBwaL5w6Tw7/m4ScK0srZnqyCTjTRMTe8pt5eh1vJVmPEN69gIFbJEIfQbmkbK
I3GZvdMuvKg1kNw+NVP6eBR9eqlRTiAM0z9/NDkgUWXCMJggrbrWufjgRVQTIOa29BalXoQi
qpnoifWH7gchomLwBYxSCWfxMZsTCQctNrNgg1ywfheDytkEkMhl/ImnmpHW+tz7rudSULkF
90Agj00AOU4VfRCIQqMFIIAGKibt3AY2GQd+vJmzzgWz57198q45eaDVzMuIA4W//8/xUan+
Ps69HpYsKbZoZxZ9Ysnt6gq/2DRPn7sPNCq/uSx2sp99TKopuSXaEi3NUBLfkP/dX/HXWE9d
OT0X6y6MTb8FcYojnlK6Usqo22tPtC2fkDk6XWg4HLkJUBawA+nyse9cvwuNXLRSKINzx5Y8
5XMDSYWHIZHZPVQpJHU5Q72g6rUMBiztTCtV4eS+A+rB28EUbIezjXuclxiAfbyStDrZ/PN7
T1mfHjTrQkb/ID0Z1fU/vKq7U05D0gyBGSn4C2QZqjp1lp84I3ceSNBKeLfQOtI4QbATeWEZ
SKza34eU0ISEvHVIxXSHEgCKrq+OA9p7sj0WyJZGgFH7roQ9k48oN3M+3f6uQXnr5LaRDWRn
N8UeJP9IzqYqdZuVXQyVVcrbOnP6WrAxnC4Ntj5Evxf+qLyPHLYybBe9BR5s3ZHL2yZAQmDo
paHza6ZQzGhD1KqLq+JdlsFA48bYLTSjcm8F9WUPGRw8UBk5tQb6dC6ywoXKXGxZu8UFZ3n9
OqdNkS+GMxDk9tJIdTMGePfBQgiqtceSnKomREkyNQqBm9+YkKprPddaRXgvM0SQRK8meCPm
slsAQLJWqZKzqty1gZaUhWRnDW3JuTSG6MlGs937PX5CzAJJ74G0atIhkxmzyN4BItEGVeJJ
cOteD8Vc1XdfL5JXlXIjHOPdoBMr0eOsZ9w795haYTGiQNOtv8h+0S4Lu3uzyEv9jeZHAVp5
pqVsNJ8W1OFmlZ/wlAVs1OdWvM+Jc7kCTl39CHD4okZYfzh+l9TWNSM9uZ1bsddd0CEBhgqz
ICEBHXoM7xLiYM1Xs8I7OcU98pCcSH6x59FmDt1RFvyVU8HtBLjVOZR5j/5q+7bFdK83BiWQ
+wEUTulobRp8+6oM2u2vrS47RrVQCZ1uTpbBix/3EJqXyZYFcZXq83/HBXka3Qm59HWbfZeO
ZuXV+O+5720EPw9NZ12P4n7hJj9OS1d8dcbo+bZZlK0GknJ8QqKaAerg8wzrd6oJLQQMcBcf
Ab2myjhnBwcmvgltl99dp4goVNjgkJr5Sq0RJTYddEqOWqLwQKNsYFVCcR2133uutxH1tr9R
7wRVPs8AIEmzbRcyeYT8HjmvtoDWOHeuW9sjg2Ui7aSVaU7JwtvA/+C61gsRuRLA36iGgiXf
t57LumTQv+YurApEFpfduxf+rY4pCd2VKeemxvjIn0pxuv8oSoB1ouCHyzNXSTUoDqm35TTW
9UF3wHw7bRFoQpWRLKXtDRw1yFe/xCMW/B69P+p7Mbe685ONFLyh9NRz9nxWTghwcaZBduSf
MzjamDSnuiJn2z11Auxch6gIZ9mkZNcyAn4IhxvtG4e1IvtnnysV33qA0Ng4Lsaicrr6UoSa
jzREuSpSBkcd6UKsSampDW9B+ltQVCYaFGpPkJVfDr0hBGGAdYDwNbmM8e+nomtLt86+YwLX
Jyrf2AZWNPO9F4vzhv8lomBrBCoVdkTh4+w3q3VbqSGhAfsd+hlipjnz/trtHtEIqbZ3fAEo
lq8waGUFFW0ASzvy9eeHFkP9d6eubQNi9s8c/pgmFq6EFPTHz00Iq3YIOlCXKh99DWkq/9Ud
kSycCFG4/9XZL5gd0pBDPvdcG6OaZlPEtq5cxqSS1hDDd6jPxBJoLXhFtplFjLIcOyS8Eww5
5y4cZK5SxRix9yqb0hK2KwtNqVVpL/+gOnL0EZOW568RoInbkBrgQC5X6LqkE0dthgZ1yH1n
NE4sb6VUcovHJpCMXEuULqYkND4Rc3GdavbY9G5PVC536B79V3bjmvSBky7V/l29f1mQ+sVq
WnccK+w12+Juo8iJ3RRyGJcnfZuV0tim930oQUTbH+Gd3E0KhWDep+4KQUaLkm8FMXnz3If8
PF7aVXrI1KO6/uISQve+vLlDrJTRVAbdlOI937V1sCHzFzubI64c37rk18S0Sooh/z7+Ud7j
JHObfw/BgzCuhdL5M5hRiz77SL0uS4MNK7OHTQ3Sbllb0ZPzq5s4rk76empOZn1zicX479c8
9t+LXPmtVehPwoFdC2Eiea37cJq4yMqmYZDnWS+mWXCTKMQ6VX6oa9eMaZCxzZX8SCyLJG13
kAOVnyZRAxuYKTqXFzz+TFiF6JhET62GWeXOdjThn7ufWBU2saFcIGKM57z2fUMCeM9q2hPd
Zhg4XLzupkDaN6eT6v2D/i8VnD+z4fvifr7g0RGHyZXoYMZ6EIWL/JZGExFiqRMv4g5otEbz
FjuOy0x7COKhHfoUMDxnqc+g3tYDMzuLsrbix2mXwB5g4XbhGp72gbZaEuEqZNDw6KwL9teu
oU4sa2BhwAvComn2lj+mV7PseKCdpHqbrLYKjw6aEg/e18ztE3mCIVRHnSEcMnPrPtQT0X8Z
IMK2pbbu0GGIoJi1Xp6Irwmo76R1IfacUz6t5A2mdrgg6selyS6hSLq/W0rq+y9K2Pj3gepG
CUjSQyPsZLPNH7sN9MLX298/CnM1Sf7Z3t+u6iSapFW+Q8tWClSckdWmB8UYfVfOnC9W5c9R
C8y8RsoJQ2+k87UlwhRvVirCLOkcQyXAWWoZDzU5QHrqF+ibRCmIrmeO2B6sOCatSupU7ZDu
ghTxI1f4UvZrd/H2aV8E2dfM5uXiNWrbUYBCBCl1VNilDHOQD+z6GQ52EMpCbpBOkbz/d84B
KCov8NNgvSmxsHyxUoSp8Ozoq65gIHoYZPzipy7D2tZNNqVUsyLF8oIBvJd9kft2Tn7xjA/J
BdAc/dhIXXjr/dZhiHZ8Rry+SCljEz/AE0XUrqHmUcXuolZpZ/plKzHyANX5pFYH3fF2UHOT
6goBbXOXVYBIaPShBbGG+6QbKu3IFJKxJ5mEuq5SWCSr3nptQMUhLXeq2V7uQyVHtoVhA5Px
o6t+uBMzEjU3I2XPU3d2Nuk8LAdzFzXN4nebJwFaRoaoisSyJKcxoNSylW/wdICmb9Qz9ntv
6M/BTfItfvSkgxoCFCWf8Fquhrkqn60LBkc8z0PLdXnYR8z+CH6RASv7aqIbX4f5drpqzFn8
UHT/6autBmmpv2Y6lvrKxl7UvemFjwbhl3k3lKf8qQJVHvwYflwz+35yGLP7fOjtTaqtP5XX
72WMH5uw7NX/tP66V7VFYEbGDNiEzklT8ClkMntP+6G8QDGrLCV5vBlwJmqEYO5XMPS2evsR
QZa5pVyGUhbHyPqx7Ws6qx4dXTn7PxjnJBgZlQuHhNB5bSwyU6ebfgwZSYBk1GqM7k0PnJFL
IyxfQOhogC70oGuUAV7fqH+8AyS16ayjOrsp9+LISHMT+P+UFCWGB7oc6sCYHI6jvDp5mUUs
lQZ5WBYq2Q2lPlEiDHcT3EgwWcjNUgHaUXR1DAQWn8YwpneBy1gPvrF11XMaPFDBRrDfjkqi
0dAiFGJehFhThThnsXamvmrAaQvfZGowBPowBdvrBIVT3FTC5MBHNv2BQGL2VrnmL0fyADaR
DROme1QLvtcYqxP0WOGrE8OO37n1xSEieLqY/U53bDV1qA7QXY8oSHRYooSrtp8Y4f4W9MUd
ROqOZf1z4lWgcAX6d3Q38KFlKROflk1/oUxpGFiRyKcg1shDbyJC7VO16PUg3VyN27XzjUfH
+BsVxD0BRNQ1hxbp8K2CaQOAjcQc1Ee6c8W+VmZG+lw3Skn4Y1oQdGS3fIFHe09Wu28DtZez
8ZyDm1y468C59HrqMNz8GB4d/t5AzgcRd6CdL2NPhr/CEnadt5kKEkGfhve71Qi6SoDYpZ91
RdbqQvOM0Zkshh1ITTKqVj9k6XlSyKcxh8LPzLRoZQ2nXFpjiwGhIj9b/286juW0WYLMJRvK
Aval3SeQHpF6U+VEdMZemyie6HaFpcVckiF8QtVd+mYh9AMUQVy+1NFxjJTGjD2hdutrH92Z
zAwtbJM7nLfPnjUYHAHsrStYlCtcua1tWAWTq0IuoB0Dcd6t7dmuOpKcgX4MnheXjnSiCtSg
nuOL5DPNyjtl4/NZXlbE3WAIQ8BL8x9tKoNYhnnyGv1bWbBeZl1XcP9syIC0UqYtp2ys0L1a
XhyJ52eVZxw1Wh2s32zCyDwZ48aW9196DhqJEmuJkR3lsgwaG/1UmaOW84x+ESUaokFRaSM+
sNMmGKx0B5Kc0ynypvSWO+B/Wv1K8SLoojwl3ZEGTyu+RqgLxD6COktxjC4zvRi9mpTjq3c9
JeUJbGym5P0Kc+9GodnZwl3TQ5EOz/vUH03SO42pE2LfBX5/r3mbrjpo/eFMCPwZXboxTnlh
a3PJCj3P36gq9d6/fkX8mnmrHBnVQDs2C5m+o350+QwMjKeAekCF48BE6Uoa1ySLvA2Zzpyf
WFi9ye7U33PAoJFLOANZ8oUc08EuYNKox8CFsC7COfxwZ6yjekek1sJxo1wCqdG7jiuHgV+n
9HJIgBobmyMFVyS9nV/F8bi8dSJCtF32f9owePE2mbjTIlbBTkOWVOZXhBnND9HeFrkJD0Sh
V8vEeBgA37UjEpzCGsPAr0jBdvD9ed0k4dnYsepzxfiQu8mvzFN0eJP/LLkfhQ91BSQrYzmv
nf7jjGAOelZ+oNt61XQNb+8KkPMo72RjgdTMeq/pJud6PSRc/GcNXQb72WtOLbGNnmMl+o1U
og3cjclmr3rw7sE3+35j6VUJtd0nP50wuJps/6vcnHIFOpthKQhWYrgsYsDI1ChZhaPO0L5D
UIwveTqZvo90LH3hI92oo3tNHy0xEbHHZj9SG/M6TrjPHmr7QKctg9EjsblQkuegxSYTjflg
Bym/x3Dj4gdgFlNJWp9dvYG4jRpp9uIT+xXoeYuKY0EYFZ4c56xqkfn8q0DdfWOjJhw1THrY
dQqm4V8gaQ1QXHIlE6kN7vTGToOX/5FhT9OEMVjxgbDbm2zIFcTy0CGnpB+dJbkDecjFVPBv
XpWIQ7/F2ygNeRpWGCfQ7/Zrl+T/EJFnV/RSfpzWcOpWyN8FalMrMQupFpxe5OwMpL1AmZsx
OnjjRyeARzM4NlDOu94q4Xr4SEnhERxB9Sq6Q2guEt9ViS+PrU/a86YMZxkqXJzdUm6fZqmi
mrfbQDrJHXKSpWxLd5ba0ftYnyOJhBfdC6Sa9KZSeK+Z2omm0JUQSeFNQqJyzbryqcbjnSj7
JRtpN6brf3BJ4Xa+jdm9pRbN/srdcTfK4VYutRw2EYinhL1LRzkSL7j2CS/mqQHWtPSp12rN
rhRTsJ77HBLU3DZn8cGOxVHqqN0LHzGQqdAF+EIB4X792dw2V8IunLaPLbGKYVvKXwThY5vF
Et15poPNjlbon/5jsN15YIOB38MlVgeaQNHHdyI2yGjlT8JCbOFZtzwiNhGIp4S9fDvgmKGi
bTHfkFRcrhi9pQS0M3CVZu8xz2HOrYmUuotFELmsOpvfVanrLo2Y3SFzzdRbwq5CnkCw8r83
BZPZFMrOUmzWJcI9Xzbo7tUngpNySMdWPqVNh3IFXhuHhCcGFQo1xFXvGXFqeJyAd2vfItDK
AQSU3o3dm2u7JpXWAX0XXFtDQqv0fauSkwKlNAFXRvjH6w6zCG/M3kZyxefX8Tny9Bao+uBx
w/F+Aatr3PQP0+XPPHe/SDWQajqgPxwI7Nb0cssEXmbfcNsXLkJ9pwGtTQa/4PutWsM39dMA
04zLJSm0ysHLBERdcQcI4wF2QBArqHrAjgcvT2IEutKzcI8Dnob3K1d0JhNry9tiulCLzlBK
hgrnxL4V+Iok/OUWJdgymK7iOXNJuwgkfT0K6xcX6lIuLl560vqyIl00Qucn0KIObm9jFtay
F4ddOXa1iuEqZHAdiW9naVg3+AZdcAYD7Ww7mNya8YMXxkDflsULhE5yg0i4mnzgugNynoXd
pFdrmzYXmTIYOSbxrLHXbaBTmUnY40Wl3RhxvNFw97OxHUfvKqA3HmuI0VFCmd62s5s0LFPr
IFtAj0BMmhGQ193dp2JpvIeWsf9Xrs8qooyzXIRiI4jIFFWQZu2fVfuVLbSQFQOYPHc3TEIl
vvBfzEbpE69Nc13SBLWEcSwnDUA3AbEhfSVnUMWheOJTJyJ+ci8TXZROigDVpZYyueR88/f1
6f8d8CMLVVM0JUw3IEpwY2ACSqiAfPriO/X2v4pXTJSSpl4sJhAEg1skRpSSj6EVDdF6EIVW
7kPT0pG+3buxYkwOzfFgjaxs+JWC0CiZ9NqgPDZHI9YtAYMS2OKUC6CI+x/xMQUbtPXR0ZBN
15++/zHWHf+ZDOd6uqVH6s6ALDFAjK04hOrzobjRHYZigE4sea7HbEq8HT+LhRYpptcmEF9E
H/ymsGy70yV93jG6RqAjKzAuES5P2hN7ZAmUigK1MyEDMbczmvgFE5wcMkhcSVAQ2gzS4ovU
YMP0Qj9+L8dYn5oLGAvPa1BiDoWyaqAgZGMdqRfpFpoKFBRvNXcv0MGpRmACmLfbctY2H8QS
VIlR+xX1OFmw3K6j1sLnd4LxsSzgDvwC6hjahGEj6pVe7O4ZBY1ZXNCXm9LHIidOlMMA9p2i
yQdQK//uu2foyU5kp7MPgIuJ/jbCrGPisclto2pM5Gc70NijpQHynpwQmorajgPShCBvV4Qr
r1bhUImIUkawrYsKdANzziB74Vmfxti8/hNKfIlVfwrlRujVVAEXR+WDayltETHwizX+7QfJ
cwtER2HFUd5GU8pyk8Vqfo7uIXyYvCvUdGMqYuxMD9U4p6h70UfUsfx1NdGEh0eb9mxH7OVj
k1T8PwdCb2x9E01TGgFsR+yn6CnRliBMW+eNjt4+l8KMi0fMTnKFM8hHWfMvq5+53yV0KFgD
PRWbyCdmpOizB9LPEul6nGyB8yYwiVZ2ju3sLYSJ10boZh3Q0Vg120Rr4ysJ2qv9mhN2Xz8f
jqNw5Nr6KWrFUpSo6No4jmxpjjfJptM3F13EcBFs13K7G6uQXJyIDwYQPLn6NrgJJ9+n+xqL
axK5pAOuugMsTCnUVEx6hY+/oiaCkgrvlsBmneua7IUMS4SXnFhyNmKfYuoqQryRW+oOnGzc
7KUd5GJcpJeBaYeuy8Vd8GVScMEnf82+IOpxBmuFQ+d/vtuJIRxQ8Xpv4IA4WGd3isgFt3CQ
P5g/TSatehYrq2+xXNiHXvfw/Dkk2UWRfC7HTUWtOHhi4AuwdwwSx6wvYA53FI40GMcgJePk
6QR+ByDRCGS1HrX7m9DQsg==

/
