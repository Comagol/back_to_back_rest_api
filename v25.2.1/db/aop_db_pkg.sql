set define off verify off feedback off

create or replace package aop_api25_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

--## CONSTANTS
 
--### AOP Version
-- The version of APEX Office Print (AOP)
c_aop_version               constant varchar2(6 char)  := '25.2.1';                               

--### AOP URLs
-- The default url for the AOP Server
c_aop_url                   constant varchar2(50 char) := 'http://api.apexofficeprint.com/';      
-- The default url for the AOP Fallback Server in case the c_aop_url would fail
c_aop_url_fallback          constant varchar2(50 char) := 'https://api-eu.apexofficeprint.com/'; 
-- The default secure url for the AOP Server
c_aop_url_secure            constant varchar2(50 char) := 'https://api.apexofficeprint.com/';     
-- The default secure url for the AOP Fallback Server
c_aop_url_secure_fallback   constant varchar2(50 char) := 'https://api-eu.apexofficeprint.com/';
-- The url for the AOP Server in the Oracle Cloud US (Ashburn)
c_aop_url_oci_us            constant varchar2(50 char) := 'https://api-us.apexofficeprint.com/';  
-- The url for the AOP Server in the Oracle Cloud EU (Frankfurt)
c_aop_url_oci_eu            constant varchar2(50 char) := 'https://api-eu.apexofficeprint.com/';  
-- The url for the AOP Server in the Oracle Cloud APAC (Hyperdad)
c_aop_url_oci_apac          constant varchar2(50 char) := 'https://api-apac.apexofficeprint.com/';

--### Available constants
--### Template and Data Type
c_source_type_apex          constant varchar2(4 char)  := 'APEX';           -- Template Type
c_source_type_workspace     constant varchar2(9 char)  := 'WORKSPACE';      -- Template Type
c_source_type_sql           constant varchar2(3 char)  := 'SQL';            -- Template and Data Type
c_source_type_plsql_sql     constant varchar2(9 char)  := 'PLSQL_SQL';      -- Template and Data Type
c_source_type_plsql         constant varchar2(5 char)  := 'PLSQL';          -- Template and Data Type
c_source_type_url           constant varchar2(3 char)  := 'URL';            -- Template and Data Type
c_source_type_url_aop       constant varchar2(7 char)  := 'URL_AOP';        -- Template Type
c_source_type_rpt           constant varchar2(6 char)  := 'IR';             -- Data Type
c_source_type_xml           constant varchar2(3 char)  := 'XML';            -- Data Type
c_source_type_json          constant varchar2(4 char)  := 'JSON';           -- Template and Data Type
c_source_type_json_files    constant varchar2(10 char) := 'JSON_FILES';     -- Data Type
c_source_type_refcursor     constant varchar2(9 char)  := 'REFCURSOR';      -- Data Type
c_source_type_sql_array     constant varchar2(9 char)  := 'SQL_ARRAY';      -- Data Type
c_source_type_filename      constant varchar2(8 char)  := 'FILENAME';       -- Template Type
c_source_type_db_directory  constant varchar2(12 char) := 'DB_DIRECTORY';   -- Template Type
c_source_type_aop_report    constant varchar2(10 char) := 'AOP_REPORT';     -- Template Type
c_source_type_apex_report   constant varchar2(11 char) := 'APEX_REPORT';    -- Template Type
c_source_type_apex_report_do constant varchar2(14 char):= 'APEX_REPORT_DO'; -- Template Type
c_source_type_layouts       constant varchar2(14 char) := 'REPORT_LAYOUTS'; -- Template Type
c_source_type_aop_template  constant varchar2(1 char)  := null;             -- Template Type
c_source_type_clob_base64   constant varchar2(11 char) := 'CLOB_BASE64';    -- Template Type
c_source_type_oci_objs      constant varchar2(8 char)  := 'OCI_OBJS';       -- Template Type
c_source_type_none          constant varchar2(4 char)  := 'NONE';           -- Template and Data Type
--### Converter
c_source_type_converter     constant varchar2(9 char)  := 'CONVERTER';
--### Mime Type
c_mime_type_docx            constant varchar2(71 char) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx            constant varchar2(65 char) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx            constant varchar2(73 char) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_doc             constant varchar2(71 char) := 'application/msword';
c_mime_type_xls             constant varchar2(71 char) := 'application/vnd.ms-excel';
c_mime_type_ppt             constant varchar2(71 char) := 'application/vnd.ms-powerpoint';
c_mime_type_odt             constant varchar2(39 char) := 'application/vnd.oasis.opendocument.text';
c_mime_type_ods             constant varchar2(46 char) := 'application/vnd.oasis.opendocument.spreadsheet';
c_mime_type_odp             constant varchar2(47 char) := 'application/vnd.oasis.opendocument.presentation';
c_mime_type_pdf             constant varchar2(15 char) := 'application/pdf';
c_mime_type_html            constant varchar2(9 char)  := 'text/html';
c_mime_type_markdown        constant varchar2(13 char) := 'text/markdown';
c_mime_type_rtf             constant varchar2(15 char) := 'application/rtf';
c_mime_type_json            constant varchar2(16 char) := 'application/json';
c_mime_type_xml             constant varchar2(15 char) := 'application/xml';
c_mime_type_text            constant varchar2(10 char) := 'text/plain';
c_mime_type_csv             constant varchar2(10 char) := 'text/csv';
c_mime_type_png             constant varchar2(9 char)  := 'image/png';
c_mime_type_jpg             constant varchar2(10 char) := 'image/jpeg';
c_mime_type_gif             constant varchar2(9 char)  := 'image/gif';
c_mime_type_bmp             constant varchar2(9 char)  := 'image/bmp';
c_mime_type_msbmp           constant varchar2(19 char) := 'image/x-windows-bmp';
c_mime_type_docm            constant varchar2(48 char) := 'application/vnd.ms-word.document.macroenabled.12';
c_mime_type_xlsm            constant varchar2(46 char) := 'application/vnd.ms-excel.sheet.macroenabled.12';
c_mime_type_pptm            constant varchar2(58 char) := 'application/vnd.ms-powerpoint.presentation.macroenabled.12';
c_mime_type_ics             constant varchar2(13 char) := 'text/calendar';
c_mime_type_ifb             constant varchar2(13 char) := 'text/calendar';
c_mime_type_eml             constant varchar2(14 char) := 'message/rfc822';
c_mime_type_msg             constant varchar2(26 char) := 'application/vnd.ms-outlook';
c_mime_type_zip             constant varchar2(26 char) := 'application/zip';
--### Calender Type
c_cal_month                 constant varchar2(19 char) := 'month';
c_cal_week                  constant varchar2(19 char) := 'week';
c_cal_day                   constant varchar2(19 char) := 'day';
c_cal_list                  constant varchar2(19 char) := 'list';
--### Output Encoding
c_output_encoding_raw       constant varchar2(3 char)  := 'raw';
c_output_encoding_base64    constant varchar2(6 char)  := 'base64';
--### Output Type
c_word_docx                 constant varchar2(4 char)  := 'docx';
c_excel_xlsx                constant varchar2(4 char)  := 'xlsx';
c_powerpoint_pptx           constant varchar2(4 char)  := 'pptx'; 
c_opendocument_odt          constant varchar2(3 char)  := 'odt';
c_opendocument_ods          constant varchar2(3 char)  := 'ods';
c_opendocument_odp          constant varchar2(3 char)  := 'odp'; 
c_word_doc                  constant varchar2(3 char)  := 'doc';
c_excel_xls                 constant varchar2(3 char)  := 'xls';
c_powerpoint_ppt            constant varchar2(3 char)  := 'ppt'; 
c_pdf_pdf                   constant varchar2(3 char)  := 'pdf'; 
c_html_html                 constant varchar2(4 char)  := 'html';
c_markdown_md               constant varchar2(2 char)  := 'md';
c_text_txt                  constant varchar2(3 char)  := 'txt'; 
c_csv_csv                   constant varchar2(3 char)  := 'csv'; 
c_word_rtf                  constant varchar2(3 char)  := 'rtf';
c_word_macro_docm           constant varchar2(4 char)  := 'docm';
c_excel_macro_xlsm          constant varchar2(4 char)  := 'xlsm';
c_powerpoint_macro_pptm     constant varchar2(4 char)  := 'pptm'; 
c_calendar_ics              constant varchar2(3 char)  := 'ics';
c_calendar_ifb              constant varchar2(3 char)  := 'ifb';
c_json_json                 constant varchar2(4 char)  := 'json';
c_xml_xml                   constant varchar2(3 char)  := 'xml';
c_email_eml                 constant varchar2(3 char)  := 'eml';  
c_email_msg                 constant varchar2(3 char)  := 'msg';  
c_zip_zip                   constant varchar2(3 char)  := 'zip';  
c_image_jpg                 constant varchar2(3 char)  := 'jpg';
c_image_jpeg                constant varchar2(4 char)  := 'jpeg';
c_image_gif                 constant varchar2(3 char)  := 'gif';
c_image_png                 constant varchar2(3 char)  := 'png';
c_image_bmp                 constant varchar2(3 char)  := 'bmp';
c_onepagepdf_pdf            constant varchar2(10 char) := 'onepagepdf';
c_count_tags                constant varchar2(10 char) := 'count_tags';
c_meta_data                 constant varchar2(9 char)  := 'meta_data';
c_get_attachments           constant varchar2(16 char) := 'get_attachments';
c_xfa_form_fields           constant varchar2(16 char) := 'xfa_form_fields';
c_form_fields               constant varchar2(11 char) := 'form_fields';
c_validate_pdf              constant varchar2(12 char) := 'validate_pdf';
c_defined_by_apex_item      constant varchar2(9 char)  := 'apex_item';
c_converter                 constant varchar2(9 char)  := 'converter';
c_aopreport                 constant varchar2(9 char)  := 'aopreport';
c_aoe                       constant varchar2(3 char)  := 'aoe';
--### Output To
c_output_return             constant varchar2(1 char)  := null;
c_output_browser            constant varchar2(7 char)  := 'BROWSER';
c_output_procedure          constant varchar2(9 char)  := 'PROCEDURE';
c_output_procedure_browser  constant varchar2(17 char) := 'PROCEDURE_BROWSER';
c_output_procedure_inline   constant varchar2(17 char) := 'PROCEDURE_INLINE';
c_output_inline             constant varchar2(14 char) := 'BROWSER_INLINE'; 
c_output_directory          constant varchar2(9 char)  := 'DIRECTORY';
c_output_db_directory       constant varchar2(12 char) := 'DB_DIRECTORY';
c_output_cloud              constant varchar2(5 char)  := 'CLOUD';
c_output_async              constant varchar2(5 char)  := 'ASYNC';
c_output_web_service        constant varchar2(12 char) := 'WEB_SERVICE';
c_apex_office_edit          constant varchar2(16 char) := 'APEX_OFFICE_EDIT';
c_pdf_region_pro            constant varchar2(14 char) := 'PDF_REGION_PRO';
--### Special
c_special_number_as_string  constant varchar2(16 char) := 'NUMBER_TO_STRING';
c_special_report_as_label   constant varchar2(16 char) := 'REPORT_AS_LABELS';
c_special_ir_filters_top    constant varchar2(14 char) := 'FILTERS_ON_TOP';
c_special_ir_highlights_top constant varchar2(17 char) := 'HIGHLIGHTS_ON_TOP';
c_special_ir_excel_header_f constant varchar2(18 char) := 'HEADER_WITH_FILTER';
c_special_ir_saved_report   constant varchar2(19 char) := 'ALWAYS_REPORT_ALIAS';
c_special_ir_repeat_header  constant varchar2(13 char) := 'REPEAT_HEADER';
c_obfuscate_data            constant varchar2(14 char) := 'OBFUSCATE_DATA';
--### Debug
c_debug_no                  constant varchar2(3 char)  := 'No';
c_debug_remote              constant varchar2(3 char)  := 'Yes';
c_debug_local               constant varchar2(5 char)  := 'Local';
c_debug_application_item    constant varchar2(9 char)  := 'APEX_ITEM';
--### Converter
c_converter_libreoffice     constant varchar2(7 char)  := 'soffice';            -- LibreOffice 
c_converter_libreoffice_sa  constant varchar2(18 char) := 'soffice-standalone'; -- LibreOffice Standalone
c_converter_msoffice        constant varchar2(11 char) := 'officetopdf';        -- MS Office (only Windows)
c_converter_custom          constant varchar2(7 char)  := 'custom';             -- Custom converter defined in the AOP Server config
--### Mode
c_mode_production           constant varchar2(15 char) := 'production';
c_mode_development          constant varchar2(15 char) := 'development';
--### Supported Languages; used for the translation of IR
c_en                        constant varchar2(5 char)  := 'en';
c_nl                        constant varchar2(5 char)  := 'nl';
c_fr                        constant varchar2(5 char)  := 'fr';
c_de                        constant varchar2(5 char)  := 'de';
--### Strings 
c_init_null                 constant varchar2(5 char)  := 'null;';
c_false                     constant varchar2(5 char)  := 'false';
c_true                      constant varchar2(4 char)  := 'true';
c_yes                       constant varchar2(3 char)  := 'Yes';
c_no                        constant varchar2(2 char)  := 'No';
c_y                         constant varchar2(1 char)  := 'Y';
c_n                         constant varchar2(1 char)  := 'N';
--### Internal Use for conditional compilation - see wwv_flow_imp.sql 
c_apex_050                  constant pls_integer := 20130101;
c_apex_051                  constant pls_integer := 20160824;
c_apex_181                  constant pls_integer := 20180404;
c_apex_182                  constant pls_integer := 20180928;
c_apex_191                  constant pls_integer := 20190331;
c_apex_192                  constant pls_integer := 20191004;
c_apex_201                  constant pls_integer := 20200331;
c_apex_202                  constant pls_integer := 20201001;
c_apex_211                  constant pls_integer := 20210415;
c_apex_212                  constant pls_integer := 20211015;
c_apex_221                  constant pls_integer := 20220412;
c_apex_222                  constant pls_integer := 20221007;
c_apex_231                  constant pls_integer := 20230428;
c_apex_232                  constant pls_integer := 20231031;
c_apex_241                  constant pls_integer := 20240531;
c_apex_242                  constant pls_integer := 20241130;


