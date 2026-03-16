set define off verify off feedback off

create or replace package aop_settings25_pkg
AUTHID CURRENT_USER
as

/**
 * @Description: Package to hold settings of AOP, defined in global variables. 
 *               Reference this package in the APEX Plug-in. 
 *               Using only the PL/SQL API you don't need to use this package as you can just define the global variables.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */ 
 
/* Copyright 2015-2025 - APEX RnD - United Codes
*/

/* AOP Version */
c_aop_version        constant varchar2(6) := '25.2.1';

-- AOP Plug-in Component Settings

-- AOP Server url
g_aop_url            varchar2(200 char) := 'http://api.apexofficeprint.com/'; -- for https use https://api.apexofficeprint.com/

-- AOP Server url in case of failure of AOP URL
g_failover_aop_url   varchar2(200 char) := 'http://www.cloudofficeprint.com/aop/'; -- for https use https://www.cloudofficeprint.com/aop/ 

-- When the failover url is used, the procedure specified in this variable will be called
g_failover_procedure varchar2(200 char) := null;

-- AOP API Key; only needed when AOP Cloud is used (http(s)://api.apexofficeprint.com/)
g_api_key            varchar2(50 char)  := '';

-- AOP Mode; only needed when AOP Cloud is used (http(s)://api.apexofficeprint.com/)
g_aop_mode           varchar2(50 char)  := '';

-- Set AOP in Debug mode
-- options: Local, Yes(=Remote), No
g_debug              varchar2(10 char)  := 'No';

-- Set the converter to go to PDF (or other format different from template)
-- options: null (LibreOffice), officetopdf (MS Office - Windows only), custom (Custom defined)
g_converter          varchar2(50 char)  := null;

-- Split file: one file per page: true/false
g_output_split       varchar2(5 char)   := null;   

-- Merge files to one PDF: true/false
g_output_merge       varchar2(5 char)   := null;   

-- Set the path of the wallet for the apex_web_service call
g_wallet_path        varchar2(300 char) := null;  -- null=defined in Manage Instance > Instance Settings

-- Set the password of the wallet for the apex_web_service call
g_wallet_pwd         varchar2(300 char) := null;  -- null=defined in Manage Instance > Instance Settings

end aop_settings25_pkg;
/
create or replace package aop_sample25_pkg as

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

/* AOP Version */
c_aop_version  constant varchar2(6)   := '25.2.1';


--
-- Change following variables for your environment
--
g_aop_url   varchar2(200) := nvl(v('AOP_URL'), aop_api_pkg.c_aop_url); -- for https use https://api.apexofficeprint.com/
g_api_key   varchar2(200) := nvl(v('AOP_API_KEY'),'');                 -- change to your API key
g_app_id    number(10)    := nvl(v('APP_ID'),222);       -- change to the APP id of the AOP Sample App
g_debug     varchar2(10)  := nvl(v('AOP_DEBUG'),'No');   -- change if you want to debug: No, Local, Remote
g_user_name varchar2(100) := nvl(v('APP_USER'),'ADMIN'); -- change to a username in APEX
g_mail_from varchar2(150) := 'support@apexofficeprint.com';
g_mail_to   varchar2(150) := 'support@apexofficeprint.com';

--
-- Store output in AOP Output table
--
procedure aop_store_document(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);


--
-- Store output in AOP Output table ASYNC
--
procedure aop_store_document_async(
    p_async_status     in varchar2,
    p_async_message    in varchar2,
    p_async_url        in varchar2,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);


--
-- Retrieve the document from the ASYNC call
--
procedure get_async_downloads;


--
-- Send email with attachment from AOP
--
procedure send_email_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);


--
-- Send HTML email from AOP
--
procedure send_html_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);


--
-- AOP_PLSQL_PKG example
--
procedure call_aop_plsql_pkg;


--
-- AOP_API_pkg example
--
procedure call_aop_api_pkg;


--
-- AOP_API_pkg ASYNC example
--
procedure call_aop_api_async_pkg;

--
-- AOP_API_pkg example to IP Printer
--
procedure call_aop_api_ip;


--
-- Procedure which can be scheduled with dbms_scheduler
--
procedure schedule_aop_api_pkg;


--
-- REST example (call this procedure from ORDS)
--
function get_file(p_customer_id   in number,
                  p_output_type   in varchar2)
return blob;


--
-- read from filesystem
--
function read_filesystem (p_filename varchar2) 
return blob;


--
-- write to filesystem
--
procedure write_filesystem;


--
-- view the tags that are used in a template (docx)
--
procedure get_tags_in_template;


--
-- all possible options for Excel cell styling
--
function test_excel_styles
return clob;

--
-- custom debug procedure which can be called by AOP to log what's happening
--
procedure custom_debug(p_message     in varchar2, 
                       p0            in varchar2 default null, 
                       p1            in varchar2 default null, 
                       p2            in varchar2 default null, 
                       p3            in varchar2 default null, 
                       p4            in varchar2 default null, 
                       p5            in varchar2 default null, 
                       p6            in varchar2 default null, 
                       p7            in varchar2 default null, 
                       p8            in varchar2 default null, 
                       p9            in varchar2 default null, 
                       p10           in varchar2 default null, 
                       p11           in varchar2 default null, 
                       p12           in varchar2 default null, 
                       p13           in varchar2 default null, 
                       p14           in varchar2 default null, 
                       p15           in varchar2 default null, 
                       p16           in varchar2 default null, 
                       p17           in varchar2 default null, 
                       p18           in varchar2 default null, 
                       p19           in varchar2 default null, 
                       p_level       in apex_debug.t_log_level default apex_debug.c_log_level_info, 
                       p_description in clob default null);

--
-- Failover procedure that will notify the administrator
--
procedure failover_procedure;

--
-- D3 example
--
function d3_radial_stacked_bar
return clob;

--
-- PL/SQL Function Returning SQL
--
function plsql_function_returning_sql
return clob;

--
-- PL/SQL Function Returning REF CURSOR
--
function plsql_function_ret_refcursor
return sys_refcursor;

--
-- Show case how to use the convert function
--
procedure use_convert_function;

--
-- Generate your own JSON for the template source
--
function get_template_json
return clob;

--
-- Do a call to AOP with source data and template JSON
--
procedure call_aop_with_template_json;

--
-- Do a call to AOP with source data SQL Array
--
procedure call_aop_with_sql_array;

--
-- Store the hash of a template
--
procedure store_template_hash_prc(
    p_output_blob         in blob,
    p_output_filename     in varchar2,
    p_output_mime_type    in varchar2,
    p_template_cache_hash in varchar2);

--
-- Show file in browser
--
procedure show_in_browser(
  p_id               in number,
  p_stop_apex_engine in varchar default 'N');

--
-- Convert a Word document to PDF using the convert_blob function
--
procedure convert_word_to_pdf;

--
-- Create base64 from URL
--
function get_b64_img_from_http (p_url  in varchar2)
return clob;

end aop_sample25_pkg;
/
create or replace package body aop_sample25_pkg as

/**
 * @Description: Examples to show case how to use the different AOP PL/SQL APIs.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */
 
--
-- Package constants
--

--
-- Store output in AOP Output table
--
procedure aop_store_document(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
as
begin
  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (p_output_blob, p_output_filename, p_output_mime_type, sysdate);

  commit;
end aop_store_document;


--
-- Store output in AOP Output table ASYNC
--
procedure aop_store_document_async(
    p_async_status     in varchar2,
    p_async_message    in varchar2,
    p_async_url        in varchar2,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
as
begin
  insert into aop_output_async (async_status, async_message, async_url, filename, mime_type, last_update_date)
  values (p_async_status, p_async_message, p_async_url, p_output_filename, p_output_mime_type, sysdate);

  commit;
end aop_store_document_async;


--
-- Retrieve the document from the ASYNC call
--
procedure get_async_downloads
as
  l_async_status   varchar2(4000);
  l_async_message  varchar2(4000);
  l_async_file     blob;
begin
  for r in (select id, async_url 
              from aop_output_async
             where output_blob is null 
                or last_update_date>sysdate-1/24 -- always gets everything from one hour ago
           )
  loop
    aop_api_pkg.poll_async_file (
      p_aop_url              => g_aop_url,
      p_async_url            => r.async_url,
      o_async_status         => l_async_status,
      o_async_message        => l_async_message,
      o_async_file           => l_async_file);
    
    -- note that when an error happens the status and message will give the reason  
    -- the poll_async_file doesn't raise an error

    update aop_output_async
       set output_blob      = l_async_file
         , async_status     = l_async_status
         , async_message    = l_async_message
         , last_update_date = sysdate
     where id = r.id;
  end loop;

  commit;
end get_async_downloads;


--
-- Send email with attachment from AOP
--
procedure send_email_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
as
  l_id number;
begin
  l_id := apex_mail.send(
            p_to   => g_mail_to,
            p_from => g_mail_from,
            p_subj => 'Mail from APEX with attachment',
            p_body => 'Please review the attachment.',
            p_body_html => '<b>Please</b> review the attachment.') ;
  apex_mail.add_attachment(
      p_mail_id    => l_id,
      p_attachment => p_output_blob,
      p_filename   => p_output_filename,
      p_mime_type  => p_output_mime_type) ;
  commit;
end send_email_prc;


--
-- Send html email from AOP
--
procedure send_html_prc(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
as
  l_body      clob;
  l_body_html clob;
begin
  l_body      := 'HTML view only';
  l_body_html := aop_api_pkg.blob2clob(p_output_blob);  

  apex_mail.send( 
            p_to   => g_mail_to, 
            p_from => g_mail_from, 
            p_subj => 'HTML Email with AOP', 
            p_body => l_body, 
            p_body_html => l_body_html);
  apex_mail.push_queue;
end send_html_prc;


--
-- AOP_PLSQL_pkg example
--
procedure call_aop_plsql_pkg
as
  c_mime_type_docx  varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
  c_mime_type_xlsx  varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  c_mime_type_pptx  varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
  c_mime_type_pdf   varchar2(100) := 'application/pdf';
  l_template        blob;
  l_output_file     blob;
begin
  select template_blob
    into l_template
    from aop_template
   where id = 1;

  l_output_file := aop_plsql_pkg.make_aop_request(
                     p_json             => '[{ "filename": "file1", "data": [{ "cust_first_name": "APEX Office Print" }] }]',
                     p_template         => l_template,
                     p_output_encoding  => 'raw',
                     p_output_type      => 'docx',
                     p_aop_remote_debug => g_debug);

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_output_file, 'output.docx', c_mime_type_docx, sysdate);
end call_aop_plsql_pkg;


--
-- AOP_API_pkg example
--
procedure call_aop_api_pkg
as
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_return          blob;
  l_output_filename varchar2(100) := 'output';

begin
  -- define bind variables
  l_binds(1).name := 'p_id';
  l_binds(1).value := '1';

  for i in 1..l_binds.count
  loop
    dbms_output.put_line('AOP: Bind ' || to_char(i) || ': ' || l_binds(i).name || ': ' || l_binds(i).value);
  end loop;

  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_sql,
                p_data_source     => q'[
                  select
                    'file1' as "filename",
                    cursor(
                      select
                        c.cust_first_name as "cust_first_name",
                        c.cust_last_name as "cust_last_name",
                        c.cust_city as "cust_city",
                        cursor(select o.order_total as "order_total",
                                      'Order ' || rownum as "order_name",
                                  cursor(select p.product_name as "product_name",
                                                i.quantity as "quantity",
                                                i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                           from aop_sample_order_items i, aop_sample_product_info p
                                          where o.order_id = i.order_id
                                            and i.product_id = p.product_id
                                        ) "product"
                                 from aop_sample_orders o
                                where c.customer_id = o.customer_id
                              ) "orders"
                      from aop_sample_customers c
                      where customer_id = :p_id
                    ) as "data"
                  from dual
                ]',
                p_template_type   => aop_api_pkg.c_source_type_sql,
                p_template_source => q'[
                   select template_type, template_blob
                    from aop_template
                   where id = 1
                ]',
                p_output_type     => aop_api_pkg.c_word_docx,
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => g_app_id,
                p_aop_remote_debug=> g_debug);

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_return, l_output_filename, aop_api_pkg.c_mime_type_docx, sysdate);
end call_aop_api_pkg;


--
-- AOP_API_pkg ASYNC example
--
procedure call_aop_api_async_pkg
as
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_return          blob;
  l_output_filename varchar2(100) := 'output';

begin
  -- define bind variables
  l_binds(1).name := 'p_id';
  l_binds(1).value := '1';

  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_sql,
                p_data_source     => q'[
                  select
                    'file1' as "filename",
                    cursor(
                      select
                        c.cust_first_name as "cust_first_name",
                        c.cust_last_name as "cust_last_name",
                        c.cust_city as "cust_city",
                        cursor(select o.order_total as "order_total",
                                      'Order ' || rownum as "order_name",
                                  cursor(select p.product_name as "product_name",
                                                i.quantity as "quantity",
                                                i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                           from aop_sample_order_items i, aop_sample_product_info p
                                          where o.order_id = i.order_id
                                            and i.product_id = p.product_id
                                        ) "product"
                                 from aop_sample_orders o
                                where c.customer_id = o.customer_id
                              ) "orders"
                      from aop_sample_customers c
                      where customer_id = :p_id
                    ) as "data"
                  from dual
                ]',
                p_template_type   => aop_api_pkg.c_source_type_sql,
                p_template_source => q'[
                   select template_type, template_blob
                    from aop_template
                   where id = 1
                ]',
                p_output_type     => aop_api_pkg.c_pdf_pdf,
                p_output_filename => l_output_filename,
                p_output_to       => aop_api_pkg.c_output_async,
                --p_procedure       => 'aop_sample_pkg.aop_store_document_async',
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => g_app_id,
                p_aop_remote_debug=> g_debug);

  -- in case of debug, we know the output 
  if g_debug in ('Local', 'Remote')
  then 
    insert into aop_output_async (output_blob, filename, mime_type)
    values (l_return, l_output_filename,aop_api_pkg.c_mime_type_json);
  else 
    -- you can either set the p_procedure parameter or call your own add the end to store the URL 
    aop_store_document_async(
      p_async_status     => aop_api_pkg.g_async_status,
      p_async_message    => aop_api_pkg.g_async_message,
      p_async_url        => aop_api_pkg.g_async_url,
      p_output_filename  => l_output_filename,
      p_output_mime_type => aop_api_pkg.c_mime_type_pdf);
    -- in case you want to see the output in SQL Workshop
    sys.htp.p('status: '  || aop_api_pkg.g_async_status);
    sys.htp.p('message: ' || aop_api_pkg.g_async_message);
    sys.htp.p('url: '     || aop_api_pkg.g_async_url); 
  end if;  


end call_aop_api_async_pkg;


--
-- AOP_API_pkg example to IP Printer
--
procedure call_aop_api_ip
as
  l_return blob;
  l_result clob;
  l_output_filename varchar2(100) := 'test.pdf';
begin
  l_return := aop_api_pkg.plsql_call_to_aop(
              p_data_type             => aop_api_pkg.c_source_type_sql,
              p_data_source           => q'[select 
                                              'file1' as "filename", 
                                              cursor(
                                                select
                                                  c.cust_first_name as "cust_first_name",
                                                  c.cust_last_name as "cust_last_name",
                                                  c.cust_city as "cust_city",
                                                  cursor(select o.order_total as "order_total", 
                                                                'Order ' || rownum as "order_name",
                                                            cursor(select p.product_name as "product_name", 
                                                                          i.quantity as "quantity",
                                                                          i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                                                    from aop_sample_order_items i, aop_sample_product_info p
                                                                    where o.order_id = i.order_id
                                                                      and i.product_id = p.product_id
                                                                  ) "product"
                                                          from aop_sample_orders o
                                                          where c.customer_id = o.customer_id
                                                        ) "orders"
                                                from aop_sample_customers c
                                                where customer_id = 1
                                              ) as "data"
                                            from dual ]',
              p_template_type         => aop_api_pkg.c_source_type_apex,
              p_template_source       => 'aop_template_d01.docx',
              p_output_type           => aop_api_pkg.c_pdf_pdf,
              p_output_filename       => l_output_filename,
              p_aop_url               => g_aop_url,
              p_api_key               => g_api_key,
              p_app_id                => g_app_id,
              p_aop_remote_debug      => g_debug,
              p_page_id               => 88,
              p_init_code             => q'[aop_api_pkg.g_ip_printer_location := 'http://localhost:3000/';
                                            aop_api_pkg.g_ip_printer_version := '1.0';]');

  -- calling an IP Printer will give back the result (Success)
  -- we have to convert blob to clob (text)
  l_result := aop_api_pkg.blob2clob(l_return);
  sys.htp.p(l_result);                  
end call_aop_api_ip;                  


-- procedure which can be scheduled with dbms_scheduler
-- to automatically receive a PDF with a specific Interactive Report
-- to debug this call use Logger:
-- ALTER PACKAGE aop_api20_pkg COMPILE PLSQL_CCFLAGS = 'logger_on:TRUE'; 
-- Example of using dbms_scheduler:
/*
BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name             => 'AOP_IR_JOB',
   job_type             => 'PLSQL_BLOCK',
   job_action           => 'BEGIN 
                              aop_sample_pkg.schedule_aop_api_pkg;
                            END;',
   start_date           => SYSDATE,
   -- change to your requirement
   --repeat_interval      => 'FREQ=DAILY', 
   --end_date             => sysdate+1,
   enabled              =>  TRUE,
   auto_drop            =>  TRUE,
   comments             => 'Creation of interactive report every day and email it out');
END;
*/
procedure schedule_aop_api_pkg
as
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_return          blob;
  l_output_filename varchar2(100) := 'output';
  l_id              number;
begin
  -- note that you can't have htp.p when you use dbms_scheduler
  aop_api_pkg.create_apex_session(
    p_app_id       => g_app_id,
    p_user_name    => g_user_name,
    p_page_id      => 70,
    p_enable_debug => 'No');

  apex_util.set_session_state('P70_CUSTOMER_ID','1');

  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_rpt,
                p_data_source     => 'ireport',
                p_template_type   => aop_api_pkg.c_source_type_apex,
                p_template_source => 'aop_interactive.docx',
                p_output_type     => aop_api_pkg.c_pdf_pdf,
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_remote_debug=> g_debug,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => g_app_id,
                p_page_id         => 70);

  l_id := apex_mail.send(
            p_to   => g_mail_to,
            p_from => g_mail_from,
            p_subj => 'Mail from APEX with attachment PLSQL 2',
            p_body => 'Please review the Interactive Report in attachment.',
            p_body_html => '<b>Please</b> review the Interactive Report in attachment.') ;
  apex_mail.add_attachment(
      p_mail_id    => l_id,
      p_attachment => l_return,
      p_filename   => l_output_filename,
      p_mime_type  => aop_api_pkg.c_mime_type_pdf) ;
  apex_mail.push_queue;
end schedule_aop_api_pkg;


--
-- REST example (call this procedure from ORDS)
--
function get_file(p_customer_id   in number,
                  p_output_type   in varchar2)
return blob
as PRAGMA AUTONOMOUS_TRANSACTION;
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_template        varchar2(100);
  l_output_filename varchar2(100);
  l_return          blob;
begin
  if p_output_type = 'xlsx'
  then
    l_template := 'aop_IR_template.xlsx';
  else
    l_template := 'aop_interactive.docx';
  end if;
  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_rpt,
                p_data_source     => 'ir1|PRIMARY',
                p_template_type   => aop_api_pkg.c_source_type_apex,
                p_template_source => l_template,
                p_output_type     => p_output_type,
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => g_app_id,
                p_page_id         => 5,
                p_user_name       => g_user_name,
                p_init_code       => q'[apex_util.set_session_state('P5_CUSTOMER_ID',']'|| to_char(p_customer_id) || q'[');]',
                p_aop_remote_debug=> g_debug);
  -- we have to do a commit in order to call this function from a SQL statement
  commit;
  return l_return;
end get_file;


--
-- read from filesystem
-- MAKE SURE YOU CREATE A DIRECTORY FIRST CALLED AOP_INPUT
-- CREATE DIRECTORY AOP_INPUT AS '/tmp';
--
function read_filesystem (p_filename varchar2) 
return blob
as
  bf bfile := bfilename('AOP_INPUT', p_filename);
  b blob;
begin
  dbms_lob.createtemporary(b,true);
  dbms_lob.fileopen(bf, dbms_lob.file_readonly);
  dbms_lob.loadfromfile(b,bf,dbms_lob.getlength(bf));
  dbms_lob.fileclose(bf);
  return b;
end read_filesystem;


--
-- write to filesystem
-- MAKE SURE YOU CREATE A DIRECTORY FIRST CALLED AOP_OUTPUT
-- CREATE DIRECTORY AOP_OUTPUT AS '/tmp';
--
procedure write_filesystem
as
  -- aop
  l_binds           wwv_flow_plugin_util.t_bind_list;
  l_output_filename varchar2(100) := 'output';
  -- file
  l_file      UTL_FILE.FILE_TYPE;
  l_buffer    RAW(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_blob      BLOB;
  l_blob_len  INTEGER;
begin
  -- loop over records
  l_binds(1).name := 'p_id';
  for r in (select 1 as id from dual union all select 2 as id from dual)
  loop
    l_pos := 1;
    l_binds(1).value := r.id;
    -- call AOP
    l_blob := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_sql,
                p_data_source     => q'[
                  select
                    'file1' as "filename",
                    cursor(
                      select
                        c.cust_first_name as "cust_first_name",
                        c.cust_last_name as "cust_last_name",
                        c.cust_city as "cust_city",
                        cursor(select o.order_total as "order_total",
                                      'Order ' || rownum as "order_name",
                                  cursor(select p.product_name as "product_name",
                                                i.quantity as "quantity",
                                                i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                           from aop_sample_order_items i, aop_sample_product_info p
                                          where o.order_id = i.order_id
                                            and i.product_id = p.product_id
                                        ) "product"
                                 from aop_sample_orders o
                                where c.customer_id = o.customer_id
                              ) "orders"
                      from aop_sample_customers c
                      where customer_id = :p_id
                    ) as "data"
                  from dual
                ]',
                p_template_type   => aop_api_pkg.c_source_type_apex,
                p_template_source => 'aop_template_d01.docx',
                p_output_type     => aop_api_pkg.c_pdf_pdf,
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_remote_debug=> g_debug,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => g_app_id);

      l_output_filename := to_char(r.id)||'_'||l_output_filename;

      -- write to file system
      BEGIN
        l_blob_len := DBMS_LOB.getlength(l_blob);

        -- Open the destination file.
        l_file := UTL_FILE.fopen('AOP_OUTPUT', l_output_filename,'w', 32767);

        -- Read chunks of the BLOB and write them to the file
        -- until complete.
        WHILE l_pos < l_blob_len LOOP
          DBMS_LOB.read(l_blob, l_amount, l_pos, l_buffer);
          UTL_FILE.put_raw(l_file, l_buffer, TRUE);
          l_pos := l_pos + l_amount;
        END LOOP;

        -- Close the file.
        UTL_FILE.fclose(l_file);

      EXCEPTION
        WHEN OTHERS THEN
          -- Close the file if something goes wrong.
          IF UTL_FILE.is_open(l_file) THEN
            UTL_FILE.fclose(l_file);
          END IF;
          RAISE;
      END;
  end loop;
end write_filesystem;


--
-- view the tags that are used in a template (docx)
--
procedure get_tags_in_template
as
  l_output varchar2(100);
  l_blob   blob;
  l_clob clob;
begin
  l_blob := aop_api_pkg.plsql_call_to_aop(
              p_data_source           => q'[
                  select
                    'file1' as "filename",
                    cursor(
                      select sysdate from dual
                    ) as "data"
                  from dual
                ]',
              p_template_source       => 'aop_template_d01.docx',
              p_output_type           => aop_api_pkg.c_count_tags,
              p_output_filename       => l_output,
              p_aop_url               => g_aop_url,
              p_api_key               => g_api_key,
              p_app_id                => g_app_id,
              p_aop_remote_debug      => g_debug
            );

  l_clob := aop_api_pkg.blob2clob(l_blob);
  sys.htp.p(l_clob);
  -- returns: {"{cust_last_name}":1,"{cust_first_name}":2,"{cust_city}":1,"{#orders}":2,"{#product}":2,"{product_name}":2,"{/product}":2,"{order_total}":2,"{/orders}":2,"{%image}":1,"{unit_price}":1,"{#quantity<3}":1,"{quantity}":2,"{/quantity<3}":2,"{^quantity<3}":1,"{ unit_price*quantity }":1}

end get_tags_in_template;