--## TYPES
type t_query is record (
    name  varchar2(30),
    query varchar2(32767),
    binds wwv_flow_plugin_util.t_bind_list);

type t_query_list is table of t_query index by pls_integer;

c_sql_array t_query_list;

--type t_bind_record is record(name varchar2(100), value varchar2(32767));
--type t_bind_table  is table of t_bind_record index by pls_integer;
c_binds wwv_flow_plugin_util.t_bind_list;

/* Variables */
--## VARIABLES

--### Logger
g_logger_enabled             boolean := true;        -- In case you use Logger (https://github.com/OraOpenSource/Logger), you can compile this package to enable Logger output:
                                                     -- SQL> ALTER PACKAGE aop_api25_pkg COMPILE PLSQL_CCFLAGS = 'logger_on:TRUE';
                                                     -- When compiled and this global variable is set to true, debug will be written to logger too
--### Call to AOP 
g_aop_url                    varchar2(200 char) := null;  -- AOP Server url
g_api_key                    varchar2(50 char)  := null;  -- AOP API Key; only needed when AOP Cloud is used (http(s)://www.apexofficeprint.com/api)
g_aop_mode                   varchar2(15 char)  := null;  -- AOP Mode can be development or production; when running in development no cloud credits are used but a watermark is printed
g_failover_aop_url           varchar2(200 char) := null;  -- AOP Server url in case of failure of AOP url
g_failover_procedure         varchar2(200 char) := null;  -- When the failover url is used, the procedure specified in this variable will be called
g_template_type              varchar2(100 char) := null;  -- Specify the template type (xlsx, docx, ...) in case the filename is not part of the template source (e.g. URL of OneDrive or Object Storage)
g_output_converter           varchar2(50 char)  := null;  -- Set the converter to go to PDF (or other format different from template) e.g. officetopdf, libreoffice or libreoffice-standalone
g_force_converter            boolean            := false;  -- Force the given converter for non Office formats (e.g. md, csv, txt, html)
g_output_locale              varchar2(50 char)  := null;  -- Available when output type is docx, pptx or pdf, sets the locale e.g. en, ne etc. 
g_output_image_resolution    varchar2(50 char)  := null;  -- When using openofficeconverter, set the resolution of the image e.g. 300dpi, 600dpi, 900dpi or 1200dpi 
g_output_jpeg_compression    varchar2(50 char)  := null;  -- When using openofficeconverter, specify the JPEG compression, percentage between 0-100
g_output_pdf_cmp_color       varchar2(500) := null; -- Color of resulting differences after comparing two PDFs
g_output_pdf_cmp_dpi         varchar2(500) := null; -- DPI of resulting differences after comparing two PDFs
g_output_pdf_cmp_threshold   varchar2(500) := null; -- Threshold to consider two pixels as different after comparing two PDFs
g_output_convert_to_pdfa     varchar2(50 char)  := null;  -- When using openofficeconverter, specify 1b or 2b which are standard PDF compliant versions, specifying any true value will convert to a PDF/A 1b compliant PDF.
g_output_ua_compliant_pdf    varchar2(50 char)  := null;  -- When using openofficeconverter, specify true to create a PDF/UA compliant PDF
g_output_correct_page_nr     boolean       := false; -- boolean to check for AOPMergePage text to replace it with the page number.
g_output_lock_form           boolean       := false; -- boolean that determines if the pdf forms should be locked/flattened.
g_lock_form_ignoring_sign    boolean       := false; -- boolean that determines to lock/flatten everything in the output PDF but not the signature fields
g_sign_certificate_field     varchar2(100 char) := '';    -- the name of the signature field to sign the output document (optional: invisible signature will be placed otherwise)
g_identify_form_fields       boolean       := false; -- boolean that fills in the name of the fields of a PDF Form in the field itself so it's easy to identify which field is at what position
g_proxy_override             varchar2(300 char) := null;  -- null=proxy defined in the application attributes
g_transfer_timeout           number(6)     := 1800;  -- default of APEX is 180
g_wallet_path                varchar2(300 char) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd                 varchar2(300 char) := null;  -- null=defined in Manage Instance > Instance Settings
g_https_host                 varchar2(300 char) := null;  -- The host name to be matched against the common name (CN) of the remote server's certificate for an HTTPS request.
g_apex_web_service_rheader_n2 varchar2(200 char) := null; -- Add a custome request header name when calling the AOP Server. This variable will set: apex_web_service.g_request_headers(2).name
g_apex_web_service_rheader_v2 varchar2(4000 char):= null; -- Add a custome request header value when calling the AOP Server. This variable will set: apex_web_service.g_request_headers(2).value
g_output_filename            varchar2(300 char) := null;  -- output
g_cloud_provider             varchar2(100 char) := null;  -- dropbox, gdrive, onedrive, aws_s3, (s)ftp
g_cloud_location             varchar2(4000 char):= null;  -- directory in dropbox, gdrive, onedrive, aws_s3 (with bucket), (s)ftp
g_cloud_access_token         varchar2(4000 char):= null;  -- access token or credentials for dropbox, gdrive, onedrive, aws_s3, (s)ftp (needs json)
g_language                   varchar2(2 char)   := c_en;  -- Language can be: en, fr, nl, de, used for the translation of filters applied etc. (translation build-in AOP)
g_app_language               varchar2(20 char)  := null;  -- Language specified in the APEX app (primary language, translated language), when left to null, apex_util.get_session_lang is being used
g_logging                    clob          := '';    -- ability to add your own logging: e.g. "request_id":"123", "request_app":"APEX", "request_user":"RND"
g_debug                      varchar2(10 char)  := null;  -- set to 'Local' when only the JSON needs to be generated, 'Remote' for remote debug
g_debug_procedure            varchar2(4000 char):= null;  -- when debug in APEX is turned on, next to the normal APEX debug, this procedure will be called
                                                     --   e.g. to write to your own debug table. The definition of the procedure needs to be the same as aop_debug
g_special                    varchar2(4000 char):= null;  -- Special settings defined in the APEX Plug-in concerning Reports (colon separated), see p_special
g_app_id                     number        := null;  -- APEX application id
g_page_id                    number        := null;  -- APEX page id
g_user_name                  varchar2(200 char) := null;  -- APEX user name (APP_USER)
g_force_create_apex_session  boolean       := false; -- Force creating a new APEX session
g_caller_program             varchar2(2)   := null;  -- Either null or DA (dynamic action)
g_data_source                clob          := null;  -- Override p_data_source  
g_ig_selected_pks            varchar2(4000):= null;  -- Override p_ig_selected_pks  

--### APEX Page Items 
g_apex_items                 varchar2(4000 char):= null;  -- colon-separated list of APEX items e.g. P1_X:P1_Y, which can be referenced in a template using {Pxx_ITEM}
                                                     -- you can only use this global variable in combination with reports (classic, IR, IG, ...).
                                                     -- When using a SQL Query, you can define the page item in your SQL query, e.g. :P1_ITEM as "P1_ITEM"
--### Layout for IR  
g_rpt_header_font_name       varchar2(50 char)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
g_rpt_header_font_size       varchar2(3 char)   := '';    -- 14
g_rpt_header_font_color      varchar2(50 char)  := '';    -- #071626
g_rpt_header_back_color      varchar2(50 char)  := '';    -- #FAFAFA
g_rpt_header_border_width    varchar2(50 char)  := '';    -- 1 ; '0' = no border
g_rpt_header_border_color    varchar2(50 char)  := '';    -- #000000
g_rpt_header_x_margin        varchar2(50 char)  := '';    -- '0'; "1pt"
g_rpt_header_y_margin        varchar2(50 char)  := '';    -- '0'; "1pt"
g_rpt_break_font_color       varchar2(50 char)  := '';    -- #071626
g_rpt_break_back_color       varchar2(50 char)  := '';    -- #FAFAFA
g_rpt_break_show_header      varchar2(1 char)   := null;  -- Show the header again after the break (Y/N)
g_rpt_data_font_name         varchar2(50 char)  := '';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163
g_rpt_data_font_size         varchar2(3 char)   := '';    -- 14
g_rpt_data_font_color        varchar2(50 char)  := '';    -- #000000
g_rpt_data_back_color        varchar2(50 char)  := '';    -- #FFFFFF
g_rpt_data_border_width      varchar2(50 char)  := '';    -- 1 ; '0' = no border
g_rpt_data_border_color      varchar2(50 char)  := '';    -- #000000
g_rpt_data_alt_row_color     varchar2(50 char)  := '';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color
g_rpt_data_x_margin        varchar2(50 char)  := '';    -- '0'; "1pt"
g_rpt_data_y_margin        varchar2(50 char)  := '';    -- '0'; "1pt"
g_rpt_group_border_color     varchar2(50 char)  := '';    -- default the same as data and header border color. 
g_rpt_group_border_width     varchar2(50 char)  := '';    -- grouping border size, default 4.
g_rpt_header_vertical_align  varchar2(50 char)  := '';    -- possible values: top, center, bottom
g_rpt_data_vertical_align    varchar2(50 char)  := '';    -- possible values: top, center, bottom
/* see also Printing attributes in Interactive Report */
g_is_component_used_yn       varchar2(1 char)   := null;  -- If you want to override the is_component_used_yn, you can specify 'Y' to always show or 'N' to never show.
g_visible_report_columns     varchar2(4000 char):= null;  -- Colon separated list of classic report, interactive report or interactive grid columns e.g. EMPNO:ENAME,
                                                     -- which will be visible regardless of authorization and condition
g_hidden_report_columns      varchar2(4000 char):= null;  -- Colon separated list of classic report, interactive report or interactive grid columns e.g. EMPNO:ENAME
                                                     -- which will be hidden regardless of authorization and condition
--### Settings for Calendar
g_cal_type                   varchar2(10 char)  := c_cal_month; -- can be month (default), week, day, list; constants can be used
g_start_date                 date          := null;  -- start date of calendar
g_end_date                   date          := null;  -- end date of calendar
g_weekdays                   varchar2(300 char) := null;  -- translation for weekdays e.g. Monday:Tuesday:Wednesday etc.
g_months                     varchar2(300 char) := null;  -- translation for months   e.g. January:February etc.  
g_color_days_sql             varchar2(4000 char):= null;  -- color the background of certain days.
                                                     --   e.g. select 1 as "id", sysdate as "date", 'FF8800' as "color" from dual
g_separate_pages             varchar2(5 char)   := 'false'; -- start calendar on new page (true) or start calendar on same page
g_alignment                  varchar2(5 char)   := 'right'; -- align text on calender: left center or right
g_title_alignment            varchar2(5 char)   := 'right'; -- align title of the calendar: left right or center
g_day_alignment              varchar2(5 char)   := 'right'; -- align days of the calendar: left right or center
g_start_of_week              varchar2(3 char)   := 'Mon';   -- start of the week day: Monday (Mon) or Sunday (Sun)
g_new_row_per_event          varchar2(5 char)   := 'false'; -- show events vertically in new row (true). Show events horizontally in new column (false). Default is false.

--### Call to URL data source
g_url_http_method            varchar2(10 char)  := 'GET';
g_url_username               varchar2(30 char) := null;
g_url_password               varchar2(300 char) := null;
g_url_schema                 varchar2(100 char) := 'Basic';
g_url_proxy_override         varchar2(300 char) := null;
g_url_transfer_timeout       number        := 180;
g_url_body                   clob          := empty_clob();
g_url_body_blob              blob          := empty_blob();
g_url_parm_name              apex_application_global.vc_arr2; --:= empty_vc_arr;
g_url_parm_value             apex_application_global.vc_arr2; --:= empty_vc_arr;
g_url_wallet_path            varchar2(300 char) := null;
g_url_wallet_pwd             varchar2(300 char) := null;
g_url_https_host             varchar2(300 char) := null;  -- parameter for apex_web_service, not used, please apply APEX patch if issues
g_url_credential_static_id   varchar2(300 char) := null;
g_url_token_url              varchar2(300 char) := null;
--### Web Source Module (APEX >= 18.1)
g_web_source_first_row       pls_integer   := null;  -- parameter for apex_exec.open_web_source_query
g_web_source_max_rows        pls_integer   := null;  -- parameter for apex_exec.open_web_source_query
g_web_source_total_row_cnt   boolean       := false; -- parameter for apex_exec.open_web_source_query
--### REST Enabled SQL (APEX >= 18.1)
g_rest_sql_auto_bind_items   boolean       := true;  -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_first_row         pls_integer   := null;  -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_max_rows          pls_integer   := null;  -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_total_row_cnt     boolean       := false; -- parameter for apex_exec.open_remote_sql_query
g_rest_sql_total_row_limit   pls_integer   := null;  -- parameter for apex_exec.open_remote_sql_query
--### Input Data
g_replace_special_symbols    varchar2(5 char)   := null;  -- Option to replace special symbols in the selected columns/keys. Replaces +, -, *, /, and  % by _.
g_override_html_expr_on_null boolean       := false; -- When HTML expressions are being used in reports, but they are null, they can be overwritten to use the report_null_values_as
--### IP Printer support
g_ip_printer_location        varchar2(300 char) := null;
g_ip_printer_version         varchar2(300 char) := '1';
g_ip_printer_requester       varchar2(300 char) := coalesce(apex_application.g_user, USER);
g_ip_printer_job_name        varchar2(300 char) := 'AOP';
g_ip_printer_return_output   varchar2(5 char)   := null; -- null or 'Yes' or 'true'
g_ip_printer_operation_attr  varchar2(4000 char):= null; -- null or as a key value pair
g_ip_printer_job_attr        varchar2(4000 char):= null; -- null or as a key value pair
--### Transformation function
g_transformation_function    varchar2(4000 char):= null; -- Transformation function used for the data manipulation by the AOP Server.
--### AOP Processing
g_pre_conversion_command     varchar2(4000 char):= null; -- The command to execute before the conversion to another file format. This command should be present on aop_config.json file.
g_pre_conversion_command_p   varchar2(4000 char):= null; -- Parameter (in JSON) before the conversion to another file format. These parameters should be present on aop_config.json file.
g_post_conversion_command    varchar2(4000 char):= null; -- The command to execute after the conversion to another file format. This command should be present on aop_config.json file.
g_post_conversion_command_p  varchar2(4000 char):= null; -- Parameter (in JSON) after the conversion to another file format. These parameters should be present on aop_config.json file.
g_post_merge_command         varchar2(4000 char):= null; -- The command to execute after the merge of files. This command should be present on aop_config.json file.
g_post_merge_command_p       varchar2(4000 char):= null; -- Parameter (in JSON) after the merge of files. These parameters should be present on aop_config.json file.
g_pipeline_name              varchar2(4000 char):= null; -- The name of the pipeline that will be executed.
g_post_process_command       varchar2(4000 char):= null; -- The command to execute. This command should be present on aop_config.json file.
g_post_process_command_p     varchar2(4000 char):= null; -- Parameter (in JSON) in the post process command. These parameters should be present on aop_config.json file.
g_post_process_return_output boolean       := true; -- Either to return the output or not. Note this output is AOP's output and not the post process command output.
g_post_process_delete_delay  number(9)     := 1500; -- AOP deletes the file provided to the command directly after executing it. This can be delayed with this option. Integer in milliseconds.
--### AOP Config
g_aop_config                 varchar2(32767):= null; -- AOP config file; anything here will overwrite or extend other attributes in the JSON. Make sure this is valid JSON.
--### Convert characterset 
g_convert                    varchar2(1 char)   := c_n;   -- set to Y (c_y) if you want to convert the JSON that is send over; necessary for Arabic support
g_convert_source_charset     varchar2(20 char)  := null;  -- default of database
g_convert_target_charset     varchar2(20 char)  := 'AL32UTF8';  
g_stop_apex_engine           varchar2(1 char)   := c_n;   -- stop the APEX engine
g_run_with_dbms_scheduler    varchar2(1 char)   := c_n;   -- Run the call in the background through a sys.dbms_scheduler job, when finished call defined procedure. 
--### Output
-- set output directory on AOP Server
-- if . is specified the files are saved in the default directory: outputfiles
g_output_directory           varchar2(200 char) := '.';   
g_return_output              boolean            := false; -- Either to return the output or not in case of output directory.
g_output_sign_certificate    varchar2(32000 char):= null; -- sign PDF with signature which is base64 encoded
g_output_sign_certificate_pwd varchar2(500 char):= null;  -- sign PDF with password
g_output_sign_certificate_fld varchar2(500 char):= null;  -- sign PDF with the given signature field name
g_output_sign_certificate_img varchar2(32767 char):= null;-- sign PDF with the given base64 encoded image as background for visible signature
g_output_sign_certificate_txt varchar2(500 char):= null;  -- sign PDF with the given text to display on the signature
g_output_sign_certificate_prp varchar2(32767 char):= null;-- sign PDF with the certificate privatekey password
g_output_split               varchar2(5 char)   := null;  -- split file: one file per page: true/false
g_output_split_by_page       number             := null;  -- split file: one file per page: 1, 2, 3, ...
g_output_split_by_string     varchar2(500 char) := null;  -- split file: by string present on the page: e.g. "Invoice No" or "Invoice No || Invoice Number"
g_output_split_after_string  boolean            := false; -- -- split file: split_by_string's default behavior is to split the pages before the page in which the string is found, and start a new pdf, use this option if you want to split the pages after the page in which the string is found 
g_output_merge               varchar2(5 char)   := null;  -- merge files into one PDF true/false
g_output_icon_font           varchar2(20 char)  := null;  -- the icon font to use for the output, Font-APEX or Font Awesome 5 (default)
g_output_even_page           varchar2(5 char)   := null;  -- PDF option to always print even pages (necessary for two-sided pages): true/false
g_output_merge_making_even   varchar2(5 char)   := null;  -- PDF option to merge making all documents even paged (necessary for two-sided pages): true/false
g_output_page_margin         varchar2(200 char) := null;  -- HTML to PDF option: margin in px, can also add top, bottom, left, right
g_output_page_orientation    varchar2(10 char)  := null;  -- HTML to PDF option: portrait (default) or landscape
g_output_page_width          varchar2(10 char)  := null;  -- HTML to PDF option: width in px, mm, cm, in. No unit means px.
g_output_page_height         varchar2(10 char)  := null;  -- HTML to PDF option: height in px, mm, cm, in. No unit means px.
g_output_page_format         varchar2(10 char)  := null;  -- HTML to PDF option: a4 (default), letter
g_output_page_number_start_at varchar2(10 char) := null;  -- Change the start of the page numbers in the template
g_output_remove_last_page    boolean       := false; -- PDF option to remove the last page; e.g. when the last page is empty
g_output_remove_comments     boolean       := false; -- Option to remove comments from the output document, works for Word, Excel, Powerpoint, PDF 
g_output_export_sheets       varchar2(500 char) := null;  -- Excel option to export specified sheets, e.g. Sheet1:Sheet3
g_output_batch_selector      varchar2(500 char) := null;  -- The hierarchy of data selector to point the data key that needs to be batch/split, e.g: orders:products 
g_output_batch_size          number        := null;   -- Number of batches to generate; refers to number of files to split into
g_output_batch_condition     varchar2(500 char)  := null;  -- Batch condition to generate batch E.g-1: category , E.g-2: unit_price > 100? "Expensive" : unit_price < 50 ? "Cheap" : "Medium"
g_output_ignore_conv_errors  boolean       := false; -- PDF option to ignore conversion errors during appending and prepending of files
g_output_modified_date       varchar2(50 char)  := null;  -- Word/Powerpoint template option to set the modified date of the file. Must be in ISO format (Example: "2022-02-07T12:55:12") or in the date time format ("YYYY-MM-DD HH:mm:ss", "YYYY-MM-DD")
g_output_created_date        varchar2(50 char)  := null;  -- Word/Powerpoint template option to set the created date of the file. Must be in ISO format (Example: "2022-02-07T12:55:12") or in the date time format ("YYYY-MM-DD HH:mm:ss", "YYYY-MM-DD")
g_output_compression         varchar2(10 char)  := null;  -- Compression algorithm: zip
g_output_compression_name    varchar2(50 char)  := null;  -- Name of the file after compression
g_output_form_fill_font      varchar2(250 char) := null;  -- The name of the font when filling in a PDF Form, The font must be installed on the system, or provided as a file on assets folder or root of aop.
g_output_attachment_text     varchar2(250 char) := null;  -- Specify the information string you want to place in the attachment retrieved from eml file (email), e.g. "Current Page: {attachmentCurrentPage} Total Pages: {attachmentTotalPage} Attachment Number : {attachmentIndex} of {attachmentFilename}"
g_output_attachment_text_pos varchar2(20 char)  := null;  -- The position of attachment text in the attachment retrieved from eml file (email), e.g. bottom-left, bottom-right, top-left, top-right or center
g_output_attachment_xml_json boolean       := false;  -- While retrieving PDF attachments, if the attachment is an xml file, convert it to json.  
g_output_insert_barcode      boolean       := false; -- Insert a barcode in the PDF. This option should be provided as true while using {|barcode} tag on pdf template      


--### Async call to AOP; a URL will be returned where the file can be polled from 
g_async_status               varchar2(4000 char):= null;  -- Get the status of the async call (OK, error, false)
g_async_message              varchar2(4000 char):= null;  -- Get the status message of the async call 
g_async_url                  varchar2(4000 char):= null;  -- Get the URL where you can get the file when processing is complete

--### Call a Web Service where AOP will send the file to (POST Request)
g_web_service_url            varchar2(500 char) := null;  -- URL to be called once AOP has created the document. AOP will do a POST request and headers can be specified
g_web_service_headers        varchar2(4000 char):= null;  -- The headers for the POST request e.g. {"file_id": "F123", "access_token": "A456789"}

--### Files
g_prepend_files_sql          clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server], [read_password] from my_table
g_append_files_sql           clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server], [read_password] from my_table
g_compare_files_sql          clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server], [read_password] from my_table
g_media_files_sql            clob          := null;  --  
g_output_prepend_per_page    boolean       := false; -- Prepend one or more pages before each page in the output. E.g. logo and company details before every document
g_output_append_per_page     boolean       := false; -- Append one or more pages after each page in the output. E.g. terms of conditions after every invoice