--
-- all possible options for Excel cell styling
--
function test_excel_styles
return clob
as
begin
   return '[{"data": [{
            "tag1": "Lorem ipsum",
            "info1":"in bold and arial",
            "tag1_font_bold":"y",
            "tag1_font_name":"Arial",
            "tag2": "Lorem ipsum",
            "info2":"arial font",
            "tag2_font_name":"Arial",
            "tag3": "Lorem ipsum",
            "info3":"font 20",
            "tag3_font_size":"20",
            "tag4": "Lorem ipsum",
            "info4":"font color #1782A6",
            "tag4_font_color":"#1782A6",
            "tag5": "Lorem ipsum",
            "info5":"underline single",
            "tag5_font_underline":"single",
            "tag6": "Lorem ipsum",
            "info6":"underline double double",
            "tag6_font_underline":"double",
            "tag7": "Lorem ipsum",
            "info7":"underline single financieel",
            "tag7_font_underline":"single-financial",
            "tag8": "Lorem ipsum",
            "info8":"underline dubbel financieel",
            "tag8_font_underline":"double-financial",
            "tag9": "Lorem ipsum",
            "info9":"left:thin, top:medium, right:thick, bottom:hair",
            "tag9_border_left":"thin",
            "tag9_border_top":"medium",
            "tag9_border_right":"thick",
            "tag9_border_bottom":"hair",
            "tag10": "Lorem ipsum",
            "info10":"left:dotted, top:medium-dashed, right:dash-dot, bottom:medium-dash-dot",
            "tag10_border_left":"dotted",
            "tag10_border_top":"medium-dashed",
            "tag10_border_right":"dash-dot",
            "tag10_border_bottom":"medium-dash-dot",
            "tag11": "Lorem ipsum",
            "info11":"left:dash-dot-dot, top:medium-dash-dot-dot, right:slash-dash-dot, bottom:double",
            "tag11_border_left":"dash-dot-dot",
            "tag11_border_top":"medium-dash-dot-dot",
            "tag11_border_right":"slash-dash-dot",
            "tag11_border_bottom":"double",
            "tag29": "Lorem ipsum",
            "info29":"diagonal border, up-wards",
            "tag29_border_diagonal":"dash-dot-dot",
            "tag29_border_diagonal_direction":"up-wards",
            "tag29_border_diagonal_color":"#FFFFFF",
            "tag30": "Lorem ipsum",
            "info30":"diagonal border, down-wards, colored",
            "tag30_border_diagonal":"dotted",
            "tag30_border_diagonal_direction":"down-wards",
            "tag30_border_diagonal_color":"4E8A0E",
            "tag31": "Lorem ipsum",
            "info31":"diagonal border, both",
            "tag31_border_diagonal":"slash-dash-dot",
            "tag31_border_diagonal_direction":"both",
            "tag31_border_diagonal_color":"ED4043",
            "tag12": "Lorem ipsum",
            "info12":"background green, font color blue",
            "tag12_cell_background":"1DF248",
            "tag12_font_color":"020EB8",
            "tag13": "Lorem ipsum",
            "info13":"pattern: dark-gray, pattern green, background yellow",
            "tag13_cell_pattern":"dark-gray",
            "tag13_cell_color":"FF17881D",
            "tag13_background_color":"FFE9E76B",
            "tag14": "Lorem ipsum",
            "info14":"pattern: medium-gray",
            "tag14_cell_pattern":"medium-gray",
            "tag15": "Lorem ipsum",
            "info15":"pattern: light-gray",
            "tag15_cell_pattern":"light-gray",
            "tag16": "Lorem ipsum",
            "info16":"pattern: gray-0625",
            "tag16_cell_pattern":"",
            "tag17": "Lorem ipsum",
            "info17":"pattern: dark-horizontal",
            "tag17_cell_pattern":"dark-horizontal",
            "tag18": "Lorem ipsum",
            "info18":"pattern: dark-vertical",
            "tag18_cell_pattern":"dark-vertical",
            "tag19": "Lorem ipsum",
            "info19":"pattern: dark-down",
            "tag19_cell_pattern":"dark-down",
            "tag20": "Lorem ipsum",
            "info20":"pattern: dark-up",
            "tag20_cell_pattern":"dark-up",
            "tag21": "Lorem ipsum",
            "info21":"pattern: dark-grid",
            "tag21_cell_pattern":"dark-grid",
            "tag22": "Lorem ipsum",
            "info22":"pattern: dark-trellis",
            "tag24_cell_pattern":"dark-trellis",
            "tag23": "Lorem ipsum",
            "info23":"pattern: light-horizontal",
            "tag24_cell_pattern":"light-horizontal",
            "tag24": "Lorem ipsum",
            "info24":"pattern: light-vertical",
            "tag24_cell_pattern":"light-vertical",
            "tag25": "Lorem ipsum",
            "info25":"pattern: light-down",
            "tag25_cell_pattern":"light-down",
            "tag26": "Lorem ipsum",
            "info26":"pattern: light-up",
            "tag26_cell_pattern":"light-up",
            "tag27": "Lorem ipsum",
            "info27":"pattern: light-grid",
            "tag27_cell_pattern":"light-grid",
            "tag28": "Lorem ipsum",
            "info28":"pattern: light-trellis",
            "tag28_cell_pattern":"light-trellis",
            "tag32": "Lorem ipsum",
            "info32":"horizonal alignment: center",
            "tag32_text_h_alignment":"center",
            "tag33": "Lorem ipsum",
            "info33":"horizonal alignment: right",
            "tag33_text_h_alignment":"right",
            "tag34": "Lorem ipsum",
            "info34":"horizonal alignment: fill",
            "tag34_text_h_alignment":"fill",
            "tag35": "Lorem ipsum",
            "info35":"horizonal alignment: justify",
            "tag35_text_h_alignment":"justify",
            "tag36": "Lorem ipsum",
            "info36":"horizonal alignment: center-continous",
            "tag36_text_h_alignment":"center-continous",
            "tag37": "Lorem ipsum",
            "info37":"horizonal alignment: distributed",
            "tag37_text_h_alignment":"distributed",
            "tag38": "Lorem ipsum",
            "info38":"horizonal alignment: left (was right)",
            "tag38_text_h_alignment":"left",
            "tag39": "Lorem ipsum",
            "info39":"vertical alignment: top",
            "tag39_text_v_alignment":"top",
            "tag40": "Lorem ipsum",
            "info40":"vertical alignment: center",
            "tag40_text_v_alignment":"center",
            "tag41": "Lorem ipsum",
            "info41":"vertical alignment: justify",
            "tag41_text_v_alignment":"justify",
            "tag42": "Lorem ipsum",
            "info42":"vertical alignment: distributed",
            "tag42_text_v_alignment":"distributed",
            "tag43": "Lorem ipsum",
            "info43":"vertical alignment: bottom (was top)",
            "tag43_text_v_alignment":"bottom",
            "tag44": "Lorem ipsum",
            "info44":"text rotation: 90",
            "tag44_text_rotation":"90",
            "tag45": "Lorem ipsum",
            "info45":"text rotation: 45",
            "tag45_text_rotation":"45",
            "tag46": "Lorem ipsum",
            "info46":"text rotation: 0",
            "tag46_text_rotation":"0",
            "tag47": "Lorem ipsum",
            "info47":"text rotation: -45",
            "tag47_text_rotation":"-45",
            "tag48": "Lorem ipsum",
            "info48":"text rotation: -180",
            "tag48_text_rotation":"-180",
            "tag49": "Lorem ipsum",
            "info49":"text rotation: aligned-vertically",
            "tag49_text_rotation":"aligned-vertically",
            "tag50": "Lorem ipsum",
            "info50":"text indent: (Number of spaces to indent = indent value * 3)",
            "tag50_text_indent":"2",
            "tag51": "Lorem ipsum Lorem ipsumLorem ipsum",
            "info51":"text wrap: y",
            "tag51_text_wrap":"y",
            "tag52": "Lorem ipsum Lorem ipsumLorem ipsum",
            "info52":"text shrink: y",
            "tag52_text_shrink":"y",
            "tag53": "Lorem ipsum",
            "info53":"cell locked: y",
            "tag53_cell_locked":"y",
            "tag54": "Lorem ipsum",
            "info54":"cell hidden: y",
            "tag54_cell_hidden":"y"
            }],
            "filename": "file1"}]';
end test_excel_styles;


--
-- custom debug procedure which can be called by AOP to log what's happening
--
procedure custom_debug(p_message     in varchar2, 
                       p0            in varchar2 default null, 
                       p1            in varchar2 default null, 
                       p2            in varchar2 default null, 
                       p3            in varchar2 default null, 
                       p4            in varchar2 default null, 
                       p5            in varchar2 default null, 
                       p6            in varchar2 default null, 
                       p7            in varchar2 default null, 
                       p8            in varchar2 default null, 
                       p9            in varchar2 default null, 
                       p10           in varchar2 default null, 
                       p11           in varchar2 default null, 
                       p12           in varchar2 default null, 
                       p13           in varchar2 default null, 
                       p14           in varchar2 default null, 
                       p15           in varchar2 default null, 
                       p16           in varchar2 default null, 
                       p17           in varchar2 default null, 
                       p18           in varchar2 default null, 
                       p19           in varchar2 default null, 
                       p_level       in apex_debug.t_log_level default apex_debug.c_log_level_info, 
                       p_description in clob default null)                     
as
PRAGMA AUTONOMOUS_TRANSACTION;
begin
  insert into aop_debug (p_message, p_description)
  values (p_message, p_description);
  commit;
end custom_debug;


--
-- Failover procedure that will notify the administrator
--
procedure failover_procedure
as 
begin
  apex_mail.send(
    p_to   => g_mail_to,
    p_from => g_mail_from,
    p_subj => 'AOP Failover notification',
    p_body => 'It looks like the main AOP url was not working, so the failover url was used at ' || to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') || '.' || CHR(10) ||
              'APEX app: '     || v('APP_ID') || CHR(10) ||
              'APEX page: '    || v('APP_PAGE_ID') || CHR(10) ||              
              'APEX session: ' || v('APP_SESSION') || CHR(10) ||
              'APEX user: '    || nvl(v('APP_USER'),user) 
  );

  apex_mail.push_queue;  
end failover_procedure;

--
-- D3 example
--
function d3_radial_stacked_bar
return clob
as
  l_d3     clob;
  l_return clob;