--### Templates
g_template_start_delimiter   varchar2(2 char)   := null;  -- { is the default start delimiter used is a template, but you can set this variable with the following options: {, {{, <, <<
g_template_end_delimiter     varchar2(2 char)   := null;  -- } is the default end delimiter used in a template, but you can set this variable with the following options: }, }}, >, >>
g_cache_template             boolean       := false; -- cache the template; an hash is returned in g_template_cache_hash
g_template_cache_hash        varchar2(128 char) := null;  -- the hashed value of the cached version of the template on the AOP Server/Cloud
g_use_template_when_no_cache varchar2(1 char)   := c_n;   -- by default when a template hash is sent and it's no longer available it will raise an error.
                                                     -- when set to Y(es), AOP will first check if the template is still available and if not include the full template when available.

--### Sub-Templates
g_sub_templates_sql          clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server, name] from my_table

--### Attachments
g_attachments_sql       clob          := null;  -- format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server, name] from my_table

--### Password protected PDF
g_output_read_password       varchar2(200 char) := null; -- protect PDF to read / provide the password for Office Documents
g_output_modify_password     varchar2(200 char) := null; -- protect PDF to write (modify)
g_output_pwd_protection_flag number(4)     := null; -- optional; default is 4. 
                                                    -- Number when bit calculation is done as specified in http://pdfhummus.com/post/147451287581/hummus-1058-and-pdf-writer-updates-encryption
g_output_pdf_producer        varchar2(4000):= null; -- PDF meta-data set producer data tag
g_output_watermark           varchar2(4000):= null; -- Watermark in PDF
g_output_watermark_color     varchar2(500) := null; -- Watermark option color
g_output_watermark_font      varchar2(500) := null; -- Watermark option font
g_output_watermark_size      varchar2(500) := null; -- Watermark option width
g_output_watermark_opacity   varchar2(500) := null; -- Watermark option opacity
g_output_watermark_rotation  varchar2(500) := null; -- Watermark option rotation
g_output_copies              number        := null; -- Requires output pdf, repeats the output pdf for the given number of times.
g_output_compress_pdf        boolean      := false; -- Compress file size of PDF true/false
g_output_comply_pdfa_level   varchar2(10 char)  := null;  -- Comply to PDF standard: pdfa1a, pdfa1b, pdfa2a, pdfa2b, pdfa2u, pdfa3a, pdfa3b, pdfa3u
g_output_validate_pdfa_level varchar2(10 char)  := null;  -- Validate to PDF standard: pdfa1a, pdfa1b, pdfa2a, pdfa2b, pdfa2u, pdfa3a, pdfa3b, pdfa3u

--### IG
g_ig_force_query             varchar2(1 char)   := null; -- force the IG to use AOPs own implementation instead of apex_region.open_query_context
g_ig_use_alternative_label   varchar2(1 char)   := null; -- force the IG to use the alternative label for the heading

--### JSON
g_anonymize_json             varchar2(1 char)   := c_n;   -- set to Y (c_y) if you want to anomyze/obfuscate the JSON that is send over. This is great for debugging of sensitive data.
g_use_data_export_pjson      varchar2(1 char)   := c_n;   -- instead of using the AOP specific code to generate the meta-data of reports, use apex_data_export.c_format_pjson

--### CSV
g_output_text_delimiter      varchar2(200 char) := null;  -- delimiter for tags
g_output_field_separator     varchar2(200 char) := null;  -- field separator, default is ,
g_output_character_set       varchar2(200 char) := null;  -- character set of CSV file 

--### Word
g_update_toc                 boolean       := false; -- Update the table of contents in Word document

--### DATA EXPORT - APEX 20.2 and higher
$if wwv_flow_api.c_current >= 20201001
$then 
g_data_export_component_id   number                         := null;
g_data_export_view_mode      varchar2(100 char)             := null;
g_data_export_max_rows       number                         := null;
g_data_export_file_name      varchar2(255 char)             := null;
g_data_export_page_size      apex_data_export.t_size        := apex_data_export.c_size_letter;
g_data_export_orientation    apex_data_export.t_orientation := apex_data_export.c_orientation_portrait;
g_data_export_data_only      boolean                        := false;
g_data_export_pdf_accessible boolean                        := false;  
$end  

--### OCI
g_oci_credential             varchar2(150 char) := null;  -- Credentials used in sys.DBMS_CLOUD (Oracle Cloud Infrastructure credentials)
g_oci_directory_name         varchar2(150 char) := null;  -- Directory name used in sys.DBMS_CLOUD 

--### Inline Region
g_inline_region_static_id    varchar2(150 char) := null;  -- Used when Output To is set to Inline Region

--### APEX Office Edit (AOE)
g_aoe_region_static_id       varchar2(150 char) := null;  -- Used when Output To is set to c_apex_office_edit 
                                                     -- Specify here the Static ID of the APEX Office Edit Plug-in region 
g_aoe_primary_key_items      varchar2(4000 char) := null; -- the primary key items defined in APEX Office Edit colon separated (will be automatically filled)
g_aoe_primary_key_values     varchar2(4000 char) := null; -- the primary key values of the records that where created by the procedure colon separated

--### PDF Region Pro
g_pdf_region_static_id       varchar2(150 char) := null;  -- Used when Output To is set to c_pdf_region_pro
                                                     -- Specify here the Static ID of the PDF Region Pro Plug-in region 
g_pdf_primary_key_items      varchar2(4000 char) := null; -- the primary key items defined in PDF Region Pro colon separated (will be automatically filled)
g_pdf_primary_key_values     varchar2(4000 char) := null; -- the primary key values of the records that where created by the procedure colon separated


--## EXCEPTIONS
/**
 * @exception 
 */


--### FUNCTIONS AND PROCEDURES   
-- ! package body contains documentation