begin
  -- D3 based on https://bl.ocks.org/mbostock/3686329aa6e1f5938df8eef12ec353fe

  l_d3 := q'!    
    const d3 = require('d3');
    const D3Node = require('d3-node');
    const linear = require('d3-scale').scaleLinear();
    
    function square(x) {
        return x * x;
    }
    
    function scaleRadial() {
    
        function scale(x) {
            return Math.sqrt(linear(x));
        }
    
        scale.domain = function (_) {
            return arguments.length ? (linear.domain(_), scale) : linear.domain();
        };
    
        scale.nice = function (count) {
            return (linear.nice(count), scale);
        };
    
        scale.range = function (_) {
            linear.range(_.map(square));
            return scale;
        };
    
        scale.ticks = linear.ticks;
        scale.tickFormat = linear.tickFormat;
    
        return scale;
    }
    
    const d3n = new D3Node();
    const [width, height] = [960, 960];
    const svg = d3n.createSVG(width, height);
    const innerRadius = 180;
    const outerRadius = Math.min(width, height) * 0.77;
    
    svg.attr('font-family', 'sans-serif').attr('font-size', 10);
    
    const g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height * 0.78 + ")");
    
    var x = d3.scaleBand()
        .range([0, 2 * Math.PI])
        .align(0);
    
    var y = scaleRadial()
        .range([innerRadius, outerRadius]);
    
    var z = d3.scaleOrdinal()
        .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);
    
    d3.csv("https://bl.ocks.org/mbostock/raw/3686329aa6e1f5938df8eef12ec353fe/data.csv", function (d, _, columns) {
        var t, i;
        // @ts-ignore
        for (i = 1, t = 0; i < columns.length; ++i) t += d[columns[i]] = +d[columns[i]];
        // @ts-ignore
        d.total = t;
        return d;
    }, function (error, data) {
        if (error) throw error;
    
        weave(data, function (a, b) { return b[data.columns[6]] - a[data.columns[6]]; });
        x.domain(data.map(function (d) { return d.State; }));
        y.domain([0, d3.max(data, function (d) { return d.total; })]);
        z.domain(data.columns.slice(1));
    
        g.append("g")
            .selectAll("g")
            // @ts-ignore
            .data(d3.stack().keys(data.columns.slice(1))(data))
            .enter().append("g")
            .attr("fill", function (d) { return z(d.key); })
            .selectAll("path")
            .data(function (d) { return d; })
            .enter().append("path")
            .attr("d", d3.arc()
                .innerRadius(function (d) { return y(d[0]); })
                .outerRadius(function (d) { return y(d[1]); })
                // @ts-ignore
                .startAngle(function (d) { return x(d.data.State); })
                // @ts-ignore
                .endAngle(function (d) { return x(d.data.State) + x.bandwidth(); })
                .padAngle(0.01)
                .padRadius(innerRadius));
    
        var label = g.append("g")
            .selectAll("g")
            .data(data)
            .enter().append("g")
            .attr("text-anchor", "middle")
            .attr("transform", function (d) { return "rotate(" + ((x(d.State) + x.bandwidth() / 2) * 180 / Math.PI - 90) + ")translate(" + innerRadius + ",0)"; });
    
        label.append("line")
            .attr("x2", -5)
            .attr("stroke", "#000");
    
        label.append("text")
            .attr("transform", function (d) { return (x(d.State) + x.bandwidth() / 2 + Math.PI / 2) % (2 * Math.PI) < Math.PI ? "rotate(90)translate(0,16)" : "rotate(-90)translate(0,-9)"; })
            .text(function (d) { return d.State; });
    
        var yAxis = g.append("g")
            .attr("text-anchor", "end");
    
        var yTick = yAxis
            .selectAll("g")
            .data(y.ticks(10).slice(1))
            .enter().append("g");
    
        yTick.append("circle")
            .attr("fill", "none")
            .attr("stroke", "#000")
            .attr("stroke-opacity", 0.5)
            .attr("r", y);
    
        yTick.append("text")
            .attr("x", -6)
            .attr("y", function (d) { return -y(d); })
            .attr("dy", "0.35em")
            .attr("fill", "none")
            .attr("stroke", "#fff")
            .attr("stroke-linejoin", "round")
            .attr("stroke-width", 3)
            .text(y.tickFormat(10, "s"));
    
        yTick.append("text")
            .attr("x", -6)
            .attr("y", function (d) { return -y(d); })
            .attr("dy", "0.35em")
            .text(y.tickFormat(10, "s"));
    
        yAxis.append("text")
            .attr("x", -6)
            .attr("y", function (d) { return -y(y.ticks(10).pop()); })
            .attr("dy", "-1em")
            .text("Population");
    
        var legend = g.append("g")
            .selectAll("g")
            .data(data.columns.slice(1).reverse())
            .enter().append("g")
            .attr("transform", function (d, i) { return "translate(-40," + (i - (data.columns.length - 1) / 2) * 20 + ")"; });
    
        legend.append("rect")
            .attr("width", 18)
            .attr("height", 18)
            .attr("fill", z);
    
        legend.append("text")
            .attr("x", 24)
            .attr("y", 9)
            .attr("dy", "0.35em")
            .text(function (d) { return d; });
    
        // @ts-ignore // Injected global, has to be called with the D3Node object once the SVG is finished
        finish(d3n);
    });
    
    function weave(array, compare) {
        var i = -1, j, n = array.sort(compare).length, weave = new Array(n);
        while (++i < n) weave[i] = array[(j = i << 1) >= n ? (n - i << 1) - 1 : j];
        while (--n >= 0) array[n] = weave[n];
    }
  !';
  apex_json.initialize_clob_output;
  apex_json.open_array;  -- [
  apex_json.open_object; -- {
  apex_json.write('filename','file1');     
  apex_json.open_array('data');  -- [
  apex_json.open_object;  -- {
  apex_json.write('d3_width', 600);   
  apex_json.write('d3_height', 600);  
  apex_json.write('d3', l_d3);  
  apex_json.close_object;
  apex_json.close_array;
  apex_json.close_object;
  apex_json.close_array;
  
  l_return := apex_json.get_clob_output;
  
  apex_json.free_output;
  
  return l_return;
  
end d3_radial_stacked_bar;

--
-- PL/SQL Function Returning SQL
--
function plsql_function_returning_sql
return clob
as 
  l_sql clob;
begin
  -- note that you can also pass :Px_X in your statement
  l_sql := q'!
                select
                  'file1' as "filename", 
                  cursor(
                    select
                      c.cust_first_name as "cust_first_name",
                      c.cust_last_name as "cust_last_name",
                      c.cust_city as "cust_city",
                      cursor(select o.order_total as "order_total", 
                                    'Order ' || rownum as "order_name",
                                cursor(select p.product_name as "product_name", 
                                              i.quantity as "quantity",
                                              i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                                         from aop_sample_order_items i, aop_sample_product_info p
                                        where o.order_id = i.order_id
                                          and i.product_id = p.product_id
                                      ) "product"
                               from aop_sample_orders o
                              where c.customer_id = o.customer_id
                            ) "orders"
                    from aop_sample_customers c
                    where customer_id = 1
                  ) as "data"
                from dual  
           !';
  return l_sql;
end plsql_function_returning_sql;

--
-- PL/SQL Function Returning REF CURSOR
--
function plsql_function_ret_refcursor
return sys_refcursor
as 
  l_ref_cursor sys_refcursor;
begin 
  open l_ref_cursor 
  for
    select
      'file1' as "filename", 
      cursor(
        select
          c.cust_first_name as "cust_first_name",
          c.cust_last_name as "cust_last_name",
          c.cust_city as "cust_city",
          cursor(select o.order_total as "order_total", 
                        'Order ' || rownum as "order_name",
                    cursor(select p.product_name as "product_name", 
                                  i.quantity as "quantity",
                                  i.unit_price as "unit_price", APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"
                              from aop_sample_order_items i, aop_sample_product_info p
                            where o.order_id = i.order_id
                              and i.product_id = p.product_id
                          ) "product"
                    from aop_sample_orders o
                  where c.customer_id = o.customer_id
                ) "orders"
        from aop_sample_customers c
        where customer_id = 1
      ) as "data"
    from dual;

  return l_ref_cursor;
end plsql_function_ret_refcursor;


--
-- Show case how to use the convert function
--
procedure use_convert_function 
as 
  l_output_filename varchar2(100) := 'output.pdf';
  l_blob            blob;
begin

  l_blob := aop_convert_pkg.convert_files(
              p_query                 => q'[select filename, mime_type, template_blob as file_blob from aop_template where instr(':143450699794791774486208947257060858781:143401895781156295774972225164064787970:', ':'||id||':')>0]',
              p_output_type           => 'pdf',
              p_output_filename       => l_output_filename,  
              p_aop_url               => g_aop_url,
              p_api_key               => g_api_key,
              p_app_id                => g_app_id
            );

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_blob, l_output_filename, 'application/pdf', sysdate);

end use_convert_function;

--
-- Generate your own JSON for the template source
--
function get_template_json
return clob
as 
  l_template_type varchar2(300);
  l_template      clob;
  l_retval        clob;
begin 
  select template_type, apex_web_service.blob2clobbase64 (p_blob => template_blob) as template_base64
    into l_template_type, l_template
    from aop_template
   where id = 1;
  apex_json.initialize_clob_output;
  apex_json.open_object;
  apex_json.write ('file', replace (l_template, '"', '\u0022'));
  apex_json.write ('template_type', l_template_type);
  apex_json.close_object;
  l_retval := apex_json.get_clob_output;
  apex_json.free_output;
  return l_retval;
exception
  when no_data_found
  then
      raise_application_error (-20000, 'There is no Active Template.');
end get_template_json;

--
-- Do a call to AOP with source data and template JSON
--
procedure call_aop_with_template_json 
as
  l_data_source     clob;
  l_template_source clob;
  l_filename        varchar2(100);
  l_result          blob; 
begin 
  l_data_source := q'!
         [{
            "cust_first_name": "John",
            "cust_last_name": "Dulles",
            "cust_city": "Sterling",
            "orders": [{
                "order_total": 2380,
                "order_name": "Order 1",
                "product": [{
                    "product_name": "Skirt",
                    "quantity": 3,
                    "unit_price": 80,
                    "image": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsU\nFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5Ojf/2wBDAQoK\nCg0MDRoPDxo3JR8lNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3\nNzc3Nzc3Nzc3Nzc3Nzf/wAARCABoAGgDASIAAhEBAxEB/8QAHAAAAQQDAQAAAAAA\nAAAAAAAAAAIDBwgBBAUG/8QAPBAAAQMCAwIKCAMJAAAAAAAAAQACAwQRBQYhBzES\nExRhcYKhscHCIjJBUXKBkdIzUpJCRVRzg5SistH/xAAUAQEAAAAAAAAAAAAAAAAA\nAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AnFCEIBebxjO2\nDYNib8Pr5JmSsa1xc2IuaLi43a9i9Iq77Qq11Xm7FJGuBDZjGOhgDfBBMUefssSf\nvVjPjje3vatuPN2XJPVxug607R3qtjpX+3vSDO/n+qCzJzVl4b8cw7+5Z/1NPzjl\ntgu7HKA/DMD3KtPKHD3/AFWOPfaw70Fi5toWVohrirX/AMuJ7u5qXg+esDxnEosP\noJZnzShxbwoS0aAk6nmCroyRxbqQPmu5k6uNDmfC6kv4LWVLA4j8pPBPYSgsqhCE\nAhCEAhCEDdRK2CCSZ/qxtLj0AXVXa6Z09RJM83dI4vcecm5VjM6VPJMqYrKDY8me\n0dLhwR3qt0x9IoNd6QUtybKBJb7kDRK9iwgy06rZhJBu02PsPOtUJ+LegtLg9YMQ\nwmirAb8fAyT6tBW4vJ7LavlWSqEE3dCXwnquNuwhesQCEIQCEIQeO2r1HEZOnYDb\njpY2dvC8qgKU6qadtVRwMGoIL/iVBf8ApaR5lCsm9A2d6bcllJcgwNywd6yNyQ46\noFBPRGyZTjCgm7YnU8ZgVdTE6xVXCHQ5o8WlSMoh2G1Nq7FKUn14Y5APhJHmCl5A\nIQhAIQhBEm22ovW4bTfkhe89YgeVRTIVIO2Go43NRjv+FTxt73eZR7KgRdYWAUOK\nBJNk2TcrL0m6BwFONOqZultcgkHY7VGDOMcd9J6eSPsDvKp4VbNn9VyXOGEy3sDU\nNYTzO9HzKyaAQhCAQhCCve0qo5RnDE3X0bIGDqtA8F5CUrtZqqeVZgxKYG4fVSuH\nRwiuHJuQNgocdEkb0E6IEuKQCLrLtyQN6BwmwCUwptx0ASo9EHRw2c01ZBUNNjFI\n2QfIg+CtWxwexr2m4cLjoVTIvWA96tDleo5XlvC6i9zJSRE9PBF0HUQhCATVVKIK\naWZ26NhefkLp1cfN8/J8rYtLexFJIAectI8UFbKhxkkc929xuVqyLekjIJ00Wq6M\n2Qa1tVgjRPGMrHFm2iDXcNEkNWwYiVjiigYOruZLYNU7xJShERuQEfrBWM2YVHKM\nkYab3MbXxnqvcO6yruyIg3sVO+xt5dlJ7CdGVcgHQQ0+KD3aEIQCTJGyVjmSsa9j\nhYtcLg/JCEHCxDJeXcQuZ8Kga4/tQgxH/Gy402yzLkjrtFZGPc2e47QUIQMu2TZe\nO6fEB/VZ9qbOyPAv4zEP1x/YhCBJ2Q4JfSvxD6x/alDZHgI31mIHrx/YhCB1uyfL\no3y17umZvg1blPszyvCPTo5pj75Kh/gQhCDpUuS8t0rg6LBqThDUF7OH/tdd1jGx\nsDI2hrRoGtFgEIQKQhCD/9k=",
                    "image_max_width": 40
                }, {
                    "product_name": "Ladies Shoes",
                    "quantity": 2,
                    "unit_price": 120,
                    "image": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBhQQEBIUEhIWFRUWFBYUGBcTFBoY\nFhQcFBgVFRUWFRscHCYhIyAjHx4THy8sLycpLCwvFh8xNTA2NSgtLCoBCQoKBQUF\nDQUFDSkYEhgpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkp\nKSkpKSkpKSkpKf/AABEIAGgAaAMBIgACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAA\nAAAABgcFCAEDBAL/xAA9EAABAwICBwQGBwkBAAAAAAABAAIDBBEFIQYHEjFBUXEi\nYYGREyMyQqGxFFJiwdLh8CQzRFRygrLC0UP/xAAUAQEAAAAAAAAAAAAAAAAAAAAA\n/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AvFERAREQEREBERAR\nEQEREBERAUD1g6eOo/VwFvpANpxcLhvENtz4+SmOKV7YIZJHbmNJ68h4mw8Vr5i+\nIGokkc83Ly4k875lBaugWspmIWik2WT2vYezIBv2b7nDM2zyzB32nAK1Cpax0Et2\nuLXMdcEGxBabgjxsVsRq30/biMWzIQKiNvbaMtsbvSMHzHAnkQgmyIiAiIgIiICI\niAiIgr/W1ipZDHED7RL3dG5NHmSf7VTLpe0rM1uu9e3uibbzcqskdbNBjMXi7Qdz\nyPUfl8l1YXjUtJURzQvLXsIcCPiCOIIuCORXvkb6RpafDuPBYN8RubiyDa7QTTWP\nFKYSss17bNljvnG78J3g/eCpItStDtKJcNqWzxG43PZfsyN4tPzB4EBbR6P49FW0\n8c8Ltpjxx3tI9prhwIORQZJERAREQEREBERBDtYmjX0mEPaO0wG/e38lRWKUL4nE\nOGQP6utpHMuLFVbpng8YmLDYOObQfeB5HgeuXTegpKabZXsoiyb2hvyJ4g8CP1zX\nrx7AC0EtGWY6Ebx3FR/C6wwygOzG4jmONvn4IMpVYSYzzHAgb1IdXWm78KqLPuae\nQgSN+rwEjRzHxGXK3e6lyte7HWI5Z7nBR3FKMtJvZBtVSVTZWNexwc1wDmuabhwI\nuCCu5UNqk1i/RHikqX+pe71bnHKJx4E/VJ8jnuur4aUHKIiAiIgIiICrjWedmemd\n0HmS0/NWOq31uGxpT9r/AHagwcuij56eaeIbRZk+ID94213Fn225Ec8xxVYYvhI2\nmvbuycCNxBWx+gsf7KTzkcfINCgesvQ0QudNEPVSOJLQMo3kXcB9l+Z7iDzCCGaK\nVokYYXHNou2/Ll4X+IXXpHQm20Pd39OHko5C90cu03JzTcWU1hxFlVFfc5uTgeHM\nHqgr2U5/rJXBqo1rNsyjq3gEdmKVxy7mPPyPDd0rDSDD/RHs+yfh3FYG9kG6YK5W\nt2huuaqomiOUfSIhkA82e0cmu5dxurs0O09p8Tj2otpjr2LJAAcrX2SDYhBJUREB\nERAVaa4Af2cgXAN/Jzcr7uCstfL4wRYi/XNBHdAZdqjB2SO2620LX3G47s/gstjW\nGCpgkid77SAfqne1w6Gx8F7QFyg1a0hoDBUHaGycwRyc0kOHnfyWNL3xu243Frhx\nHHuPMK4damhpcXTsHZdm4j3HDLaPc4W8QeaqqeicBm2/e3MFB8nEhOO20NduOyMj\n1BXTUYLE/MEsP2c2+ROXHisPV1JY4ixHUL5jxxw4ZIM7S4HGy1wX/wBR7PkP+qWY\ndVloaWO2S32S3LZ6WUDi0mHvNKyNLpXEOY6hBeGjusTIMqh3ekHHqp1T1LZGhzHB\nwO4jctaKfS+G1i8eKkGj+sL6O+8UmR3tJu13ggvxFg9GNK4q9m1GbOHtMvm3vHMI\ngziIiAiIg4c26weIaDUU9zJTR3PFg2D5tsiIIxiOpKkkv6OSaI8tpsjfJ7Sfio9W\nahpB+6qond0kJb8WuPyREGJqNSFaPdpn9JHD/Ji8btSlb/LR+EzPyXKIOs6j6s/w\nw8J2fiXLNRVWf/Fo6zt+4lEQT/VrqwkwyZ0skjc2Fvo2Oc4Z2zcTYeQ8UREH/9k=",
                    "image_max_width": 40  
                }]
            }]
        }]
  !';
  l_template_source := get_template_json;
  l_result := aop_api_pkg.plsql_call_to_aop (p_data_type       => aop_api_pkg.c_source_type_json
                                            ,p_data_source     => l_data_source
                                            ,p_template_type   => aop_api_pkg.c_source_type_json
                                            ,p_template_source => l_template_source
                                            ,p_aop_url         => g_aop_url
                                            ,p_api_key         => g_api_key
                                            ,p_output_filename => l_filename
                                            -- uncomment when you want to download the output in a browser
                                            ,p_output_to       => aop_api_pkg.c_output_browser
                                            ,p_aop_remote_debug=> g_debug
                                            );
end call_aop_with_template_json;


--
-- Do a call to AOP with source data SQL Array
--
procedure call_aop_with_sql_array
as 
  l_list   aop_api_pkg.t_query_list;
  l_binds  wwv_flow_plugin_util.t_bind_list;  
  l_return blob;
  l_output_filename varchar2(100) := 'output';
begin
  -- one customer
  l_list(1).name  := 'customer';
  l_list(1).query := 'select * from aop_sample_customers where customer_id = :p_customer_id';
  l_list(1).binds(1).name  := 'p_customer_id'; 
  l_list(1).binds(1).value := '1';

  -- orders for that customer
  l_list(2).name  := 'orders';
  l_list(2).query := 'select * from aop_sample_orders where customer_id = :p_customer_id';
  l_list(2).binds(1).name  := 'p_customer_id'; 
  l_list(2).binds(1).value := '1';

  -- show all products that are available
  l_list(3).name  := 'products';
  l_list(3).query := 'select * from aop_sample_product_info';
  l_list(3).binds := l_binds; -- empty

  l_return := aop_api_pkg.plsql_call_to_aop (
                p_data_type       => aop_api_pkg.c_source_type_sql_array,
                p_sql_array       => l_list,
                p_template_type   => null,
                p_template_source => '', -- AOP Template
                p_output_type     => 'docx',
                p_output_filename => l_output_filename,
                p_binds           => l_binds,
                p_aop_url         => g_aop_url,
                p_api_key         => g_api_key,
                p_app_id          => g_app_id,
                p_aop_remote_debug=> g_debug
              );  
                
  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_return, 'sql_array_data_source.docx', aop_api_pkg.c_mime_type_docx, sysdate);
  
end call_aop_with_sql_array;

--
-- Store the hash of a template
--
procedure store_template_hash_prc(
    p_output_blob         in blob,
    p_output_filename     in varchar2,
    p_output_mime_type    in varchar2,
    p_template_cache_hash in varchar2)
is
begin
  -- update the table to store the hash of the template
  -- note that you can use v('P1_X') in case you want to reference an APEX Page Item
  /*
  update aop_template
     set description = p_template_cache_hash
   where id = 1;  
     
  commit;    
  */

  -- set the hash in session state, for other requests, see page 82 in the AOP Sample App
  apex_util.set_session_state('P82_TEMPLATE_HASH', p_template_cache_hash);

end store_template_hash_prc;

--
-- Show file in browser
--
procedure show_in_browser(
  p_id               in number,
  p_stop_apex_engine in varchar default 'N')
is 
  c_y        constant varchar2(1) := 'Y';
  l_blob     blob;
  l_filename varchar2(200);
begin
  select output_blob, filename
    into l_blob, l_filename
    from aop_output
   where id = p_id; 

  sys.htp.flush;
  sys.htp.init;
  owa_util.mime_header('application/octet-stream',false);
  sys.htp.p('Content-length:'||dbms_lob.getlength(l_blob));
  sys.htp.p('Content-Disposition:attachment; filename="'||l_filename||'"; ' || 'filename*=utf-8'''''||l_filename);
  owa_util.http_header_close;
  wpg_docload.download_file(l_blob);
  if p_stop_apex_engine = c_y 
  then    
    apex_application.stop_apex_engine;    
  end if;  

end show_in_browser;

--
-- Convert a Word document to PDF using the convert_blob function
--
procedure convert_word_to_pdf
as
  l_blob      blob; 
  l_mime_type varchar2(500);
  l_filename  varchar2(200);
  l_pdf       blob;
begin
  select mime_type, template_blob, filename
    into l_mime_type, l_blob, l_filename
    from aop_template
   where id = 1;

  l_pdf := aop_convert_pkg.convert_blob(
             p_blob               => l_blob,
             p_mime_type          => l_mime_type,
             p_output_type        => aop_api_pkg.c_pdf_pdf,
             p_output_filename    => l_filename,  
             p_aop_url            => g_aop_url,
             p_api_key            => g_api_key
           );

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_pdf, 'converted_word_to_pdf.pdf', aop_api_pkg.c_mime_type_pdf, sysdate);
end convert_word_to_pdf;

--
-- Create base64 from URL
--
function get_b64_img_from_http (p_url  in varchar2)
return clob
as
  l_clob clob;
begin
  l_clob := l_clob || apex_web_service.blob2clobbase64(httpuritype.createuri(p_url).getblob());
  return l_clob;
end get_b64_img_from_http;

end aop_sample25_pkg;
/
create or replace package aop_test25_pkg as

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

/* AOP Version */
c_aop_version            constant varchar2(6) := '25.2.1';


-- Run automated tests in table AOP_AUTOMATED_TEST; if p_id is null, all tests will be ran
procedure run_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null);

-- Reset all automated tests in table AOP_AUTOMATED_TEST
procedure reset_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null);

-- Add new and update existing automated tests in table AOP_AUTOMATED_TEST based on the entries in the AOP Sample App
procedure sync_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null);


end aop_test25_pkg;
/
create or replace package body aop_test25_pkg as

/**
 * @Description: Run automated tests in table AOP_AUTOMATED_TEST; if p_id is null, all tests will be ran
 *
 * @Author: Dimitri Gielis
 * @Created: 2015-7-9
 *
 * @Param: p_id     Id of record in table, null is all
 * @Param: p_app_id Application Id
 */
procedure run_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null)
as
  l_return blob;
  l_error  varchar2(4000);
  l_start  date;
  l_end    date;
  l_output_filename varchar2(150);
  l_mime_type       varchar2(150);
  --
  l_aop_url          varchar2(1000);
  l_api_key          varchar2(40);
  l_aop_remote_debug varchar2(10);
  l_output_converter varchar2(100);
begin
  apex_debug.message(p_message => 'Begin run_automated_tests', p_level => apex_debug.c_log_level_app_enter);
  -- note that session state needs to be set manually for the items (see pre-rendering page 8)

  -- set logging on by going to aop_api_pkg g_logger_enabled true

  -- read AOP settings
  select aop_url, api_key, debug, converter
    into l_aop_url, l_api_key, l_aop_remote_debug, l_output_converter
    from aop_config;

  -- reset tests
  update aop_automated_test
    set received_bytes     = null,
        output_blob        = null,
        result             = null,
        processing_seconds = null,
        run_date           = null,
        mime_type          = null
  where app_id = p_app_id
    and (id = p_id or p_id is null) 
    and active = 'Y'
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;

  commit;         
  -- loop over reports
  for r in (select id, data_type, data_source,
                   template_type, template_source,
                   output_type, output_filename, output_to, output_type_item_name,
                   filename, special, procedure_, app_id, page_id, init_code 
                   --output_split, prepend_files_sql, append_files_sql, sub_templates_sql
              from aop_automated_test
             where (id = p_id or p_id is null)
               and app_id = p_app_id
               and active = 'Y'
               and 1 = case 
                       when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
                       when p_only_failed is null then 1
                       end
             order by seq_nr
           )
  loop
    --logger.log('AOP Automated Tests, ID: ' || to_char(r.id));
    apex_debug.message(p_message => 'test id: ' || to_char(r.id), p_level => apex_debug.c_log_level_app_trace); 
    begin
      l_start := sysdate;
      l_output_filename := nvl(r.output_filename,'output');
      -- reset global variables
      aop_api_pkg.g_aop_url                   := null;
      aop_api_pkg.g_api_key                   := null;
      aop_api_pkg.g_aop_mode                  := null;
      aop_api_pkg.g_failover_aop_url          := null;
      aop_api_pkg.g_failover_procedure        := null;
      aop_api_pkg.g_output_converter          := null;
      aop_api_pkg.g_output_correct_page_nr    := false;
      aop_api_pkg.g_output_lock_form          := false;
      aop_api_pkg.g_identify_form_fields      := null;
      aop_api_pkg.g_proxy_override            := null;
      aop_api_pkg.g_transfer_timeout          := 1800;
      aop_api_pkg.g_wallet_path               := null;
      aop_api_pkg.g_wallet_pwd                := null;
      aop_api_pkg.g_output_filename           := null;
      aop_api_pkg.g_cloud_provider            := null;
      aop_api_pkg.g_cloud_location            := null;
      aop_api_pkg.g_cloud_access_token        := null;
      aop_api_pkg.g_language                  := aop_api_pkg.c_en;
      aop_api_pkg.g_app_language              := null;
      aop_api_pkg.g_logging                   := '';
      aop_api_pkg.g_debug                     := null;
      aop_api_pkg.g_debug_procedure           := null;
      -- APEX Page Items
      aop_api_pkg.g_apex_items                := null;
      -- Layout for IR
      aop_api_pkg.g_rpt_header_font_name      := '';
      aop_api_pkg.g_rpt_header_font_size      := '';
      aop_api_pkg.g_rpt_header_font_color     := '';
      aop_api_pkg.g_rpt_header_back_color     := '';
      aop_api_pkg.g_rpt_header_border_width   := '';
      aop_api_pkg.g_rpt_header_border_color   := '';
      aop_api_pkg.g_rpt_data_font_name        := '';
      aop_api_pkg.g_rpt_data_font_size        := '';
      aop_api_pkg.g_rpt_data_font_color       := '';
      aop_api_pkg.g_rpt_data_back_color       := '';
      aop_api_pkg.g_rpt_data_border_width     := '';
      aop_api_pkg.g_rpt_data_border_color     := '';
      aop_api_pkg.g_rpt_data_alt_row_color    := '';
      aop_api_pkg.g_cal_type                  := aop_api_pkg.c_cal_month;
      aop_api_pkg.g_start_date                := null;
      aop_api_pkg.g_end_date                  := null;
      aop_api_pkg.g_weekdays                  := null;
      aop_api_pkg.g_months                    := null;
      aop_api_pkg.g_color_days_sql            := null;
      aop_api_pkg.g_separate_pages            := 'false';
      aop_api_pkg.g_alignment                 := 'right';
      aop_api_pkg.g_start_of_week             := 'Mon';
      -- Call to URL data source
      aop_api_pkg.g_url_username              := null;
      aop_api_pkg.g_url_password              := null;
      aop_api_pkg.g_url_proxy_override        := null;
      aop_api_pkg.g_url_transfer_timeout      := 180;
      aop_api_pkg.g_url_body                  := empty_clob();
      aop_api_pkg.g_url_body_blob             := empty_blob();
      --aop_api_pkg.g_url_parm_name := empty_vc_arr;
      --aop_api_pkg.g_url_parm_value := empty_vc_arr;
      aop_api_pkg.g_url_wallet_path           := null;
      aop_api_pkg.g_url_wallet_pwd            := null;
      aop_api_pkg.g_url_https_host            := null;
      -- Web Source Module 
      aop_api_pkg.g_web_source_first_row      := null;
      aop_api_pkg.g_web_source_max_rows       := null;
      aop_api_pkg.g_web_source_total_row_cnt  := false;
      -- REST Enabled SQL 
      aop_api_pkg.g_rest_sql_auto_bind_items  := true;
      aop_api_pkg.g_rest_sql_first_row        := null;
      aop_api_pkg.g_rest_sql_max_rows         := null;
      aop_api_pkg.g_rest_sql_total_row_cnt    := false;
      aop_api_pkg.g_rest_sql_total_row_limit  := null;
      -- IP Printer support
      aop_api_pkg.g_ip_printer_location       := null;
      aop_api_pkg.g_ip_printer_version        := null;
      aop_api_pkg.g_ip_printer_requester      := null;
      aop_api_pkg.g_ip_printer_job_name       := 'AOP';
      aop_api_pkg.g_ip_printer_return_output  := null;
      -- AOP Processing
      aop_api_pkg.g_pre_conversion_command    := null;
      aop_api_pkg.g_pre_conversion_command_p  := null; 
      aop_api_pkg.g_post_conversion_command   := null;
      aop_api_pkg.g_post_conversion_command_p := null;
      aop_api_pkg.g_post_merge_command        := null;
      aop_api_pkg.g_post_merge_command_p      := null;
      aop_api_pkg.g_pipeline_name             := null;
      aop_api_pkg.g_post_process_command      := null;
      aop_api_pkg.g_post_process_return_output:= true;
      aop_api_pkg.g_post_process_delete_delay := null;
      -- AOP; Config
      aop_api_pkg.g_aop_config               := null;
      -- Convert characterset
      aop_api_pkg.g_convert                  := aop_api_pkg.c_n;
      aop_api_pkg.g_convert_source_charset   := null;
      aop_api_pkg.g_convert_target_charset   := 'AL32UTF8';
      -- Output
      aop_api_pkg.g_output_directory         := null;
      aop_api_pkg.g_output_sign_certificate  := null;
      aop_api_pkg.g_output_split             := null;
      aop_api_pkg.g_output_icon_font         := null;
      aop_api_pkg.g_output_even_page         := null;
      aop_api_pkg.g_output_merge_making_even := null;
      aop_api_pkg.g_output_merge             := null; 
      aop_api_pkg.g_output_page_margin       := null; 
      aop_api_pkg.g_output_page_orientation  := null; 
      aop_api_pkg.g_output_page_width        := null; 
      aop_api_pkg.g_output_page_height       := null; 
      aop_api_pkg.g_output_page_format       := null; 
      -- Files
      aop_api_pkg.g_prepend_files_sql        := null;
      aop_api_pkg.g_append_files_sql         := null;
      aop_api_pkg.g_media_files_sql          := null;      
      -- Sub-Templates
      aop_api_pkg.g_sub_templates_sql        := null;
      -- Password protected PDF
      aop_api_pkg.g_output_read_password     := null;
      aop_api_pkg.g_output_modify_password   := null;
      aop_api_pkg.g_output_pwd_protection_flag := null;
      aop_api_pkg.g_output_watermark        := null;
      aop_api_pkg.g_output_copies           := null;
      aop_api_pkg.g_ig_force_query           := null;      

      update aop_automated_test
         set result = 'processing...',
             run_date = l_start
       where id = r.id;

      commit; 

      l_return := aop_api_pkg.plsql_call_to_aop (
                    p_data_type       => r.data_type,
                    p_data_source     => r.data_source,
                    p_template_type   => r.template_type,
                    p_template_source => r.template_source,
                    p_output_type     => r.output_type,
                    p_output_filename => l_output_filename,
                    p_output_type_item_name => r.output_type_item_name,
                    p_output_to             => r.output_to,
                    p_procedure             => r.procedure_,
                    --p_binds               in t_bind_table default c_binds,
                    p_special               => r.special,
                    p_aop_remote_debug      => l_aop_remote_debug,
                    p_output_converter      => l_output_converter,
                    p_aop_url               => l_aop_url,
                    p_api_key               => l_api_key,
                    p_app_id                => r.app_id,
                    p_page_id               => r.page_id,
                    --p_user_name             => r.user_name,
                    p_init_code             => r.init_code
                    -- will be set through global variables through init code
                    --p_output_encoding       => r.output_encoding,
                    --p_output_split          => r.output_split,
                    --p_failover_aop_url      => r.failover_aop_url,
                    --p_failover_procedure    => r.failover_procedure,
                    --p_log_procedure         => r.log_procedure,
                    --p_prepend_files_sql     => r.prepend_files_sql,
                    --p_append_files_sql      => r.append_files_sql,
                    --p_sub_templates_sql     => r.sub_templates_sql
                  );
      l_end := sysdate;
      
     if r.output_type ='pdf' then l_mime_type := aop_api_pkg.c_mime_type_pdf;
       elsif r.output_type ='html' then l_mime_type := aop_api_pkg.c_mime_type_html;
       elsif r.output_type ='csv' then l_mime_type := aop_api_pkg.c_mime_type_csv;
       elsif r.output_type ='pptx' then l_mime_type :=aop_api_pkg.c_mime_type_pptx;
       elsif r.output_type ='onepagepdf' then l_mime_type := aop_api_pkg.c_mime_type_pdf;
       elsif r.output_type ='xlsx' then l_mime_type := aop_api_pkg.c_mime_type_xlsx;
       elsif r.output_type ='docx' then l_mime_type := aop_api_pkg.c_mime_type_docx;
       elsif r.output_type ='md' then l_mime_type := aop_api_pkg.c_mime_type_markdown;
       elsif r.output_type ='xlsm' then l_mime_type := aop_api_pkg.c_mime_type_xlsm;
       elsif r.output_type ='ics' then l_mime_type := aop_api_pkg.c_mime_type_ics;
       elsif r.output_type ='txt' then l_mime_type := aop_api_pkg.c_mime_type_text;
       elsif r.output_type ='docm' then l_mime_type := aop_api_pkg.c_mime_type_docm;
       elsif r.output_type ='pptm' then l_mime_type := aop_api_pkg.c_mime_type_pptm;
       else l_mime_type := null;
      end if;

      update aop_automated_test
         set received_bytes = dbms_lob.getlength(l_return),
             output_blob = l_return,
             result = 'ok',
             processing_seconds = round((l_end-l_start)*60*60*24,2),
             run_date = l_start,
             mime_type = l_mime_type,
             output_filename = l_output_filename
       where id = r.id;

      apex_debug.message(p_message => ' - completed in: ' || to_char(round((l_end-l_start)*60*60*24,2)), p_level => apex_debug.c_log_level_app_trace); 

      commit;
     exception
       when others
       then
         l_end := sysdate;
         l_error := substr(SQLERRM, 1, 4000);
         apex_debug.message(p_message => ' - error: ' || l_error, p_level => apex_debug.c_log_level_app_trace); 
         --logger.log(to_char(r.id) ||':' ||l_error);
         update aop_automated_test
            set received_bytes = null,
                output_blob = null,
                result = l_error,
                processing_seconds = round((l_end-l_start)*60*60*24,2)
          where id = r.id;
          
        commit;  
     end;
  end loop;

  -- set inactive to result NA
  update aop_automated_test
    set received_bytes = null,
        output_blob = null,
        result = 'Inactive',
        processing_seconds = null
  where app_id = p_app_id
    and active = 'N'
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;
  commit;         
  apex_debug.message(p_message => 'End run_automated_tests', p_level => apex_debug.c_log_level_app_enter);
end run_automated_tests;


/**
 * @Description: Reset all automated tests in table AOP_AUTOMATED_TEST
 *
 * @Author: Dimitri Gielis
 * @Created: 9/9/2018
 *
 */
procedure reset_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null)
as
begin
  update aop_automated_test
    set received_bytes     = null,
        output_blob        = null,
        result             = null,
        processing_seconds = null,
        run_date           = null
  where app_id = p_app_id
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;
end reset_automated_tests;


/**
 * @Description: Add new and update existing automated tests in table AOP_AUTOMATED_TEST based on the entries in the AOP Sample App
 *
 * @Author: Dimitri Gielis
 * @Created: 9/9/2018
 *
 */
procedure sync_automated_tests(
  p_app_id      in number,
  p_id          in aop_automated_test.id%type default null,
  p_only_failed in varchar2 default null)
as
begin
  -- CHECK IF TEST IS STILL IN APP (set active to C)
  update AOP_AUTOMATED_TEST
    set active = 'C'
  where app_id = p_app_id
    and active = 'Y'
    and expected_bytes is null
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;  
            
  update AOP_AUTOMATED_TEST
     set active = 'Y'
   where description in (select 'A:' || a.application_id || 'P: ' || lpad(a.page_id,6,' ') || ': ' || process_name 
                          from APEX_APPLICATION_PAGE_PROC a
                          where a.application_id = p_app_id
                            and a.process_type_plugin_name = 'PLUGIN_BE.APEXRND.AOP'
                        )
    and app_id = p_app_id
    and active = 'C'
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;  

  update AOP_AUTOMATED_TEST
     set active = 'Y'
   where description in (select 'A:' || a.application_id || 'P: ' || lpad(a.page_id,6,' ') || ': ' || dynamic_action_name  
                          from APEX_APPLICATION_PAGE_DA_ACTS a
                          where a.application_id = p_app_id
                            and a.action_code = 'PLUGIN_BE.APEXRND.AOP_DA'
                        )
    and app_id = p_app_id
    and active = 'C'
    and (id = p_id or p_id is null) 
    and 1 = case 
             when p_only_failed='Y' and (result <> 'ok' or result is null) then 1 
             when p_only_failed is null then 1
            end;  

  -- DELETE NON EXISTING RECORDS
  delete 
    from aop_automated_test
   where active = 'C'; 

  -- INSERT AOP PROCESSES
  insert into AOP_AUTOMATED_TEST 
    (seq_nr, description, data_type, data_source, template_type, template_source, output_type, output_type_item_name, output_filename, output_to, special, procedure_, app_id, page_id, active, plugin_type)
  select 
      row_number() over (order by  LAST_UPDATED_ON)  as seq_nr
    , 'A:' || application_id || 'P: ' || lpad(page_id,6,' ') || ': ' || process_name as description
    , attribute_05 as data_type
    , case 
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_11
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_12
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql_sql') then attribute_12
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_01      
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_rpt')       then attribute_13
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_xml')       then attribute_01  
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_json')      then attribute_01  
      when attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_json_files') then attribute_01  
      else 'invalid data source'
      end as data_source
    --, attribute_11 as data_source_sql
    --, attribute_12 as data_source_plsql
    --, attribute_01 as data_source_url
    --, attribute_13 as data_source_static_id
    , attribute_06 as template_type
    , case 
      when attribute_06 is null                                                   then null
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_apex')      then attribute_07
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_workspace') then attribute_07
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_09
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_plsql_sql') then attribute_10
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_10
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_filename')  then attribute_07
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_07    
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_url_aop')   then attribute_07     
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_layouts')   then attribute_07     
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_aop_report')   then attribute_07     
      when attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_db_directory') then attribute_07
      else 'invalid template source'
      end as template_source
    --, attribute_07 as template_source_file	  
    --, attribute_09 as template_source_sql
    --, attribute_10 as template_source_plsql
    , attribute_04 as output_type
    , attribute_08 as output_type_item_name
    , attribute_03 as output_filename
    , attribute_14 as output_to
    , attribute_02 as special
    , attribute_15 as procedure_
    , application_id
    , page_id
    , 'Y' as active
    , 'Process' as plugin_type
    from APEX_APPLICATION_PAGE_PROC 
  where application_id = p_app_id
    and process_type_plugin_name = 'PLUGIN_BE.APEXRND.AOP'
    --and attribute_05 = 'SQL'
    --and attribute_04 <> 'apex_item' 
    and 'A:' || application_id || 'P: ' || lpad(page_id,6,' ') || ': ' || process_name not in (select description from AOP_AUTOMATED_TEST)
    and (condition_type_code <> 'NEVER' or condition_type_code is null)
  order by LAST_UPDATED_ON;

  -- INSERT AOP DYNAMIC ACTIONS
  insert into AOP_AUTOMATED_TEST 
    (seq_nr, description, data_type, data_source, template_type, template_source, output_type, output_type_item_name, output_filename, output_to, special, procedure_, app_id, page_id, init_code, active, plugin_type)
  select 
      row_number() over (order by a.LAST_UPDATED_ON)  as seq_nr
    , 'A:' || a.application_id || 'P: ' || lpad(a.page_id,6,' ') || ': ' || a.dynamic_action_name as description
    , a.attribute_05 as data_type
    , case 
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_11
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_12
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_plsql_sql') then attribute_12
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_01      
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_rpt')       then attribute_13
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_xml')       then attribute_01  
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_json')      then attribute_01  
      when a.attribute_05 = aop_api_pkg.getconstantvalue('c_source_type_json_files') then attribute_01  
      else 'invalid data source'
      end as data_source
    --, attribute_11 as data_source_sql
    --, attribute_12 as data_source_plsql
    --, attribute_01 as data_source_url
    --, attribute_13 as data_source_static_id
    , a.attribute_06 as template_type
    , case 
      when a.attribute_06 is null                                                   then null
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_apex')      then attribute_07
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_workspace') then attribute_07
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_sql')       then attribute_09
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_plsql_sql') then attribute_10
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_plsql')     then attribute_10
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_filename')  then attribute_07
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_url')       then attribute_07   
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_url_aop')   then attribute_07     
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_layouts')   then attribute_07     
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_aop_report')   then attribute_07     
      when a.attribute_06 = aop_api_pkg.getconstantvalue('c_source_type_db_directory') then attribute_07
      else 'invalid template source'
      end as template_source
    --, attribute_07 as template_source_file	  
    --, attribute_09 as template_source_sql
    --, attribute_10 as template_source_plsql
    , a.attribute_04 as output_type
    , a.attribute_08 as output_type_item_name
    , 'output_'||to_char(a.page_id)||'_'||substr(replace(a.dynamic_action_name,' ','_'),1,130) as output_filename
    , a.attribute_14 as output_to
    , a.attribute_02 as special
    , a.attribute_15 as procedure_
    , a.application_id
    , a.page_id
    , a.attribute_03 as init_code
    , 'Y' as active
    , 'DA' as plugin_type
    from APEX_APPLICATION_PAGE_DA_ACTS a, APEX_APPLICATION_PAGE_DA d
  where a.application_id = p_app_id
    and a.action_code = 'PLUGIN_BE.APEXRND.AOP_DA'
    --and attribute_05 = 'SQL'
    --and attribute_04 <> 'apex_item' 
    and 'A:' || a.application_id || 'P: ' || lpad(a.page_id,6,' ') || ': ' || a.dynamic_action_name not in (select description from AOP_AUTOMATED_TEST)
    and a.dynamic_action_id = d.dynamic_action_id
    and (d.condition_type_code <> 'NEVER' or d.condition_type_code is null)  
  order by a.LAST_UPDATED_ON;

  -- set some tests on Inactive as they are irrelevant to run
  update AOP_AUTOMATED_TEST
     set active = 'N'
   where app_id = p_app_id
     and active = 'Y'
     and expected_bytes is null
     and (id = p_id or p_id is null)
     and (lower(description) like '%invalid%' 
         or lower(description) like '%remote%'
         or lower(description) like '%web source%'
         or lower(description) like '%inline%'
         or lower(description) like '%database directory%'
         or lower(description) like '%external data source%'
         or lower(description) like '%printer%'
         or lower(description) like '%screenshots%'
         or lower(description) like '%send to%'
         or lower(description) like '%substitution%'
         );

end sync_automated_tests;

end aop_test25_pkg;
/
create or replace package aop_log25_pkg 
as

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

/* AOP Version */
c_aop_version  constant varchar2(6)   := '25.2.1';

--
-- Function: start_request
-- Purpose: When there's a call to AOP (aop_api_pkg.plsql_call_to_aop), this function logs the request (start)
--
function start_request (
  p_data_type                in varchar2,
  p_data_source              in clob,
  p_template_type            in varchar2,
  p_template_source          in clob,
  p_output_type              in varchar2,
  p_output_filename          in varchar2 default null,
  p_output_type_item_name    in varchar2 default null,
  p_output_to                in varchar2 default null,
  p_procedure                in varchar2 default null,
  p_binds                    in varchar2 default null,
  p_special                  in varchar2 default null,
  p_aop_remote_debug         in varchar2 default null,
  p_output_converter         in varchar2 default null,
  p_aop_url                  in varchar2,
  p_api_key                  in varchar2,
  p_aop_mode                 in varchar2 default null,
  p_app_id                   in number   default null,
  p_page_id                  in number   default null,
  p_user_name                in varchar2 default null,
  p_init_code                in clob     default null,
  p_output_encoding          in varchar2 default null,
  p_output_split             in varchar2 default null,
  p_output_merge             in varchar2 default null,
  p_output_even_page         in varchar2 default null,
  p_output_merge_making_even in varchar2 default null,
  p_failover_aop_url         in varchar2 default null,
  p_failover_procedure       in varchar2 default null,
  p_log_procedure            in varchar2 default null,
  p_prepend_files_sql        in clob     default null,
  p_append_files_sql         in clob     default null,
  p_compare_files_sql        in clob     default null,
  p_media_files_sql          in clob     default null,
  p_sub_templates_sql        in clob     default null,
  p_attachments_sql          in clob     default null,
  p_ref_cursor               in clob     default null,
  p_sql_array                in clob     default null,
  p_ig_selected_pks          in varchar2 default null
) return number;

--
-- Function: end_request
-- Purpose: When there's a call to AOP (aop_api20_pkg.plsql_call_to_aop), this function logs the request (end)
--
procedure end_request (
  p_aop_log_id            in number,      
  p_status                in varchar2, 
  p_aop_json              in clob,
  p_aop_error             in varchar2, 
  p_ora_sqlcode           in number, 
  p_ora_sqlerrm           in varchar2
);

end aop_log25_pkg;
/
create or replace package body aop_log25_pkg 
as
/**
 * @Description: Example of additional logging package.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */
 
/**
 * @Description: When there's a call to AOP (aop_api_pkg.plsql_call_to_aop), this function logs the request (start)
 *
 * @Author: Dimitri Gielis
 * @Created: 9/1/2018
 *
 * @Param: p_data_type As defined in aop_api_pkg
 * @Param: p_data_source As defined in aop_api_pkg
 * @Param: p_template_type As defined in aop_api_pkg
 * @Param: p_template_source As defined in aop_api_pkg
 * @Param: p_output_type As defined in aop_api_pkg
 * @Param: p_output_filename As defined in aop_api_pkg
 * @Param: p_output_type_item_name As defined in aop_api_pkg
 * @Param: p_output_to As defined in aop_api_pkg
 * @Param: p_procedure As defined in aop_api_pkg
 * @Param: p_binds a varchar2 representing the binds
 * @Param: p_special As defined in aop_api_pkg
 * @Param: p_aop_remote_debug As defined in aop_api_pkg
 * @Param: p_output_converter As defined in aop_api_pkg
 * @Param: p_aop_url As defined in aop_api_pkg
 * @Param: p_api_key As defined in aop_api_pkg
 * @Param: p_aop_mode As defined in aop_api_pkg
 * @Param: p_app_id As defined in aop_api_pkg
 * @Param: p_page_id As defined in aop_api_pkg
 * @Param: p_user_name As defined in aop_api_pkg
 * @Param: p_init_code As defined in aop_api_pkg
 * @Param: p_output_encoding As defined in aop_api_pkg
 * @Param: p_output_split As defined in aop_api_pkg
 * @Param: p_output_merge As defined in aop_api_pkg 
 * @Param: p_output_even_page As defined in aop_api_pkg 
 * @Param: p_output_merge_making_even As defined in aop_api_pkg 
 * @Param: p_failover_aop_url As defined in aop_api_pkg
 * @Param: p_failover_procedure As defined in aop_api_pkg
 * @Param: p_log_procedure As defined in aop_api_pkg 
 * @Param: p_prepend_files_sql As defined in aop_api_pkg
 * @Param: p_append_files_sql As defined in aop_api_pkg
 * @Param: p_compare_files_sql As defined in aop_api_pkg
 * @Param: p_media_files_sql As defined in aop_api_pkg
 * @Param: p_sub_templates_sql As defined in aop_api_pkg
 * @Param: p_attachments_sql As defined in aop_api_pkg
 * @Param: p_ref_cursor a clob representing the ref cursor
 * @Param: p_sql_array a clob representing the sql array
 * @Param: p_ig_selected_pks As defined in aop_api_pkg
 * @Return: the id of the log, which can be used in the end_request procedure
 */
function start_request (
  p_data_type                in varchar2,
  p_data_source              in clob,
  p_template_type            in varchar2,
  p_template_source          in clob,
  p_output_type              in varchar2,
  p_output_filename          in varchar2 default null,
  p_output_type_item_name    in varchar2 default null,
  p_output_to                in varchar2 default null,
  p_procedure                in varchar2 default null,
  p_binds                    in varchar2 default null,
  p_special                  in varchar2 default null,
  p_aop_remote_debug         in varchar2 default null,
  p_output_converter         in varchar2 default null,
  p_aop_url                  in varchar2,
  p_api_key                  in varchar2,
  p_aop_mode                 in varchar2 default null,
  p_app_id                   in number   default null,
  p_page_id                  in number   default null,
  p_user_name                in varchar2 default null,
  p_init_code                in clob     default null,
  p_output_encoding          in varchar2 default null,
  p_output_split             in varchar2 default null,
  p_output_merge             in varchar2 default null,
  p_output_even_page         in varchar2 default null,
  p_output_merge_making_even in varchar2 default null,
  p_failover_aop_url         in varchar2 default null,
  p_failover_procedure       in varchar2 default null,
  p_log_procedure            in varchar2 default null,
  p_prepend_files_sql        in clob     default null,
  p_append_files_sql         in clob     default null,
  p_compare_files_sql        in clob     default null,
  p_media_files_sql          in clob     default null,
  p_sub_templates_sql        in clob     default null,
  p_attachments_sql          in clob     default null,
  p_ref_cursor               in clob     default null,
  p_sql_array                in clob     default null,
  p_ig_selected_pks          in varchar2 default null
) return number
as
pragma autonomous_transaction;
  l_aop_log_id      aop_log.id%type;
  l_http_user_agent varchar2(200);
  l_remote_addr     varchar2(200);
begin
  if apex_application.g_user is not null 
  then 
    begin 
      l_http_user_agent := owa_util.get_cgi_env('HTTP_USER_AGENT'); 
      l_remote_addr := owa_util.get_cgi_env('REMOTE_ADDR');
    exception
    when others 
    then 
      l_http_user_agent := null;
      l_remote_addr := null;
    end;
  end if;    

  insert into aop_log (
    start_date               ,  
    p_data_type              ,
    p_data_source            ,
    p_template_type          ,
    p_template_source        ,
    p_output_type            ,
    p_output_filename        ,
    p_output_type_item_name  ,
    p_output_to              ,
    p_procedure              ,
    p_binds                  ,
    p_special                ,
    p_aop_remote_debug       ,
    p_output_converter       ,
    p_aop_url                ,
    p_api_key                ,
    p_aop_mode               ,
    p_app_id                 ,
    p_page_id                ,
    p_user_name              ,
    p_init_code              ,
    p_output_encoding        ,
    p_output_split           ,
    p_output_merge           ,
    p_output_even_page       ,
    p_output_merge_making_even,    
    p_failover_aop_url       ,
    p_failover_procedure     ,
    p_log_procedure          ,
    p_prepend_files_sql      ,
    p_append_files_sql       ,
    p_compare_files_sql      ,    
    p_media_files_sql        ,
    p_sub_templates_sql      ,
    p_attachments_sql        ,
    p_ref_cursor             ,
    p_sql_array              ,
    p_ig_selected_pks        ,
    apex_session             ,
    apex_app_id              ,
    apex_app_page_id         ,
    apex_app_user            ,
    apex_user_agent          , 
    apex_ip_address          ,
    apex_ip_address2         
  )
  values (
    sysdate                  ,    
    p_data_type              ,
    p_data_source            ,
    p_template_type          ,
    p_template_source        ,
    p_output_type            ,
    p_output_filename        ,
    p_output_type_item_name  ,
    p_output_to              ,
    p_procedure              ,
    p_binds                  ,
    p_special                ,
    p_aop_remote_debug       ,
    p_output_converter       ,
    p_aop_url                ,
    p_api_key                ,
    p_aop_mode               ,
    p_app_id                 ,
    p_page_id                ,
    p_user_name              ,
    p_init_code              ,
    p_output_encoding        ,
    p_output_split           ,
    p_output_merge           ,
    p_output_even_page       ,
    p_output_merge_making_even,
    p_failover_aop_url       ,
    p_failover_procedure     ,
    p_log_procedure          ,
    p_prepend_files_sql      ,
    p_append_files_sql       ,
    p_compare_files_sql      ,
    p_media_files_sql        ,
    p_sub_templates_sql      ,
    p_attachments_sql        ,
    p_ref_cursor             ,
    p_sql_array              ,
    p_ig_selected_pks        ,
    v('APP_SESSION')         ,
    v('APP_ID')              ,
    v('APP_PAGE_ID')         ,
    v('APP_USER')            ,
    l_http_user_agent        ,
    l_remote_addr            ,
    sys_context('USERENV', 'IP_ADDRESS')
  ) returning id into l_aop_log_id;

  commit;
  
  return l_aop_log_id;
end start_request;


/**
 * @Description: When there's a call to AOP (aop_api_pkg.plsql_call_to_aop), this function logs the request (end)
 *
 * @Author: Dimitri Gielis
 * @Created: 9/1/2018
 *
 * @Param: p_aop_log_id id which was returned by start_request
 * @Param: p_status Status
 * @Param: p_aop_json JSON generated by AOP
 * @Param: p_aop_error Error message
 * @Param: p_ora_sqlcode SQL Error Code
 * @Param: p_ora_sqlerrm SQL Error Message
 */
procedure end_request (
  p_aop_log_id            in number,  
  p_status                in varchar2, 
  p_aop_json              in clob,
  p_aop_error             in varchar2, 
  p_ora_sqlcode           in number, 
  p_ora_sqlerrm           in varchar2
)
as
pragma autonomous_transaction;
begin
  update aop_log 
     set status      = p_status              
       , aop_json    = p_aop_json           
       , aop_error   = p_aop_error           
       , ora_sqlcode = p_ora_sqlcode        
       , ora_sqlerrm = p_ora_sqlerrm 
       , end_date    = sysdate 
    where id = p_aop_log_id;

  commit;

end end_request;

end aop_log25_pkg;
/
create or replace package aop_error25_pkg
as
    --
    -- Function: apex_error_handling
    -- Purpose: Try to elegantly handle errors that occur while using the application.
    --
    function apex_error_handling (
        p_error in apex_error.t_error )
        return apex_error.t_error_result;

    --
    -- Procedure: add_error_log
    -- Purpose: logs application errors
    --
    procedure add_error_log (
        p_error               in varchar2 default  null,
        p_procedure_name      in varchar2 default  null,
        p_page_item_name      in varchar2 default  null,
        p_region_id           in varchar2 default  null,
        p_column_alias        in varchar2 default  null,
        p_row_num             in varchar2 default  null,
        p_apex_error_code     in varchar2 default  null,
        p_ora_sqlcode         in varchar2 default  null,
        p_ora_sqlerrm         in varchar2 default  null,
        p_error_backtrace     in varchar2 default  null,
        p_arg1_name           in varchar2 default  null,
        p_arg1_val            in varchar2 default  null,
        p_arg2_name           in varchar2 default  null,
        p_arg2_val            in varchar2 default  null,
        p_arg3_name           in varchar2 default  null,
        p_arg3_val            in varchar2 default  null,
        p_arg4_name           in varchar2 default  null,
        p_arg4_val            in varchar2 default  null,
        p_arg5_name           in varchar2 default  null,
        p_arg5_val            in varchar2 default  null,
        p_arg6_name           in varchar2 default  null,
        p_arg6_val            in varchar2 default  null,
        p_arg7_name           in varchar2 default  null,
        p_arg7_val            in varchar2 default  null,
        p_arg8_name           in varchar2 default  null,
        p_arg8_val            in varchar2 default  null,
        p_arg9_name           in varchar2 default  null,
        p_arg9_val            in varchar2 default  null,
        p_arg10_name          in varchar2 default  null,
        p_arg10_val           in varchar2 default  null
        );
end aop_error25_pkg;
/

create or replace package body aop_error25_pkg
as

/**
 * @Description: Error handling package used in the AOP Sample App.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */
 
    /**
     * @Description: Try to elegantly handle errors that occur while using the application.
     *
     * @Author: Dimitri Gielis
     * @Created: 9/1/2018
     *
     * @Param: p_error Error we get in APEX
     * @Return: Nicer error message
     */
    function apex_error_handling ( p_error in apex_error.t_error )
            return apex_error.t_error_result is
        l_result          apex_error.t_error_result;
        l_constraint_name varchar2(255);
        procedure add_error_log ( p_error in apex_error.t_error ) is
            pragma autonomous_transaction;
        begin
            -- Remove old errors
            --delete from aop_errors where err_time <= localtimestamp - 22;
            -- Log the error.
            insert into aop_error (
                app_id,
                app_page_id,
                app_user,
                user_agent,
                ip_address,
                ip_address2,
                message,
                page_item_name,
                region_id,
                column_alias,
                row_num,
                apex_error_code,
                ora_sqlcode,
                ora_sqlerrm,
                error_backtrace )
            select v('APP_ID'),
                v('APP_PAGE_ID'),
                v('APP_USER'),
                owa_util.get_cgi_env('HTTP_USER_AGENT'),
                owa_util.get_cgi_env('REMOTE_ADDR'),
                sys_context('USERENV', 'IP_ADDRESS'),
                substr(p_error.message,0,4000),
                p_error.page_item_name,
                p_error.region_id,
                p_error.column_alias,
                p_error.row_num,
                p_error.apex_error_code,
                p_error.ora_sqlcode,
                substr(p_error.ora_sqlerrm,0,4000),
                substr(p_error.error_backtrace,0,4000)
            from dual;
            commit;
        end add_error_log;
    begin
        l_result := apex_error.init_error_result (
                        p_error => p_error );
        -- If it is an internal error raised by APEX, like an invalid statement or
        -- code which can not be executed, the error text might contain security sensitive
        -- information. To avoid this security problem we can rewrite the error to
        -- a generic error message and log the original error message for further
        -- investigation by the help desk.
        if p_error.is_internal_error then
            -- mask all errors that are not common runtime errors (Access Denied
            -- errors raised by application / page authorization and all errors
            -- regarding session and session state)
            if not p_error.is_common_runtime_error then
                add_error_log( p_error );
                -- Change the message to the generic error message which doesn't expose
                -- any sensitive information.
                l_result.message         := 'An unexpected internal application error has occurred: ' || substr(p_error.message,0,3500);
                l_result.additional_info := null;
            end if;
        else
            -- Always show the error as inline error
            -- Note: If you have created manual tabular forms (using the package
            --       apex_item/htmldb_item in the SQL statement) you should still
            --       use "On error page" on that pages to avoid loosing entered data
            l_result.display_location := case
                                           when l_result.display_location = apex_error.c_on_error_page then apex_error.c_inline_in_notification
                                           else l_result.display_location
                                         end;
            -- If it's a constraint violation like
            --
            --   -) ORA-00001: unique constraint violated
            --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)
            --   -) ORA-02290: check constraint violated
            --   -) ORA-02291: integrity constraint violated - parent key not found
            --   -) ORA-02292: integrity constraint violated - child record found
            --
            -- we try to get a friendly error message from our constraint lookup configuration.
            -- If we don't find the constraint in our lookup table we fallback to
            -- the original ORA error message.
            if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then
                l_constraint_name := apex_error.extract_constraint_name (
                                         p_error => p_error );
                begin
                    select message
                      into l_result.message
                      from aop_error_lookup
                     where constraint_name = l_constraint_name;
                exception when no_data_found then null; -- not every constraint has to be in our lookup table
                end;
            end if;
            -- If an ORA error has been raised, for example a raise_application_error(-20xxx, '...')
            -- in a table trigger or in a PL/SQL package called by a process and we
            -- haven't found the error in our lookup table, then we just want to see
            -- the actual error text and not the full error stack with all the ORA error numbers.
            if p_error.ora_sqlcode is not null and l_result.message = p_error.message then
                l_result.message := apex_error.get_first_ora_error_text (
                                        p_error => p_error );
            end if;
            -- If no associated page item/tabular form column has been set, we can use
            -- apex_error.auto_set_associated_item to automatically guess the affected
            -- error field by examine the ORA error for constraint names or column names.
            if l_result.page_item_name is null and l_result.column_alias is null then
                apex_error.auto_set_associated_item (
                    p_error        => p_error,
                    p_error_result => l_result );
            end if;
        end if;
        return l_result;
    end apex_error_handling;


    /**
     * @Description: Logs application errors
     *
     * @Author: Dimitri Gielis
     * @Created: 9/1/2018
     *
     * @Param: p_error Error message
     * @Param: p_procedure_name Procedure
     * @Param: p_page_item_name Page Item
     * @Param: p_region_id Region
     * @Param: p_column_alias Column
     * @Param: p_row_num Row
     * @Param: p_apex_error_code APEX Error
     * @Param: p_ora_sqlcode SQL Error Code
     * @Param: p_ora_sqlerrm SQL Error Message
     * @Param: p_error_backtrace Backtrace
     * @Param: p_arg1-10_name Arguments to pass other information
     * @Param: p_arg1-10_val Values of arguments
     */
    procedure add_error_log (
        p_error               in varchar2 default  null,
        p_procedure_name      in varchar2 default  null,
        p_page_item_name      in varchar2 default  null,
        p_region_id           in varchar2 default  null,
        p_column_alias        in varchar2 default  null,
        p_row_num             in varchar2 default  null,
        p_apex_error_code     in varchar2 default  null,
        p_ora_sqlcode         in varchar2 default  null,
        p_ora_sqlerrm         in varchar2 default  null,
        p_error_backtrace     in varchar2 default  null,
        p_arg1_name           in varchar2 default  null,
        p_arg1_val            in varchar2 default  null,
        p_arg2_name           in varchar2 default  null,
        p_arg2_val            in varchar2 default  null,
        p_arg3_name           in varchar2 default  null,
        p_arg3_val            in varchar2 default  null,
        p_arg4_name           in varchar2 default  null,
        p_arg4_val            in varchar2 default  null,
        p_arg5_name           in varchar2 default  null,
        p_arg5_val            in varchar2 default  null,
        p_arg6_name           in varchar2 default  null,
        p_arg6_val            in varchar2 default  null,
        p_arg7_name           in varchar2 default  null,
        p_arg7_val            in varchar2 default  null,
        p_arg8_name           in varchar2 default  null,
        p_arg8_val            in varchar2 default  null,
        p_arg9_name           in varchar2 default  null,
        p_arg9_val            in varchar2 default  null,
        p_arg10_name          in varchar2 default  null,
        p_arg10_val           in varchar2 default  null )
    is
    begin
        -- Remove old errors
        --delete from aop_errors where err_time <= localtimestamp - 22;
        -- Log the error.
        insert into aop_error (
            app_id,
            app_page_id,
            app_user,
            user_agent,
            --
            ip_address,
            ip_address2,
            message,
            page_item_name,
            --
            region_id,
            column_alias,
            row_num,
            apex_error_code,
            --
            ora_sqlcode,
            ora_sqlerrm,
            error_backtrace,
            arg1_name,
            arg1_val,
            arg2_name,
            arg2_val,
            arg3_name,
            arg3_val,
            arg4_name,
            arg4_val,
            arg5_name,
            arg5_val,
            arg6_name,
            arg6_val,
            arg7_name,
            arg7_val,
            arg8_name,
            arg8_val,
            arg9_name,
            arg9_val,
            arg10_name,
            arg10_val )
        select v('APP_ID'),
            v('APP_PAGE_ID'),
            v('APP_USER'),
            owa_util.get_cgi_env('HTTP_USER_AGENT'),
            --
            owa_util.get_cgi_env('REMOTE_ADDR'),
            sys_context('USERENV', 'IP_ADDRESS'),
            substr(p_error,0,4000),
            substr(p_page_item_name,0,4000),
            --
            p_region_id,
            p_column_alias,
            p_row_num,
            p_apex_error_code,
            --
            p_ora_sqlcode,
            substr(p_ora_sqlerrm,1,4000),
            substr(p_error_backtrace,1,4000),
            p_arg1_name,
            p_arg1_val,
            p_arg2_name,
            p_arg2_val,
            p_arg3_name,
            p_arg3_val,
            p_arg4_name,
            p_arg4_val,
            p_arg5_name,
            p_arg5_val,
            p_arg6_name,
            p_arg6_val,
            p_arg7_name,
            p_arg7_val,
            p_arg8_name,
            p_arg8_val,
            p_arg9_name,
            p_arg9_val,
            p_arg10_name,
            p_arg10_val
        from dual;
        commit;
    end add_error_log;

    end aop_error25_pkg;
    /
create or replace synonym aop_error_pkg for aop_error25_pkg;
create or replace synonym aop_log_pkg for aop_log25_pkg;
create or replace synonym aop_sample_pkg for aop_sample25_pkg;
create or replace synonym aop_test_pkg for aop_test25_pkg;
create or replace synonym aop_settings_pkg for aop_settings25_pkg;
create or replace package aop_pdf_pkg
as


procedure save_collection(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2);

function get_sql
  return clob;
  
function create_form 
  return clob;

function create_form_sql 
  return clob;
  
function fill_in_form 
  return clob;

function display_sql_json (p_sql in clob)
  return clob;
  
end aop_pdf_pkg;
/

create or replace package body aop_pdf_pkg
as

--
--
procedure save_collection(
    p_output_blob      in blob,
    p_output_filename  in varchar2,
    p_output_mime_type in varchar2)
is
  l_collection_name VARCHAR2(100) := 'SCREEN_CAPTURE';
BEGIN
  apex_debug.message('save_collection p_output_blob: ' || dbms_lob.getlength(p_output_blob));
    
  -- check if exist
  IF NOT apex_collection.collection_exists(p_collection_name => l_collection_name) THEN
    apex_collection.create_collection(l_collection_name);
  END IF;
  -- add collection member (only if BLOB not null)
  IF dbms_lob.getlength(lob_loc => p_output_blob) IS NOT NULL THEN
    apex_collection.add_member(p_collection_name => l_collection_name,
                               p_c001            => p_output_filename, -- filename
                               p_c002            => p_output_mime_type, -- mime_type
                               p_d001            => SYSDATE, -- date created
                               p_blob001         => p_output_blob); -- BLOB img content
  END IF;
  --
end save_collection;

--
--
function get_sql
  return clob
as
  l_return clob;
begin
  l_return := q'[
    select
      'file1' as "filename", 
      cursor(
        select
          c.cust_first_name as "cust_first_name",
          c.cust_last_name as "cust_last_name",
          c.cust_city as "cust_city",
          cursor(select o.order_total as "order_total", 
                        'Order ' || rownum as "order_name",
                    cursor(select p.product_name as "product_name", 
                                  i.quantity as "quantity",
                                  i.unit_price as "unit_price", 
                                  apex_web_service.blob2clobbase64(p.product_image) as "image"
                             from aop_sample_order_items i, aop_sample_product_info p
                            where o.order_id = i.order_id
                              and i.product_id = p.product_id
                          ) "product"
                   from aop_sample_orders o
                  where c.customer_id = o.customer_id
                ) "orders"
        from aop_sample_customers c
        where customer_id = :AI_CUSTOMER_ID
      ) as "data"
    from dual
  ]';
  
  return l_return;
end get_sql;


--
--
function create_form 
  return clob
as 
  l_type   varchar2(10);
  l_logo   clob;
  l_return clob;
begin
  -- create json
  apex_json.initialize_clob_output;
  apex_json.open_array; -- [  
  apex_json.open_object;
  apex_json.write('filename', 'pdf_form');
  apex_json.open_object('data');
  
  select apex_web_service.blob2clobbase64(file_content)
    into l_logo
    from apex_application_static_files
   where application_id = v('APP_ID')
     and file_name = 'logo-apex-office.png';
     
  apex_json.write('company_logo', l_logo);

  for r in (select id, form_item, item_type, item_name, item_value, text, height, width
              from aop_pdf_form 
             where parent_id is null)
  loop
    if r.item_type = 'list'
    then
      apex_json.open_array(r.form_item); -- [

      begin
        select 'object'
          into l_type
          from aop_pdf_form
         where parent_id = r.id
           and form_item is not null
           and rownum < 2;
           
        apex_json.open_object; -- {           
      exception     
      when no_data_found
      then
        l_type := null;
      end;
      
      for s in (select form_item, item_type, item_name, item_value, text, height, width
                  from aop_pdf_form 
                 where parent_id = r.id)
      loop
        apex_json.open_object(s.form_item); -- {
        apex_json.write('type'      , s.item_type);
        apex_json.write('name'      , s.item_name);
        apex_json.write('value'     , s.item_value);
        apex_json.write('text'      , s.text);
        apex_json.write('height'    , s.height);
        apex_json.write('width'     , s.width);    
        apex_json.close_object;             -- }    
      end loop;      
      
      if l_type = 'object'
      then
        apex_json.close_object; -- }
      end if;  
      
      apex_json.close_array; -- ]

    else
      apex_json.open_object(r.form_item); -- {
      apex_json.write('type'      , r.item_type);
      apex_json.write('name'      , r.item_name);
      apex_json.write('value'     , r.item_value);
      apex_json.write('text'      , r.text);
      apex_json.write('height'    , r.height);
      apex_json.write('width'     , r.width);    
      apex_json.close_object;             -- }
    end if;  
  end loop;

  apex_json.close_object;

  apex_json.close_object;

  apex_json.close_array;
  
  l_return := apex_json.get_clob_output;
  apex_json.free_output;

  -- replace booleans
  l_return := replace(l_return, '"true"', 'true');
  l_return := replace(l_return, '"false"', 'false');  
  
  -- return
  return l_return; 
end create_form;


--
--
function create_form_sql 
  return clob
as 
  l_return clob;
begin
  l_return := q'[
    select
      'pdf_form' as "filename",
      cursor(
        select       
          cursor(select
            'checkbox' as "type",
            'Agree'    as "name",
            'false'    as "value",
            null       as "text",
            10         as "height",
            100        as "width"
          from dual) as "checkbox",
          cursor(select
            'text'       as "type",
            'First Name' as "name",
            null         as "value",
            null         as "text",
            15           as "height",
            100          as "width"
          from dual) as "first_name",
          cursor(select
            'text'       as "type",
            'Last Name'  as "name",
            null         as "value",
            null         as "text",
            15           as "height",
            100          as "width"
          from dual) as "last_name",
          cursor(select
            cursor(select
              'radio'    as "type",
              'Radio'    as "name",
              'A'        as "value",
              'Option A' as "text",
              15         as "height",
              100        as "width"
            from dual) as "a",
            cursor(select
              'radio'    as "type",
              'Radio'    as "name",
              'B'        as "value",
              'Option B' as "text",
              15         as "height",
              100        as "width"
            from dual) as "b"            
          from dual) as "radio",
          cursor(select
              'radio'         as "type",
              'Radiolist'     as "name",
              'List A'        as "value",
              'List option A' as "text",
              10              as "height",
              100             as "width"
          from dual
          union
          select
              'radio'         as "type",
              'Radiolist'     as "name",
              'List B'        as "value",
              'List option B' as "text",
              10              as "height",
              100             as "width"
          from dual
          ) "radiolist"
        from dual
      ) as "data"
    from dual
  ]';
  
  return l_return;
end create_form_sql;


--
--
function fill_in_form 
  return clob
as 
  l_cursor sys_refcursor;
  l_return clob;
begin
  apex_json.initialize_clob_output(dbms_lob.call, true, 2) ;
  open l_cursor for 
  select
    'file1' as "filename",
    cursor
    (select 
      cursor(
          select         
            'Prince'   as "First Name",
            'Charming' as "Last Name",
            'List A'   as "radiolist",
            'A'        as "radio",
            'true'     as "Agree"
            from dual
      )  as "aop_pdf_form_data"
     from dual
    ) as "data"
  from dual;
  apex_json.write(l_cursor);
  l_return := apex_json.get_clob_output;
  l_return := replace(l_return, '"true"', 'true');
  return l_return;
end fill_in_form;


--
--
function display_sql_json (p_sql in clob)
  return clob
as
  l_cursor sys_refcursor;
  l_return clob;
begin
  apex_json.initialize_clob_output(dbms_lob.call, true, 2) ;
  open l_cursor for p_sql;
  apex_json.write(l_cursor);
  l_return := apex_json.get_clob_output;
  --sys.htp.p(l_return);
  return l_return;
end display_sql_json;

end aop_pdf_pkg;
/