-- debug function, will write to apex_debug_messages, logger (if enabled) and your own debug procedure
procedure aop_debug(p_message     in varchar2, 
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


-- convert clob to base64, handy for HTML templates 
function clob2base64(p_clob in clob)
return clob;

-- convert base64 to clob
function base642clob(p_base64 in clob)
return clob;

-- convert a url with for example an image to base64
function url2base64 (
  p_url in varchar2)
  return clob;

-- get the value of one of the above constants
function getconstantvalue (
  p_constant in varchar2)
  return varchar2 deterministic;

-- get the mime type of a file extention: docx, xlsx, pptx, pdf
function getmimetype (
  p_file_ext in varchar2)
  return varchar2 deterministic;

-- get the file extention of a mime type
function getfileextension (
  p_mime_type in varchar2)
  return varchar2 deterministic;  

-- get the Font Awesome / APEX icon of a mime type
function geticon (
  p_mime_type in varchar2)
  return varchar2 deterministic;  

-- convert a blob to a clob
function blob2clob(p_blob in blob)
  return clob;

-- convert a clob to a blob
function clob2blob(p_clob in clob)
  return blob;

-- convert a blob to a file in the database directory
procedure blob2file(p_blob      in blob,
                    p_directory in varchar2,
                    p_filename  in varchar2);

-- convert a file to a blob
function file2blob(p_directory in varchar2,
                   p_filename  in varchar2)
  return blob;

-- internal function to check a server-side condition
function is_component_used_yn(p_build_option_id         in number default null,
                              p_authorization_scheme_id in varchar2,
                              p_condition_type          in varchar2,
                              p_condition_expression1   in varchar2,
                              p_condition_expression2   in varchar2,
                              p_component               in varchar2 default null,
                              p_report_column           in varchar2 default null)
  return varchar2;

-- internal function to get the bind variables of a SQL statement
function get_binds (
    p_stmt in clob )
    return sys.dbms_sql.varchar2_table;

-- check template and output type compatibility
-- template and output type can be mime_type or file extension
function is_valid_output_type(p_template_type in varchar2,
                              p_output_type   in varchar2)
  return boolean;

-- check if the hash of the template cache is still valid and present on the AOP Server/Cloud
function is_valid_template_hash(p_aop_url in varchar2 default g_aop_url,
                                p_hash    in varchar2)
  return boolean;


/**
 * @Description: Call to AOP Server through API, used behind the scenes by the APEX plug-in, but a manual call can be done with PL/SQL too.
 *
 * @Author: Dimitri Gielis
 * @Created: 2016-8-2
 *
 * @Param: p_data_type Define where the data is coming from. 
 *                     Following constants exists in aop_api_pkg: c_source_type_sql, c_source_type_plsql_sql, c_source_type_plsql, c_source_type_url, c_source_type_rpt, c_source_type_refcursor, c_source_type_sql_array, c_source_type_xml, c_source_type_json, c_source_type_json_files, c_source_type_none
 * @Param: p_data_source Depending the data type, define here the source:
 *                         - c_source_type_sql: SQL statement with cursor syntax or returning JSON
 *                         - c_source_type_plsql_sql: PL/SQL function returning SQL statement with mime type and blob
 *                         - c_source_type_plsql: PL/SQL function returning JSON with the template file base64 encoded
 *                         - c_source_type_url: URL which contains the file
 *                         - c_source_type_rpt: static id(s) or region id(s) of the APEX regions
 *                         - c_source_type_refcursor: REF Cursor
 *                         - c_source_type_sql_array: Array of SQL statements
 *                         - c_source_type_xml: XML
 *                         - c_source_type_json: JSON data part
 *                         - c_source_type_json_files: JSON including files
 *                         - c_source_type_none: leave the source blank
 * @Param: p_template_type Define where the template is stored. 
 *                         Following constants exists in aop_api_pkg: c_source_type_apex, c_source_type_workspace, c_source_type_sql, c_source_type_plsql_sql, c_source_type_plsql, 
 *                                                                    c_source_type_url, c_source_type_filename, c_source_type_url_aop, c_source_type_json, c_source_type_db_directory, c_source_type_oci_objs, 
 *                                                                    c_source_type_aop_report, c_source_type_apex_report, c_source_type_aop_template, c_source_type_clob_base64, c_source_type_none
 * @Param: p_template_source Depending the template_type, define here the filename, SQL statement, PL/SQL function or URL:
 *                         - c_source_type_apex: file uploaded in APEX Static Application Files
 *                         - c_source_type_workspace: file uploaded in APEX Workspace Files
 *                         - c_source_type_sql: SQL statement returning mime type and blob
 *                         - c_source_type_plsql_sql: PL/SQL function returning SQL statement with mime type and blob
 *                         - c_source_type_plsql: PL/SQL function returning JSON with the template file base64 encoded
 *                         - c_source_type_url: URL which contains the file (will be read from DB server)
 *                         - c_source_type_url_aop: URL which contains the file (will be read from AOP server)
 *                         - c_source_type_filename: file specified in a directory on the AOP Server
 *                         - c_source_type_db_directory: file specified in a directory on the Database Server, use DIRECTORY:filename
 *                         - c_source_type_json: JSON with the template file base64 encoded 
 *                         - c_source_type_clob_base64: BLOB in CLOB base64 encoded (user apex_web_service.blob2clobbase64) 
 *                         - c_source_type_aop_template: AOP will generate a starter template
 *                         - c_source_type_aop_report: AOP will use it's own template, used to generate one or more APEX regions
 *                         - c_source_type_apex_report: APEX will generate one region (native functionality)
 *                         - c_source_type_oci_objs: Oracle Cloud Infrastructure - Object Storage
 *                         - c_source_type_none: leave the source blank
 * @Param: p_output_type Extension (pdf, xlsx, ...) or mime type (application/pdf, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, ...) of the output format. 
 *                       Following constants exists in aop_api_pkg:
 *                         - c_word_docx             
 *                         - c_excel_xlsx            
 *                         - c_powerpoint_pptx    
 *                         - c_opendocument_odt        
 *                         - c_opendocument_ods        
 *                         - c_opendocument_odp           
 *                         - c_pdf_pdf               
 *                         - c_html_html             
 *                         - c_markdown_md           
 *                         - c_text_txt              
 *                         - c_csv_csv         
 *                         - c_word_rtf              
 *                         - c_onepagepdf_pdf        
 *                         - c_count_tags
 *                         - c_meta_data
 *                         - c_get_attachments
 *                         - c_xfa_form_fields
 *                         - c_form_fields
 *                         - c_defined_by_apex_item                           
 * @Param: p_output_filename Filename of the result
 * @Param: p_output_type_item_name APEX Item holding the filename
 * @Param: p_output_to Where does the blob or file need to be sent to: 
 *                         - c_output_browser: the browser will open the file          
 *                         - c_output_inline: the output is defined for showing inline in a region
 *                         - c_output_directory: the file is stored on the AOP Server in this directory
 *                         - c_output_db_directory: the file is stored on the Database Server in this directory 
 *                         - c_output_cloud: a file is sent to the cloud (Dropbox, Amazon S3, Google Drive, Oracle Cloud) using the credentials defined in g_cloud_provider, g_cloud_location and g_cloud_access_token
 *                         - c_output_procedure: a blob will be passed to a procedure which is defined in p_procedure. 
 *                           The procedure definition needs to be: proc_name(p_output_blob in blob, p_output_filename in varchar2, p_output_mime_type in varchar2)
 *                         - c_output_procedure_browser: a blob will be passed to a procedure which is defined in p_procedure and the file is sent to the browser
 *                         - c_output_procedure_inline: a blob will be passed to a procedure which is defined in p_procedure and the file is showing inline in a region
 *                         - c_output_async: the blob will be empty and a URL will be passed to g_async_url where the file will be available to download when AOP is finished. Use the poll_async_file procedure to check and download the file.
 *                           Optionally a procedure can be defined in p_procedure with the following definition: proc_name(p_async_status in varchar2, p_async_message in varchar2, p_async_url in varchar2, p_output_filename in varchar2, p_output_mime_type in varchar2)
 *                         - c_output_web_service: AOP will call the web service (a POST Request) defined in g_web_service_url once AOP is finished producing the file. Extra headers can be added to the POST request by defining them in g_web_service_headers 
 *                         - c_apex_office_edit: a blob will be passed to a procedure which is defined in p_procedure and the file can be shown directly in APEX Office Edit (AOE), the editor that can show and edit Word, Excel, PowerPoint, PDF, and Text straight from the browser. 
 *                           The procedure definition needs to be: proc_name(p_output_blob in blob, p_output_filename in varchar2, p_output_mime_type in varchar2)
 * @Param: p_procedure Procedure that needs to be called when the file is merged
 * @Param: p_binds Bind variable for SQL or PL/SQL Source
 * @Param: p_special Special settings defined in the APEX Plug-in concerning Reports (colon separated).
 *                   Following constants can be used:
 *                        - c_special_number_as_string 
 *                        - c_special_report_as_label  
 *                        - c_special_ir_filters_top   
 *                        - c_special_ir_highlights_top
 *                        - c_special_ir_excel_header_f
 *                        - c_special_ir_saved_report  
 *                        - c_special_ir_repeat_header 
 * @Param: p_aop_remote_debug Turning debugging on will generate the JSON that is sent to the AOP Server in a file. The actual request to the AOP Server is not done. Following constants can be used:
 *                        - c_debug_remote: store the JSON in your dashboard on https://www.apexofficeprint.com
 *                        - c_debug_local: store the JSON local on your pc
 *                        - c_debug_application_item: depending the Application item AOP_DEBUG, Remote (Yes) or Local (Local) or no debugging is done
 * @Param: p_output_converter Define the PDF converter you want to use. Multiple converters can be defined in the AOP Server. e.g. officetopdf, libreoffice, libreoffice-standalone
 * @Param: p_aop_url Description: URL where the AOP Server is running. For the AOP Cloud use c_aop_url
 * @Param: p_api_key Description: API Key which can be found when you login at https://www.apexofficeprint.com
 * @Param: p_app_id APEX Application ID
 * @Param: p_page_id Page ID to call in the APEX application
 * @Param: p_user_name Username which should be used to create an APEX session
 * @Param: p_init_code Initialisation code which can be invoked in this package
 * @Param: p_output_encoding Following constants can be used: c_output_encoding_raw, c_output_encoding_base64
 * @Param: p_output_split Split PDF in multiple pages and create zip
 * @Param: p_output_split_by_page Split PDF in multiple number of pages specified and create a zip
 * @Param: p_output_split_by_string Split PDF in multiple pages by string present on the page and create a zip
 * @Param: p_output_merge Merge multiple files to one PDF
 * @Param: p_failover_aop_url: URL where the AOP Failover Server is running. For the AOP Cloud use c_aop_url_fallback
 * @Param: p_failover_procedure: Procedure which is called when the failover URL is being used, so you are warned the main AOP server has issues.
 * @Param: p_log_procedure: Procedure which can be defined to do your own extra logging.
 * @Param: p_prepend_files_sql: SQL statement which hold the files to include before the main report.
 *                              Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server, read_password] from my_table
 *                              Between [] is optional and one or more columns can be included
 * @Param: p_append_files_sql: SQL statement which hold the files to include after the main report.
 *                             Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server, read_password] from my_table
 *                             Between [] is optional and one or more columns can be included
 * @Param: p_compare_files_sql: SQL statement which hold the files to include after the main report.
 *                             Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server, read_password] from my_table
 *                             Between [] is optional and one or more columns can be included
 * @Param: p_media_files_sql: Coming soon (!); use AME API via https://www.apexmediaextension.com
 *                              Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server], 
 *                                             [media_width, media_max_width, media_height, media_max_height, media_watermark_text, media_watermark_image, media_properties, media_output_file_type]
 *                                        from my_table
 *                              Between [] is optional and one or more columns can be included
 * @Param: p_sub_templates_sql: SQL statement which hold the sub-template Word documents.
 *                             Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
 *                             Between [] is optional and one or more columns can be included 
 * @Param: p_attachments_sql: SQL statement which hold the attachments for PDF file.
 *                             Format: select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
 *                             Between [] is optional and one or more columns can be included 
 * @Param: p_ref_cursor: when data type is c_source_type_refcursor, we will read the ref cursor specified here 
 * @Param: p_sql_array:  when data type is c_source_type_sql_arrea, different SQL statements can be passed by using t_query_list
 * @Param: p_ig_selected_pks: add a json object with the regions and selected primary keys in format {"region_static_id": pk} e.g. {"customers": 1}
 * @Return: blob in defined output format containing result of merged template(s) with data and prepend and append files.
 *
 * @Example:
 *<code> 
 *declare
 *  l_binds           wwv_flow_plugin_util.t_bind_list;
 *  l_return          blob;
 *  l_output_filename varchar2(300) := 'output';
 *begin
 *  -- set the output to JSON, so we see what is being sent to the AOP Server (uncomment next line)
 *  -- aop_api_pkg.g_debug := 'Local';
 *  -- set output to own custom debug table (uncomment next line)
 *  -- aop_api_pkg.g_debug_procedure := 'aop_sample_pkg.custom_debug';
 *  --
 *  -- most minimalistic example 
 *  l_return := aop_api_pkg.plsql_call_to_aop (
 *                p_data_type       => aop_api_pkg.c_source_type_json,
 *                p_data_source     => '[{"hello":"world"}]',
 *                p_template_type   => aop_api_pkg.c_source_type_aop_template,
 *                p_output_type     => 'docx',
 *                p_output_filename => l_output_filename,
 *                p_aop_url         => 'http://localhost:8010'); 
 *  --
 *  --
 *  l_return := aop_api_pkg.plsql_call_to_aop (
 *                p_data_type       => aop_api_pkg.c_source_type_rpt,
 *                p_data_source     => 'report1',
 *                p_template_type   => null,
 *                p_template_source => '',
 *                p_output_type     => 'docx',
 *                p_output_filename => l_output_filename,
 *                p_binds           => l_binds,
 *                p_aop_url         => 'http://api.apexofficeprint.com',
 *                p_api_key         => '<your API key>', -- change the API key if you use the AOP Cloud
 *                p_app_id          => 498,              -- change to APEX app id
 *                p_page_id         => 100);             -- change to APEX page id
 *  
 *  -- write output to table (uncomment next line)
 *  -- insert into aop_output (output_blob, filename) values (l_return, l_output_filename);              
 *end;
*/
function plsql_call_to_aop(
  p_data_type                 in varchar2 default c_source_type_sql,
  p_data_source               in clob     default null,
  p_template_type             in varchar2 default c_source_type_apex,
  p_template_source           in clob     default null,
  p_output_type               in varchar2 default c_pdf_pdf,
  p_output_filename           in out nocopy varchar2,
  p_output_type_item_name     in varchar2 default null,
  p_output_to                 in varchar2 default null,
  p_procedure                 in varchar2 default null,
  p_binds                     in wwv_flow_plugin_util.t_bind_list default c_binds,
  p_special                   in varchar2 default null,
  p_aop_remote_debug          in varchar2 default c_no,
  p_output_converter          in varchar2 default null,
  p_aop_url                   in varchar2 default null,
  p_api_key                   in varchar2 default null,
  p_aop_mode                  in varchar2 default null,
  p_app_id                    in number   default null,
  p_page_id                   in number   default null,
  p_user_name                 in varchar2 default null,
  p_init_code                 in clob     default c_init_null,
  p_output_encoding           in varchar2 default c_output_encoding_raw,
  p_output_split              in varchar2 default c_false,
  p_output_merge              in varchar2 default c_false,
  p_output_even_page          in varchar2 default c_false,
  p_output_merge_making_even  in varchar2 default c_false,
  p_failover_aop_url          in varchar2 default null,
  p_failover_procedure        in varchar2 default null,
  p_log_procedure             in varchar2 default null,
  p_prepend_files_sql         in clob     default null,
  p_append_files_sql          in clob     default null,
  p_compare_files_sql         in clob     default null,
  p_media_files_sql           in clob     default null,
  p_sub_templates_sql         in clob     default null,
  p_attachments_sql           in clob     default null,
  p_ref_cursor                in sys_refcursor default null,
  p_sql_array                 in t_query_list default c_sql_array,
  p_ig_selected_pks           in varchar2 default null)
  return blob;

-- retrieve underlaying PL/SQL code of APEX Plug-in call
function show_plsql_call_plugin(
  p_process_id            in number   default null,
  p_dynamic_action_id     in number   default null,
  p_show_api_key          in varchar2 default c_no)
  return clob;

-- check to see if the AOP Server is running (function returning boolean)
function is_aop_accessible(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return boolean;

-- check to see if the AOP Server is running (procedure returning with sys.htp.p and sys.dbms_output)
procedure is_aop_accessible(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- send a sample request to the AOP Server
procedure send_aop_sample(
  p_url             in varchar2,
  p_api_key         in varchar2 default null,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- check the version of the AOP Server (function)
function get_aop_server_version(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return varchar2;

-- check the version of the AOP Server (procedure)
procedure show_aop_server_version(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- check the version of the AOP Server (function)
function get_aop_plsql_version
  return varchar2;

-- check the version of the AOP Server (procedure)
procedure show_aop_plsql_version;

-- get supported template types (function)
function get_aop_template_types(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return varchar2;

-- get supported template types (procedure)
procedure show_aop_template_types(
  p_url             in varchar2,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- get supported output types (function)
function get_aop_output_type_for_tmpl(
  p_url             in varchar2,
  p_template_type   in varchar2 default null,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null)
  return varchar2;

-- get supported output types (function)
procedure show_aop_output_type_for_tmpl(
  p_url             in varchar2,
  p_template_type   in varchar2 default null,
  p_proxy_override  in varchar2 default null,
  p_wallet_path     in varchar2 default null,
  p_wallet_pwd      in varchar2 default null);

-- async call to retrieve the file based on a URL
procedure poll_async_file (
  p_aop_url              in varchar2,
  p_proxy_override       in varchar2 default null,
  p_wallet_path          in varchar2 default null,
  p_wallet_pwd           in varchar2 default null,
  p_async_url            in varchar2,
  o_async_status         out varchar2,
  o_async_message        out varchar2,
  o_async_file           out blob);


-- APEX Plugins

-- Process Type Plugin
function f_process_aop(
  p_process in apex_plugin.t_process,
  p_plugin  in apex_plugin.t_plugin)
  return apex_plugin.t_process_exec_result;

-- Dynamic Action Plugin
function f_render_aop (
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_render_result;

function f_ajax_aop(
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_ajax_result;


-- Other Procedure

-- Create an APEX session from PL/SQL
-- p_enable_debug: Yes / No (default)
procedure create_apex_session(
  p_app_id       in apex_applications.application_id%type,
  p_user_name    in apex_workspace_sessions.user_name%type default 'ADMIN',
  p_page_id      in apex_application_pages.page_id%type default null,
  p_session_id   in apex_workspace_sessions.apex_session_id%type default null,
  p_enable_debug in varchar2 default 'No');

-- Get the current APEX Session
function get_apex_session
  return apex_workspace_sessions.apex_session_id%type;

-- Join an APEX Session
procedure join_apex_session(
  p_session_id   in apex_workspace_sessions.apex_session_id%type,
  p_app_id       in apex_applications.application_id%type default null,
  p_page_id      in apex_application_pages.page_id%type default null,
  p_enable_debug in varchar2 default 'No');

-- Drop the current APEX Session
procedure drop_apex_session(
  p_app_id     in apex_applications.application_id%type default null,
  p_session_id in apex_workspace_sessions.apex_session_id%type default null);

end aop_api25_pkg;
/
create or replace package aop_plsql25_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

/* AOP Version */
c_aop_version  constant varchar2(6)   := '25.2.1';

--
-- Pre-requisites: apex_web_service package
-- if APEX is not installed, you can use this package as your starting point
-- but you would need to change the apex_web_service calls by utl_http calls or similar
--


--
-- Change following variables for your environment
--
g_aop_url  varchar2(200) := 'http://api.apexofficeprint.com/';                  -- for https use https://api.apexofficeprint.com/
g_api_key  varchar2(200) := '';    -- change to your API key in APEX 18 or above you can use apex_app_setting.get_value('AOP_API_KEY')
g_aop_mode varchar2(15)  := null;  -- AOP Mode can be development or production; when running in development no cloud credits are used but a watermark is printed                                                    

-- Global variables
-- Call to AOP
g_proxy_override          varchar2(300) := null;  -- null=proxy defined in the application attributes
g_transfer_timeout        number(6)     := 180;   -- default is 180
g_wallet_path             varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd              varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings

-- Output parameters
--### Output
g_output_directory          varchar2(200) := '.';   -- set output directory on AOP Server, if . is specified the files are saved in the default directory: outputfiles
g_output_sign_certificate   varchar2(32000) := null;-- sign PDF with signature which is base64 encoded
g_output_split              varchar2(5)   := null;  -- split file: one file per page: true/false
g_output_merge              varchar2(5)   := null;  -- merge files into one PDF true/false
g_output_icon_font          varchar2(20)  := null;  -- the icon font to use for the output, Font-APEX or Font Awesome 5 (default)
g_output_even_page          varchar2(5)   := null;  -- PDF option to always print even pages (necessary for two-sided pages): true/false
g_output_merge_making_even  varchar2(5)   := null;  -- PDF option to merge making all documents even paged (necessary for two-sided pages): true/false
g_output_page_margin        varchar2(50)  := null;  -- HTML to PDF option: margin in px, can also add top, bottom, left, right
g_output_page_orientation   varchar2(10)  := null;  -- HTML to PDF option: portrait (default) or landscape
g_output_page_width         varchar2(10)  := null;  -- HTML to PDF option: width in px, mm, cm, in. No unit means px.
g_output_page_height        varchar2(10)  := null;  -- HTML to PDF option: height in px, mm, cm, in. No unit means px.
g_output_page_format        varchar2(10)  := null;  -- HTML to PDF option: a4 (default), letter
g_output_remove_last_page   boolean       := false; -- PDF option to remove the last page; e.g. when the last page is empty
--### PDF
g_output_read_password      varchar2(200) := null;  -- protect PDF to read
g_output_modify_password    varchar2(200) := null;  -- protect PDF to write (modify)
g_output_pwd_protection_flag number(4)    := null;  -- optional; default is 4. 
                                                    -- Number when bit calculation is done as specified in http://pdfhummus.com/post/147451287581/hummus-1058-and-pdf-writer-updates-encryption
g_output_correct_page_nr    boolean        := false;-- boolean to check for AOPMergePage text to replace it with the page number.
g_output_lock_form          boolean        := false;-- boolean that determines if the pdf forms should be locked/flattened.
g_identify_form_fields      boolean        := false;-- boolean that fills in the name of the fields of a PDF Form in the field itself so it's easy to identify which field is at what position
g_output_watermark          varchar2(4000) := null; -- Watermark in PDF
g_output_watermark_color    varchar2(500)  := null; -- Watermark option color
g_output_watermark_font     varchar2(500)  := null; -- Watermark option font
g_output_watermark_width    varchar2(500)  := null; -- Watermark option width
g_output_watermark_height   varchar2(500)  := null; -- Watermark option height
g_output_watermark_opacity  varchar2(500)  := null; -- Watermark option opacity
g_output_watermark_rotation varchar2(500)  := null; -- Watermark option rotation
g_output_copies             number         := null; -- Requires output pdf, repeats the output pdf for the given number of times.
g_output_insert_barcode     boolean        := false; -- boolean to insert barcode in PDF, default is false

--### CSV
g_output_text_delimiter     varchar2(200) := null;  -- 
g_output_field_separator    varchar2(200) := null;  -- 
g_output_character_set      varchar2(200) := null;  -- 

-- Constants
c_mime_type_docx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf         constant varchar2(100) := 'application/pdf';
c_mime_type_html        constant varchar2(9)   := 'text/html';
c_mime_type_markdown    constant varchar2(13)  := 'text/markdown';


function make_aop_request(
  p_aop_url            in varchar2 default g_aop_url,
  p_api_key            in varchar2 default g_api_key,
  p_aop_mode           in varchar2 default g_aop_mode,  
  p_json               in clob,
  p_template           in blob,
  p_template_type      in varchar2 default null,
  p_output_encoding    in varchar2 default 'raw', -- change to raw to have binary, change to base64 to have base64 encoded
  p_output_type        in varchar2 default null,
  p_output_filename    in varchar2 default 'output',
  p_aop_remote_debug   in varchar2 default 'No',
  p_output_converter   in varchar2 default '',
  p_prepend_files_json in clob default null,
  p_append_files_json  in clob default null,
  p_templates_json     in clob default null
  )
  return blob;

end aop_plsql25_pkg;
/
create or replace package aop_plsql_only_pkg
authid current_user
as

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

/* AOP Version */
c_aop_version  constant varchar2(6)   := '25.2.1';

--
-- PL/SQL only version, not needing Oracle APEX. Requests are being done by UTL_HTTP
--

--
-- Change following variables for your environment
--
g_aop_url  varchar2(200) := 'https://api.apexofficeprint.com/'; -- for http use http://api.apexofficeprint.com/
g_api_key  varchar2(200) := '';    -- change to your API key 
g_aop_mode varchar2(15)  := null;  -- AOP Mode can be development or production; when running in development no cloud credits are used but a watermark is printed                                                    

g_wallet_path varchar2(300 char) := null; -- specify for an HTTPS call
g_wallet_pwd  varchar2(300 char) := null; -- specify for an HTTPS call

g_output_converter varchar2(250) := null; 


-- Constants
c_mime_type_docx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx        constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf         constant varchar2(100) := 'application/pdf';
c_mime_type_html        constant varchar2(9)   := 'text/html';
c_mime_type_markdown    constant varchar2(13)  := 'text/markdown';


-- Helper functions
function replace_with_clob(
   p_source in clob
  ,p_search in varchar2
  ,p_replace in clob
) return clob;

function blob2clobbase64(p_blob in blob)
return clob;


/**
 * @Description: Make a call to the AOP Server and generate the correct JSON with PL/SQL.               
 *
 * @Author: Dimitri Gielis
 * @Created: 29/7/2023
 *
 * @Param: p_aop_url  URL of AOP Server
 * @Param: p_api_key  API Key in case AOP Cloud is used
 * @Param: p_aop_mode  API Key in case AOP Cloud is used
 * @Param: p_data_json  Data in JSON format
 * @Param: p_template  Template in blob format
 * @Param: p_template_type  The type of the template e.g. docx, xlsx, pptx, html, txt, md
 * @Param: p_output_type  The extension of the output e.g. pdf, if no output type is defined, the same extension as the template is used
 * @Param: p_output_filename  Filename of the result
 * @Param: p_aop_debug  Ability to do local (or remote debugging in case the AOP Cloud is used)
 * @Param: p_prepend_files_json Prepend files
 * @Param: p_append_files_json Append Files
 * @Param: p_templates_json Use Sub-templates
 * @Param: p_output_json Configure extra output parameters e.g. output_page_height, output_page_format, output_page_number_start_at, output_remove_last_page
 * @Return: Resulting file where the template and data are merged and outputted in the requested format (output type).
 * @Example: 

-- Generate an AOP Template in Word based on the data I provide
declare
  l_blob blob;
begin
  l_blob := aop_plsql_only_pkg.make_aop_request(
              p_aop_url   => 'https://api.apexofficeprint.com/',
              p_api_key   => '',
              p_data_json => q'!
                                [
                                  {
                                    "filename": "file1",
                                    "data": [
                                        {
                                          "cust_city": "St. Louis",
                                          "cust_first_name": "Albertos",
                                          "cust_last_name": "Lambert",
                                          "orders": [
                                              {
                                                "order_name": "Order 1",
                                                "order_total": 950,
                                                "product": [
                                                    {
                                                        "product_name": "Business \nShirt",
                                                        "quantity": 3,
                                                        "unit_price": 50
                                                    },
                                                    {
                                                        "product_name": "Trousers",
                                                        "quantity": 2,
                                                        "unit_price": 80
                                                    }
                                                ]
                                              }
                                          ]
                                        }
                                    ]
                                  }
                                ]              
              !',
              p_output_type => 'docx'
            );

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_blob, 'plsql_only_doc.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', sysdate);          
end;  

-- Generate PDF based on Word template
declare
  l_template blob;
  l_pdf      blob;
begin
  select template_blob
    into l_template
    from aop_template
   where id = 1;

  l_pdf := aop_plsql_only_pkg.make_aop_request(
              p_aop_url   => 'https://api.apexofficeprint.com/',
              p_api_key   => '',
              p_template_type => 'docx',
              p_template  => l_template,
              p_data_json => q'!
                                [
                                  {
                                    "filename": "file1",
                                    "data": [
                                        {
                                          "cust_city": "St. Louis",
                                          "cust_first_name": "Albertos",
                                          "cust_last_name": "Lambert"
                                        }
                                    ]
                                  }
                                ]              
              !',
              p_output_type => 'pdf'
            );

  insert into aop_output (output_blob, filename, mime_type, last_update_date)
  values (l_pdf, 'plsql_only_pdf.pdf', 'application/pdf', sysdate);          
end;  
 *
 */
function make_aop_request(
  p_aop_url            in varchar2 default g_aop_url,
  p_api_key            in varchar2 default g_api_key,
  p_aop_mode           in varchar2 default g_aop_mode,  
  p_data_json          in clob,
  p_template           in blob default null,
  p_template_type      in varchar2 default null,
  p_output_type        in varchar2 default null,
  p_output_filename    in varchar2 default 'output',
  p_aop_debug          in varchar2 default 'No',
  p_prepend_files_json in clob default null,
  p_append_files_json  in clob default null,
  p_templates_json     in clob default null,
  p_output_json        in clob default null)
  return blob;

end aop_plsql_only_pkg;
/
create or replace package aop_convert25_pkg
AUTHID CURRENT_USER
as

/* Copyright 2015-2025 - APEX RnD - United Codes
*/

-- CONSTANTS

/* AOP Version */
c_aop_version             constant varchar2(6) := '25.2.1';
c_aop_url                 constant varchar2(50) := 'http://api.apexofficeprint.com/'; -- for https use https://api.apexofficeprint.com/
-- Mime Types
c_mime_type_docx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
c_mime_type_xlsx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
c_mime_type_pptx          constant varchar2(100) := 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
c_mime_type_pdf           constant varchar2(100) := 'application/pdf';
c_mime_type_html          constant varchar2(100) := 'text/html';
c_mime_type_markdown      constant varchar2(100) := 'text/markdown';
c_mime_type_rtf           constant varchar2(100) := 'application/rtf';
c_mime_type_json          constant varchar2(100) := 'application/json';
c_mime_type_text          constant varchar2(100) := 'text/plain';
c_mime_type_zip           constant varchar2(100) := 'application/zip';
c_pdf_pdf                 constant varchar2(3)  := 'pdf'; 
-- Output
c_output_encoding_raw     constant varchar2(3) := 'raw';
c_output_encoding_base64  constant varchar2(6) := 'base64';
/* Init */
c_init_null               constant varchar2(5) := 'null;';
c_source_type_sql         constant varchar2(3) := 'SQL';

-- VARIABLES

-- Logger
g_logger_enabled          boolean := false;       -- set to true to write extra debug output to logger - see https://github.com/OraOpenSource/Logger

-- Call to AOP
g_proxy_override          varchar2(300) := null;  -- null=proxy defined in the application attributes
g_https_host              varchar2(300) := null;  -- parameter for utl_http and apex_web_service
g_transfer_timeout        number(6)     := 1800;  -- default of APEX is 180
g_wallet_path             varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_wallet_pwd              varchar2(300) := null;  -- null=defined in Manage Instance > Instance Settings
g_output_filename         varchar2(100) := null;  -- output
g_language                varchar2(2)   := 'en';  -- Language can be: en, fr, nl, de
g_logging                 clob          := '';    -- ability to add your own logging: e.g. "request_id":"123", "request_app":"APEX", "request_user":"RND"
g_debug                   varchar2(10)  := null;  -- set to 'Local' when only the JSON needs to be generated, 'Remote' for remore debug
g_debug_procedure         varchar2(4000):= null;  -- when debug in APEX is turned on, next to the normal APEX debug, this procedure will be called
   

--
-- Convert one or more files by using a SQL query with following syntax (between [] can be one or more columns)
-- select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server] from my_table
--
function convert_files(
  p_query                 in clob,
  p_output_type           in varchar2 default c_pdf_pdf,
  p_output_encoding       in varchar2 default c_output_encoding_raw,
  p_output_to             in varchar2 default null,
  p_output_filename       in out nocopy varchar2,  
  p_output_converter      in varchar2 default null,
  p_output_collection     in varchar2 default null,
  p_aop_remote_debug      in varchar2 default 'No',
  p_aop_url               in varchar2 default null,
  p_api_key               in varchar2 default null,
  p_aop_mode              in varchar2 default null,
  p_app_id                in number   default null,
  p_page_id               in number   default null,
  p_user_name             in varchar2 default null,
  p_init_code             in clob     default c_init_null,
  p_failover_aop_url      in varchar2 default null,
  p_failover_procedure    in varchar2 default null,
  p_log_procedure         in varchar2 default null,
  p_procedure             in varchar2 default null
) return blob;

--
-- Convert a blob from one format to the other
--
function convert_blob(
  p_blob                  in blob,
  p_mime_type             in varchar2 default null,
  p_output_type           in varchar2 default c_pdf_pdf,
  p_output_filename       in out nocopy varchar2,  
  p_aop_url               in varchar2 default null,
  p_api_key               in varchar2 default null,
  p_aop_mode              in varchar2 default null,
  p_failover_aop_url      in varchar2 default null,
  p_failover_procedure    in varchar2 default null,
  p_log_procedure         in varchar2 default null
) return blob;

-- APEX Plugins

-- Process Type Plugin
/*
function f_process_aop(
  p_process in apex_plugin.t_process,
  p_plugin  in apex_plugin.t_plugin)
  return apex_plugin.t_process_exec_result;
*/
-- Dynamic Action Plugin
function f_render_aop (
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_render_result;

function f_ajax_aop(
  p_dynamic_action in apex_plugin.t_dynamic_action,
  p_plugin         in apex_plugin.t_plugin)
  return apex_plugin.t_dynamic_action_ajax_result;


end aop_convert25_pkg;
/
create or replace synonym aop_api_pkg for aop_api25_pkg;
create or replace synonym aop_plsql_pkg for aop_plsql25_pkg;
create or replace synonym aop_convert_pkg for aop_convert25_pkg;
create or replace package body aop_api25_pkg wrapped 
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
77d9e 1669d
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

/
create or replace package body aop_plsql25_pkg as

/**
 * @Description: Package to show how to make a manual call with PL/SQL to the AOP Server
 *               If APEX is not installed, you can use this package as your starting point but you would need to change the apex_web_service calls by utl_http calls or similar.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */

function replace_with_clob(
   p_source in clob
  ,p_search in varchar2
  ,p_replace in clob
) return clob
as
  l_pos pls_integer;
begin
  l_pos := instr(p_source, p_search);
  if l_pos > 0 then
    return substr(p_source, 1, l_pos-1)
      || p_replace
      || substr(p_source, l_pos+length(p_search));
  end if;
  return p_source;
end replace_with_clob;


/**
 * @Description: Example how to make a manual call to the AOP Server and generate the correct JSON.               
 *
 * @Author: Dimitri Gielis
 * @Created: 9/1/2018
 *
 * @Param: p_aop_url URL of AOP Server
 * @Param: p_api_key API Key in case AOP Cloud is used
 * @Param: p_json Data in JSON format
 * @Param: p_template Template in blob format
 * @Param: p_template_type The type of the template e.g. docx, xlsx, pptx, html, txt, md
 * @Param: p_output_encoding Encoding in raw or base64
 * @Param: p_output_type The extension of the output e.g. pdf, if no output type is defined, the same extension as the template is used
 * @Param: p_output_filename Filename of the result
 * @Param: p_aop_remote_debug Ability to do remote debugging in case the AOP Cloud is used
 * @Param: p_output_converter 
 * @Param: p_prepend_files_json
 * @Param: p_append_files_json
 * @Param: p_templates_json
 * @Param: p_render_pdf_barcode Boolean to render a barcode in the PDF
 * @Return: Resulting file where the template and data are merged and outputted in the requested format (output type).
 */
function make_aop_request(
  p_aop_url            in varchar2 default g_aop_url,
  p_api_key            in varchar2 default g_api_key,
  p_aop_mode           in varchar2 default g_aop_mode,
  p_json               in clob,
  p_template           in blob,
  p_template_type      in varchar2 default null,
  p_output_encoding    in varchar2 default 'raw',  
  p_output_type        in varchar2 default null,
  p_output_filename    in varchar2 default 'output',
  p_aop_remote_debug   in varchar2 default 'No',
  p_output_converter   in varchar2 default '',
  p_prepend_files_json in clob default null,
  p_append_files_json  in clob default null,
  p_templates_json     in clob default null)
  return blob
as
  l_aop_json          clob;
  l_template_clob     clob;
  l_template_type     varchar2(10);
  l_data_json         clob;
  l_output_type       varchar2(10);
  l_blob              blob;
  l_error_description varchar2(32767);
  l_amount                   integer := dbms_lob.lobmaxsize;
  l_dest_offset              integer := 1 ;
  l_src_offset               integer := 1 ;
  l_blob_csid                integer := dbms_lob.default_csid;
  l_lang_context             integer := dbms_lob.default_lang_ctx;
  l_warning                  integer := dbms_lob.warn_inconvertible_char;
begin
  l_template_clob := apex_web_service.blob2clobbase64(p_template);
  l_template_clob := replace(l_template_clob, chr(13) || chr(10), null);
  l_template_clob := replace(l_template_clob, '"', '\u0022');

  if p_template_type is null 
  then
    if dbms_lob.instr(p_template, utl_raw.cast_to_raw('ppt/presentation'))> 0
    then
      l_template_type := 'pptx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('worksheets/'))> 0
    then
      l_template_type := 'xlsx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('word/document'))> 0
    then
      l_template_type := 'docx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('html'))> 0
    then
      l_template_type := 'html';
    else
      l_template_type := 'unknown';
    end if;
  else
      l_template_type := p_template_type;
  end if;

  if p_output_type is null
  then
    l_output_type := l_template_type;
  else
    l_output_type := p_output_type;
  end if;

  l_data_json := p_json;

  l_aop_json := '
  {
      "version": "***AOP_VERSION***",
      "api_key": "***AOP_API_KEY***",
      "mode": "***AOP_MODE***",
      "aop_remote_debug": "***AOP_REMOTE_DEBUG***",
      "template": {
        "file":"***AOP_TEMPLATE_BASE64***",
         "template_type": "***AOP_TEMPLATE_TYPE***"
      },
      "templates": 
        ***AOP_TEMPLATES_JSON***,
      "output": {
        "output_encoding": "***AOP_OUTPUT_ENCODING***",
        "output_type": "***AOP_OUTPUT_TYPE***",
        "output_converter": "***AOP_OUTPUT_CONVERTER***",
        "icon_font": "g_output_icon_font",
        "output_watermark": "g_output_watermark",
        "output_watermark_color": "g_output_watermark_color",
        "output_watermark_font": "g_output_watermark_font",
        "output_watermark_width": "g_output_watermark_width",
        "output_watermark_height": "g_output_watermark_height",
        "output_watermark_opacity": "g_output_watermark_opacity",
        "output_watermark_rotation": "g_output_watermark_rotation",
        "output_modify_password": "g_output_modify_password",  
        "output_read_password": "g_output_read_password",  
        "output_password_protection_flag": "g_output_pwd_protection_flag",  
        "output_correct_page_number": g_output_correct_page_nr,  
        "lock_form": g_output_lock_form,
        "identify_form_fields": g_identify_form_fields,
        "output_even_page": "g_output_even_page",
        "output_merge_making_even": "g_output_merge_making_even",
        "output_split": "g_output_split",
        "output_merge": "g_output_merge",
        "output_sign_certificate": "g_output_sign_certificate",
        "output_copies": "g_output_copies",
        "output_page_margin": "g_output_page_margin",
        "output_page_orientation": "g_output_page_orientation",
        "output_page_width": "g_output_page_width",
        "output_page_height": "g_output_page_height",
        "output_page_format": "g_output_page_format",
        "output_text_delimiter": "g_output_text_delimiter",
        "output_field_separator": "g_output_field_separator",
        "output_character_set": "g_output_character_set",
        "output_remove_last_page": "g_output_remove_last_page",
        "output_insert_barcode": "g_output_insert_barcode"
      },
      "files":
        ***AOP_DATA_JSON***,
      "prepend_files":
        ***AOP_PREPEND_FILES_JSON***,
      "append_files":
        ***AOP_APPEND_FILES_JSON***  
  }';

  l_aop_json := replace(l_aop_json, '***AOP_VERSION***', c_aop_version);
  l_aop_json := replace(l_aop_json, '***AOP_API_KEY***', p_api_key);
  l_aop_json := replace(l_aop_json, '***AOP_MODE***', p_aop_mode);
  l_aop_json := replace(l_aop_json, '***AOP_REMOTE_DEBUG***', p_aop_remote_debug);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_BASE64***', l_template_clob);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_TYPE***', l_template_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_ENCODING***', p_output_encoding);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_TYPE***', l_output_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_CONVERTER***', p_output_converter);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_DATA_JSON***', l_data_json);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_PREPEND_FILES_JSON***', nvl(p_prepend_files_json,'[]'));
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_APPEND_FILES_JSON***', nvl(p_append_files_json,'[]'));
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATES_JSON***', nvl(p_templates_json,'[]'));
  l_aop_json := replace(l_aop_json, 'g_output_icon_font', g_output_icon_font);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_color', g_output_watermark_color);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_font', g_output_watermark_font);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_width', g_output_watermark_width);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_height', g_output_watermark_height);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_opacity', g_output_watermark_opacity);
  l_aop_json := replace(l_aop_json, 'g_output_watermark_rotation', g_output_watermark_rotation);
  l_aop_json := replace(l_aop_json, 'g_output_watermark', g_output_watermark);
  l_aop_json := replace(l_aop_json, 'g_output_modify_password', g_output_modify_password);
  l_aop_json := replace(l_aop_json, 'g_output_read_password', g_output_read_password);
  l_aop_json := replace(l_aop_json, 'g_output_pwd_protection_flag', to_char(g_output_pwd_protection_flag));
  l_aop_json := replace(l_aop_json, 'g_output_correct_page_nr', case when g_output_correct_page_nr then 'true' else 'false' end);
  l_aop_json := replace(l_aop_json, 'g_output_lock_form', case when g_output_lock_form then 'true' else 'false' end);
  l_aop_json := replace(l_aop_json, 'g_identify_form_fields', case when g_identify_form_fields then 'true' else 'false' end);
  l_aop_json := replace(l_aop_json, 'g_output_even_page', g_output_even_page);
  l_aop_json := replace(l_aop_json, 'g_output_merge_making_even', g_output_merge_making_even);
  l_aop_json := replace(l_aop_json, 'g_output_split', g_output_split);
  l_aop_json := replace(l_aop_json, 'g_output_merge', g_output_merge);
  l_aop_json := replace(l_aop_json, 'g_output_sign_certificate', g_output_sign_certificate);
  l_aop_json := replace(l_aop_json, 'g_output_copies', to_char(g_output_copies));
  l_aop_json := replace(l_aop_json, 'g_output_page_margin', g_output_page_margin);
  l_aop_json := replace(l_aop_json, 'g_output_page_orientation', g_output_page_orientation);
  l_aop_json := replace(l_aop_json, 'g_output_page_width', g_output_page_width);
  l_aop_json := replace(l_aop_json, 'g_output_page_height', g_output_page_height);
  l_aop_json := replace(l_aop_json, 'g_output_page_format', g_output_page_format);
  l_aop_json := replace(l_aop_json, 'g_output_text_delimiter', g_output_text_delimiter);
  l_aop_json := replace(l_aop_json, 'g_output_field_separator', g_output_field_separator);
  l_aop_json := replace(l_aop_json, 'g_output_character_set', g_output_character_set);
  l_aop_json := replace(l_aop_json, '"g_output_insert_barcode"', case when g_output_insert_barcode then 'true' else 'false' end );
  l_aop_json := replace(l_aop_json, 'g_output_remove_last_page', case when g_output_remove_last_page then 'true' else 'false' end);
  l_aop_json := replace(l_aop_json, '\\n', '\n');

  --logger.log(p_text  => 'AOP JSON: ' || p_message, p_scope => 'AOP', p_extra => l_aop_json);

  if p_aop_remote_debug = 'Local'
  then 
    dbms_lob.createtemporary(l_blob, false);
    dbms_lob.converttoblob (
        dest_lob    => l_blob,
        src_clob    => l_aop_json,
        amount      => l_amount,
        dest_offset => l_dest_offset,
        src_offset  => l_src_offset,
        blob_csid   => l_blob_csid,
        lang_context=> l_lang_context,
        warning     => l_warning
    );
  else
    apex_web_service.g_request_headers.delete;
    apex_web_service.g_request_headers(1).name := 'Content-Type';
    apex_web_service.g_request_headers(1).value := 'application/json';

    begin
      l_blob := apex_web_service.make_rest_request_b(
        p_url              => p_aop_url,
        p_http_method      => 'POST',
        p_body             => l_aop_json,
        p_proxy_override   => g_proxy_override,
        p_transfer_timeout => g_transfer_timeout,
        p_wallet_path      => g_wallet_path,
        p_wallet_pwd       => g_wallet_pwd);
    exception
    when others
    then
      raise_application_error(-20001,'Issue calling AOP Service (REST call: ' || apex_web_service.g_status_code || '): ' || CHR(10) || SQLERRM);
    end;

    -- read header variable and create error message
    -- HTTP Status Codes:
    --  200 is normal
    --  500 error received
    --  503 Service Temporarily Unavailable, the AOP server is probably not running
    if apex_web_service.g_status_code = 200
    then
      l_error_description := null;
    elsif apex_web_service.g_status_code = 503
    then
      l_error_description := 'AOP Server not running.';
    elsif apex_web_service.g_status_code = 500
    then
      for l_loop in 1.. apex_web_service.g_headers.count loop
        if apex_web_service.g_headers(l_loop).name = 'error_description'
        then
          l_error_description := apex_web_service.g_headers(l_loop).value;
          -- errors returned by AOP server are base64 encoded
          l_error_description := utl_encode.text_decode(l_error_description, 'AL32UTF8', UTL_ENCODE.BASE64);
        end if;
      end loop;
    else
      l_error_description := 'Unknown error. Check AOP server logs.';
    end if;

    -- YOU CAN STORE THE L_BLOB TO A LOCAL DEBUG TABLE AS AOP SERVER RETURNS A DOCUMENT WITH MORE INFORMATION
    --

    -- check if succesfull
    if apex_web_service.g_status_code <> 200
    then
      raise_application_error(-20002,'Issue returned by AOP Service (REST call: ' || apex_web_service.g_status_code || '): ' || CHR(10) || l_error_description);
    end if;
  end if;

  -- return print
  return l_blob;

end make_aop_request;

end aop_plsql25_pkg;
/
create or replace package body aop_plsql_only_pkg as

/**
 * @Description: Package to show how to make a manual call with PL/SQL to the AOP Server
 *               If APEX is not installed, you can use this package as your starting point but you would need to change the apex_web_service calls by utl_http calls or similar.
 *
 * @Author: Dimitri Gielis
 * @Created: 12/12/2015
 */

function replace_with_clob(
   p_source in clob
  ,p_search in varchar2
  ,p_replace in clob
) return clob
as
  l_pos pls_integer;
begin
  l_pos := instr(p_source, p_search);
  if l_pos > 0 then
    return substr(p_source, 1, l_pos-1)
      || p_replace
      || substr(p_source, l_pos+length(p_search));
  end if;
  return p_source;
end replace_with_clob;


function blob2clobbase64(p_blob in blob)
return clob
as
  l_step   pls_integer := 12000;
  l_base64 clob;
begin
  for i in 0 .. trunc((dbms_lob.getlength(p_blob) - 1 )/l_step) loop
    l_base64 := l_base64 || sys.utl_raw.cast_to_varchar2(sys.utl_encode.base64_encode(dbms_lob.substr(p_blob, l_step, i * l_step + 1)));
  end loop;  

  return l_base64;
end blob2clobbase64;


--
function make_aop_request(
  p_aop_url            in varchar2 default g_aop_url,
  p_api_key            in varchar2 default g_api_key,
  p_aop_mode           in varchar2 default g_aop_mode,  
  p_data_json          in clob,
  p_template           in blob default null,
  p_template_type      in varchar2 default null,
  p_output_type        in varchar2 default null,
  p_output_filename    in varchar2 default 'output',
  p_aop_debug          in varchar2 default 'No',
  p_prepend_files_json in clob default null,
  p_append_files_json  in clob default null,
  p_templates_json     in clob default null,
  p_output_json        in clob default null)
  return blob
as
  l_aop_json          clob;
  l_template_clob     clob;
  l_template_type     varchar2(10);
  l_output_type       varchar2(10);
  l_blob              blob;
  l_error_description varchar2(32767);
  l_max_amount        integer := dbms_lob.lobmaxsize;
  l_amount            binary_integer := 8000; 
  l_dest_offset       integer := 1 ;
  l_src_offset        integer := 1 ;
  l_blob_csid         integer := dbms_lob.default_csid;
  l_lang_context      integer := dbms_lob.default_lang_ctx;
  l_warning           integer := dbms_lob.warn_inconvertible_char;
  l_req               utl_http.req;
  l_res               utl_http.resp;
  l_buffer            varchar2(32767); 
  l_raw_buf           raw(32767);
  l_step              pls_integer := 12000;
  l_head_name         varchar2(4000);
  l_head_value        varchar2(32767);
  l_output_json       clob;
  l_aop_json_length   integer;
begin
  if p_template is not null
  then
    l_template_clob := blob2clobbase64(p_template);
    l_template_clob := replace(l_template_clob, chr(13) || chr(10), null);
    l_template_clob := replace(l_template_clob, '"', '\u0022');
  end if;

  if p_template_type is not null
  then
    l_template_type := p_template_type;
  elsif p_template_type is null and p_template is not null
  then
    if dbms_lob.instr(p_template, utl_raw.cast_to_raw('ppt/presentation'))> 0
    then
      l_template_type := 'pptx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('worksheets/'))> 0
    then
      l_template_type := 'xlsx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('word/document'))> 0
    then
      l_template_type := 'docx';
    elsif dbms_lob.instr(p_template, utl_raw.cast_to_raw('html'))> 0
    then
      l_template_type := 'html';
    else
      l_template_type := 'txt';
    end if;
  else
    -- use AOP Template 
    l_template_type := '';
  end if;

  if p_output_type is null
  then
    l_output_type := l_template_type;
  else
    l_output_type := p_output_type;
  end if;

  if p_output_json is null
  then
    l_output_json := ' "output_converter": "' || g_output_converter || '" ';
  else
    l_output_json := ' "output_converter": "' || g_output_converter || '", ' || p_output_json;
  end if;

  l_aop_json := '
  {
      "version": "***AOP_VERSION***",
      "api_key": "***AOP_API_KEY***",
      "mode": "***AOP_MODE***",
      "template": {
        "file":"***AOP_TEMPLATE_BASE64***",
         "template_type": "***AOP_TEMPLATE_TYPE***"
      },
      "templates": 
        ***AOP_TEMPLATES_JSON***,
      "output": {
        "output_encoding": "raw",
        "output_type": "***AOP_OUTPUT_TYPE***",
        ***AOP_OUTPUT_JSON***        
      },
      "files":
        ***AOP_DATA_JSON***,
      "prepend_files":
        ***AOP_PREPEND_FILES_JSON***,
      "append_files":
        ***AOP_APPEND_FILES_JSON***  
  }';

  l_aop_json := replace(l_aop_json, '***AOP_VERSION***', c_aop_version);
  l_aop_json := replace(l_aop_json, '***AOP_API_KEY***', p_api_key);
  l_aop_json := replace(l_aop_json, '***AOP_MODE***', p_aop_mode);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_BASE64***', l_template_clob);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATE_TYPE***', l_template_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_TYPE***', l_output_type);
  l_aop_json := replace(l_aop_json, '***AOP_OUTPUT_JSON***', l_output_json);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_DATA_JSON***', p_data_json);
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_PREPEND_FILES_JSON***', nvl(p_prepend_files_json,'[]'));
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_APPEND_FILES_JSON***', nvl(p_append_files_json,'[]'));
  l_aop_json := replace_with_clob(l_aop_json, '***AOP_TEMPLATES_JSON***', nvl(p_templates_json,'[]'));
  l_aop_json := replace(l_aop_json, '\\n', '\n');
  dbms_lob.createtemporary(l_blob, false);
  dbms_lob.converttoblob (
        dest_lob    => l_blob,
        src_clob    => l_aop_json,
        amount      => l_max_amount,
        dest_offset => l_dest_offset,
        src_offset  => l_src_offset,
        blob_csid   => l_blob_csid,
        lang_context=> l_lang_context,
        warning     => l_warning
    );
  if p_aop_debug != 'Local'
  then 
    -- If using HTTPS, open a wallet containing the trusted root certificate.
    if g_wallet_path is not null
      -- and g_wallet_pwd is not null 
    then
      sys.utl_http.set_wallet(g_wallet_path, g_wallet_pwd);
    end if;
    
    -- Call AOP
    l_aop_json_length := sys.dbms_lob.getlength(l_blob);
    l_req := sys.utl_http.begin_request(p_aop_url, 'POST', 'HTTP/1.1');
    sys.utl_http.set_header(l_req, 'Content-Type', 'application/json'); 
    sys.utl_http.set_header(l_req, 'Content-Length', l_aop_json_length);  

    if l_aop_json_length > 0 then
        declare
            l_raw              raw(8000);
            l_amount           number := 8000;
            l_offset           number := 1;
        begin
            while (l_offset <= l_aop_json_length) loop
                sys.dbms_lob.read(l_blob, l_amount, l_offset, l_raw);
                sys.utl_http.write_raw(l_req, l_raw);
                l_offset := l_offset + l_amount;
            end loop;
        end;
    end if;


    l_res := sys.utl_http.get_response(l_req);
    -- code and header
    if l_res.status_code = utl_http.http_ok
    then
      l_error_description := null;
    elsif l_res.status_code = 503
    then
      l_error_description := 'AOP Server not running or can not be reached.';
    elsif l_res.status_code = 500
    then
      for i in 1 .. sys.utl_http.get_header_count(l_res) loop
        sys.utl_http.get_header(l_res, i, l_head_name, l_head_value);
        if l_head_name = 'error_description'
        then
          l_error_description := l_head_value;
          -- errors returned by AOP server are base64 encoded
          l_error_description := utl_encode.text_decode(l_error_description, 'AL32UTF8', utl_encode.base64);
        end if;  
      end loop;
    else
      l_error_description := 'Unknown error. Check AOP server logs.';
    end if;

    if l_error_description is not null
    then
      raise_application_error(-20002, 'Issue returned by AOP Service (REST call: ' || l_res.status_code || '): ' || CHR(10) || l_error_description);

    else
      -- body
      sys.dbms_lob.createtemporary (lob_loc => l_blob, cache => true );
      begin
        loop
          sys.utl_http.read_raw(l_res, l_raw_buf);        
          sys.dbms_lob.writeappend( l_blob, sys.utl_raw.length(l_raw_buf), l_raw_buf );
        end loop;
      exception
      when others 
      then
        null; -- end reading output
      end;    
      sys.utl_http.end_response(l_res);
    end if;

  end if;

  -- return print
  return l_blob;

end make_aop_request;

end aop_plsql_only_pkg;
/
create or replace package body aop_convert25_pkg wrapped 
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
4685 1477
+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

/
