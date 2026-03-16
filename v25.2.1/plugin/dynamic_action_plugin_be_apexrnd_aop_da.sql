prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>1306646936487727
,p_default_application_id=>135
,p_default_id_offset=>0
,p_default_owner=>'AOP'
);
end;
/
 
prompt APPLICATION 135 - APEX Office Print (AOP) - Sample App - Menu
--
-- Application Export:
--   Application:     135
--   Name:            APEX Office Print (AOP) - Sample App - Menu
--   Date and Time:   12:54 Tuesday January 6, 2026
--   Exported By:     SUNIL
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 1964743008618968609
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     199076768067146
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/be_apexrnd_aop_da
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(1964743008618968609)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.APEXRND.AOP_DA'
,p_display_name=>'UC - APEX Office Print (AOP) - DA'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#js/es6-promise.min.js',
'#PLUGIN_FILES#js/aop_da.min.js',
'#PLUGIN_FILES#js/snapdom.min.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#css/spinkit.min.css',
'#PLUGIN_FILES#css/spinkit-aop.min.css',
'#PLUGIN_FILES#css/aop.min.css'))
,p_api_version=>1
,p_render_function=>'aop_api_pkg.f_render_aop'
,p_ajax_function=>'aop_api_pkg.f_ajax_aop'
,p_standard_attributes=>'ITEM:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT:INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) is created by United Codes to facilitate exporting data and printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel, PowerPoint) or HTML, Markdown, CSV, or Text. This plugin can only be'
||' used to print to AOP and is copyrighted by APEX R&D and United Codes. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!'))
,p_version_identifier=>'25.2.1'
,p_about_url=>'https://www.apexofficeprint.com'
,p_files_version=>537
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1964759516864314505)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>1000
,p_prompt=>'AOP URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'https://api.apexofficeprint.com/'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'URL to APEX Office Print server. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://api.apexofficeprint.com/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://api.apexofficeprint.com/ or https://www.cloudofficeprint.com/aop/<br/>',
'You can also dynamically specify a url by an Application Item e.g. &AI_AOP_URL.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1851576300302349798)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>2000
,p_prompt=>'API key'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>50
,p_max_length=>50
,p_is_translatable=>false
,p_help_text=>'Enter your API key found on your account when you login at https://www.apexofficeprint.com.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1551390233711827958)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>3000
,p_prompt=>'Debug'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'No'
,p_help_text=>'By default debug is turned off.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1297638879415854531)
,p_plugin_attribute_id=>wwv_flow_api.id(1551390233711827958)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1551397700384829348)
,p_plugin_attribute_id=>wwv_flow_api.id(1551390233711827958)
,p_display_sequence=>25
,p_display_value=>'AOP Cloud (Remote)'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is available in your dashboard at https://www.apexofficeprint.com. So note that with this option your data is sent to us.',
'This makes debugging your JSON easier, checking if it''s valid, and contacting us if you need support. This option only works when you use http(s)://api.apexofficeprint.com/in your AOP settings.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(474547825654640523)
,p_plugin_attribute_id=>wwv_flow_api.id(1551390233711827958)
,p_display_sequence=>30
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set AOP debugging.<br/>',
'The application item needs to be called AOP_DEBUG and can have values: No, Yes (=Remote) or Local.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1554277620077011765)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>4000
,p_prompt=>'Converter'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'LibreOffice'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'To transform an Office document to PDF, APEX Office Print is using an external converter.',
'By default LibreOffice is used, but you can select another converter on request.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1554300053743038813)
,p_plugin_attribute_id=>wwv_flow_api.id(1554277620077011765)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1554300502904041992)
,p_plugin_attribute_id=>wwv_flow_api.id(1554277620077011765)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
,p_help_text=>'Specify the name of the custom converter defined at the AOP Server.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(743866308935806918)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>5000
,p_prompt=>'Settings package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_display_length=>80
,p_max_length=>300
,p_is_translatable=>false
,p_examples=>'aop_settings_pkg'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'When you use a different AOP server in DEV, TEST, PROD it might be easier to define the package where the settings (e.g. AOP server) is defined.<br/>',
'This makes deployments seamless and you don''t need to update the plug-in component settings manually afterwards.<br/>',
'When a package is defined, we will always read those settings, regardless what is filled in above.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(793103471925424629)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>1500
,p_prompt=>'AOP Failover URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Failover URL to APEX Office Print server incase the AOP URL fails. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://www.apexofficeprint.com/failover-api/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://www.apexofficeprint.com/failover-api/ or https://www.cloudofficeprint.com/aop/'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(819361072402450275)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>9000
,p_prompt=>'Failover procedure'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(793103471925424629)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'aop_sample_pkg.failover_procedure;'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Specify the procedure that should be called when the failover url is used.',
'The procedure can for example send an email to notify the primary AOP url is not used, but the fallback url.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(658534486411898052)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>8
,p_display_sequence=>8000
,p_prompt=>'Logging package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'see aop_log_pkg that comes with the AOP Sample app.'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If you want every request to aop_api_pkg.plsql_call_to_aop to be logged, you can specify a logging package here.<br/>',
'The logging package needs at least a function and a procedure with following definition:',
'<pre>',
'function start_request (',
'  p_data_type                in varchar2,',
'  p_data_source              in clob,',
'  p_template_type            in varchar2,',
'  p_template_source          in clob,',
'  p_output_type              in varchar2,',
'  p_output_filename          in varchar2 default null,',
'  p_output_type_item_name    in varchar2 default null,',
'  p_output_to                in varchar2 default null,',
'  p_procedure                in varchar2 default null,',
'  p_binds                    in varchar2 default null,',
'  p_special                  in varchar2 default null,',
'  p_aop_remote_debug         in varchar2 default null,',
'  p_output_converter         in varchar2 default null,',
'  p_aop_url                  in varchar2,',
'  p_api_key                  in varchar2,',
'  p_aop_mode                 in varchar2 default null,',
'  p_app_id                   in number   default null,',
'  p_page_id                  in number   default null,',
'  p_user_name                in varchar2 default null,',
'  p_init_code                in clob     default null,',
'  p_output_encoding          in varchar2 default null,',
'  p_output_split             in varchar2 default null,',
'  p_output_merge             in varchar2 default null,',
'  p_output_even_page         in varchar2 default null,',
'  p_output_merge_making_even in varchar2 default null,',
'  p_failover_aop_url         in varchar2 default null,',
'  p_failover_procedure       in varchar2 default null,',
'  p_log_procedure            in varchar2 default null,',
'  p_prepend_files_sql        in clob     default null,',
'  p_append_files_sql         in clob     default null,',
'  p_compare_files_sql        in clob     default null,',
'  p_media_files_sql          in clob     default null,',
'  p_sub_templates_sql        in clob     default null,',
'  p_attachments_sql          in clob     default null,',
'  p_ref_cursor               in clob     default null,',
'  p_sql_array                in clob     default null,',
'  p_ig_selected_pks          in varchar2 default null',
') return number;',
'',
'',
'procedure end_request (',
'  p_aop_log_id            in number,  ',
'  p_status                in varchar2, ',
'  p_aop_json              in clob,',
'  p_aop_error             in varchar2, ',
'  p_ora_sqlcode           in number, ',
'  p_ora_sqlerrm           in varchar2',
')',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(427825926767391941)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>4050
,p_prompt=>'Custom converter'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1554277620077011765)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'AOP Server config looks like this:',
'<br/>',
'<pre><code>',
'{',
'    "converters": {',
'        "abiword":{',
'            "command": "abiword --to={outputFormat} --to-name={outputFile} {inputFile}"',
'        },',
'        "other":{',
'            "command":""',
'        }',
'    }',
'}',
'</code></pre>',
'</p>',
'<p>',
'This means you can use abiword or other as the name of the custom converter.',
'</p>'))
,p_help_text=>'Specify the name of the custom converter as specified at the AOP Server e.g. abiword'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(461755294421615411)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>10
,p_display_sequence=>2500
,p_prompt=>'AOP Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Production'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Production (=null)',
'  Credits will be used.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(461755680631618090)
,p_plugin_attribute_id=>wwv_flow_api.id(461755294421615411)
,p_display_sequence=>10
,p_display_value=>'Development'
,p_return_value=>'development'
,p_help_text=>'In development mode no credits are used.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(461756514042634124)
,p_plugin_attribute_id=>wwv_flow_api.id(461755294421615411)
,p_display_sequence=>20
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set the AOP mode.<br/>',
'The application item needs to be called AOP_MODE and can have values: development, production  or null (=production).'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1964760627838339704)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>23
,p_prompt=>'Data Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'URL,XML,JSON,JSON_FILES'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select ',
'  ''file1'' as filename,  ',
'  cursor( ',
'    select',
'      c.cust_first_name, ',
'      c.cust_last_name, ',
'      c.cust_city, ',
'      cursor(select o.order_total, ''Order '' || rownum as order_name,',
'                cursor(select p.product_name, i.quantity, i.unit_price, APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as image ',
'                         from aop_sample_order_items i, aop_sample_product_info p ',
'                        where o.order_id = i.order_id ',
'                          and i.product_id = p.product_id ',
'                      ) product                 ',
'               from aop_sample_orders o ',
'              where c.customer_id = o.customer_id ',
'            ) orders ',
'    from aop_sample_customers c ',
'    where customer_id = :id ',
'  ) as data ',
'from dual ',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Specify the XML or JSON.',
'</p>',
'<p>For type URL:<br/>',
'Create (in for example ORDS) a new REST web service with a GET, source type "Query" and format "JSON".<br/>',
'Put the url in this text box, e.g. https://www.apexofficeprint.com/ords/aop/get_data/1',
'<br/><br/>',
'Here''s an example of a query which contains a parameter too:',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1423865554929101639)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>27
,p_prompt=>'Special'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SQL,PLSQL_SQL,IR'
,p_lov_type=>'STATIC'
,p_help_text=>'Specific features of APEX Office Print'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1423886651530104223)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>10
,p_display_value=>'Treat all numbers as strings'
,p_return_value=>'NUMBER_TO_STRING'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'There''s a limitation in APEX with the cursor() statement in SQL that it doesn''t remember which datatype the column is in. So when doing to_char(0.9,''990D00'') it will return 0.9 as number instead of as string ''0.90''. To resolve this, enable this check'
||'box and concatenate your number with ''!FMT!'' e.g. ''!FMT!''||to_char(35, ''990D00'') - !FMT! stands for format.',
'</p>',
'<p>',
'Alternatively if you format your number with the currency sign to_char(35,''FML990D00'') Oracle will recognise it as a string and you don''t need to use this checkbox.',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1423886960968105701)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>20
,p_display_value=>'Report as Labels'
,p_return_value=>'REPORT_AS_LABELS'
,p_help_text=>'Check this box in case you want to use the Classic or Interactive Report data source but print them as Labels (using the Mailings feature in Word).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1482001118863468217)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>30
,p_display_value=>'IR/IG: Show Filters on top'
,p_return_value=>'FILTERS_ON_TOP'
,p_help_text=>'When there''re filters applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1482025003255471931)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>40
,p_display_value=>'IR/IG: Show Highlights on top'
,p_return_value=>'HIGHLIGHTS_ON_TOP'
,p_help_text=>'When there''re highlights applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1487971735974590000)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>50
,p_display_value=>'IR/IG: Show header with filter (Excel)'
,p_return_value=>'HEADER_WITH_FILTER'
,p_help_text=>'When exporting the Interactive Report to Excel, show the header with filter option.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1492936025742472717)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>60
,p_display_value=>'IR/IG: Use Saved Report instead of Report in Session'
,p_return_value=>'ALWAYS_REPORT_ALIAS'
,p_help_text=>'When defining the Interactive Report source ir1|my_saved_report, the "my_saved_report" will be used, even when the person is looking at a different report in his session session.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(767484330795916684)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>70
,p_display_value=>'IR/IG: Repeat header on every page'
,p_return_value=>'REPEAT_HEADER'
,p_help_text=>'When the table spans multiple pages, the header row will be repeated on every page.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(266473618103693853)
,p_plugin_attribute_id=>wwv_flow_api.id(1423865554929101639)
,p_display_sequence=>80
,p_display_value=>'Obfuscate data'
,p_return_value=>'OBFUSCATE_DATA'
,p_help_text=>'Obfuscate data, so it''s easy to send examples to others.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1294271948356129159)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Init PL/SQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'aop_api_pkg.g_output_filename         := ''output'';',
'aop_api_pkg.g_output_filename         := v(''P1_FILENAME'');',
'aop_api_pkg.g_output_remove_last_page := true;',
'aop_api_pkg.g_rpt_header_font_size    := ''12'';',
'aop_api_pkg.g_prepend_files_sql       := q''[select filename, mime_type, template_blob as file_blob from aop_template where filename like ''PREPEND%'' order by filename]'';',
'aop_api_pkg.g_append_files_sql        := q''[select filename, mime_type, template_blob as file_blob from aop_template where filename like ''APPEND%'' order by filename]'';',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'You can define global variables of the aop_api_pkg in this area.<br/>',
'</p>',
'For a list of available global variables, see the spec of aop_api_pkg:',
'<pre>',
'-- Global variables ',
'g_output_filename         varchar2(100) := null;',
'g_language                varchar2(2)   := ''en'';  -- Language can be: en, fr, nl, de',
'g_debug                   varchar2(10)  := null;  -- set to ''Local'' when only the JSON needs to be generated, ''Remote'' for remote debug',
'g_output_remove_last_page boolean       := false; -- PDF option to remove the last page; e.g. when the last page is empty',
'',
'-- Interactive Report',
'g_rpt_header_font_name    varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_header_font_size    varchar2(3)   := '''';    -- 14',
'g_rpt_header_font_color   varchar2(50)  := '''';    -- #071626',
'g_rpt_header_back_color   varchar2(50)  := '''';    -- #FAFAFA',
'g_rpt_header_border_width varchar2(50)  := '''';    -- 1 ; ''0'' = no border',
'g_rpt_header_border_color varchar2(50)  := '''';    -- #000000',
'g_rpt_data_font_name      varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_data_font_size      varchar2(3)   := '''';    -- 14',
'g_rpt_data_font_color     varchar2(50)  := '''';    -- #000000',
'g_rpt_data_back_color     varchar2(50)  := '''';    -- #FFFFFF',
'g_rpt_data_border_width   varchar2(50)  := '''';    -- 1 ; ''0'' = no border ',
'g_rpt_data_border_color   varchar2(50)  := '''';    -- #000000',
'g_rpt_data_alt_row_color  varchar2(50)  := '''';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color',
'',
'-- APEX Page Items ',
'g_apex_items              varchar2(4000):= null;  -- colon-separated list of APEX items e.g. P1_X:P1_Y, which can be referenced in a template using {Pxx_ITEM}',
'                                                  -- you can only use this global variable in combination with reports (classic, IR, IG, ...).',
'                                                  -- When using a SQL Query, you can define the page item in your SQL query, e.g. :P1_ITEM as "P1_ITEM"',
'',
'-- Call a Web Service where AOP will send the file to (POST Request)',
'g_web_service_url         varchar2(500) := null;  -- URL to be called once AOP has created the document. AOP will do a POST request and headers can be specified',
'g_web_service_headers     varchar2(4000):= null;  -- The headers for the POST request e.g. {"file_id": "F123", "access_token": "A456789"}',
'',
'-- Templates',
'g_template_start_delimiter   varchar2(2)   := null;  -- { is the default start delimiter used is a template, but you can set this variable with the following options: {, {{, <, <<',
'g_template_end_delimiter     varchar2(2)   := null;  -- } is the default end delimiter used in a template, but you can set this variable with the following options: }, }}, >, >>',
'g_cache_template             boolean       := false; -- cache the template; an hash is returned in g_template_cache_hash',
'',
'-- Password protected PDF',
'g_output_read_password       varchar2(200) := null; -- protect PDF to read',
'g_output_modify_password     varchar2(200) := null; -- protect PDF to write (modify)',
'g_output_pwd_protection_flag number(4)     := null; -- optional; default is 4. ',
'',
'-- Watermark',
'g_output_watermark           varchar2(4000):= null; -- Watermark in PDF',
'g_output_watermark_color     varchar2(500) := null; -- Watermark option color',
'',
'-- Many more are specified in the package',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1964784723487304177)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>31
,p_prompt=>'Output Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'docx'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1964785320468305603)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>10
,p_display_value=>'Word (docx)'
,p_return_value=>'docx'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1964786113351308853)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>20
,p_display_value=>'Excel (xlsx)'
,p_return_value=>'xlsx'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1964786512489309317)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>30
,p_display_value=>'PowerPoint (pptx)'
,p_return_value=>'pptx'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1964786911410309850)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>40
,p_display_value=>'PDF (pdf)'
,p_return_value=>'pdf'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1964787709469310712)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>60
,p_display_value=>'HTML (html)'
,p_return_value=>'html'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(822021508168986490)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>65
,p_display_value=>'Markdown (md)'
,p_return_value=>'md'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(656127614685299270)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>66
,p_display_value=>'Text (txt)'
,p_return_value=>'txt'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1964787310548310241)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>67
,p_display_value=>'Rich Text Format (rtf)'
,p_return_value=>'rtf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(451142126330612394)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>68
,p_display_value=>'CSV (csv)'
,p_return_value=>'csv'
,p_help_text=>'Comma separated values file. Text file containing information separated by commas.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(515847636603864061)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>69
,p_display_value=>'One Page PDF (pdf)'
,p_return_value=>'onepagepdf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(179682937858381871)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>70
,p_display_value=>'PDF Form Fields (pdf)'
,p_return_value=>'form_fields'
,p_help_text=>'Get the form fields defined on a PDF.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(89919948208331554)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>80
,p_display_value=>'PDF Attachments (pdf)'
,p_return_value=>'get_attachments'
,p_help_text=>'Retrieve attachments from a PDF'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(35964979407404833)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>90
,p_display_value=>'Image (jpeg)'
,p_return_value=>'jpeg'
,p_help_text=>'Template must be PDF. Output will be zip if pdf contains multiple pages. Otherwise .jpeg.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(462321170255899486)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>210
,p_display_value=>'Word with macros (docm)'
,p_return_value=>'docm'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(462321530618900785)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>220
,p_display_value=>'Excel with macros (xlsm)'
,p_return_value=>'xlsm'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(462321985776901884)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>230
,p_display_value=>'PowerPoint with macros (pptm)'
,p_return_value=>'pptm'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(462322335736903271)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>240
,p_display_value=>'Calendar (ics)'
,p_return_value=>'ics'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(462322713289904659)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>250
,p_display_value=>'Calendar (ifb)'
,p_return_value=>'ifb'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17248389442649939)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>310
,p_display_value=>'Word (doc)'
,p_return_value=>'doc'
,p_help_text=>'Old Microsoft Word version'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17248792642651993)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>320
,p_display_value=>'Excel (xls)'
,p_return_value=>'xls'
,p_help_text=>'Old Microsoft Excel version'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17249195731654366)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>330
,p_display_value=>'PowerPoint (ppt)'
,p_return_value=>'ppt'
,p_help_text=>'Old Microsoft PowerPoint version'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(182168829132441064)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>520
,p_display_value=>'OpenDocument Text (odt)'
,p_return_value=>'odt'
,p_help_text=>'OpenOffice Word'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(182169176843439172)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>530
,p_display_value=>'OpenDocument Spreadsheet (ods)'
,p_return_value=>'ods'
,p_help_text=>'OpenOffice Excel'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(182169659138437788)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>540
,p_display_value=>'OpenDocument Presentation (odp)'
,p_return_value=>'odp'
,p_help_text=>'OpenOffice Powerpoint'
);
end;
/
begin
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(232677307889270495)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>550
,p_display_value=>'XML (xml)'
,p_return_value=>'xml'
,p_help_text=>'Extensible Markup Language is a markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(266453533499401242)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>560
,p_display_value=>'JSON (json)'
,p_return_value=>'json'
,p_help_text=>'JSON stands for JavaScript Object Notation. JSON is a lightweight data-interchange format.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(131674271041662155)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>570
,p_display_value=>'APEX Office Edit (AOE)'
,p_return_value=>'aoe'
,p_help_text=>'This option will not merge the template and the data, instead, the template is sent to an APEX Office Edit (AOE) region, where the data will be automatically loaded in the AOP sidebar, and the template will be available to edit. It''s recommended to u'
||'se a small sample data set.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(177553032780147527)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>580
,p_display_value=>'Metadata'
,p_return_value=>'meta_data'
,p_help_text=>'meta_data'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1964915138736232105)
,p_plugin_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_display_sequence=>900
,p_display_value=>'Defined by APEX Item'
,p_return_value=>'apex_item'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1928154227477371741)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>20
,p_prompt=>'Data Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1892803921783917641)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>You can also use SQL that generates JSON.',
'<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.',
'<br/>',
'',
'<p><b>Cursor syntax:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'         c.cust_first_name as "cust_first_name",',
'         c.cust_last_name as "cust_last_name",',
'         c.cust_city as "cust_city"',
'       from demo_customers c',
'      where c.customer_id = :PXX_ITEM ',
'    ) as "data"',
'from dual',
'</pre>',
'',
'<p><b>Native JSON database functionality:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select ',
'  json_arrayagg( ',
'    json_object( ',
'      ''filename'' value ''file1'', ',
'      ''data''     value (select ',
'                          json_arrayagg(',
'                            json_object( ',
'                              ''cust_first_name'' value c.cust_first_name, ',
'                              ''cust_last_name''  value c.cust_last_name,',
'                              ''cust_city''       value c.cust_city ',
'                            )',
'                          )  ',
'                          from demo_customers c',
'                          where c.customer_id = :PXX_ITEM',
'                        )  ',
'    )',
'  ) as aop_json',
'  from dual ',
'</pre>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1481685622752170197)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns as select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1928155222948373863)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON as defined in the URL example above.',
'(see example in help of Data Source)'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1928154824889372899)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>30
,p_display_value=>'URL (returning JSON)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Source should point to a URL that returns a JSON object with following format:',
'{',
'  "filename": "file1",',
'  "data":[{...}]',
'}',
'If the URL is using an APEX/ORDS REST call it will automatically be wrapped with additional JSON: {"items":[...]} This is ok as the plugin removes it for you.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1758835357411793338)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>40
,p_display_value=>'Region(s): Classic Report, Interactive Report/Grid, SVG, Canvas, HTML, Other'
,p_return_value=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Enter a comma separated list of static id of one of following region types:',
'<ul>',
'<li>Classic Report</li>',
'<li>Interactive Report</li>',
'<li>Interactive Grid</li>',
'<li>JET Chart</li>',
'<li>Any other region (static html, div, plugin) which you want to include</li>',
'</ul>',
'</p>',
'<p>',
'e.g. my_classic_report,ir1,jet2,my_div',
'</p>',
'<p>',
'In your template you can include the entire Interactive Report by using the tag {&interactive_1} for the first interactive report, {&interactive_2} for the second etc.',
'<br/>',
'To include an Interactive Grid as you see on the screen you use the tag {&interactive_<static_id>}.',
'<br/>',
'If you just want to get the data and do the styling yourself, you can use for classic report: {#<static_id>}{column}{/<static_id} or for interactive report {#aopireportdata_1}{column}{/aopireportdata_1}.',
'For interactive grid use {#aopigridoptions_<static_id>} {column} {/aopigridoptions_<static_id>}',
'<br/>',
'To include the svg(s) in the div use {%region} and specify in the Custom Attributes of the region: aop-region-as="client_svg"',
'<br/>',
'To include a canvas in the div use {%region} and specify in the Custom Attributes of the region: aop-region-as="client_canvas"',
'<br/>',
'To include the html in the div use {_region} and specify in the Custom Attributes of the region: aop-region-as="server_html" or aop-region-as="client_html". AOP will translate the html into native Word styling either by passing the HTML defined in th'
||'e Region Source (server_html) or defined after rendering on the page (client_html).',
'<br/>',
'To include a screenshot of the div use {%region}, you don''t have to specify anything or you can specify in the Custom Attributes of the region: aop-region-as="client_screenshot".',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(375974277131986456)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>50
,p_display_value=>'XML (data part)'
,p_return_value=>'XML'
,p_help_text=>'Data in XML format. No need to specify files or filename.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(375974696793987371)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>60
,p_display_value=>'JSON (data part)'
,p_return_value=>'JSON'
,p_help_text=>'Data in JSON format. No need to specify files or filename.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(377620064436023742)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>70
,p_display_value=>'JSON (REST, GraphQL, Raw)'
,p_return_value=>'JSON_FILES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter JSON in format ',
'<code>',
'[',
'{ "filename": "xxx.docx",',
'  "datasource": "graphql",',
'  "query": "{human(id:\"1000\"){name height}",',
'  "endpoint": "https://api.graph.cool/simple/v1/",',
'  "headers": [{"Content-Type":"application/json"},{"Custom-Auth-Token":"xyz"}]',
'} ',
']',
'</code>',
'',
'The files part of the AOP structure will be filled in with the value specified here.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(187848935861636189)
,p_plugin_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_display_sequence=>80
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_help_text=>'To only append or prepend files or to work with PDFs, set the data type to none.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1892768768655662257)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>10
,p_prompt=>'Template Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'AOP Template'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'<b>AOP Template</b>: will generate a Word document with a starting template based on the data (JSON) that is submitted. <br/>',
'Documentation is also added on the next page(s) that describe the functions AOP will understand. <br/>',
'When the output is APEX Office Edit, the available tags will be automatically loaded in the AOP sidebar.',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(375784615187868160)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>1
,p_display_value=>'AOP Report'
,p_return_value=>'AOP_REPORT'
,p_help_text=>'AOP will generate a report for you based on the Print Attributes specified in the given region (in case multiple regions are specified, the first region is used for the Print Attributes).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(187850318594627792)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>3
,p_display_value=>'APEX Report'
,p_return_value=>'APEX_REPORT'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(218097242863773048)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>4
,p_display_value=>'APEX Report (Data only)'
,p_return_value=>'APEX_REPORT_DO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Data only will remove highlights etc. and just export the data. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1851316943624089758)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>5
,p_display_value=>'Static Application Files'
,p_return_value=>'APEX'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Application Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1738923921972753522)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>7
,p_display_value=>'Static Workspace Files'
,p_return_value=>'WORKSPACE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Workspace Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1892771322049662958)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Query that returns two columns: template_type and file (in this order) <br/>',
'- template_type: docx, xlsx, pptx, html, md <br/>',
'- file: blob column'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(781559856869082596)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns a select statement with two columns: template_type and file (in this order) <br/>',
'- template_type: docx, xlsx, pptx, html, md <br/>',
'- file: blob column',
'<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1892771761586663684)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON object with following format: ',
'<pre>',
'{',
'  "file":"clob base 64 data",',
'  "template_type":"docx,xlsx,pptx"',
'}',
'</pre>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(386105888039449472)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>25
,p_display_value=>'JSON'
,p_return_value=>'JSON'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Add the JSON of "template" in here. <br/>',
'e.g.:',
'<pre>',
'{"filename":"aop_template_d01.docx", "template_type":"docx"}',
'</pre>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1892772130160664491)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>30
,p_display_value=>'Filename (with path relative to AOP server)'
,p_return_value=>'FILENAME'
,p_help_text=>'Enter the path and filename of the template which is stored on the same server AOP is running at.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(377610247739744221)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>35
,p_display_value=>'Filename (with database directory)'
,p_return_value=>'DB_DIRECTORY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the Database directory colon separated with the filename. <br/>',
'e.g. AOP_TEMPLATE:my_template.docx',
'<br/><br/>',
'Example how to create Database directory: <br/>',
'CREATE DIRECTORY AOP_TEMPLATE AS ''/home/oracle/aop_template'';'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1481502469020716351)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>40
,p_display_value=>'URL (call from DB)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. https://www.apexofficeprint.com/templates/aop_template_d01.docx',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from the database, so the database server needs to have access to the url.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(461765129003793855)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>50
,p_display_value=>'URL (call from AOP)'
,p_return_value=>'URL_AOP'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. https://www.apexofficeprint.com/templates/aop_template_d01.docx ',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from AOP, so the AOP server needs to have access to the url.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(179679540069439973)
,p_plugin_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_display_sequence=>60
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_help_text=>'To only append or prepend files or to fill PDFs, set the template type to none.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1964914317398226886)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>11
,p_prompt=>'Template Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'APEX,WORKSPACE,FILENAME,URL,URL_AOP,DB_DIRECTORY,JSON'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Reference a file in Shared Components > Static Application Files or Static Workspace Files <br/>',
'<pre>',
'aop_template.docx',
'</pre>',
'In case you want to specify the template dynamically, use the SQL option with following:',
'<pre>',
'select case ',
'        when mime_type = ''application/octet-stream''',
'        then substr(file_name, instr(file_name,''.'',-1)+1) ',
'        else mime_type',
'        end as template_type, ',
'        file_content as template_blob',
'  from apex_application_static_files',
' where file_name    = :PXX_YOUR_ITEM',
'   and application_id = :APP_ID',
'</pre>',
'</p>',
'<p>',
'Reference a file on the server. Include the path relative to the AOP executable.',
'</p>',
'<p>',
'Reference a url, accessible from the database.',
'</p>',
'<p>',
'Reference a url, accessible from the AOP Server.',
'</p>',
'<p>',
'Specify the region static id where the Print Attributes are specified for the AOP Report.',
'</p>',
'<p>',
'Reference a database directory and file on the database server. Format: DIRECTORY:FILENAME e.g. AOP_TEMPLATE:my_template.docx',
'</p>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The templates need to be of format: Word (docx), Excel (xlsx), Powerpoint (pptx), HTML (html), Text (txt), CSV (csv) or Markdown (md).',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1964915726228237909)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1964784723487304177)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1792924159608461117)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'Template Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'To query your own table:',
'<pre>',
' select template_type, template_blob',
'  from aop_template  ',
' where id = :P1_TEMPLATE_ID ',
'</pre>',
'To query the APEX static application files use:',
'<pre>',
'select case ',
'        when mime_type = ''application/octet-stream''',
'        then substr(file_name, instr(file_name,''.'',-1)+1) ',
'        else mime_type',
'        end as template_type, ',
'        file_content as template_blob',
'  from apex_application_static_files',
' where file_name    = :PXX_YOUR_ITEM',
'   and application_id = :APP_ID',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'When you use your own table (or the one that is provided in the sample AOP app) to store the template documents, this select statement might help:',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1792924981383467501)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>13
,p_prompt=>'Template Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1892768768655662257)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      a.TEMPLATE_TYPE as template_type,',
'      apex_web_service.blob2clobbase64(a.TEMPLATE_BLOB) as file',
'     from aop_template a',
'    where id = 1',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare ',
'  l_return        clob; ',
'  l_template      clob; ',
'  l_template_type aop_template.template_type%type; ',
'begin ',
'  select template_type, apex_web_service.blob2clobbase64(template_blob) template ',
'    into l_template_type, l_template ',
'    from aop_template ',
'   where id = :p4_template;',
'',
'  l_return := ''{ "file": "'' || replace(l_template,''"'', ''\u0022'') ',
'              || ''",'' || '' "template_type": "'' || replace(l_template_type,''"'', ''\u0022'') ',
'              || ''" }''; ',
'',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>',
'<p>',
'The JSON format should be file and template_type. You can use substitution variables in the PL/SQL code. <br/>',
'The structure is like this:',
'</p>',
'<pre>',
'declare ',
'  l_return        clob; ',
'begin ',
'  l_return := ''{ "file": "", "template_type": "docx" }''; ',
'',
'  return l_return; ',
'end;',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1792927533324519751)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>21
,p_prompt=>'Data Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>1
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><b>Cursor syntax:</b></p>',
'<p>List of all customers e.g. to send a letter to all</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'       cursor(select',
'                  c.cust_first_name as "cust_first_name",',
'                  c.cust_last_name as "cust_last_name",',
'                  c.cust_city as "cust_city" ',
'                from aop_sample_customers c) as "customers"',
'       from dual) as "data"',
'from dual ',
'</pre>',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select',
'  ''file1'' as "filename", ',
'  cursor(',
'    select',
'      c.cust_first_name as "cust_first_name",',
'      c.cust_last_name as "cust_last_name",',
'      c.cust_city as "cust_city",',
'      cursor(select o.order_total as "order_total", ',
'                    ''Order '' || rownum as "order_name",',
'                cursor(select p.product_name as "product_name", ',
'                              i.quantity as "quantity",',
'                              i.unit_price as "unit_price", ',
'                              apex_web_service.blob2clobbase64(p.product_image) as "image"',
'                         from aop_sample_order_items i, aop_sample_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                      ) "product"',
'               from aop_sample_orders o',
'              where c.customer_id = o.customer_id',
'            ) "orders"',
'    from aop_sample_customers c',
'    where customer_id = :P1_CUSTOMER_ID',
'  ) as "data"',
'from dual',
'</pre>',
'',
'<p><b>Native JSON database functionality:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select ',
'  json_arrayagg( ',
'    json_object( ',
'      ''filename'' value ''file1'', ',
'      ''data''     value (select ',
'                          json_arrayagg(',
'                            json_object( ',
'                              ''cust_first_name'' value c.cust_first_name, ',
'                              ''cust_last_name''  value c.cust_last_name,',
'                              ''cust_city''       value c.cust_city ',
'                            )',
'                          )  ',
'                          from aop_sample_customers c',
'                          where c.customer_id = 1',
'                        )  ',
'    )',
'  ) as aop_json',
'  from dual ',
'</pre>',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select ',
'json_arrayagg( ',
'json_object( ',
'''filename'' value ''file1'', ',
'''data''     value (',
'  select ',
'    json_arrayagg(',
'      json_object( ',
'        ''cust_first_name'' value c.cust_first_name, ',
'        ''cust_last_name''  value c.cust_last_name,',
'        ''cust_city''       value c.cust_city, ',
'        ''orders''          value (',
'            select ',
'              json_arrayagg(',
'                json_object(                               ',
'                  ''order_total'' value o.order_total, ',
'                  ''order_name''  value ''Order '' || rownum,',
'                  ''order_lines'' value (',
'                      select ',
'                        json_arrayagg(',
'                          json_object(                               ',
'                            ''product_name'' value p.product_name, ',
'                            ''quantity''     value i.quantity,',
'                            ''unit_price''   value i.unit_price',
'                          )',
'                        returning clob)      ',
'                        from aop_sample_order_items i, aop_sample_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                    )',
'                )',
'              returning clob)      ',
'              from aop_sample_orders o',
'            where o.customer_id = c.customer_id',
'          )',
'      )',
'    returning clob)  ',
'    from aop_sample_customers c',
'    where c.customer_id = :P1_CUSTOMER_ID',
'  )',
')',
'returning clob) as aop_json',
'from dual',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'A SQL statement is the easiest to use, either by using the cursor syntax or native JSON database functionality.<br/>',
'Images need to be base64 encoded. You can reference items by using :ITEM ',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1792927982893524097)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>22
,p_prompt=>'Data Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      ''file1'' as "filename",',
'      cursor(',
'        select',
'          c.cust_first_name as "cust_first_name",',
'          c.cust_last_name as "cust_last_name",',
'          c.cust_city as "cust_city",',
'          cursor(',
'            select',
'              o.order_total as "order_total",',
'              ''Order '' || rownum as "order_name",',
'              cursor(',
'                select',
'                  p.product_name as "product_name",',
'                  i.quantity as "quantity",',
'                  i.unit_price as "unit_price",',
'                  apex_web_service.blob2clobbase64(p.product_image) as "image"',
'                from',
'                  aop_sample_order_items i, aop_sample_product_info p',
'                where',
'                  o.order_id = i.order_id',
'                  and i.product_id = p.product_id',
'                    ) "product"',
'            from',
'              aop_sample_orders o',
'            where',
'              c.customer_id = o.customer_id',
'                ) "orders"',
'        from',
'          aop_sample_customers c',
'        where',
'          customer_id = :P4_CUSTOMER_ID',
'            ) as "data"',
'    from dual',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare',
'  l_cursor sys_refcursor;',
'  l_return clob;',
'begin',
'  apex_json.initialize_clob_output(dbms_lob.call, true, 2) ;',
'  open l_cursor for ',
'  select ''file1'' as "filename",',
'  cursor',
'    (select',
'        c.cust_first_name as "cust_first_name",',
'        c.cust_last_name  as "cust_last_name" ,',
'        c.cust_city       as "cust_city"      ,',
'        cursor',
'        (select',
'            o.order_total      as "order_total",',
'            ''Order '' || rownum as "order_name" ,',
'            cursor',
'            (select',
'                p.product_name                                    as "product_name",',
'                i.quantity                                        as "quantity"    ,',
'                i.unit_price                                      as "unit_price"  ,',
'                apex_web_service.blob2clobbase64(p.product_image) as "image"',
'              from',
'                aop_sample_order_items i,',
'                aop_sample_product_info p',
'              where',
'                o.order_id       = i.order_id',
'                and i.product_id = p.product_id',
'            ) "product"',
'        from',
'          aop_sample_orders o',
'        where',
'          c.customer_id = o.customer_id',
'        ) "orders"',
'      from',
'        aop_sample_customers c',
'      where',
'        customer_id = :P4_CUSTOMER_ID',
'    ) as "data" ',
'  from dual;',
'  apex_json.write(l_cursor) ;',
'  l_return := apex_json.get_clob_output;',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1759058597626416885)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>25
,p_prompt=>'Region Static Id(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1928154227477371741)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Define one or more Static Id(s) of the report region. Static ids should be separated by a comma. e.g. ir1,ir2 <br/>',
'You can set the Static ID of the region in the region settings (Advanced section). Under Static ID in the Custom Attributes you can define how AOP should behave: aop-region-as="client_svg / client_html / client_screenshot". Depending this setting, AO'
||'P will render the HTML from the server or it will take from client the svg, html or take a screenshot of the region. ',
'<br><br>',
'You can reference regions from other APEX pages by using the following syntax:<br>',
'<code>P[page-number]#[region-static-id]</code>',
'',
'<p>Where:</p>',
'',
'<ul>',
'  <li><code>page-number</code> is the page number you want to reference</li>',
'  <li><code>region-static-id</code> is the Static ID of the region on that page</li>',
'</ul>',
'',
'<p>For example, to reference a region with Static ID <strong>rid</strong> that is on page <strong>33</strong>, you would use:</p>',
'<p><code>P33#rid</code></p>',
'',
'<p>This allows you to include content from regions that exist on different pages of your application.</p>',
'</p>'))
);
end;
/
begin
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1759443431108783041)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Output To'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Browser (file)'
,p_help_text=>'By default the file that''s generated by AOP, will be downloaded by the Browser and saved on your harddrive.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1759448554208784465)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format (see definition in procedure help). This option is useful in case you don''t need the file on your own hard drive, but for example, you want to mail the document automatically or want to store it '
||'in the database.',
'In that case, you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1759448917398786015)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser (file)'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your hard drive.',
'An example is when you first want to store the generated document in a table before letting the browser download it. (see definition in procedure help)'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(958839107283325983)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>30
,p_display_value=>'Inline Region (pdf/html/md/txt only)'
,p_return_value=>'BROWSER_INLINE'
,p_help_text=>'add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(186248269962196962)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>35
,p_display_value=>'Procedure and Inline Region (pdf/html/md/txt only)'
,p_return_value=>'PROCEDURE_INLINE'
,p_help_text=>'This option allows you to call a procedure first and next show the output in a region. Add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(820760477693448561)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>40
,p_display_value=>'Directory (on AOP Server)'
,p_return_value=>'DIRECTORY'
,p_help_text=>'Save the file to a directory specified with g_output_directory. The default directory on the AOP Server is outputfiles.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(377612786880769177)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>45
,p_display_value=>'Directory (on Database Server)'
,p_return_value=>'DB_DIRECTORY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the file to a database directory specified with g_output_directory. ',
'<br/>',
'Example how to create Database directory: <br/>',
'CREATE DIRECTORY AOP_TEMPLATE AS ''/home/oracle/aop_output'';'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(474317525343135596)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>50
,p_display_value=>'Cloud (Dropbox, Google Drive, OneDrive, Amazon S3)'
,p_return_value=>'CLOUD'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the output straight in a directory on the cloud. <br/>',
'Use following global variables to define the provider and location.',
'<ul>',
'<li>g_cloud_provider (dropbox, gdrive, onedrive, amazon_s3)</li>',
'<li>g_cloud_location (directory, or bucket with directory on Amazon)</li>',
'<li>g_cloud_access_token (oauth token)</li>',
'</ul>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(190628361112189823)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>60
,p_display_value=>'Defined in Post Process (e.g. Printer)'
,p_return_value=>'NA'
,p_help_text=>'Use when an external post-process command is specified and the output is only needed to be passed to that process. For example when you want to print directly to a Printer or call an OS command.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354258706580561904)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>70
,p_display_value=>'Asynchronous (Returns URL)'
,p_return_value=>'ASYNC'
,p_help_text=>'AOP will process the request asynchronously. This is especially useful for long-running processes. A URL will be passed to g_async_url where the file will be available to download when AOP is finished. Use the aop_api_pkg.poll_async_file procedure to'
||' check and download the file. Optionally a procedure can be defined (see definition in procedure help).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354268019653488788)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>80
,p_display_value=>'Web Service (POST Request)'
,p_return_value=>'WEB_SERVICE'
,p_help_text=>'AOP will call the web service (a POST Request) defined in g_web_service_url once AOP is finished producing the file. Extra headers can be added to the POST request by defining them in g_web_service_headers e.g. {"file_id": "F123", "access_token": "A4'
||'56789"}'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354268477689441581)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>90
,p_display_value=>'APEX Office Edit (AOE)'
,p_return_value=>'APEX_OFFICE_EDIT'
,p_help_text=>'This option allows you to call a procedure first and next show the output in APEX Office Edit (AOE), the editor that can show and edit Word, Excel, PowerPoint, PDF, and Text straight from the browser.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(87266907011063766)
,p_plugin_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_display_sequence=>100
,p_display_value=>'PDF Region Pro'
,p_return_value=>'PDF_REGION_PRO'
,p_help_text=>'This option allows you to call a procedure first and next show the output in the Plug-ins Pro PDF Region Pro, the PDF Viewer that show and edit a PDF from the browser.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1759449311919817346)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1759443431108783041)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PROCEDURE,PROCEDURE_BROWSER,PROCEDURE_INLINE,ASYNC,APEX_OFFICE_EDIT,PDF_REGION_PRO'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Create the following procedure in the database:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob      in blob,',
'    p_output_filename  in varchar2,',
'    p_output_mime_type in varchar2)',
'is',
'  l_id   number;',
'  l_to   varchar2(200);',
'  l_from varchar2(200);',
'begin',
'  -- in case you want to reference a page item',
'  l_to := v(''P1_EMAIL'');',
'',
'  -- sending an email with an attachment',
'  l_id := apex_mail.send( ',
'            p_to   => l_to, ',
'            p_from => l_from, ',
'            p_subj => ''Mail from APEX with attachment'', ',
'            p_body => ''Please review the attachment.'', ',
'            p_body_html => ''<b>Please</b> review the attachment.'');',
'',
'  apex_mail.add_attachment( ',
'      p_mail_id    => l_id, ',
'      p_attachment => p_output_blob, ',
'      p_filename   => p_output_filename, ',
'      p_mime_type  => p_output_mime_type) ;',
'',
'  apex_mail.push_queue;    ',
'end send_email_prc;',
'</pre>',
'',
'<br/><br/>',
'',
'<p>',
'Create the following procedure in the database with <b>template cache</b>:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob         in blob,',
'    p_output_filename     in varchar2,',
'    p_output_mime_type    in varchar2,',
'    p_template_cache_hash in varchar2)',
'is',
'begin',
'  insert into x (output_blob, output_filename, output_mime_type, template_cache_hash)',
'  values (p_output_blob, p_output_filename, p_output_mime_type, p_template_cache_hash);',
'end send_email_prc;',
'</pre>',
'',
'<br/><br/>',
'<p>',
'Create the following procedure in the database for Output To <b>Asynchronous</b>:',
'</p>',
'<pre>',
'create procedure download_aop_async(',
'  p_async_status     in varchar2, ',
'  p_async_message    in varchar2, ',
'  p_async_url        in varchar2, ',
'  p_output_filename  in varchar2, ',
'  p_output_mime_type in varchar2)',
'is',
'begin',
'  insert into aop_output_async (async_status, async_message, async_url, filename, mime_type, last_update_date)',
'  values (p_async_status, p_async_message, p_async_url, p_output_filename, p_output_mime_type, sysdate);',
'',
'  commit;',
'',
'  -- the p_async_url will contain the URL to download the file once it''s ready.',
'end download_aop_async;',
'</pre>',
'',
'<br/><br/>',
'',
'<p>',
'When Output To <b>APEX Office Edit</b> is set, leave the procedure empty to take the settings defined in the APEX Office Edit region or create the following procedure in the database in case you want to call a custom function:',
'</p>',
'<pre>',
'create procedure download_aop_async(',
'    p_output_blob        in blob,',
'    p_output_filename    in varchar2,',
'    p_output_mime_type   in varchar2,',
'    p_primary_key_values out varchar2)',
'is',
'    v_id                number;',
'    v_session_id        number := v(''APP_SESSION'');',
'    v_version           number := 1;',
'    v_last_update_date  timestamp := systimestamp;',
'    v_blob_owner        varchar2(50) := v(''APP_USER'');',
'begin',
'    insert into aoe_files_custom(',
'      session_id,',
'      content,',
'      filename,',
'      mime_type,',
'      blob_owner,',
'      version,',
'      last_update_date',
'    ) values(',
'      v_session_id,',
'      p_output_blob,',
'      p_output_filename,',
'      p_output_mime_type,',
'      v_blob_owner,',
'      v_version,',
'      v_last_update_date',
'    )',
'    returning id into v_id;',
'    -- return    ',
'    p_primary_key_values := v_id;',
'end download_aop_async;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter only the procedure name in this field (so without parameters) for example "download_prc".',
'The procedure in the database needs to be structured with the parameters as in the example. ',
'The procedure name can be any name, but the parameters need to match exactly as in the example.',
'You can add other parameters with a default value. ',
'You can reference page items in the procedure by using the v() function.'))
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(822254679628773832)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
,p_depending_on_has_to_exist=>true
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.spinner,',
'  spinnerIcon: ''bounce''',
'};<br>',
'AOP.gAOPOptions.showNotification = false;<br>',
'AOP.gAOPOptions.notificatonMessage = ''An AOP error occurred'';',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'<strong>Options</strong><br>',
'<strong>AOP.gAOPOptions.showNotification - Show Notification if something went wrong</strong><br>',
'Values: true (default) / false<br><br>',
'<strong>AOP.gAOPOptions.notificatonMessage - Overrides Server-side Notification Message</strong><br>',
'<strong>AOP.gAOPOptions.processingIndicator - Waiting Indicators</strong><br>',
'<code>',
'-- Only Spinner',
'',
'/* APEX Spinner */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.spinner,',
'  spinnerIcon: ''APEX''',
'};',
'',
'/* Spinkit Circle Spinner */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.spinner,',
'  spinnerIcon: ''circle''',
'};',
'',
'-- Spinner with Overlay',
'',
'/* APEX Spinner with Overlay */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.overlay,',
'  spinnerIcon: ''APEX''',
'};',
'',
'/* Spinkit Circle Spinner with Overlay */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.overlay,',
'  spinnerIcon: ''circle''',
'};',
'',
'-- Spinner in button',
'',
'/* APEX Spinner Added to a Button */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.button,',
'  button: ''DOCX'',',
'  spinnerIcon: ''APEX''',
'};',
'',
'/* Spinkit Circle Spinner Added to a Button  */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.button,',
'  button: ''DOCX'',',
'  spinnerIcon: ''circle''',
'};',
'</code>',
'Available waiting spinners:<br>',
'apex (default), flow, plance, circle-fade, fold, bounce, wave, wander, pulse, chase, circle, grid',
'<br><be>',
'</pre>'))
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1096739285790511323)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_name=>'aop-file-error'
,p_display_name=>'AOP Print File Error'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1096739756275511323)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_name=>'aop-file-progress'
,p_display_name=>'AOP Print File Progress'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1096740130856511323)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_name=>'aop-file-success'
,p_display_name=>'AOP Print File Success'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E616F702D50726F63657373696E677B7A2D696E6465783A39393939393939397D2E742D427574746F6E202E616F702D50726F63657373696E677B2D2D736B2D73697A653A766172282D2D612D627574746F6E2D666F6E742D73697A652C203230707829';
wwv_flow_api.g_varchar2_table(2) := '7D2E616F702D496E6C696E65507265766965777B646973706C61793A666C65783B666C65782D646972656374696F6E3A636F6C756D6E7D2E616F702D496E6C696E6550726576696577202E616F702D496E6C696E65507265766965772D2D646F776E6C6F';
wwv_flow_api.g_varchar2_table(3) := '6164427574746F6E7B6D617267696E2D626F74746F6D3A3870783B616C69676E2D73656C663A666C65782D656E647D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(89783358736596645)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'css/aop.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3A726F6F747B2D2D736B2D73697A653A343070783B2D2D736B2D636F6C6F723A233333337D2E736B2D63656E7465727B6D617267696E3A6175746F7D2E736B2D706C616E657B77696474683A766172282D2D736B2D73697A65293B6865696768743A7661';
wwv_flow_api.g_varchar2_table(2) := '72282D2D736B2D73697A65293B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B616E696D6174696F6E3A736B2D706C616E6520312E327320696E66696E69746520656173652D696E2D6F75747D406B65796672616D65';
wwv_flow_api.g_varchar2_table(3) := '7320736B2D706C616E657B30257B7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828302920726F74617465592830297D3530257B7472616E73666F726D3A70657273706563746976652831323070782920726F';
wwv_flow_api.g_varchar2_table(4) := '7461746558282D3138302E316465672920726F74617465592830297D313030257B7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567297D7D2E';
wwv_flow_api.g_varchar2_table(5) := '736B2D63686173657B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976653B616E696D6174696F6E3A736B2D636861736520322E357320696E66696E69';
wwv_flow_api.g_varchar2_table(6) := '7465206C696E65617220626F74687D2E736B2D63686173652D646F747B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A303B616E696D6174696F6E3A736B2D63686173';
wwv_flow_api.g_varchar2_table(7) := '652D646F7420322E307320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B2D63686173652D646F743A6265666F72657B636F6E74656E743A27273B646973706C61793A626C6F636B3B77696474683A3235253B6865696768743A';
wwv_flow_api.g_varchar2_table(8) := '3235253B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D63686173652D646F742D6265666F726520322E307320696E66696E69746520';
wwv_flow_api.g_varchar2_table(9) := '656173652D696E2D6F757420626F74687D2E736B2D63686173652D646F743A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D63686173652D646F743A6E74682D6368696C642832297B616E696D617469';
wwv_flow_api.g_varchar2_table(10) := '6F6E2D64656C61793A2D312E30737D2E736B2D63686173652D646F743A6E74682D6368696C642833297B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D63686173652D646F743A6E74682D6368696C642834297B616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(11) := '2D64656C61793A2D302E38737D2E736B2D63686173652D646F743A6E74682D6368696C642835297B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D63686173652D646F743A6E74682D6368696C642836297B616E696D6174696F6E2D64';
wwv_flow_api.g_varchar2_table(12) := '656C61793A2D302E36737D2E736B2D63686173652D646F743A6E74682D6368696C642831293A6265666F72657B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D63686173652D646F743A6E74682D6368696C642832293A6265666F7265';
wwv_flow_api.g_varchar2_table(13) := '7B616E696D6174696F6E2D64656C61793A2D312E30737D2E736B2D63686173652D646F743A6E74682D6368696C642833293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D63686173652D646F743A6E74682D636869';
wwv_flow_api.g_varchar2_table(14) := '6C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D63686173652D646F743A6E74682D6368696C642835293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D6368617365';
wwv_flow_api.g_varchar2_table(15) := '2D646F743A6E74682D6368696C642836293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E36737D406B65796672616D657320736B2D63686173657B313030257B7472616E73666F726D3A726F7461746528333630646567297D7D406B';
wwv_flow_api.g_varchar2_table(16) := '65796672616D657320736B2D63686173652D646F747B3830252C313030257B7472616E73666F726D3A726F7461746528333630646567297D7D406B65796672616D657320736B2D63686173652D646F742D6265666F72657B3530257B7472616E73666F72';
wwv_flow_api.g_varchar2_table(17) := '6D3A7363616C6528302E34297D313030252C30257B7472616E73666F726D3A7363616C6528312E30297D7D2E736B2D626F756E63657B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F73';
wwv_flow_api.g_varchar2_table(18) := '6974696F6E3A72656C61746976657D2E736B2D626F756E63652D646F747B77696474683A313030253B6865696768743A313030253B626F726465722D7261646975733A3530253B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C';
wwv_flow_api.g_varchar2_table(19) := '6F72293B6F7061636974793A2E363B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B616E696D6174696F6E3A736B2D626F756E636520327320696E66696E6974652063756269632D62657A69657228302E3435352C302E30';
wwv_flow_api.g_varchar2_table(20) := '332C302E3531352C302E393535297D2E736B2D626F756E63652D646F743A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D312E30737D406B65796672616D657320736B2D626F756E63657B30252C313030257B7472616E7366';
wwv_flow_api.g_varchar2_table(21) := '6F726D3A7363616C652830297D3435252C3535257B7472616E73666F726D3A7363616C652831297D7D2E736B2D776176657B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B646973706C6179';
wwv_flow_api.g_varchar2_table(22) := '3A666C65783B6A7573746966792D636F6E74656E743A73706163652D6265747765656E7D2E736B2D776176652D726563747B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B6865696768743A313030253B7769647468';
wwv_flow_api.g_varchar2_table(23) := '3A3135253B616E696D6174696F6E3A736B2D7761766520312E327320696E66696E69746520656173652D696E2D6F75747D2E736B2D776176652D726563743A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2D312E32737D2E73';
wwv_flow_api.g_varchar2_table(24) := '6B2D776176652D726563743A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D776176652D726563743A6E74682D6368696C642833297B616E696D6174696F6E2D64656C61793A2D312E30737D2E736B2D';
wwv_flow_api.g_varchar2_table(25) := '776176652D726563743A6E74682D6368696C642834297B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D776176652D726563743A6E74682D6368696C642835297B616E696D6174696F6E2D64656C61793A2D302E38737D406B65796672';
wwv_flow_api.g_varchar2_table(26) := '616D657320736B2D776176657B30252C3430252C313030257B7472616E73666F726D3A7363616C655928302E34297D3230257B7472616E73666F726D3A7363616C65592831297D7D2E736B2D70756C73657B77696474683A766172282D2D736B2D73697A';
wwv_flow_api.g_varchar2_table(27) := '65293B6865696768743A766172282D2D736B2D73697A65293B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D70756C736520312E3273';
wwv_flow_api.g_varchar2_table(28) := '20696E66696E6974652063756269632D62657A69657228302E3435352C302E30332C302E3531352C302E393535297D406B65796672616D657320736B2D70756C73657B30257B7472616E73666F726D3A7363616C652830297D313030257B7472616E7366';
wwv_flow_api.g_varchar2_table(29) := '6F726D3A7363616C652831293B6F7061636974793A307D7D2E736B2D666C6F777B77696474683A63616C6328766172282D2D736B2D73697A6529202A20312E33293B6865696768743A63616C6328766172282D2D736B2D73697A6529202A20312E33293B';
wwv_flow_api.g_varchar2_table(30) := '646973706C61793A666C65783B6A7573746966792D636F6E74656E743A73706163652D6265747765656E7D2E736B2D666C6F772D646F747B77696474683A3235253B6865696768743A3235253B6261636B67726F756E642D636F6C6F723A766172282D2D';
wwv_flow_api.g_varchar2_table(31) := '736B2D636F6C6F72293B626F726465722D7261646975733A3530253B616E696D6174696F6E3A736B2D666C6F7720312E34732063756269632D62657A69657228302E3435352C302E30332C302E3531352C302E3935352920307320696E66696E69746520';
wwv_flow_api.g_varchar2_table(32) := '626F74687D2E736B2D666C6F772D646F743A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2D302E3330737D2E736B2D666C6F772D646F743A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D302E31';
wwv_flow_api.g_varchar2_table(33) := '35737D406B65796672616D657320736B2D666C6F777B30252C3830252C313030257B7472616E73666F726D3A7363616C6528302E33297D3430257B7472616E73666F726D3A7363616C652831297D7D2E736B2D7377696E677B77696474683A766172282D';
wwv_flow_api.g_varchar2_table(34) := '2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976653B616E696D6174696F6E3A736B2D7377696E6720312E387320696E66696E697465206C696E6561727D2E736B2D7377696E672D';
wwv_flow_api.g_varchar2_table(35) := '646F747B77696474683A3435253B6865696768743A3435253B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B72696768743A303B6D617267696E3A6175746F3B6261636B67726F756E642D636F6C6F723A766172282D2D73';
wwv_flow_api.g_varchar2_table(36) := '6B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D7377696E672D646F7420327320696E66696E69746520656173652D696E2D6F75747D2E736B2D7377696E672D646F743A6E74682D6368696C642832';
wwv_flow_api.g_varchar2_table(37) := '297B746F703A6175746F3B626F74746F6D3A303B616E696D6174696F6E2D64656C61793A2D31737D406B65796672616D657320736B2D7377696E677B313030257B7472616E73666F726D3A726F7461746528333630646567297D7D406B65796672616D65';
wwv_flow_api.g_varchar2_table(38) := '7320736B2D7377696E672D646F747B30252C313030257B7472616E73666F726D3A7363616C6528302E32297D3530257B7472616E73666F726D3A7363616C652831297D7D2E736B2D636972636C657B77696474683A766172282D2D736B2D73697A65293B';
wwv_flow_api.g_varchar2_table(39) := '6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976657D2E736B2D636972636C652D646F747B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C656674';
wwv_flow_api.g_varchar2_table(40) := '3A303B746F703A307D2E736B2D636972636C652D646F743A6265666F72657B636F6E74656E743A27273B646973706C61793A626C6F636B3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D636F6C6F723A766172282D2D';
wwv_flow_api.g_varchar2_table(41) := '736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D636972636C6520312E327320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B2D636972636C652D646F743A6E74682D63';
wwv_flow_api.g_varchar2_table(42) := '68696C642831297B7472616E73666F726D3A726F74617465283330646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642832297B7472616E73666F726D3A726F74617465283630646567297D2E736B2D636972636C652D646F743A6E';
wwv_flow_api.g_varchar2_table(43) := '74682D6368696C642833297B7472616E73666F726D3A726F74617465283930646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642834297B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D636972636C652D';
wwv_flow_api.g_varchar2_table(44) := '646F743A6E74682D6368696C642835297B7472616E73666F726D3A726F7461746528313530646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642836297B7472616E73666F726D3A726F7461746528313830646567297D2E736B2D63';
wwv_flow_api.g_varchar2_table(45) := '6972636C652D646F743A6E74682D6368696C642837297B7472616E73666F726D3A726F7461746528323130646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642838297B7472616E73666F726D3A726F746174652832343064656729';
wwv_flow_api.g_varchar2_table(46) := '7D2E736B2D636972636C652D646F743A6E74682D6368696C642839297B7472616E73666F726D3A726F7461746528323730646567297D2E736B2D636972636C652D646F743A6E74682D6368696C64283130297B7472616E73666F726D3A726F7461746528';
wwv_flow_api.g_varchar2_table(47) := '333030646567297D2E736B2D636972636C652D646F743A6E74682D6368696C64283131297B7472616E73666F726D3A726F7461746528333330646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642831293A6265666F72657B616E69';
wwv_flow_api.g_varchar2_table(48) := '6D6174696F6E2D64656C61793A2D312E31737D2E736B2D636972636C652D646F743A6E74682D6368696C642832293A6265666F72657B616E696D6174696F6E2D64656C61793A2D31737D2E736B2D636972636C652D646F743A6E74682D6368696C642833';
wwv_flow_api.g_varchar2_table(49) := '293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D636972636C652D646F743A6E74682D6368696C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D636972636C652D64';
wwv_flow_api.g_varchar2_table(50) := '6F743A6E74682D6368696C642835293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D636972636C652D646F743A6E74682D6368696C642836293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E36';
wwv_flow_api.g_varchar2_table(51) := '737D2E736B2D636972636C652D646F743A6E74682D6368696C642837293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E35737D2E736B2D636972636C652D646F743A6E74682D6368696C642838293A6265666F72657B616E696D6174';
wwv_flow_api.g_varchar2_table(52) := '696F6E2D64656C61793A2D302E34737D2E736B2D636972636C652D646F743A6E74682D6368696C642839293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E33737D2E736B2D636972636C652D646F743A6E74682D6368696C64283130';
wwv_flow_api.g_varchar2_table(53) := '293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D636972636C652D646F743A6E74682D6368696C64283131293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E31737D406B65796672616D657320';
wwv_flow_api.g_varchar2_table(54) := '736B2D636972636C657B30252C3830252C313030257B7472616E73666F726D3A7363616C652830297D3430257B7472616E73666F726D3A7363616C652831297D7D2E736B2D636972636C652D666164657B77696474683A766172282D2D736B2D73697A65';
wwv_flow_api.g_varchar2_table(55) := '293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976657D2E736B2D636972636C652D666164652D646F747B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C75';
wwv_flow_api.g_varchar2_table(56) := '74653B6C6566743A303B746F703A307D2E736B2D636972636C652D666164652D646F743A6265666F72657B636F6E74656E743A27273B646973706C61793A626C6F636B3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D';
wwv_flow_api.g_varchar2_table(57) := '636F6C6F723A766172282D2D736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D636972636C652D6661646520312E327320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B';
wwv_flow_api.g_varchar2_table(58) := '2D636972636C652D666164652D646F743A6E74682D6368696C642831297B7472616E73666F726D3A726F74617465283330646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642832297B7472616E73666F726D3A726F74';
wwv_flow_api.g_varchar2_table(59) := '617465283630646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642833297B7472616E73666F726D3A726F74617465283930646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283429';
wwv_flow_api.g_varchar2_table(60) := '7B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642835297B7472616E73666F726D3A726F7461746528313530646567297D2E736B2D636972636C652D666164652D';
wwv_flow_api.g_varchar2_table(61) := '646F743A6E74682D6368696C642836297B7472616E73666F726D3A726F7461746528313830646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642837297B7472616E73666F726D3A726F7461746528323130646567297D';
wwv_flow_api.g_varchar2_table(62) := '2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642838297B7472616E73666F726D3A726F7461746528323430646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642839297B7472616E73666F726D';
wwv_flow_api.g_varchar2_table(63) := '3A726F7461746528323730646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283130297B7472616E73666F726D3A726F7461746528333030646567297D2E736B2D636972636C652D666164652D646F743A6E74682D63';
wwv_flow_api.g_varchar2_table(64) := '68696C64283131297B7472616E73666F726D3A726F7461746528333330646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642831293A6265666F72657B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D';
wwv_flow_api.g_varchar2_table(65) := '636972636C652D666164652D646F743A6E74682D6368696C642832293A6265666F72657B616E696D6174696F6E2D64656C61793A2D312E30737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642833293A6265666F72657B616E';
wwv_flow_api.g_varchar2_table(66) := '696D6174696F6E2D64656C61793A2D302E39737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D636972636C652D666164652D646F';
wwv_flow_api.g_varchar2_table(67) := '743A6E74682D6368696C642835293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642836293A6265666F72657B616E696D6174696F6E2D64656C61793A';
wwv_flow_api.g_varchar2_table(68) := '2D302E36737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642837293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E35737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283829';
wwv_flow_api.g_varchar2_table(69) := '3A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E34737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642839293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E33737D2E736B2D63697263';
wwv_flow_api.g_varchar2_table(70) := '6C652D666164652D646F743A6E74682D6368696C64283130293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283131293A6265666F72657B616E696D';
wwv_flow_api.g_varchar2_table(71) := '6174696F6E2D64656C61793A2D302E31737D406B65796672616D657320736B2D636972636C652D666164657B30252C3339252C313030257B6F7061636974793A303B7472616E73666F726D3A7363616C6528302E36297D3430257B6F7061636974793A31';
wwv_flow_api.g_varchar2_table(72) := '3B7472616E73666F726D3A7363616C652831297D7D2E736B2D677269647B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65297D2E736B2D677269642D637562657B77696474683A33332E3333253B';
wwv_flow_api.g_varchar2_table(73) := '6865696768743A33332E3333253B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B666C6F61743A6C6566743B616E696D6174696F6E3A736B2D6772696420312E337320696E66696E69746520656173652D696E2D6F75';
wwv_flow_api.g_varchar2_table(74) := '747D2E736B2D677269642D637562653A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D677269642D637562653A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D';
wwv_flow_api.g_varchar2_table(75) := '677269642D637562653A6E74682D6368696C642833297B616E696D6174696F6E2D64656C61793A2E34737D2E736B2D677269642D637562653A6E74682D6368696C642834297B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D677269642D63';
wwv_flow_api.g_varchar2_table(76) := '7562653A6E74682D6368696C642835297B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D677269642D637562653A6E74682D6368696C642836297B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D677269642D637562653A6E74';
wwv_flow_api.g_varchar2_table(77) := '682D6368696C642837297B616E696D6174696F6E2D64656C61793A30737D2E736B2D677269642D637562653A6E74682D6368696C642838297B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D677269642D637562653A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(78) := '2839297B616E696D6174696F6E2D64656C61793A2E32737D406B65796672616D657320736B2D677269647B30252C3730252C313030257B7472616E73666F726D3A7363616C65334428312C312C31297D3335257B7472616E73666F726D3A7363616C6533';
wwv_flow_api.g_varchar2_table(79) := '4428302C302C31297D7D2E736B2D666F6C647B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976653B7472616E73666F726D3A726F746174655A283435';
wwv_flow_api.g_varchar2_table(80) := '646567297D2E736B2D666F6C642D637562657B666C6F61743A6C6566743B77696474683A3530253B6865696768743A3530253B706F736974696F6E3A72656C61746976653B7472616E73666F726D3A7363616C6528312E31297D2E736B2D666F6C642D63';
wwv_flow_api.g_varchar2_table(81) := '7562653A6265666F72657B636F6E74656E743A27273B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B77696474683A313030253B6865696768743A313030253B6261636B67726F756E642D636F6C6F723A766172282D2D73';
wwv_flow_api.g_varchar2_table(82) := '6B2D636F6C6F72293B616E696D6174696F6E3A736B2D666F6C6420322E347320696E66696E697465206C696E65617220626F74683B7472616E73666F726D2D6F726967696E3A3130302520313030257D2E736B2D666F6C642D637562653A6E74682D6368';
wwv_flow_api.g_varchar2_table(83) := '696C642832297B7472616E73666F726D3A7363616C6528312E312920726F746174655A283930646567297D2E736B2D666F6C642D637562653A6E74682D6368696C642834297B7472616E73666F726D3A7363616C6528312E312920726F746174655A2831';
wwv_flow_api.g_varchar2_table(84) := '3830646567297D2E736B2D666F6C642D637562653A6E74682D6368696C642833297B7472616E73666F726D3A7363616C6528312E312920726F746174655A28323730646567297D2E736B2D666F6C642D637562653A6E74682D6368696C642832293A6265';
wwv_flow_api.g_varchar2_table(85) := '666F72657B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D666F6C642D637562653A6E74682D6368696C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2E36737D2E736B2D666F6C642D637562653A6E74682D636869';
wwv_flow_api.g_varchar2_table(86) := '6C642833293A6265666F72657B616E696D6174696F6E2D64656C61793A2E39737D406B65796672616D657320736B2D666F6C647B30252C3130257B7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D313830';
wwv_flow_api.g_varchar2_table(87) := '646567293B6F7061636974793A307D3235252C3735257B7472616E73666F726D3A70657273706563746976652831343070782920726F74617465582830293B6F7061636974793A317D3930252C313030257B7472616E73666F726D3A7065727370656374';
wwv_flow_api.g_varchar2_table(88) := '6976652831343070782920726F746174655928313830646567293B6F7061636974793A307D7D2E736B2D77616E6465727B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E';
wwv_flow_api.g_varchar2_table(89) := '3A72656C61746976657D2E736B2D77616E6465722D637562657B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B77696474683A3230253B6865696768743A3230253B706F736974696F6E3A6162736F6C7574653B746F';
wwv_flow_api.g_varchar2_table(90) := '703A303B6C6566743A303B2D2D736B2D77616E6465722D64697374616E63653A63616C6328766172282D2D736B2D73697A6529202A20302E3735293B616E696D6174696F6E3A736B2D77616E64657220322E307320656173652D696E2D6F7574202D322E';
wwv_flow_api.g_varchar2_table(91) := '307320696E66696E69746520626F74687D2E736B2D77616E6465722D637562653A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D302E35737D2E736B2D77616E6465722D637562653A6E74682D6368696C642833297B616E69';
wwv_flow_api.g_varchar2_table(92) := '6D6174696F6E2D64656C61793A2D312E30737D406B65796672616D657320736B2D77616E6465727B30257B7472616E73666F726D3A726F746174652830297D3235257B7472616E73666F726D3A7472616E736C6174655828766172282D2D736B2D77616E';
wwv_flow_api.g_varchar2_table(93) := '6465722D64697374616E6365292920726F74617465282D393064656729207363616C6528302E36297D3530257B7472616E73666F726D3A7472616E736C6174655828766172282D2D736B2D77616E6465722D64697374616E63652929207472616E736C61';
wwv_flow_api.g_varchar2_table(94) := '74655928766172282D2D736B2D77616E6465722D64697374616E6365292920726F74617465282D313739646567297D35302E31257B7472616E73666F726D3A7472616E736C6174655828766172282D2D736B2D77616E6465722D64697374616E63652929';
wwv_flow_api.g_varchar2_table(95) := '207472616E736C6174655928766172282D2D736B2D77616E6465722D64697374616E6365292920726F74617465282D313830646567297D3735257B7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928766172282D2D';
wwv_flow_api.g_varchar2_table(96) := '736B2D77616E6465722D64697374616E6365292920726F74617465282D32373064656729207363616C6528302E36297D313030257B7472616E73666F726D3A726F74617465282D333630646567297D7D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(89783794378595350)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'css/spinkit.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E616F702D50726F63657373696E677B7A2D696E6465783A39393939393939397D2E742D427574746F6E202E616F702D50726F63657373696E677B2D2D736B2D73697A653A766172282D2D612D627574746F6E2D666F6E742D73697A652C203230707829';
wwv_flow_api.g_varchar2_table(2) := '7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(89784132171593868)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'css/spinkit-aop.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2866756E6374696F6E28742C65297B226F626A656374223D3D747970656F66206578706F727473262622756E646566696E656422213D747970656F66206D6F64756C653F6D6F64756C652E6578706F7274733D6528293A2266756E6374696F6E223D3D74';
wwv_flow_api.g_varchar2_table(2) := '7970656F6620646566696E652626646566696E652E616D643F646566696E652865293A742E45533650726F6D6973653D6528297D2928746869732C66756E6374696F6E28297B2275736520737472696374223B66756E6374696F6E20742874297B766172';
wwv_flow_api.g_varchar2_table(3) := '20653D747970656F6620743B72657475726E206E756C6C213D3D74262628226F626A656374223D3D3D657C7C2266756E6374696F6E223D3D3D65297D66756E6374696F6E20652874297B72657475726E2266756E6374696F6E223D3D747970656F662074';
wwv_flow_api.g_varchar2_table(4) := '7D66756E6374696F6E206E2874297B423D747D66756E6374696F6E20722874297B473D747D66756E6374696F6E206F28297B72657475726E2066756E6374696F6E28297B72657475726E2070726F636573732E6E6578745469636B2861297D7D66756E63';
wwv_flow_api.g_varchar2_table(5) := '74696F6E206928297B72657475726E22756E646566696E656422213D747970656F66207A3F66756E6374696F6E28297B7A2861297D3A6328297D66756E6374696F6E207328297B76617220743D302C653D6E6577204A2861292C6E3D646F63756D656E74';
wwv_flow_api.g_varchar2_table(6) := '2E637265617465546578744E6F6465282222293B72657475726E20652E6F627365727665286E2C7B636861726163746572446174613A21307D292C66756E6374696F6E28297B6E2E646174613D743D2B2B7425327D7D66756E6374696F6E207528297B76';
wwv_flow_api.g_varchar2_table(7) := '617220743D6E6577204D6573736167654368616E6E656C3B72657475726E20742E706F7274312E6F6E6D6573736167653D612C66756E6374696F6E28297B72657475726E20742E706F7274322E706F73744D6573736167652830297D7D66756E6374696F';
wwv_flow_api.g_varchar2_table(8) := '6E206328297B76617220743D73657454696D656F75743B72657475726E2066756E6374696F6E28297B72657475726E207428612C31297D7D66756E6374696F6E206128297B666F722876617220743D303B743C573B742B3D32297B76617220653D565B74';
wwv_flow_api.g_varchar2_table(9) := '5D2C6E3D565B742B315D3B65286E292C565B745D3D766F696420302C565B742B315D3D766F696420307D573D307D66756E6374696F6E206628297B7472797B76617220743D46756E6374696F6E282272657475726E2074686973222928292E7265717569';
wwv_flow_api.g_varchar2_table(10) := '72652822766572747822293B72657475726E207A3D742E72756E4F6E4C6F6F707C7C742E72756E4F6E436F6E746578742C6928297D63617463682874297B72657475726E206328297D7D66756E6374696F6E206C28742C65297B766172206E3D74686973';
wwv_flow_api.g_varchar2_table(11) := '2C723D6E657720746869732E636F6E7374727563746F722870293B766F696420303D3D3D725B5A5D26264F2872293B766172206F3D6E2E5F73746174653B6966286F297B76617220693D617267756D656E74735B6F2D315D3B472866756E6374696F6E28';
wwv_flow_api.g_varchar2_table(12) := '297B72657475726E2050286F2C722C692C6E2E5F726573756C74297D297D656C73652045286E2C722C742C65293B72657475726E20727D66756E6374696F6E20682874297B76617220653D746869733B696628742626226F626A656374223D3D74797065';
wwv_flow_api.g_varchar2_table(13) := '6F6620742626742E636F6E7374727563746F723D3D3D652972657475726E20743B766172206E3D6E657720652870293B72657475726E2067286E2C74292C6E7D66756E6374696F6E207028297B7D66756E6374696F6E207628297B72657475726E206E65';
wwv_flow_api.g_varchar2_table(14) := '7720547970654572726F722822596F752063616E6E6F74207265736F6C766520612070726F6D697365207769746820697473656C6622297D66756E6374696F6E206428297B72657475726E206E657720547970654572726F722822412070726F6D697365';
wwv_flow_api.g_varchar2_table(15) := '732063616C6C6261636B2063616E6E6F742072657475726E20746861742073616D652070726F6D6973652E22297D66756E6374696F6E205F2874297B7472797B72657475726E20742E7468656E7D63617463682874297B72657475726E206E742E657272';
wwv_flow_api.g_varchar2_table(16) := '6F723D742C6E747D7D66756E6374696F6E207928742C652C6E2C72297B7472797B742E63616C6C28652C6E2C72297D63617463682874297B72657475726E20747D7D66756E6374696F6E206D28742C652C6E297B472866756E6374696F6E2874297B7661';
wwv_flow_api.g_varchar2_table(17) := '7220723D21312C6F3D79286E2C652C66756E6374696F6E286E297B727C7C28723D21302C65213D3D6E3F6728742C6E293A5328742C6E29297D2C66756E6374696F6E2865297B727C7C28723D21302C6A28742C6529297D2C22536574746C653A20222B28';
wwv_flow_api.g_varchar2_table(18) := '742E5F6C6162656C7C7C2220756E6B6E6F776E2070726F6D6973652229293B217226266F262628723D21302C6A28742C6F29297D2C74297D66756E6374696F6E206228742C65297B652E5F73746174653D3D3D74743F5328742C652E5F726573756C7429';
wwv_flow_api.g_varchar2_table(19) := '3A652E5F73746174653D3D3D65743F6A28742C652E5F726573756C74293A4528652C766F696420302C66756E6374696F6E2865297B72657475726E206728742C65297D2C66756E6374696F6E2865297B72657475726E206A28742C65297D297D66756E63';
wwv_flow_api.g_varchar2_table(20) := '74696F6E207728742C6E2C72297B6E2E636F6E7374727563746F723D3D3D742E636F6E7374727563746F722626723D3D3D6C26266E2E636F6E7374727563746F722E7265736F6C76653D3D3D683F6228742C6E293A723D3D3D6E743F286A28742C6E742E';
wwv_flow_api.g_varchar2_table(21) := '6572726F72292C6E742E6572726F723D6E756C6C293A766F696420303D3D3D723F5328742C6E293A652872293F6D28742C6E2C72293A5328742C6E297D66756E6374696F6E206728652C6E297B653D3D3D6E3F6A28652C762829293A74286E293F772865';
wwv_flow_api.g_varchar2_table(22) := '2C6E2C5F286E29293A5328652C6E297D66756E6374696F6E20412874297B742E5F6F6E6572726F722626742E5F6F6E6572726F7228742E5F726573756C74292C542874297D66756E6374696F6E205328742C65297B742E5F73746174653D3D3D24262628';
wwv_flow_api.g_varchar2_table(23) := '742E5F726573756C743D652C742E5F73746174653D74742C30213D3D742E5F73756273637269626572732E6C656E67746826264728542C7429297D66756E6374696F6E206A28742C65297B742E5F73746174653D3D3D24262628742E5F73746174653D65';
wwv_flow_api.g_varchar2_table(24) := '742C742E5F726573756C743D652C4728412C7429297D66756E6374696F6E204528742C652C6E2C72297B766172206F3D742E5F73756273637269626572732C693D6F2E6C656E6774683B742E5F6F6E6572726F723D6E756C6C2C6F5B695D3D652C6F5B69';
wwv_flow_api.g_varchar2_table(25) := '2B74745D3D6E2C6F5B692B65745D3D722C303D3D3D692626742E5F737461746526264728542C74297D66756E6374696F6E20542874297B76617220653D742E5F73756273637269626572732C6E3D742E5F73746174653B69662830213D3D652E6C656E67';
wwv_flow_api.g_varchar2_table(26) := '7468297B666F722876617220723D766F696420302C6F3D766F696420302C693D742E5F726573756C742C733D303B733C652E6C656E6774683B732B3D3329723D655B735D2C6F3D655B732B6E5D2C723F50286E2C722C6F2C69293A6F2869293B742E5F73';
wwv_flow_api.g_varchar2_table(27) := '756273637269626572732E6C656E6774683D307D7D66756E6374696F6E204D28742C65297B7472797B72657475726E20742865297D63617463682874297B72657475726E206E742E6572726F723D742C6E747D7D66756E6374696F6E205028742C6E2C72';
wwv_flow_api.g_varchar2_table(28) := '2C6F297B76617220693D652872292C733D766F696420302C753D766F696420302C633D766F696420302C613D766F696420303B69662869297B696628733D4D28722C6F292C733D3D3D6E743F28613D21302C753D732E6572726F722C732E6572726F723D';
wwv_flow_api.g_varchar2_table(29) := '6E756C6C293A633D21302C6E3D3D3D732972657475726E20766F6964206A286E2C642829297D656C736520733D6F2C633D21303B6E2E5F7374617465213D3D247C7C28692626633F67286E2C73293A613F6A286E2C75293A743D3D3D74743F53286E2C73';
wwv_flow_api.g_varchar2_table(30) := '293A743D3D3D657426266A286E2C7329297D66756E6374696F6E207828742C65297B7472797B652866756E6374696F6E2865297B6728742C65297D2C66756E6374696F6E2865297B6A28742C65297D297D63617463682865297B6A28742C65297D7D6675';
wwv_flow_api.g_varchar2_table(31) := '6E6374696F6E204328297B72657475726E2072742B2B7D66756E6374696F6E204F2874297B745B5A5D3D72742B2B2C742E5F73746174653D766F696420302C742E5F726573756C743D766F696420302C742E5F73756273637269626572733D5B5D7D6675';
wwv_flow_api.g_varchar2_table(32) := '6E6374696F6E206B28297B72657475726E206E6577204572726F7228224172726179204D6574686F6473206D7573742062652070726F766964656420616E20417272617922297D66756E6374696F6E20462874297B72657475726E206E6577206F742874';
wwv_flow_api.g_varchar2_table(33) := '6869732C74292E70726F6D6973657D66756E6374696F6E20592874297B76617220653D746869733B72657475726E206E6577206528552874293F66756E6374696F6E286E2C72297B666F7228766172206F3D742E6C656E6774682C693D303B693C6F3B69';
wwv_flow_api.g_varchar2_table(34) := '2B2B29652E7265736F6C766528745B695D292E7468656E286E2C72297D3A66756E6374696F6E28742C65297B72657475726E2065286E657720547970654572726F722822596F75206D757374207061737320616E20617272617920746F20726163652E22';
wwv_flow_api.g_varchar2_table(35) := '29297D297D66756E6374696F6E20712874297B76617220653D746869732C6E3D6E657720652870293B72657475726E206A286E2C74292C6E7D66756E6374696F6E204428297B7468726F77206E657720547970654572726F722822596F75206D75737420';
wwv_flow_api.g_varchar2_table(36) := '706173732061207265736F6C7665722066756E6374696F6E2061732074686520666972737420617267756D656E7420746F207468652070726F6D69736520636F6E7374727563746F7222297D66756E6374696F6E204B28297B7468726F77206E65772054';
wwv_flow_api.g_varchar2_table(37) := '7970654572726F7228224661696C656420746F20636F6E737472756374202750726F6D697365273A20506C65617365207573652074686520276E657727206F70657261746F722C2074686973206F626A65637420636F6E7374727563746F722063616E6E';
wwv_flow_api.g_varchar2_table(38) := '6F742062652063616C6C656420617320612066756E6374696F6E2E22297D66756E6374696F6E204C28297B76617220743D766F696420303B69662822756E646566696E656422213D747970656F6620676C6F62616C29743D676C6F62616C3B656C736520';
wwv_flow_api.g_varchar2_table(39) := '69662822756E646566696E656422213D747970656F662073656C6629743D73656C663B656C7365207472797B743D46756E6374696F6E282272657475726E2074686973222928297D63617463682874297B7468726F77206E6577204572726F722822706F';
wwv_flow_api.g_varchar2_table(40) := '6C7966696C6C206661696C6564206265636175736520676C6F62616C206F626A65637420697320756E617661696C61626C6520696E207468697320656E7669726F6E6D656E7422297D76617220653D742E50726F6D6973653B69662865297B766172206E';
wwv_flow_api.g_varchar2_table(41) := '3D6E756C6C3B7472797B6E3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C28652E7265736F6C76652829297D63617463682874297B7D696628225B6F626A6563742050726F6D6973655D223D3D3D6E262621652E63617374';
wwv_flow_api.g_varchar2_table(42) := '2972657475726E7D742E50726F6D6973653D69747D766172204E3D766F696420303B4E3D41727261792E697341727261793F41727261792E697341727261793A66756E6374696F6E2874297B72657475726E225B6F626A6563742041727261795D223D3D';
wwv_flow_api.g_varchar2_table(43) := '3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C2874297D3B76617220553D4E2C573D302C7A3D766F696420302C423D766F696420302C473D66756E6374696F6E28742C65297B565B575D3D742C565B572B315D3D652C572B';
wwv_flow_api.g_varchar2_table(44) := '3D322C323D3D3D57262628423F422861293A582829297D2C483D22756E646566696E656422213D747970656F662077696E646F773F77696E646F773A766F696420302C493D487C7C7B7D2C4A3D492E4D75746174696F6E4F627365727665727C7C492E57';
wwv_flow_api.g_varchar2_table(45) := '65624B69744D75746174696F6E4F627365727665722C513D22756E646566696E6564223D3D747970656F662073656C66262622756E646566696E656422213D747970656F662070726F636573732626225B6F626A6563742070726F636573735D223D3D3D';
wwv_flow_api.g_varchar2_table(46) := '7B7D2E746F537472696E672E63616C6C2870726F63657373292C523D22756E646566696E656422213D747970656F662055696E7438436C616D7065644172726179262622756E646566696E656422213D747970656F6620696D706F727453637269707473';
wwv_flow_api.g_varchar2_table(47) := '262622756E646566696E656422213D747970656F66204D6573736167654368616E6E656C2C563D6E657720417272617928316533292C583D766F696420303B583D513F6F28293A4A3F7328293A523F7528293A766F696420303D3D3D4826262266756E63';
wwv_flow_api.g_varchar2_table(48) := '74696F6E223D3D747970656F6620726571756972653F6628293A6328293B766172205A3D4D6174682E72616E646F6D28292E746F537472696E67283336292E737562737472696E672832292C243D766F696420302C74743D312C65743D322C6E743D7B65';
wwv_flow_api.g_varchar2_table(49) := '72726F723A6E756C6C7D2C72743D302C6F743D66756E6374696F6E28297B66756E6374696F6E207428742C65297B746869732E5F696E7374616E6365436F6E7374727563746F723D742C746869732E70726F6D6973653D6E657720742870292C74686973';
wwv_flow_api.g_varchar2_table(50) := '2E70726F6D6973655B5A5D7C7C4F28746869732E70726F6D697365292C552865293F28746869732E6C656E6774683D652E6C656E6774682C746869732E5F72656D61696E696E673D652E6C656E6774682C746869732E5F726573756C743D6E6577204172';
wwv_flow_api.g_varchar2_table(51) := '72617928746869732E6C656E677468292C303D3D3D746869732E6C656E6774683F5328746869732E70726F6D6973652C746869732E5F726573756C74293A28746869732E6C656E6774683D746869732E6C656E6774687C7C302C746869732E5F656E756D';
wwv_flow_api.g_varchar2_table(52) := '65726174652865292C303D3D3D746869732E5F72656D61696E696E6726265328746869732E70726F6D6973652C746869732E5F726573756C742929293A6A28746869732E70726F6D6973652C6B2829297D72657475726E20742E70726F746F747970652E';
wwv_flow_api.g_varchar2_table(53) := '5F656E756D65726174653D66756E6374696F6E2874297B666F722876617220653D303B746869732E5F73746174653D3D3D242626653C742E6C656E6774683B652B2B29746869732E5F65616368456E74727928745B655D2C65297D2C742E70726F746F74';
wwv_flow_api.g_varchar2_table(54) := '7970652E5F65616368456E7472793D66756E6374696F6E28742C65297B766172206E3D746869732E5F696E7374616E6365436F6E7374727563746F722C723D6E2E7265736F6C76653B696628723D3D3D68297B766172206F3D5F2874293B6966286F3D3D';
wwv_flow_api.g_varchar2_table(55) := '3D6C2626742E5F7374617465213D3D2429746869732E5F736574746C6564417428742E5F73746174652C652C742E5F726573756C74293B656C7365206966282266756E6374696F6E22213D747970656F66206F29746869732E5F72656D61696E696E672D';
wwv_flow_api.g_varchar2_table(56) := '2D2C746869732E5F726573756C745B655D3D743B656C7365206966286E3D3D3D6974297B76617220693D6E6577206E2870293B7728692C742C6F292C746869732E5F77696C6C536574746C65417428692C65297D656C736520746869732E5F77696C6C53';
wwv_flow_api.g_varchar2_table(57) := '6574746C654174286E6577206E2866756E6374696F6E2865297B72657475726E20652874297D292C65297D656C736520746869732E5F77696C6C536574746C65417428722874292C65297D2C742E70726F746F747970652E5F736574746C656441743D66';
wwv_flow_api.g_varchar2_table(58) := '756E6374696F6E28742C652C6E297B76617220723D746869732E70726F6D6973653B722E5F73746174653D3D3D24262628746869732E5F72656D61696E696E672D2D2C743D3D3D65743F6A28722C6E293A746869732E5F726573756C745B655D3D6E292C';
wwv_flow_api.g_varchar2_table(59) := '303D3D3D746869732E5F72656D61696E696E6726265328722C746869732E5F726573756C74297D2C742E70726F746F747970652E5F77696C6C536574746C6541743D66756E6374696F6E28742C65297B766172206E3D746869733B4528742C766F696420';
wwv_flow_api.g_varchar2_table(60) := '302C66756E6374696F6E2874297B72657475726E206E2E5F736574746C656441742874742C652C74297D2C66756E6374696F6E2874297B72657475726E206E2E5F736574746C656441742865742C652C74297D297D2C747D28292C69743D66756E637469';
wwv_flow_api.g_varchar2_table(61) := '6F6E28297B66756E6374696F6E20742865297B746869735B5A5D3D4328292C746869732E5F726573756C743D746869732E5F73746174653D766F696420302C746869732E5F73756273637269626572733D5B5D2C70213D3D652626282266756E6374696F';
wwv_flow_api.g_varchar2_table(62) := '6E22213D747970656F66206526264428292C7468697320696E7374616E63656F6620743F7828746869732C65293A4B2829297D72657475726E20742E70726F746F747970652E63617463683D66756E6374696F6E2874297B72657475726E20746869732E';
wwv_flow_api.g_varchar2_table(63) := '7468656E286E756C6C2C74297D2C742E70726F746F747970652E66696E616C6C793D66756E6374696F6E2874297B76617220653D746869732C6E3D652E636F6E7374727563746F723B72657475726E20652E7468656E2866756E6374696F6E2865297B72';
wwv_flow_api.g_varchar2_table(64) := '657475726E206E2E7265736F6C766528742829292E7468656E2866756E6374696F6E28297B72657475726E20657D297D2C66756E6374696F6E2865297B72657475726E206E2E7265736F6C766528742829292E7468656E2866756E6374696F6E28297B74';
wwv_flow_api.g_varchar2_table(65) := '68726F7720657D297D297D2C747D28293B72657475726E2069742E70726F746F747970652E7468656E3D6C2C69742E616C6C3D462C69742E726163653D592C69742E7265736F6C76653D682C69742E72656A6563743D712C69742E5F7365745363686564';
wwv_flow_api.g_varchar2_table(66) := '756C65723D6E2C69742E5F736574417361703D722C69742E5F617361703D472C69742E706F6C7966696C6C3D4C2C69742E50726F6D6973653D69742C69747D293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(89784958677591815)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'js/es6-promise.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2828293D3E7B7661722044653D4F626A6563742E646566696E6550726F70657274793B766172204B3D4F626A6563742E6765744F776E50726F706572747953796D626F6C733B7661722075653D4F626A6563742E70726F746F747970652E6861734F776E';
wwv_flow_api.g_varchar2_table(2) := '50726F70657274792C6D653D4F626A6563742E70726F746F747970652E70726F70657274794973456E756D657261626C653B7661722070653D28652C742C61293D3E7420696E20653F446528652C742C7B656E756D657261626C653A21302C636F6E6669';
wwv_flow_api.g_varchar2_table(3) := '67757261626C653A21302C7772697461626C653A21302C76616C75653A617D293A655B745D3D612C553D28652C74293D3E7B666F7228766172206120696E20747C7C28743D7B7D292975652E63616C6C28742C61292626706528652C612C745B615D293B';
wwv_flow_api.g_varchar2_table(4) := '6966284B29666F72287661722061206F66204B287429296D652E63616C6C28742C61292626706528652C612C745B615D293B72657475726E20657D3B7661722068653D28652C74293D3E7B76617220613D7B7D3B666F7228766172206320696E20652975';
wwv_flow_api.g_varchar2_table(5) := '652E63616C6C28652C63292626742E696E6465784F662863293C30262628615B635D3D655B635D293B69662865213D6E756C6C26264B29666F72287661722063206F66204B28652929742E696E6465784F662863293C3026266D652E63616C6C28652C63';
wwv_flow_api.g_varchar2_table(6) := '29262628615B635D3D655B635D293B72657475726E20617D3B76617220683D28652C742C61293D3E6E65772050726F6D6973652828632C73293D3E7B766172206E3D6F3D3E7B7472797B6C28612E6E657874286F29297D63617463682872297B73287229';
wwv_flow_api.g_varchar2_table(7) := '7D7D2C693D6F3D3E7B7472797B6C28612E7468726F77286F29297D63617463682872297B732872297D7D2C6C3D6F3D3E6F2E646F6E653F63286F2E76616C7565293A50726F6D6973652E7265736F6C7665286F2E76616C7565292E7468656E286E2C6929';
wwv_flow_api.g_varchar2_table(8) := '3B6C2828613D612E6170706C7928652C7429292E6E6578742829297D293B76617220663D7B696D6167653A6E6577204D61702C6261636B67726F756E643A6E6577204D61702C7265736F757263653A6E6577204D61702C64656661756C745374796C653A';
wwv_flow_api.g_varchar2_table(9) := '6E6577204D61702C626173655374796C653A6E6577204D61702C636F6D70757465645374796C653A6E6577205765616B4D61702C666F6E743A6E6577205365742C736E617073686F743A6E6577205765616B4D61702C736E617073686F744B65793A6E65';
wwv_flow_api.g_varchar2_table(10) := '77204D61702C7072655374796C654D61703A6E6577204D61702C7072655374796C653A6E6577205765616B4D61702C7072654E6F64654D61703A6E6577204D61702C72657365743A6A657D3B66756E6374696F6E206A6528297B662E636F6D7075746564';
wwv_flow_api.g_varchar2_table(11) := '5374796C653D6E6577205765616B4D61702C662E736E617073686F743D6E6577205765616B4D61702C662E736E617073686F744B65792E636C65617228292C662E7072655374796C654D61702E636C65617228292C662E7072655374796C653D6E657720';
wwv_flow_api.g_varchar2_table(12) := '5765616B4D61702C662E7072654E6F64654D61702E636C65617228297D7661722057653D5B22646976222C227370616E222C2270222C2261222C22696D67222C22756C222C226C69222C22627574746F6E222C22696E707574222C2273656C656374222C';
wwv_flow_api.g_varchar2_table(13) := '227465787461726561222C226C6162656C222C2273656374696F6E222C2261727469636C65222C22686561646572222C22666F6F746572222C226E6176222C226D61696E222C226173696465222C226831222C226832222C226833222C226834222C2268';
wwv_flow_api.g_varchar2_table(14) := '35222C226836222C22737667222C2270617468222C22636972636C65222C2272656374222C226C696E65222C2267222C227461626C65222C227468656164222C2274626F6479222C227472222C227464222C227468225D3B66756E6374696F6E20676528';
wwv_flow_api.g_varchar2_table(15) := '297B666F72286C65742065206F662057652979652865297D66756E6374696F6E2079652865297B696628662E64656661756C745374796C652E6861732865292972657475726E20662E64656661756C745374796C652E6765742865293B6966286E657720';
wwv_flow_api.g_varchar2_table(16) := '536574285B22736372697074222C227374796C65222C226D657461222C226C696E6B222C226E6F736372697074222C2274656D706C617465225D292E686173286529297B6C657420693D7B7D3B72657475726E20662E64656661756C745374796C652E73';
wwv_flow_api.g_varchar2_table(17) := '657428652C69292C697D6C657420613D646F63756D656E742E676574456C656D656E74427949642822736E6170646F6D2D73616E64626F7822293B617C7C28613D646F63756D656E742E637265617465456C656D656E74282264697622292C612E69643D';
wwv_flow_api.g_varchar2_table(18) := '22736E6170646F6D2D73616E64626F78222C612E7374796C652E706F736974696F6E3D226162736F6C757465222C612E7374796C652E6C6566743D222D393939397078222C612E7374796C652E746F703D222D393939397078222C612E7374796C652E77';
wwv_flow_api.g_varchar2_table(19) := '696474683D2230222C612E7374796C652E6865696768743D2230222C612E7374796C652E6F766572666C6F773D2268696464656E222C646F63756D656E742E626F64792E617070656E644368696C64286129293B6C657420633D646F63756D656E742E63';
wwv_flow_api.g_varchar2_table(20) := '7265617465456C656D656E742865293B632E7374796C652E616C6C3D22696E697469616C222C612E617070656E644368696C642863293B6C657420733D676574436F6D70757465645374796C652863292C6E3D7B7D3B666F72286C65742069206F662073';
wwv_flow_api.g_varchar2_table(21) := '296E5B695D3D732E67657450726F706572747956616C75652869293B72657475726E20612E72656D6F76654368696C642863292C662E64656661756C745374796C652E73657428652C6E292C6E7D66756E6374696F6E204F28652C742C613D2131297B6C';
wwv_flow_api.g_varchar2_table(22) := '657420633D5B5D2C733D79652874293B666F72286C65745B6E2C695D6F66204F626A6563742E656E747269657328652929696628216129692626632E707573682860247B6E7D3A247B697D60293B656C73657B6C6574206C3D735B6E5D3B69262669213D';
wwv_flow_api.g_varchar2_table(23) := '3D6C2626632E707573682860247B6E7D3A247B697D60297D72657475726E20632E736F727428292E6A6F696E28223B22297D66756E6374696F6E2077652865297B6C657420743D6E6577205365743B72657475726E20652E6E6F646554797065213D3D4E';
wwv_flow_api.g_varchar2_table(24) := '6F64652E454C454D454E545F4E4F44452626652E6E6F646554797065213D3D4E6F64652E444F43554D454E545F465241474D454E545F4E4F44453F5B5D3A28652E7461674E616D652626742E61646428652E7461674E616D652E746F4C6F776572436173';
wwv_flow_api.g_varchar2_table(25) := '652829292C747970656F6620652E717565727953656C6563746F72416C6C3D3D2266756E6374696F6E222626652E717565727953656C6563746F72416C6C28222A22292E666F724561636828613D3E742E61646428612E7461674E616D652E746F4C6F77';
wwv_flow_api.g_varchar2_table(26) := '657243617365282929292C41727261792E66726F6D287429297D66756E6374696F6E2078652865297B6C657420743D6E6577204D61703B666F72286C65742063206F662065297B6C657420733D662E64656661756C745374796C652E6765742863293B69';
wwv_flow_api.g_varchar2_table(27) := '6628217329636F6E74696E75653B6C6574206E3D4F626A6563742E656E74726965732873292E6D617028285B692C6C5D293D3E60247B697D3A247B6C7D3B60292E736F727428292E6A6F696E282222293B742E686173286E297C7C742E736574286E2C5B';
wwv_flow_api.g_varchar2_table(28) := '5D292C742E676574286E292E707573682863297D6C657420613D22223B666F72286C65745B632C735D6F6620742E656E7472696573282929612B3D60247B732E6A6F696E28222C22297D207B20247B637D207D0A603B72657475726E20617D66756E6374';
wwv_flow_api.g_varchar2_table(29) := '696F6E20536528297B6C657420653D6E65772053657428662E7072655374796C654D61702E76616C7565732829292C743D6E6577204D61702C613D313B666F72286C65742063206F66206529742E73657428632C6063247B612B2B7D60293B7265747572';
wwv_flow_api.g_varchar2_table(30) := '6E20747D66756E6374696F6E20422861297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A28652C743D7B7D297B6C657420633D5F2865292C733D2F5E2828726570656174696E672D293F286C696E6561727C726164';
wwv_flow_api.g_varchar2_table(31) := '69616C7C636F6E6963292D6772616469656E74295C282F692E746573742865293B69662863297B6C6574206E3D592863293B696628662E6261636B67726F756E642E686173286E292972657475726E20742E736B6970496E6C696E653F766F696420303A';
wwv_flow_api.g_varchar2_table(32) := '6075726C28247B662E6261636B67726F756E642E676574286E297D29603B7B6C657420693D7969656C642050286E2C7B75736550726F78793A742E75736550726F78797D293B72657475726E20662E6261636B67726F756E642E736574286E2C69292C74';
wwv_flow_api.g_varchar2_table(33) := '2E736B6970496E6C696E653F766F696420303A6075726C2822247B697D2229607D7D72657475726E20657D297D66756E6374696F6E204428652C7B666173743A743D21317D3D7B7D297B696628742972657475726E206528293B22726571756573744964';
wwv_flow_api.g_varchar2_table(34) := '6C6543616C6C6261636B22696E2077696E646F773F7265717565737449646C6543616C6C6261636B28652C7B74696D656F75743A35307D293A73657454696D656F757428652C31297D66756E6374696F6E204E28652C743D6E756C6C297B696628212865';
wwv_flow_api.g_varchar2_table(35) := '20696E7374616E63656F6620456C656D656E74292972657475726E2077696E646F772E676574436F6D70757465645374796C6528652C74293B6C657420613D662E636F6D70757465645374796C652E6765742865293B696628617C7C28613D6E6577204D';
wwv_flow_api.g_varchar2_table(36) := '61702C662E636F6D70757465645374796C652E73657428652C6129292C21612E686173287429297B6C657420633D77696E646F772E676574436F6D70757465645374796C6528652C74293B612E73657428742C63297D72657475726E20612E6765742874';
wwv_flow_api.g_varchar2_table(37) := '297D66756E6374696F6E2062652865297B6C657420743D652E7265706C616365282F5E5B27225D7C5B27225D242F672C2222293B696628742E7374617274735769746828225C5C2229297472797B72657475726E20537472696E672E66726F6D43686172';
wwv_flow_api.g_varchar2_table(38) := '436F6465287061727365496E7428742E7265706C61636528225C5C222C2222292C313629297D63617463682861297B72657475726E20747D72657475726E20747D66756E6374696F6E205F2865297B6C657420743D652E6D61746368282F75726C5C2828';
wwv_flow_api.g_varchar2_table(39) := '5B27225D3F29282E2A3F29285C31295C292F293B69662821742972657475726E206E756C6C3B6C657420613D745B325D2E7472696D28293B72657475726E20612E7374617274735769746828222322293F6E756C6C3A617D66756E6374696F6E20502865';
wwv_flow_api.g_varchar2_table(40) := '2C7B74696D656F75743A743D3365332C75736550726F78793A613D22227D3D7B7D297B66756E6374696F6E2063286F297B7472797B72657475726E206E65772055524C286F2C77696E646F772E6C6F636174696F6E2E68726566292E6F726967696E3D3D';
wwv_flow_api.g_varchar2_table(41) := '3D77696E646F772E6C6F636174696F6E2E6F726967696E3F227573652D63726564656E7469616C73223A22616E6F6E796D6F7573227D63617463682872297B72657475726E22616E6F6E796D6F7573227D7D66756E6374696F6E2073286F297B72657475';
wwv_flow_api.g_varchar2_table(42) := '726E206828746869732C6E756C6C2C66756E6374696F6E2A28297B6C657420723D643D3E666574636828642C7B6D6F64653A22636F7273222C63726564656E7469616C733A632864293D3D3D227573652D63726564656E7469616C73223F22696E636C75';
wwv_flow_api.g_varchar2_table(43) := '6465223A226F6D6974227D292E7468656E28703D3E702E626C6F622829292E7468656E28703D3E6E65772050726F6D69736528286D2C75293D3E7B6C657420793D6E65772046696C655265616465723B792E6F6E6C6F6164656E643D28293D3E7B6C6574';
wwv_flow_api.g_varchar2_table(44) := '20773D792E726573756C743B696628747970656F662077213D22737472696E67227C7C21772E737461727473576974682822646174613A696D6167652F2229297B75286E6577204572726F722822496E76616C696420696D61676520646174612055524C';
wwv_flow_api.g_varchar2_table(45) := '2229293B72657475726E7D6D2877297D2C792E6F6E6572726F723D28293D3E75286E6577204572726F72282246696C65526561646572206572726F722229292C792E7265616441734461746155524C2870297D29293B7472797B72657475726E20796965';
wwv_flow_api.g_varchar2_table(46) := '6C642072286F297D63617463682864297B696628612626747970656F6620613D3D22737472696E6722297B6C657420703D612E7265706C616365282F5C2F242F2C2222292B59286F293B7472797B72657475726E207969656C6420722870297D63617463';
wwv_flow_api.g_varchar2_table(47) := '68286D297B7468726F77206E6577204572726F7228225B536E6170444F4D202D206665746368496D6167655D20434F5253207265737472696374696F6E732070726576656E74656420696D616765206361707475726520286576656E207669612070726F';
wwv_flow_api.g_varchar2_table(48) := '78792922297D7D656C7365207468726F77206E6577204572726F7228225B536E6170444F4D202D206665746368496D6167655D2046657463682066616C6C6261636B206661696C656420616E64206E6F2070726F78792070726F766964656422297D7D29';
wwv_flow_api.g_varchar2_table(49) := '7D6C6574206E3D632865293B72657475726E20662E696D6167652E6861732865293F50726F6D6973652E7265736F6C766528662E696D6167652E676574286529293A652E737461727473576974682822646174613A696D6167652F22293F28662E696D61';
wwv_flow_api.g_varchar2_table(50) := '67652E73657428652C65292C50726F6D6973652E7265736F6C7665286529293A2F5C2E737667285C3F2E2A293F242F692E746573742865293F68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B7472797B6C657420723D7969656C6428796965';
wwv_flow_api.g_varchar2_table(51) := '6C6420666574636828652C7B6D6F64653A22636F7273222C63726564656E7469616C733A6E3D3D3D227573652D63726564656E7469616C73223F22696E636C756465223A226F6D6974227D29292E7465787428292C643D60646174613A696D6167652F73';
wwv_flow_api.g_varchar2_table(52) := '76672B786D6C3B636861727365743D7574662D382C247B656E636F6465555249436F6D706F6E656E742872297D603B72657475726E20662E696D6167652E73657428652C64292C647D6361746368286F297B72657475726E20732865297D7D293A6E6577';
wwv_flow_api.g_varchar2_table(53) := '2050726F6D69736528286F2C72293D3E7B6C657420643D73657454696D656F75742828293D3E7B72286E6577204572726F7228225B536E6170444F4D202D206665746368496D6167655D20496D616765206C6F61642074696D6564206F75742229297D2C';
wwv_flow_api.g_varchar2_table(54) := '74292C703D6E657720496D6167653B702E63726F73734F726967696E3D6E2C702E6F6E6C6F61643D28293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B636C65617254696D656F75742864293B7472797B7969656C6420702E6465636F';
wwv_flow_api.g_varchar2_table(55) := '646528293B6C6574206D3D646F63756D656E742E637265617465456C656D656E74282263616E76617322293B6D2E77696474683D702E77696474682C6D2E6865696768743D702E6865696768742C6D2E676574436F6E746578742822326422292E647261';
wwv_flow_api.g_varchar2_table(56) := '77496D61676528702C302C302C6D2E77696474682C6D2E686569676874293B6C657420793D6D2E746F4461746155524C2822696D6167652F706E6722293B662E696D6167652E73657428652C79292C6F2879297D6361746368286D297B7472797B6C6574';
wwv_flow_api.g_varchar2_table(57) := '20753D7969656C6420732865293B662E696D6167652E73657428652C75292C6F2875297D63617463682875297B722875297D7D7D292C702E6F6E6572726F723D28293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B636C65617254696D';
wwv_flow_api.g_varchar2_table(58) := '656F75742864292C636F6E736F6C652E6572726F7228605B536E6170444F4D202D206665746368496D6167655D20496D616765206661696C656420746F206C6F61643A20247B657D60293B7472797B6C6574206D3D7969656C6420732865293B662E696D';
wwv_flow_api.g_varchar2_table(59) := '6167652E73657428652C6D292C6F286D297D6361746368286D297B72286D297D7D292C702E7372633D657D297D66756E6374696F6E206F652865297B6C657420743D7B7D3B666F72286C65742061206F66206529745B615D3D652E67657450726F706572';
wwv_flow_api.g_varchar2_table(60) := '747956616C75652861293B72657475726E20747D66756E6374696F6E20436528297B72657475726E2F5E28283F216368726F6D657C616E64726F6964292E292A7361666172692F692E74657374286E6176696761746F722E757365724167656E74297D66';
wwv_flow_api.g_varchar2_table(61) := '756E6374696F6E2045652865297B69662821657C7C653D3D3D226E6F6E65222972657475726E22223B6C657420743D652E7265706C616365282F7472616E736C6174655B58595D3F5C285B5E295D2A5C292F672C2222293B72657475726E20743D742E72';
wwv_flow_api.g_varchar2_table(62) := '65706C616365282F6D61747269785C28285B5E295D2B295C292F672C28612C63293D3E7B6C657420733D632E73706C697428222C22292E6D6170286E3D3E6E2E7472696D2829293B72657475726E20732E6C656E677468213D3D363F606D617472697828';
wwv_flow_api.g_varchar2_table(63) := '247B637D29603A28735B345D3D2230222C735B355D3D2230222C606D617472697828247B732E6A6F696E28222C2022297D2960297D292C743D742E7265706C616365282F6D617472697833645C28285B5E295D2B295C292F672C28612C63293D3E7B6C65';
wwv_flow_api.g_varchar2_table(64) := '7420733D632E73706C697428222C22292E6D6170286E3D3E6E2E7472696D2829293B72657475726E20732E6C656E677468213D3D31363F606D6174726978336428247B637D29603A28735B31325D3D2230222C735B31335D3D2230222C606D6174726978';
wwv_flow_api.g_varchar2_table(65) := '336428247B732E6A6F696E28222C2022297D2960297D292C742E7472696D28292E7265706C616365282F5C737B322C7D2F672C222022297D66756E6374696F6E20592865297B6966282F255B302D39412D46612D665D7B327D2F2E746573742865292972';
wwv_flow_api.g_varchar2_table(66) := '657475726E20653B7472797B72657475726E20656E636F64655552492865297D63617463682874297B72657475726E20657D7D66756E6374696F6E206A2865297B6C657420743D5B5D2C613D302C633D303B666F72286C657420733D303B733C652E6C65';
wwv_flow_api.g_varchar2_table(67) := '6E6774683B732B2B297B6C6574206E3D655B735D3B6E3D3D3D2228222626612B2B2C6E3D3D3D2229222626612D2D2C6E3D3D3D222C222626613D3D3D30262628742E7075736828652E736C69636528632C73292E7472696D2829292C633D732B31297D72';
wwv_flow_api.g_varchar2_table(68) := '657475726E20742E7075736828652E736C6963652863292E7472696D2829292C747D66756E6374696F6E2056652865297B6C657420743D7B7D3B666F72286C657420613D303B613C652E6C656E6774683B612B2B297B6C657420633D655B615D2C733D65';
wwv_flow_api.g_varchar2_table(69) := '2E67657450726F706572747956616C75652863293B28633D3D3D226261636B67726F756E642D696D616765227C7C633D3D3D22636F6E74656E7422292626732E696E636C75646573282275726C282229262621732E696E636C756465732822646174613A';
wwv_flow_api.g_varchar2_table(70) := '2229262628733D226E6F6E6522292C745B635D3D737D72657475726E20747D66756E6374696F6E205828652C742C61297B766172206F3B696628652E7461674E616D653D3D3D225354594C45222972657475726E3B662E7072655374796C652E68617328';
wwv_flow_api.g_varchar2_table(71) := '65297C7C662E7072655374796C652E73657428652C4E286529293B6C657420633D662E7072655374796C652E6765742865293B69662821662E736E617073686F742E686173286529297B6C657420723D56652863293B662E736E617073686F742E736574';
wwv_flow_api.g_varchar2_table(72) := '28652C72297D6C657420733D662E736E617073686F742E6765742865292C6E3D4F626A6563742E656E74726965732873292E736F727428285B725D2C5B645D293D3E722E6C6F63616C65436F6D70617265286429292E6D617028285B722C645D293D3E60';
wwv_flow_api.g_varchar2_table(73) := '247B727D3A247B647D60292E6A6F696E28223B22293B696628662E736E617073686F744B65792E686173286E29297B662E7072655374796C654D61702E73657428742C662E736E617073686F744B65792E676574286E29293B72657475726E7D6C657420';
wwv_flow_api.g_varchar2_table(74) := '693D28286F3D652E7461674E616D65293D3D6E756C6C3F766F696420303A6F2E746F4C6F776572436173652829297C7C22646976222C6C3D4F28732C692C61293B662E736E617073686F744B65792E736574286E2C6C292C662E7072655374796C654D61';
wwv_flow_api.g_varchar2_table(75) := '702E73657428742C6C297D66756E6374696F6E207128652C742C613D7B7D2C63297B766172206C2C6F3B6966282165297468726F77206E6577204572726F722822496E76616C6964206E6F646522293B6C657420733D6E6577205365742C6E3D6E756C6C';
wwv_flow_api.g_varchar2_table(76) := '3B696628652E6E6F6465547970653D3D3D4E6F64652E544558545F4E4F44457C7C652E6E6F646554797065213D3D4E6F64652E454C454D454E545F4E4F44452972657475726E20652E636C6F6E654E6F6465282130293B696628652E6765744174747269';
wwv_flow_api.g_varchar2_table(77) := '627574652822646174612D6361707475726522293D3D3D226578636C75646522297B6C657420723D646F63756D656E742E637265617465456C656D656E74282264697622292C643D652E676574426F756E64696E67436C69656E745265637428293B7265';
wwv_flow_api.g_varchar2_table(78) := '7475726E20722E7374796C652E637373546578743D60646973706C61793A696E6C696E652D626C6F636B3B77696474683A247B642E77696474687D70783B6865696768743A247B642E6865696768747D70783B7669736962696C6974793A68696464656E';
wwv_flow_api.g_varchar2_table(79) := '3B602C727D696628612E6578636C756465262641727261792E6973417272617928612E6578636C7564652929666F72286C65742072206F6620612E6578636C756465297472797B696628286C3D652E6D61746368657329213D6E756C6C26266C2E63616C';
wwv_flow_api.g_varchar2_table(80) := '6C28652C7229297B6C657420643D646F63756D656E742E637265617465456C656D656E74282264697622292C703D652E676574426F756E64696E67436C69656E745265637428293B72657475726E20642E7374796C652E637373546578743D6064697370';
wwv_flow_api.g_varchar2_table(81) := '6C61793A696E6C696E652D626C6F636B3B77696474683A247B702E77696474687D70783B6865696768743A247B702E6865696768747D70783B7669736962696C6974793A68696464656E3B602C647D7D63617463682864297B636F6E736F6C652E776172';
wwv_flow_api.g_varchar2_table(82) := '6E2860496E76616C69642073656C6563746F7220696E206578636C756465206F7074696F6E3A20247B727D602C64297D696628747970656F6620612E66696C7465723D3D2266756E6374696F6E22297472797B69662821612E66696C74657228652C637C';
wwv_flow_api.g_varchar2_table(83) := '7C6529297B6C657420723D646F63756D656E742E637265617465456C656D656E74282264697622292C643D652E676574426F756E64696E67436C69656E745265637428293B72657475726E20722E7374796C652E637373546578743D60646973706C6179';
wwv_flow_api.g_varchar2_table(84) := '3A696E6C696E652D626C6F636B3B77696474683A247B642E77696474687D70783B6865696768743A247B642E6865696768747D70783B7669736962696C6974793A68696464656E3B602C727D7D63617463682872297B636F6E736F6C652E7761726E2822';
wwv_flow_api.g_varchar2_table(85) := '4572726F7220696E2066696C7465722066756E6374696F6E3A222C72297D696628652E7461674E616D653D3D3D22494652414D4522297B6C657420723D646F63756D656E742E637265617465456C656D656E74282264697622293B72657475726E20722E';
wwv_flow_api.g_varchar2_table(86) := '7374796C652E637373546578743D6077696474683A247B652E6F666673657457696474687D70783B6865696768743A247B652E6F66667365744865696768747D70783B6261636B67726F756E642D696D6167653A726570656174696E672D6C696E656172';
wwv_flow_api.g_varchar2_table(87) := '2D6772616469656E742834356465672C236464642C23646464203570782C23663966396639203570782C236639663966392031307078293B646973706C61793A666C65783B616C69676E2D6974656D733A63656E7465723B6A7573746966792D636F6E74';
wwv_flow_api.g_varchar2_table(88) := '656E743A63656E7465723B666F6E742D73697A653A313270783B636F6C6F723A233535353B626F726465723A31707820736F6C696420236161613B602C727D696628652E6765744174747269627574652822646174612D6361707475726522293D3D3D22';
wwv_flow_api.g_varchar2_table(89) := '706C616365686F6C64657222297B6C657420723D652E636C6F6E654E6F6465282131293B662E7072654E6F64654D61702E73657428722C65292C5828652C722C74293B6C657420643D646F63756D656E742E637265617465456C656D656E742822646976';
wwv_flow_api.g_varchar2_table(90) := '22293B72657475726E20642E74657874436F6E74656E743D652E6765744174747269627574652822646174612D706C616365686F6C6465722D7465787422297C7C22222C642E7374796C652E637373546578743D22636F6C6F723A233636363B666F6E74';
wwv_flow_api.g_varchar2_table(91) := '2D73697A653A313270783B746578742D616C69676E3A63656E7465723B6C696E652D6865696768743A312E343B70616464696E673A302E35656D3B626F782D73697A696E673A626F726465722D626F783B222C722E617070656E644368696C642864292C';
wwv_flow_api.g_varchar2_table(92) := '727D696628652E7461674E616D653D3D3D2243414E56415322297B6C657420723D652E746F4461746155524C28292C643D646F63756D656E742E637265617465456C656D656E742822696D6722293B72657475726E20642E7372633D722C642E77696474';
wwv_flow_api.g_varchar2_table(93) := '683D652E77696474682C642E6865696768743D652E6865696768742C662E7072654E6F64654D61702E73657428642C65292C5828652C642C74292C647D6C657420693B7472797B693D652E636C6F6E654E6F6465282131292C662E7072654E6F64654D61';
wwv_flow_api.g_varchar2_table(94) := '702E73657428692C65297D63617463682872297B7468726F7720636F6E736F6C652E6572726F7228225B536E6170646F6D5D204661696C656420746F20636C6F6E65206E6F64653A222C652C72292C727D6966286520696E7374616E63656F662048544D';
wwv_flow_api.g_varchar2_table(95) := '4C5465787441726561456C656D656E74297B692E74657874436F6E74656E743D652E76616C75652C692E76616C75653D652E76616C75653B6C657420723D652E676574426F756E64696E67436C69656E745265637428293B72657475726E20692E737479';
wwv_flow_api.g_varchar2_table(96) := '6C652E77696474683D60247B722E77696474687D7078602C692E7374796C652E6865696768743D60247B722E6865696768747D7078602C697D6966286520696E7374616E63656F662048544D4C496E707574456C656D656E74262628692E76616C75653D';
wwv_flow_api.g_varchar2_table(97) := '652E76616C75652C692E736574417474726962757465282276616C7565222C652E76616C7565292C652E636865636B6564213D3D766F69642030262628692E636865636B65643D652E636865636B65642C652E636865636B65642626692E736574417474';
wwv_flow_api.g_varchar2_table(98) := '7269627574652822636865636B6564222C2222292C652E696E64657465726D696E617465262628692E696E64657465726D696E6174653D652E696E64657465726D696E6174652929292C6520696E7374616E63656F662048544D4C53656C656374456C65';
wwv_flow_api.g_varchar2_table(99) := '6D656E742626286E3D652E76616C7565292C5828652C692C74292C652E736861646F77526F6F742969662841727261792E66726F6D28652E736861646F77526F6F742E717565727953656C6563746F72416C6C2822736C6F742229292E6C656E6774683E';
wwv_flow_api.g_varchar2_table(100) := '30297B666F72286C65742064206F6620652E736861646F77526F6F742E6368696C644E6F64657329696628642E6E6F6465547970653D3D3D4E6F64652E454C454D454E545F4E4F44452626642E7461674E616D653D3D3D225354594C4522297B6C657420';
wwv_flow_api.g_varchar2_table(101) := '703D642E74657874436F6E74656E747C7C22223B702E7472696D2829262674262628662E7072655374796C657C7C28662E7072655374796C653D6E6577205765616B4D6170292C662E7072655374796C652E73657428642C7029297D7D656C73657B6C65';
wwv_flow_api.g_varchar2_table(102) := '7420643D646F63756D656E742E637265617465446F63756D656E74467261676D656E7428293B666F72286C65742070206F6620652E736861646F77526F6F742E6368696C644E6F646573297B696628702E6E6F6465547970653D3D3D4E6F64652E454C45';
wwv_flow_api.g_varchar2_table(103) := '4D454E545F4E4F44452626702E7461674E616D653D3D3D225354594C4522297B6C657420753D702E74657874436F6E74656E747C7C22223B752E7472696D2829262674262628662E7072655374796C657C7C28662E7072655374796C653D6E6577205765';
wwv_flow_api.g_varchar2_table(104) := '616B4D6170292C662E7072655374796C652E73657428702C7529293B636F6E74696E75657D6C6574206D3D7128702C742C612C637C7C65293B6D2626642E617070656E644368696C64286D297D692E617070656E644368696C642864297D696628652E74';
wwv_flow_api.g_varchar2_table(105) := '61674E616D653D3D3D22534C4F5422297B6C657420723D28286F3D652E61737369676E65644E6F646573293D3D6E756C6C3F766F696420303A6F2E63616C6C28652C7B666C617474656E3A21307D29297C7C5B5D2C643D722E6C656E6774683E303F723A';
wwv_flow_api.g_varchar2_table(106) := '41727261792E66726F6D28652E6368696C644E6F646573292C703D646F63756D656E742E637265617465446F63756D656E74467261676D656E7428293B666F72286C6574206D206F662064297B6C657420753D71286D2C742C612C637C7C65293B752626';
wwv_flow_api.g_varchar2_table(107) := '702E617070656E644368696C642875297D72657475726E20707D666F72286C65742072206F6620652E6368696C644E6F646573297B696628732E68617328722929636F6E74696E75653B6C657420643D7128722C742C612C637C7C65293B642626692E61';
wwv_flow_api.g_varchar2_table(108) := '7070656E644368696C642864297D6966286E213D3D6E756C6C26266920696E7374616E63656F662048544D4C53656C656374456C656D656E74297B692E76616C75653D6E3B666F72286C65742072206F6620692E6F7074696F6E7329722E76616C75653D';
wwv_flow_api.g_varchar2_table(109) := '3D3D6E3F722E736574417474726962757465282273656C6563746564222C2222293A722E72656D6F7665417474726962757465282273656C656374656422297D72657475726E20697D766172204F653D5B2F666F6E745C732A617765736F6D652F692C2F';
wwv_flow_api.g_varchar2_table(110) := '6D6174657269616C5C732A69636F6E732F692C2F696F6E69636F6E732F692C2F676C79706869636F6E732F692C2F666561746865722F692C2F626F6F7473747261705C732A69636F6E732F692C2F72656D69785C732A69636F6E732F692C2F6865726F69';
wwv_flow_api.g_varchar2_table(111) := '636F6E732F692C2F6C617975692F692C2F6C75636964652F695D2C61653D5B5D3B66756E6374696F6E2076652865297B6C657420743D41727261792E697341727261792865293F653A5B655D3B666F72286C65742061206F662074296120696E7374616E';
wwv_flow_api.g_varchar2_table(112) := '63656F66205265674578703F61652E707573682861293A747970656F6620613D3D22737472696E67223F61652E70757368286E65772052656745787028612C22692229293A636F6E736F6C652E7761726E28225B736E6170646F6D5D2049676E6F726564';
wwv_flow_api.g_varchar2_table(113) := '20696E76616C69642069636F6E466F6E742076616C75653A222C61297D66756E6374696F6E20242865297B6C657420743D747970656F6620653D3D22737472696E67223F653A22222C613D5B2E2E2E4F652C2E2E2E61655D3B666F72286C65742063206F';
wwv_flow_api.g_varchar2_table(114) := '662061296966286320696E7374616E63656F66205265674578702626632E746573742874292972657475726E21303B72657475726E2121282F69636F6E2F692E746573742874297C7C2F676C7970682F692E746573742874297C7C2F73796D626F6C732F';
wwv_flow_api.g_varchar2_table(115) := '692E746573742874297C7C2F666561746865722F692E746573742874297C7C2F666F6E74617765736F6D652F692E74657374287429297D66756E6374696F6E20246528652C742C612C633D33322C733D222330303022297B72657475726E206828746869';
wwv_flow_api.g_varchar2_table(116) := '732C6E756C6C2C66756E6374696F6E2A28297B743D742E7265706C616365282F5E5B27225D2B7C5B27225D2B242F672C2222293B6C6574206E3D77696E646F772E646576696365506978656C526174696F7C7C312C6C3D646F63756D656E742E63726561';
wwv_flow_api.g_varchar2_table(117) := '7465456C656D656E74282263616E76617322292E676574436F6E746578742822326422293B6C2E666F6E743D613F60247B617D20247B637D70782022247B747D22603A60247B637D70782022247B747D22603B6C6574206F3D6C2E6D6561737572655465';
wwv_flow_api.g_varchar2_table(118) := '78742865292C723D6F2E61637475616C426F756E64696E67426F78417363656E747C7C632A2E382C643D6F2E61637475616C426F756E64696E67426F7844657363656E747C7C632A2E322C703D722B642C6D3D6F2E77696474682C753D646F63756D656E';
wwv_flow_api.g_varchar2_table(119) := '742E637265617465456C656D656E74282263616E76617322293B752E77696474683D4D6174682E6365696C286D2A6E292C752E6865696768743D4D6174682E6365696C28702A6E293B6C657420793D752E676574436F6E746578742822326422293B7265';
wwv_flow_api.g_varchar2_table(120) := '7475726E20792E7363616C65286E2C6E292C792E666F6E743D6C2E666F6E742C792E74657874416C69676E3D226C656674222C792E74657874426173656C696E653D22616C7068616265746963222C792E66696C6C5374796C653D732C792E66696C6C54';
wwv_flow_api.g_varchar2_table(121) := '65787428652C302C72292C752E746F4461746155524C28297D297D66756E6374696F6E206B652865297B72657475726E2041727261792E66726F6D28646F63756D656E742E7374796C65536865657473292E736F6D6528743D3E742E687265663D3D3D65';
wwv_flow_api.g_varchar2_table(122) := '297D66756E6374696F6E205F652865297B72657475726E206E65772050726F6D69736528743D3E7B6966286B652865292972657475726E2074286E756C6C293B6C657420613D646F63756D656E742E637265617465456C656D656E7428226C696E6B2229';
wwv_flow_api.g_varchar2_table(123) := '3B612E72656C3D227374796C657368656574222C612E687265663D652C612E7365744174747269627574652822646174612D736E6170646F6D222C22696E6A65637465642D696D706F727422292C612E6F6E6C6F61643D28293D3E742861292C612E6F6E';
wwv_flow_api.g_varchar2_table(124) := '6572726F723D28293D3E74286E756C6C292C646F63756D656E742E686561642E617070656E644368696C642861297D297D66756E6374696F6E204728297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A287B707265';
wwv_flow_api.g_varchar2_table(125) := '4361636865643A653D21317D3D7B7D297B696628662E7265736F757263652E6861732822666F6E74732D656D6265642D6373732229297B69662865297B6C6574206E3D646F63756D656E742E637265617465456C656D656E7428227374796C6522293B6E';
wwv_flow_api.g_varchar2_table(126) := '2E7365744174747269627574652822646174612D736E6170646F6D222C22656D626564466F6E747322292C6E2E74657874436F6E74656E743D662E7265736F757263652E6765742822666F6E74732D656D6265642D63737322292C646F63756D656E742E';
wwv_flow_api.g_varchar2_table(127) := '686561642E617070656E644368696C64286E297D72657475726E20662E7265736F757263652E6765742822666F6E74732D656D6265642D63737322297D6C657420743D2F40696D706F72745C732B75726C5C285B22275D3F285B5E2227295D2B295B2227';
wwv_flow_api.g_varchar2_table(128) := '5D3F5C292F672C613D5B5D3B666F72286C6574206E206F6620646F63756D656E742E717565727953656C6563746F72416C6C28227374796C652229297B6C657420693D6E2E74657874436F6E74656E747C7C22222C6C3D41727261792E66726F6D28692E';
wwv_flow_api.g_varchar2_table(129) := '6D61746368416C6C287429293B666F72286C6574206F206F66206C297B6C657420723D6F5B315D3B242872297C7C6B652872297C7C612E707573682872297D7D7969656C642050726F6D6973652E616C6C28612E6D6170285F6529293B6C657420633D41';
wwv_flow_api.g_varchar2_table(130) := '727261792E66726F6D28646F63756D656E742E717565727953656C6563746F72416C6C28276C696E6B5B72656C3D227374796C657368656574225D2729292E66696C746572286E3D3E6E2E68726566292C733D22223B666F72286C6574206E206F662063';
wwv_flow_api.g_varchar2_table(131) := '297472797B6C6574206C3D7969656C64287969656C64206665746368286E2E6872656629292E7465787428293B69662824286E2E68726566297C7C24286C2929636F6E74696E75653B6C6574206F3D2F75726C5C28285B22275D3F29285B5E2227295D2B';
wwv_flow_api.g_varchar2_table(132) := '295C315C292F672C723D7969656C642050726F6D6973652E616C6C2841727261792E66726F6D286C2E6D61746368416C6C286F29292E6D617028703D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B6C6574206D3D5F28705B305D293B69';
wwv_flow_api.g_varchar2_table(133) := '6628216D2972657475726E206E756C6C3B6C657420753D6D3B69662821752E737461727473576974682822687474702229262621752E737461727473576974682822646174613A2229262628753D6E65772055524C28752C6E2E68726566292E68726566';
wwv_flow_api.g_varchar2_table(134) := '292C242875292972657475726E206E756C6C3B696628662E7265736F757263652E6861732875292972657475726E20662E666F6E742E6164642875292C7B6F726967696E616C3A705B305D2C696E6C696E65643A6075726C28247B662E7265736F757263';
wwv_flow_api.g_varchar2_table(135) := '652E6765742875297D29607D3B696628662E666F6E742E6861732875292972657475726E206E756C6C3B7472797B6C657420773D7969656C64287969656C64206665746368287529292E626C6F6228292C783D7969656C64206E65772050726F6D697365';
wwv_flow_api.g_varchar2_table(136) := '28673D3E7B6C657420623D6E65772046696C655265616465723B622E6F6E6C6F61643D28293D3E6728622E726573756C74292C622E7265616441734461746155524C2877297D293B72657475726E20662E7265736F757263652E73657428752C78292C66';
wwv_flow_api.g_varchar2_table(137) := '2E666F6E742E6164642875292C7B6F726967696E616C3A705B305D2C696E6C696E65643A6075726C28247B787D29607D7D63617463682879297B72657475726E20636F6E736F6C652E7761726E28225B736E6170646F6D5D204661696C656420746F2066';
wwv_flow_api.g_varchar2_table(138) := '6574636820666F6E74207265736F757263653A222C75292C6E756C6C7D7D2929292C643D6C3B666F72286C65742070206F6620722970262628643D642E7265706C61636528702E6F726967696E616C2C702E696E6C696E656429293B732B3D642B600A60';
wwv_flow_api.g_varchar2_table(139) := '7D63617463682869297B636F6E736F6C652E7761726E28225B736E6170646F6D5D204661696C656420746F206665746368204353533A222C6E2E68726566297D666F72286C6574206E206F6620646F63756D656E742E7374796C65536865657473297472';
wwv_flow_api.g_varchar2_table(140) := '797B696628216E2E687265667C7C632E657665727928693D3E692E68726566213D3D6E2E6872656629297B666F72286C65742069206F66206E2E63737352756C657329696628692E747970653D3D3D43535352756C652E464F4E545F464143455F52554C';
wwv_flow_api.g_varchar2_table(141) := '45297B6C6574206C3D692E7374796C652E67657450726F706572747956616C7565282273726322292C6F3D692E7374796C652E67657450726F706572747956616C75652822666F6E742D66616D696C7922293B696628216C7C7C24286F2929636F6E7469';
wwv_flow_api.g_varchar2_table(142) := '6E75653B6C657420723D2F75726C5C28285B22275D3F29285B5E2227295D2B295C315C292F672C643D2F6C6F63616C5C28285B22275D3F295B5E295D2B3F5C315C292F672C703D21216C2E6D617463682872292C6D3D21216C2E6D617463682864293B69';
wwv_flow_api.g_varchar2_table(143) := '6628217026266D297B732B3D6040666F6E742D666163657B666F6E742D66616D696C793A247B6F7D3B7372633A247B6C7D3B666F6E742D7374796C653A247B692E7374796C652E67657450726F706572747956616C75652822666F6E742D7374796C6522';
wwv_flow_api.g_varchar2_table(144) := '297C7C226E6F726D616C227D3B666F6E742D7765696768743A247B692E7374796C652E67657450726F706572747956616C75652822666F6E742D77656967687422297C7C226E6F726D616C227D3B7D603B636F6E74696E75657D6C657420753D6C2C793D';
wwv_flow_api.g_varchar2_table(145) := '41727261792E66726F6D286C2E6D61746368416C6C287229293B666F72286C65742077206F662079297B6C657420783D775B325D2E7472696D28293B696628217829636F6E74696E75653B6C657420673D783B69662821672E7374617274735769746828';
wwv_flow_api.g_varchar2_table(146) := '22687474702229262621672E737461727473576974682822646174613A2229262628673D6E65772055524C28672C6E2E687265667C7C6C6F636174696F6E2E68726566292E68726566292C2124286729297B696628662E7265736F757263652E68617328';
wwv_flow_api.g_varchar2_table(147) := '6729297B662E666F6E742E6164642867292C753D752E7265706C61636528775B305D2C6075726C28247B662E7265736F757263652E6765742867297D2960293B636F6E74696E75657D69662821662E666F6E742E686173286729297472797B6C65742049';
wwv_flow_api.g_varchar2_table(148) := '3D7969656C64287969656C64206665746368286729292E626C6F6228292C6B3D7969656C64206E65772050726F6D69736528543D3E7B6C657420433D6E65772046696C655265616465723B432E6F6E6C6F61643D28293D3E5428432E726573756C74292C';
wwv_flow_api.g_varchar2_table(149) := '432E7265616441734461746155524C2849297D293B662E7265736F757263652E73657428672C6B292C662E666F6E742E6164642867292C753D752E7265706C61636528775B305D2C6075726C28247B6B7D2960297D63617463682862297B636F6E736F6C';
wwv_flow_api.g_varchar2_table(150) := '652E7761726E28225B736E6170646F6D5D204661696C656420746F20666574636820666F6E742055524C3A222C67297D7D7D732B3D6040666F6E742D666163657B666F6E742D66616D696C793A247B6F7D3B7372633A247B757D3B666F6E742D7374796C';
wwv_flow_api.g_varchar2_table(151) := '653A247B692E7374796C652E67657450726F706572747956616C75652822666F6E742D7374796C6522297C7C226E6F726D616C227D3B666F6E742D7765696768743A247B692E7374796C652E67657450726F706572747956616C75652822666F6E742D77';
wwv_flow_api.g_varchar2_table(152) := '656967687422297C7C226E6F726D616C227D3B7D607D7D7D63617463682869297B636F6E736F6C652E7761726E28225B736E6170646F6D5D2043616E6E6F7420616363657373207374796C657368656574222C6E2E687265662C69297D666F72286C6574';
wwv_flow_api.g_varchar2_table(153) := '206E206F6620646F63756D656E742E666F6E7473296966286E2E66616D696C7926266E2E7374617475733D3D3D226C6F616465642226266E2E5F736E6170646F6D537263297B69662824286E2E66616D696C792929636F6E74696E75653B6C657420693D';
wwv_flow_api.g_varchar2_table(154) := '6E2E5F736E6170646F6D5372633B69662821692E737461727473576974682822646174613A2229297B696628662E7265736F757263652E686173286E2E5F736E6170646F6D5372632929693D662E7265736F757263652E676574286E2E5F736E6170646F';
wwv_flow_api.g_varchar2_table(155) := '6D537263292C662E666F6E742E616464286E2E5F736E6170646F6D537263293B656C73652069662821662E666F6E742E686173286E2E5F736E6170646F6D53726329297472797B6C6574206F3D7969656C64287969656C64206665746368286E2E5F736E';
wwv_flow_api.g_varchar2_table(156) := '6170646F6D53726329292E626C6F6228293B693D7969656C64206E65772050726F6D69736528723D3E7B6C657420643D6E65772046696C655265616465723B642E6F6E6C6F61643D28293D3E7228642E726573756C74292C642E72656164417344617461';
wwv_flow_api.g_varchar2_table(157) := '55524C286F297D292C662E7265736F757263652E736574286E2E5F736E6170646F6D5372632C69292C662E666F6E742E616464286E2E5F736E6170646F6D537263297D6361746368286C297B636F6E736F6C652E7761726E28225B736E6170646F6D5D20';
wwv_flow_api.g_varchar2_table(158) := '4661696C656420746F2066657463682064796E616D696320666F6E74207372633A222C6E2E5F736E6170646F6D537263293B636F6E74696E75657D7D732B3D6040666F6E742D666163657B666F6E742D66616D696C793A27247B6E2E66616D696C797D27';
wwv_flow_api.g_varchar2_table(159) := '3B7372633A75726C28247B697D293B666F6E742D7374796C653A247B6E2E7374796C657C7C226E6F726D616C227D3B666F6E742D7765696768743A247B6E2E7765696768747C7C226E6F726D616C227D3B7D607D69662873262628662E7265736F757263';
wwv_flow_api.g_varchar2_table(160) := '652E7365742822666F6E74732D656D6265642D637373222C73292C6529297B6C6574206E3D646F63756D656E742E637265617465456C656D656E7428227374796C6522293B6E2E7365744174747269627574652822646174612D736E6170646F6D222C22';
wwv_flow_api.g_varchar2_table(161) := '656D626564466F6E747322292C6E2E74657874436F6E74656E743D732C646F63756D656E742E686561642E617070656E644368696C64286E297D72657475726E20737D297D66756E6374696F6E20726528652C742C612C633D21312C73297B7265747572';
wwv_flow_api.g_varchar2_table(162) := '6E206828746869732C6E756C6C2C66756E6374696F6E2A28297B69662821286520696E7374616E63656F6620456C656D656E74297C7C21287420696E7374616E63656F6620456C656D656E74292972657475726E3B666F72286C6574206C206F665B223A';
wwv_flow_api.g_varchar2_table(163) := '3A6265666F7265222C223A3A6166746572222C223A3A66697273742D6C6574746572225D297472797B6C6574206F3D4E28652C6C293B696628216F7C7C747970656F66206F5B53796D626F6C2E6974657261746F725D213D2266756E6374696F6E222963';
wwv_flow_api.g_varchar2_table(164) := '6F6E74696E75653B6966286C3D3D3D223A3A66697273742D6C657474657222297B6C657420453D676574436F6D70757465645374796C652865293B69662821286F2E636F6C6F72213D3D452E636F6C6F727C7C6F2E666F6E7453697A65213D3D452E666F';
wwv_flow_api.g_varchar2_table(165) := '6E7453697A657C7C6F2E666F6E74576569676874213D3D452E666F6E745765696768742929636F6E74696E75653B6C6574204D3D41727261792E66726F6D28742E6368696C644E6F646573292E66696E64286E653D3E6E652E6E6F6465547970653D3D3D';
wwv_flow_api.g_varchar2_table(166) := '4E6F64652E544558545F4E4F444526266E652E74657874436F6E74656E7426266E652E74657874436F6E74656E742E7472696D28292E6C656E6774683E30293B696628214D29636F6E74696E75653B6C65742066653D4D2E74657874436F6E74656E742C';
wwv_flow_api.g_varchar2_table(167) := '74653D66652E6D61746368282F5E285B5E5C707B4C7D5C707B4E7D5C735D2A5B5C707B4C7D5C707B4E7D5D283F3A5B27E280995D293F292F75292C463D74653D3D6E756C6C3F766F696420303A74655B305D2C46653D66652E736C6963652828463D3D6E';
wwv_flow_api.g_varchar2_table(168) := '756C6C3F766F696420303A462E6C656E677468297C7C30293B69662821467C7C2F5B5C75443830302D5C75444646465D2F2E7465737428462929636F6E74696E75653B6C657420483D646F63756D656E742E637265617465456C656D656E742822737061';
wwv_flow_api.g_varchar2_table(169) := '6E22293B482E74657874436F6E74656E743D462C482E646174617365742E736E6170646F6D50736575646F3D223A3A66697273742D6C6574746572223B6C65742055653D6F65286F292C42653D4F2855652C227370616E222C61293B662E707265537479';
wwv_flow_api.g_varchar2_table(170) := '6C654D61702E73657428482C4265293B6C65742064653D646F63756D656E742E637265617465546578744E6F6465284665293B742E7265706C6163654368696C642864652C4D292C742E696E736572744265666F726528482C6465293B636F6E74696E75';
wwv_flow_api.g_varchar2_table(171) := '657D6C657420723D6F2E67657450726F706572747956616C75652822636F6E74656E7422292C643D6F2E67657450726F706572747956616C756528226261636B67726F756E642D696D61676522292C703D6F2E67657450726F706572747956616C756528';
wwv_flow_api.g_varchar2_table(172) := '226261636B67726F756E642D636F6C6F7222292C6D3D6F2E67657450726F706572747956616C75652822666F6E742D66616D696C7922292C753D7061727365496E74286F2E67657450726F706572747956616C75652822666F6E742D73697A652229297C';
wwv_flow_api.g_varchar2_table(173) := '7C33322C793D7061727365496E74286F2E67657450726F706572747956616C75652822666F6E742D7765696768742229297C7C21312C773D6F2E67657450726F706572747956616C75652822636F6C6F7222297C7C2223303030222C783D6F2E67657450';
wwv_flow_api.g_varchar2_table(174) := '726F706572747956616C75652822646973706C617922292C673D7061727365466C6F6174286F2E67657450726F706572747956616C7565282277696474682229292C623D7061727365466C6F6174286F2E67657450726F706572747956616C7565282268';
wwv_flow_api.g_varchar2_table(175) := '65696768742229292C493D6F2E67657450726F706572747956616C75652822626F726465722D7374796C6522292C6B3D6F2E67657450726F706572747956616C756528227472616E73666F726D22292C543D24286D292C433B2F636F756E7465725C732A';
wwv_flow_api.g_varchar2_table(176) := '5C287C636F756E746572735C732A5C282F2E746573742872293F433D222D20223A433D62652872293B6C657420573D72213D3D226E6F6E6522262643213D3D22222C7A3D64262664213D3D226E6F6E65222C563D70262670213D3D227472616E73706172';
wwv_flow_api.g_varchar2_table(177) := '656E7422262670213D3D227267626128302C20302C20302C203029222C4A3D78213D3D22696E6C696E6522262628673E307C7C623E30292C513D49262649213D3D226E6F6E65222C413D6B26266B213D3D226E6F6E65223B6966282128577C7C7A7C7C56';
wwv_flow_api.g_varchar2_table(178) := '7C7C4A7C7C517C7C412929636F6E74696E75653B6C657420763D646F63756D656E742E637265617465456C656D656E7428227370616E22293B762E646174617365742E736E6170646F6D50736575646F3D6C3B6C6574205A3D6F65286F292C65653D4F28';
wwv_flow_api.g_varchar2_table(179) := '5A2C227370616E222C61293B696628662E7072655374796C654D61702E73657428762C6565292C542626432E6C656E6774683D3D3D31297B6C657420453D646F63756D656E742E637265617465456C656D656E742822696D6722293B452E7372633D7969';
wwv_flow_api.g_varchar2_table(180) := '656C6420246528432C6D2C792C752C77292C452E7374796C653D6077696474683A247B757D70783B6865696768743A6175746F3B6F626A6563742D6669743A636F6E7461696E3B602C762E617070656E644368696C642845297D656C736520696628432E';
wwv_flow_api.g_varchar2_table(181) := '73746172747357697468282275726C282229297B6C657420453D5F2843293B696628452626452E7472696D2829213D3D2222297472797B6C657420523D646F63756D656E742E637265617465456C656D656E742822696D6722292C4D3D7969656C642050';
wwv_flow_api.g_varchar2_table(182) := '285928452C7B75736550726F78793A737D29293B522E7372633D4D2C522E7374796C653D6077696474683A247B757D70783B6865696768743A6175746F3B6F626A6563742D6669743A636F6E7461696E3B602C762E617070656E644368696C642852297D';
wwv_flow_api.g_varchar2_table(183) := '63617463682852297B636F6E736F6C652E6572726F7228605B736E6170646F6D5D204572726F7220696E2070736575646F20247B6C7D20666F72602C652C52297D7D656C73652154262657262628762E74657874436F6E74656E743D43293B6966287A29';
wwv_flow_api.g_varchar2_table(184) := '7472797B6C657420453D6A2864292C523D7969656C642050726F6D6973652E616C6C28452E6D6170284D3D3E42284D2929293B762E7374796C652E6261636B67726F756E64496D6167653D522E6A6F696E28222C2022297D63617463682845297B636F6E';
wwv_flow_api.g_varchar2_table(185) := '736F6C652E7761726E28605B736E6170646F6D5D204661696C656420746F20696E6C696E65206261636B67726F756E642D696D61676520666F7220247B6C7D602C45297D69662856262628762E7374796C652E6261636B67726F756E64436F6C6F723D70';
wwv_flow_api.g_varchar2_table(186) := '292C2128762E6368696C644E6F6465732E6C656E6774683E307C7C762E74657874436F6E74656E742626762E74657874436F6E74656E742E7472696D2829213D3D22227C7C7A7C7C567C7C4A7C7C517C7C412929636F6E74696E75653B6C3D3D3D223A3A';
wwv_flow_api.g_varchar2_table(187) := '6265666F7265223F742E696E736572744265666F726528762C742E66697273744368696C64293A742E617070656E644368696C642876297D6361746368286F297B636F6E736F6C652E7761726E28605B736E6170646F6D5D204661696C656420746F2063';
wwv_flow_api.g_varchar2_table(188) := '61707475726520247B6C7D20666F72602C652C6F297D6C6574206E3D41727261792E66726F6D28652E6368696C6472656E292C693D41727261792E66726F6D28742E6368696C6472656E292E66696C746572286C3D3E216C2E646174617365742E736E61';
wwv_flow_api.g_varchar2_table(189) := '70646F6D50736575646F293B666F72286C6574206C3D303B6C3C4D6174682E6D696E286E2E6C656E6774682C692E6C656E677468293B6C2B2B297969656C64207265286E5B6C5D2C695B6C5D2C612C632C73297D297D66756E6374696F6E204965286529';
wwv_flow_api.g_varchar2_table(190) := '7B69662821652972657475726E3B6C657420743D646F63756D656E742E717565727953656C6563746F72416C6C2822737667203E206465667322293B742E6C656E6774682626652E717565727953656C6563746F72416C6C282273766722292E666F7245';
wwv_flow_api.g_varchar2_table(191) := '61636828613D3E7B6C657420633D612E717565727953656C6563746F72416C6C282275736522293B69662821632E6C656E6774682972657475726E3B6C657420733D6E6577205365743B696628632E666F724561636828693D3E7B6C6574206C3D692E67';
wwv_flow_api.g_varchar2_table(192) := '65744174747269627574652822786C696E6B3A6872656622297C7C692E67657441747472696275746528226872656622293B6C26266C2E7374617274735769746828222322292626732E616464286C2E736C696365283129297D292C21732E73697A6529';
wwv_flow_api.g_varchar2_table(193) := '72657475726E3B6C6574206E3D646F63756D656E742E637265617465456C656D656E744E532822687474703A2F2F7777772E77332E6F72672F323030302F737667222C226465667322293B666F72286C65742069206F66207329666F72286C6574206C20';
wwv_flow_api.g_varchar2_table(194) := '6F662074297B6C6574206F3D6C2E717565727953656C6563746F72286023247B4353532E6573636170652869297D60293B6966286F297B6E2E617070656E644368696C64286F2E636C6F6E654E6F646528213029293B627265616B7D7D6E2E6368696C64';
wwv_flow_api.g_varchar2_table(195) := '4E6F6465732E6C656E6774682626612E696E736572744265666F7265286E2C612E66697273744368696C64297D297D66756E6374696F6E2052652873297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A28652C743D';
wwv_flow_api.g_varchar2_table(196) := '21312C613D21312C633D7B7D297B766172206C3B6C6574206E2C693D22223B7472797B6E3D7128652C742C632C65297D6361746368286F297B7468726F7720636F6E736F6C652E7761726E282264656570436C6F6E65206661696C65643A222C6F292C6F';
wwv_flow_api.g_varchar2_table(197) := '7D7472797B7969656C6420726528652C6E2C742C612C632E75736550726F7879297D6361746368286F297B636F6E736F6C652E7761726E2822696E6C696E6550736575646F456C656D656E7473206661696C65643A222C6F297D7472797B4965286E297D';
wwv_flow_api.g_varchar2_table(198) := '6361746368286F297B636F6E736F6C652E7761726E2822696E6C696E6545787465726E616C446566206661696C65643A222C6F297D69662874297B6C6574206F3D536528293B693D41727261792E66726F6D286F2E656E74726965732829292E6D617028';
wwv_flow_api.g_varchar2_table(199) := '285B722C645D293D3E602E247B647D7B247B727D7D60292E6A6F696E282222293B666F72286C65745B722C645D6F6620662E7072655374796C654D61702E656E74726965732829297B696628722E7461674E616D653D3D3D225354594C452229636F6E74';
wwv_flow_api.g_varchar2_table(200) := '696E75653B6C657420703D6F2E6765742864293B702626722E636C6173734C6973742E6164642870293B6C6574206D3D286C3D722E7374796C65293D3D6E756C6C3F766F696420303A6C2E6261636B67726F756E64496D6167653B722E72656D6F766541';
wwv_flow_api.g_varchar2_table(201) := '747472696275746528227374796C6522292C6D26266D213D3D226E6F6E6522262628722E7374796C652E6261636B67726F756E64496D6167653D6D297D7D656C736520666F72286C65745B6F2C725D6F6620662E7072655374796C654D61702E656E7472';
wwv_flow_api.g_varchar2_table(202) := '6965732829296F2E7461674E616D65213D3D225354594C452226266F2E73657441747472696275746528227374796C65222C722E7265706C616365282F3B2F672C223B202229293B666F72286C65745B6F2C725D6F6620662E7072654E6F64654D61702E';
wwv_flow_api.g_varchar2_table(203) := '656E74726965732829297B6C657420643D722E7363726F6C6C4C6566742C703D722E7363726F6C6C546F703B69662828647C7C702926266F20696E7374616E63656F662048544D4C456C656D656E74297B6F2E7374796C652E6F766572666C6F773D2268';
wwv_flow_api.g_varchar2_table(204) := '696464656E222C6F2E7374796C652E7363726F6C6C62617257696474683D226E6F6E65222C6F2E7374796C652E6D734F766572666C6F775374796C653D226E6F6E65223B6C657420753D646F63756D656E742E637265617465456C656D656E7428226469';
wwv_flow_api.g_varchar2_table(205) := '7622293B666F7228752E7374796C652E7472616E73666F726D3D607472616E736C61746528247B2D647D70782C20247B2D707D707829602C752E7374796C652E77696C6C4368616E67653D227472616E73666F726D222C752E7374796C652E646973706C';
wwv_flow_api.g_varchar2_table(206) := '61793D22696E6C696E652D626C6F636B222C752E7374796C652E77696474683D2231303025223B6F2E66697273744368696C643B29752E617070656E644368696C64286F2E66697273744368696C64293B6F2E617070656E644368696C642875297D7D69';
wwv_flow_api.g_varchar2_table(207) := '6628653D3D3D662E7072654E6F64654D61702E676574286E29297B6C6574206F3D662E7072655374796C652E6765742865297C7C77696E646F772E676574436F6D70757465645374796C652865293B662E7072655374796C652E73657428652C6F293B6C';
wwv_flow_api.g_varchar2_table(208) := '657420723D4565286F2E7472616E73666F726D293B6E2E7374796C652E6D617267696E3D2230222C6E2E7374796C652E706F736974696F6E3D22737461746963222C6E2E7374796C652E746F703D226175746F222C6E2E7374796C652E6C6566743D2261';
wwv_flow_api.g_varchar2_table(209) := '75746F222C6E2E7374796C652E72696768743D226175746F222C6E2E7374796C652E626F74746F6D3D226175746F222C6E2E7374796C652E7A496E6465783D226175746F222C6E2E7374796C652E666C6F61743D226E6F6E65222C6E2E7374796C652E63';
wwv_flow_api.g_varchar2_table(210) := '6C6561723D226E6F6E65222C6E2E7374796C652E7472616E73666F726D3D727C7C22227D666F72286C65745B6F2C725D6F6620662E7072654E6F64654D61702E656E7472696573282929722E7461674E616D653D3D3D22505245222626286F2E7374796C';
wwv_flow_api.g_varchar2_table(211) := '652E6D617267696E546F703D2230222C6F2E7374796C652E6D617267696E426C6F636B53746172743D223022293B72657475726E7B636C6F6E653A6E2C636C6173734353533A697D7D297D66756E6374696F6E204E652861297B72657475726E20682874';
wwv_flow_api.g_varchar2_table(212) := '6869732C617267756D656E74732C66756E6374696F6E2A28652C743D7B7D297B6C657420633D41727261792E66726F6D28652E717565727953656C6563746F72416C6C2822696D672229292C733D6E3D3E68286E756C6C2C6E756C6C2C66756E6374696F';
wwv_flow_api.g_varchar2_table(213) := '6E2A28297B6C657420693D6E2E7372633B7472797B6C6574206C3D7969656C64205028692C7B75736550726F78793A742E75736550726F78797D293B6E2E7372633D6C2C6E2E77696474687C7C286E2E77696474683D6E2E6E61747572616C5769647468';
wwv_flow_api.g_varchar2_table(214) := '7C7C313030292C6E2E6865696768747C7C286E2E6865696768743D6E2E6E61747572616C4865696768747C7C313030297D6361746368286C297B6C6574206F3D646F63756D656E742E637265617465456C656D656E74282264697622293B6F2E7374796C';
wwv_flow_api.g_varchar2_table(215) := '653D6077696474683A20247B6E2E77696474687C7C3130307D70783B206865696768743A20247B6E2E6865696768747C7C3130307D70783B206261636B67726F756E643A20236363633B20646973706C61793A20696E6C696E652D626C6F636B3B207465';
wwv_flow_api.g_varchar2_table(216) := '78742D616C69676E3A2063656E7465723B206C696E652D6865696768743A20247B6E2E6865696768747C7C3130307D70783B20636F6C6F723A20233636363B20666F6E742D73697A653A20313270783B602C6F2E696E6E6572546578743D22696D67222C';
wwv_flow_api.g_varchar2_table(217) := '6E2E7265706C61636557697468286F297D7D293B666F72286C6574206E3D303B6E3C632E6C656E6774683B6E2B3D34297B6C657420693D632E736C696365286E2C6E2B34292E6D61702873293B7969656C642050726F6D6973652E616C6C536574746C65';
wwv_flow_api.g_varchar2_table(218) := '642869297D7D297D66756E6374696F6E20546528632C73297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A28652C742C613D7B7D297B6C6574206E3D5B5B652C745D5D2C693D5B226261636B67726F756E642D696D';
wwv_flow_api.g_varchar2_table(219) := '616765222C226D61736B222C226D61736B2D696D616765222C222D7765626B69742D6D61736B2D696D616765222C226D61736B2D736F75726365222C226D61736B2D626F782D696D6167652D736F75726365222C226D61736B2D626F726465722D736F75';
wwv_flow_api.g_varchar2_table(220) := '726365222C222D7765626B69742D6D61736B2D626F782D696D6167652D736F75726365225D3B666F72283B6E2E6C656E6774683B297B6C65745B6C2C6F5D3D6E2E736869667428292C723D662E7072655374796C652E676574286C297C7C4E286C293B66';
wwv_flow_api.g_varchar2_table(221) := '2E7072655374796C652E686173286C297C7C662E7072655374796C652E736574286C2C72293B666F72286C65742075206F662069297B6C657420793D722E67657450726F706572747956616C75652875293B69662821797C7C793D3D3D226E6F6E652229';
wwv_flow_api.g_varchar2_table(222) := '636F6E74696E75653B6C657420773D6A2879292C783D7969656C642050726F6D6973652E616C6C28772E6D617028673D3E4228672C612929293B782E736F6D6528673D3E67262667213D3D226E6F6E65222626212F5E75726C5C28756E646566696E6564';
wwv_flow_api.g_varchar2_table(223) := '2F2E746573742867292926266F2E7374796C652E73657450726F706572747928752C782E6A6F696E28222C202229297D6C657420643D722E67657450726F706572747956616C756528226261636B67726F756E642D636F6C6F7222293B64262664213D3D';
wwv_flow_api.g_varchar2_table(224) := '227472616E73706172656E7422262664213D3D227267626128302C20302C20302C203029222626286F2E7374796C652E6261636B67726F756E64436F6C6F723D64293B6C657420703D41727261792E66726F6D286C2E6368696C6472656E292C6D3D4172';
wwv_flow_api.g_varchar2_table(225) := '7261792E66726F6D286F2E6368696C6472656E293B666F72286C657420753D303B753C4D6174682E6D696E28702E6C656E6774682C6D2E6C656E677468293B752B2B296E2E70757368285B705B755D2C6D5B755D5D297D7D297D66756E6374696F6E2041';
wwv_flow_api.g_varchar2_table(226) := '652861297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A28652C743D7B7D297B6966282165297468726F77206E6577204572726F722822456C656D656E742063616E6E6F74206265206E756C6C206F7220756E6465';
wwv_flow_api.g_varchar2_table(227) := '66696E656422293B662E726573657428293B6C65747B636F6D70726573733A633D21302C656D626564466F6E74733A733D21312C666173743A6E3D21302C7363616C653A693D312C75736550726F78793A6C3D22227D3D742C6F2C722C643D22222C703D';
wwv_flow_api.g_varchar2_table(228) := '22222C6D2C753B6966287B636C6F6E653A6F2C636C6173734353533A727D3D7969656C6420526528652C632C732C74292C7969656C64206E65772050726F6D69736528773D3E7B442828293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A2829';
wwv_flow_api.g_varchar2_table(229) := '7B7969656C64204E65286F2C74292C7728297D292C7B666173743A6E7D297D292C7969656C64206E65772050726F6D69736528773D3E7B442828293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B7969656C6420546528652C6F2C7429';
wwv_flow_api.g_varchar2_table(230) := '2C7728297D292C7B666173743A6E7D297D292C732626287969656C64206E65772050726F6D69736528773D3E7B442828293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B643D7969656C64204728292C7728297D292C7B666173743A6E';
wwv_flow_api.g_varchar2_table(231) := '7D297D29292C63297B6C657420773D7765286F292E736F727428292C783D772E6A6F696E28222C22293B662E626173655374796C652E6861732878293F703D662E626173655374796C652E6765742878293A7969656C64206E65772050726F6D69736528';
wwv_flow_api.g_varchar2_table(232) := '673D3E7B442828293D3E7B703D78652877292C662E626173655374796C652E73657428782C70292C6728297D2C7B666173743A6E7D297D297D7969656C64206E65772050726F6D69736528773D3E7B442828293D3E7B6C657420783D652E676574426F75';
wwv_flow_api.g_varchar2_table(233) := '6E64696E67436C69656E745265637428292C673D782E77696474682C623D782E6865696768742C493D4E756D6265722E697346696E69746528742E7769647468292C6B3D4E756D6265722E697346696E69746528742E686569676874292C543D74797065';
wwv_flow_api.g_varchar2_table(234) := '6F6620693D3D226E756D62657222262669213D3D313B6966282154297B6C657420413D782E77696474682F782E6865696768743B4926266B3F28673D742E77696474682C623D742E686569676874293A493F28673D742E77696474682C623D672F41293A';
wwv_flow_api.g_varchar2_table(235) := '6B262628623D742E6865696768742C673D622A41297D696628673D4D6174682E6365696C2867292C623D4D6174682E6365696C2862292C6F2E7365744174747269627574652822786D6C6E73222C22687474703A2F2F7777772E77332E6F72672F313939';
wwv_flow_api.g_varchar2_table(236) := '392F7868746D6C22292C6F2E7374796C652E7472616E73666F726D4F726967696E3D22746F70206C656674222C2154262628497C7C6B29297B6C657420413D782E77696474682C63653D782E6865696768742C763D672F412C5A3D622F63652C65653D6F';
wwv_flow_api.g_varchar2_table(237) := '2E7374796C652E7472616E73666F726D7C7C22222C6C653D607363616C6528247B767D2C20247B5A7D29603B6F2E7374796C652E7472616E73666F726D3D60247B6C657D20247B65657D602E7472696D28297D6C657420433D22687474703A2F2F777777';
wwv_flow_api.g_varchar2_table(238) := '2E77332E6F72672F323030302F737667222C4C3D646F63756D656E742E637265617465456C656D656E744E5328432C22666F726569676E4F626A65637422293B4C2E73657441747472696275746528227769647468222C223130302522292C4C2E736574';
wwv_flow_api.g_varchar2_table(239) := '4174747269627574652822686569676874222C223130302522293B6C657420573D646F63756D656E742E637265617465456C656D656E7428227374796C6522293B572E74657874436F6E74656E743D702B642B227376677B6F766572666C6F773A766973';
wwv_flow_api.g_varchar2_table(240) := '69626C653B7D222B722C4C2E617070656E644368696C642857292C4C2E617070656E644368696C64286F293B6C657420563D6E657720584D4C53657269616C697A657228292E73657269616C697A65546F537472696E67284C293B753D603C7376672078';
wwv_flow_api.g_varchar2_table(241) := '6D6C6E733D22247B437D222077696474683D22247B677D22206865696768743D22247B627D222076696577426F783D2230203020247B677D20247B627D223E602B562B223C2F7376673E222C6D3D60646174613A696D6167652F7376672B786D6C3B6368';
wwv_flow_api.g_varchar2_table(242) := '61727365743D7574662D382C247B656E636F6465555249436F6D706F6E656E742875297D602C7728297D2C7B666173743A6E7D297D293B6C657420793D646F63756D656E742E676574456C656D656E74427949642822736E6170646F6D2D73616E64626F';
wwv_flow_api.g_varchar2_table(243) := '7822293B72657475726E20792626792E7374796C652E706F736974696F6E3D3D3D226162736F6C757465222626792E72656D6F766528292C6D7D297D66756E6374696F6E20716528632C73297B72657475726E206828746869732C617267756D656E7473';
wwv_flow_api.g_varchar2_table(244) := '2C66756E6374696F6E2A28652C7B6470723A743D312C7363616C653A613D317D297B6C6574206E3D6E657720496D6167653B72657475726E206E2E7372633D652C7969656C64206E2E6465636F646528292C6E2E77696474683D6E2E77696474682A612C';
wwv_flow_api.g_varchar2_table(245) := '6E2E6865696768743D6E2E6865696768742A612C6E7D297D66756E6374696F6E204D652863297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A28652C7B6470723A743D312C7363616C653A613D317D3D7B7D297B6C';
wwv_flow_api.g_varchar2_table(246) := '657420733D6E657720496D6167653B732E7372633D652C732E63726F73734F726967696E3D22616E6F6E796D6F7573222C732E6C6F6164696E673D226561676572222C732E6465636F64696E673D2273796E63223B6C6574206E3D436528292C693D2131';
wwv_flow_api.g_varchar2_table(247) := '3B6966286E262628646F63756D656E742E626F64792E617070656E644368696C642873292C693D2130292C7969656C6420732E6465636F646528292C6E2626287969656C64206E65772050726F6D69736528703D3E73657454696D656F757428702C3130';
wwv_flow_api.g_varchar2_table(248) := '302929292C732E77696474683D3D3D307C7C732E6865696768743D3D3D30297468726F7720692626732E72656D6F766528292C6E6577204572726F722822496D616765206661696C656420746F206C6F6164206F7220686173206E6F2064696D656E7369';
wwv_flow_api.g_varchar2_table(249) := '6F6E7322293B6C6574206C3D732E77696474682A612C6F3D732E6865696768742A612C723D646F63756D656E742E637265617465456C656D656E74282263616E76617322293B722E77696474683D4D6174682E6365696C286C2A74292C722E6865696768';
wwv_flow_api.g_varchar2_table(250) := '743D4D6174682E6365696C286F2A74292C722E7374796C652E77696474683D60247B6C7D7078602C722E7374796C652E6865696768743D60247B6F7D7078603B6C657420643D722E676574436F6E746578742822326422293B72657475726E20642E7363';
wwv_flow_api.g_varchar2_table(251) := '616C6528742C74292C642E64726177496D61676528732C302C302C6C2C6F292C692626732E72656D6F766528292C727D297D66756E6374696F6E205065286E297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A2865';
wwv_flow_api.g_varchar2_table(252) := '2C7B747970653A743D22737667222C7363616C653A613D312C6261636B67726F756E64436F6C6F723A633D2223666666222C7175616C6974793A737D3D7B7D297B6C657420693D7B6A70673A22696D6167652F6A706567222C6A7065673A22696D616765';
wwv_flow_api.g_varchar2_table(253) := '2F6A706567222C706E673A22696D6167652F706E67222C776562703A22696D6167652F77656270227D5B745D7C7C22696D6167652F706E67223B696628743D3D3D2273766722297B6C6574206F3D6465636F6465555249436F6D706F6E656E7428652E73';
wwv_flow_api.g_varchar2_table(254) := '706C697428222C22295B315D293B72657475726E206E657720426C6F62285B6F5D2C7B747970653A22696D6167652F7376672B786D6C227D297D6C6574206C3D7969656C6420696528652C7B6470723A312C7363616C653A617D2C63293B72657475726E';
wwv_flow_api.g_varchar2_table(255) := '206E65772050726F6D697365286F3D3E7B6C2E746F426C6F6228723D3E6F2872292C60247B697D602C73297D297D297D66756E6374696F6E20696528732C6E2C69297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A';
wwv_flow_api.g_varchar2_table(256) := '28652C7B6470723A743D312C7363616C653A613D317D2C63297B6C6574206C3D7969656C64204D6528652C7B6470723A742C7363616C653A617D293B69662821632972657475726E206C3B6C6574206F3D646F63756D656E742E637265617465456C656D';
wwv_flow_api.g_varchar2_table(257) := '656E74282263616E76617322293B6F2E77696474683D6C2E77696474682C6F2E6865696768743D6C2E6865696768743B6C657420723D6F2E676574436F6E746578742822326422293B72657475726E20722E66696C6C5374796C653D632C722E66696C6C';
wwv_flow_api.g_varchar2_table(258) := '5265637428302C302C6F2E77696474682C6F2E686569676874292C722E64726177496D616765286C2C302C30292C6F7D297D66756E6374696F6E20736528692C6C297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A';
wwv_flow_api.g_varchar2_table(259) := '28652C7B6470723A743D312C7363616C653A613D312C6261636B67726F756E64436F6C6F723A632C7175616C6974793A737D2C6E3D22706E6722297B6C6574206F3D5B226A7067222C226A706567222C2277656270225D2E696E636C75646573286E293F';
wwv_flow_api.g_varchar2_table(260) := '2223666666223A766F696420302C723D63213D6E756C6C3F633A6F2C643D7969656C6420696528652C7B6470723A742C7363616C653A617D2C72292C703D6E657720496D6167653B72657475726E20702E7372633D642E746F4461746155524C2860696D';
wwv_flow_api.g_varchar2_table(261) := '6167652F247B6E7D602C73292C7969656C6420702E6465636F646528292C702E7374796C652E77696474683D60247B642E77696474682F747D7078602C702E7374796C652E6865696768743D60247B642E6865696768742F747D7078602C707D297D6675';
wwv_flow_api.g_varchar2_table(262) := '6E6374696F6E207A652869297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A28652C7B6470723A743D312C7363616C653A613D312C6261636B67726F756E64436F6C6F723A632C666F726D61743A733D22706E6722';
wwv_flow_api.g_varchar2_table(263) := '2C66696C656E616D653A6E3D22736E6170444F4D227D3D7B7D297B696628733D3D3D2273766722297B6C657420753D7969656C642050652865292C793D55524C2E6372656174654F626A65637455524C2875292C773D646F63756D656E742E6372656174';
wwv_flow_api.g_varchar2_table(264) := '65456C656D656E7428226122293B772E687265663D792C772E646F776E6C6F61643D60247B6E7D2E737667602C772E636C69636B28292C55524C2E7265766F6B654F626A65637455524C2879293B72657475726E7D6C6574206C3D5B226A7067222C226A';
wwv_flow_api.g_varchar2_table(265) := '706567222C2277656270225D2E696E636C756465732873293F2223666666223A766F696420302C6F3D63213D6E756C6C3F633A6C2C723D7969656C6420696528652C7B6470723A742C7363616C653A617D2C6F292C643D7B6A70673A22696D6167652F6A';
wwv_flow_api.g_varchar2_table(266) := '706567222C6A7065673A22696D6167652F6A706567222C706E673A22696D6167652F706E67222C776562703A22696D6167652F77656270227D5B735D7C7C22696D6167652F706E67222C703D722E746F4461746155524C2864292C6D3D646F63756D656E';
wwv_flow_api.g_varchar2_table(267) := '742E637265617465456C656D656E7428226122293B6D2E687265663D702C6D2E646F776E6C6F61643D60247B6E7D2E247B737D602C6D2E636C69636B28297D297D66756E6374696F6E20532861297B72657475726E206828746869732C617267756D656E';
wwv_flow_api.g_varchar2_table(268) := '74732C66756E6374696F6E2A28652C743D7B7D297B696628743D55287B7363616C653A317D2C74292C2165297468726F77206E6577204572726F722822456C656D656E742063616E6E6F74206265206E756C6C206F7220756E646566696E656422293B72';
wwv_flow_api.g_varchar2_table(269) := '657475726E20742E69636F6E466F6E74732626766528742E69636F6E466F6E7473292C7969656C6420532E6361707475726528652C74297D297D532E636170747572653D28612C2E2E2E63293D3E68286E756C6C2C5B612C2E2E2E635D2C66756E637469';
wwv_flow_api.g_varchar2_table(270) := '6F6E2A28652C743D7B7D297B6C657420733D7969656C6420416528652C74292C6E3D77696E646F772E646576696365506978656C526174696F7C7C312C693D742E7363616C657C7C313B72657475726E7B75726C3A732C6F7074696F6E733A742C746F52';
wwv_flow_api.g_varchar2_table(271) := '61773A28293D3E732C746F496D673A28293D3E716528732C7B6470723A6E2C7363616C653A697D292C746F43616E7661733A28293D3E4D6528732C7B6470723A6E2C7363616C653A697D292C746F426C6F623A6C3D3E506528732C55287B6470723A6E2C';
wwv_flow_api.g_varchar2_table(272) := '7363616C653A697D2C6C29292C746F506E673A6C3D3E736528732C55287B6470723A6E2C7363616C653A697D2C6C292C22706E6722292C746F4A70673A6C3D3E736528732C55287B6470723A6E2C7363616C653A697D2C6C292C226A70656722292C746F';
wwv_flow_api.g_varchar2_table(273) := '576562703A6C3D3E736528732C55287B6470723A6E2C7363616C653A697D2C6C292C227765627022292C646F776E6C6F61643A287B666F726D61743A6C3D22706E67222C66696C656E616D653A6F3D2263617074757265222C6261636B67726F756E6443';
wwv_flow_api.g_varchar2_table(274) := '6F6C6F723A727D3D7B7D293D3E7A6528732C7B6470723A6E2C7363616C653A692C6261636B67726F756E64436F6C6F723A722C666F726D61743A6C2C66696C656E616D653A6F7D297D7D293B532E746F5261773D28652C74293D3E68286E756C6C2C6E75';
wwv_flow_api.g_varchar2_table(275) := '6C6C2C66756E6374696F6E2A28297B72657475726E287969656C6420532E6361707475726528652C7429292E746F52617728297D293B532E746F496D673D28652C74293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B72657475726E28';
wwv_flow_api.g_varchar2_table(276) := '7969656C6420532E6361707475726528652C7429292E746F496D6728297D293B532E746F43616E7661733D28652C74293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B72657475726E287969656C6420532E6361707475726528652C74';
wwv_flow_api.g_varchar2_table(277) := '29292E746F43616E76617328297D293B532E746F426C6F623D28652C74293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B72657475726E287969656C6420532E6361707475726528652C7429292E746F426C6F622874297D293B532E74';
wwv_flow_api.g_varchar2_table(278) := '6F506E673D28652C74293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B72657475726E287969656C6420532E6361707475726528652C7429292E746F506E672874297D293B532E746F4A70673D28652C74293D3E68286E756C6C2C6E75';
wwv_flow_api.g_varchar2_table(279) := '6C6C2C66756E6374696F6E2A28297B72657475726E287969656C6420532E6361707475726528652C7429292E746F4A70672874297D293B532E746F576562703D28652C74293D3E68286E756C6C2C6E756C6C2C66756E6374696F6E2A28297B7265747572';
wwv_flow_api.g_varchar2_table(280) := '6E287969656C6420532E6361707475726528652C7429292E746F576562702874297D293B532E646F776E6C6F61643D28612C2E2E2E63293D3E68286E756C6C2C5B612C2E2E2E635D2C66756E6374696F6E2A28652C743D7B7D297B6C657420723D742C7B';
wwv_flow_api.g_varchar2_table(281) := '666F726D61743A733D22706E67222C66696C656E616D653A6E3D2263617074757265222C6261636B67726F756E64436F6C6F723A697D3D722C6C3D686528722C5B22666F726D6174222C2266696C656E616D65222C226261636B67726F756E64436F6C6F';
wwv_flow_api.g_varchar2_table(282) := '72225D293B72657475726E207969656C64287969656C6420532E6361707475726528652C6C29292E646F776E6C6F6164287B666F726D61743A732C66696C656E616D653A6E2C6261636B67726F756E64436F6C6F723A697D297D293B66756E6374696F6E';
wwv_flow_api.g_varchar2_table(283) := '204C6528297B72657475726E206828746869732C617267756D656E74732C66756E6374696F6E2A28653D646F63756D656E742C743D7B7D297B6C65747B656D626564466F6E74733A613D21302C72657365743A633D21317D3D743B69662863297B662E72';
wwv_flow_api.g_varchar2_table(284) := '6573657428293B72657475726E7D7969656C6420646F63756D656E742E666F6E74732E72656164792C676528293B6C657420733D5B5D2C6E3D5B5D3B65213D6E756C6C2626652E717565727953656C6563746F72416C6C262628733D41727261792E6672';
wwv_flow_api.g_varchar2_table(285) := '6F6D28652E717565727953656C6563746F72416C6C2822696D675B7372635D2229292C6E3D41727261792E66726F6D28652E717565727953656C6563746F72416C6C28222A222929293B6C657420693D5B5D3B666F72286C6574206C206F662073297B6C';
wwv_flow_api.g_varchar2_table(286) := '6574206F3D6C2E7372633B662E696D6167652E686173286F297C7C692E707573682850286F2C7B75736550726F78793A742E75736550726F78797D292E7468656E28723D3E662E696D6167652E736574286F2C7229292E63617463682828293D3E7B7D29';
wwv_flow_api.g_varchar2_table(287) := '297D666F72286C6574206C206F66206E297B6C6574206F3D4E286C292E6261636B67726F756E64496D6167653B6966286F26266F213D3D226E6F6E6522297B6C657420723D6A286F293B666F72286C65742064206F66207229642E737461727473576974';
wwv_flow_api.g_varchar2_table(288) := '68282275726C2822292626692E70757368284228642C74292E63617463682828293D3E7B7D29297D7D612626287969656C642047287B7072654361636865643A21307D29292C7969656C642050726F6D6973652E616C6C2869297D297D747970656F6620';
wwv_flow_api.g_varchar2_table(289) := '77696E646F77213D22756E646566696E65642226262877696E646F772E736E6170646F6D3D532C77696E646F772E70726543616368653D4C65293B7D2928293B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(128274144645656360)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'js/snapdom.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E616F702D50726F63657373696E67207B0A20207A2D696E6465783A2039393939393939393B0A7D0A0A2E742D427574746F6E202E616F702D50726F63657373696E67207B0A20202D2D736B2D73697A653A20766172282D2D612D627574746F6E2D666F';
wwv_flow_api.g_varchar2_table(2) := '6E742D73697A652C2032307078293B0A7D0A0A2E616F702D496E6C696E6550726576696577207B0A2020646973706C61793A20666C65783B0A2020666C65782D646972656374696F6E3A20636F6C756D6E3B0A7D0A0A2E616F702D496E6C696E65507265';
wwv_flow_api.g_varchar2_table(3) := '76696577202E616F702D496E6C696E65507265766965772D2D646F776E6C6F6164427574746F6E207B0A20206D617267696E2D626F74746F6D3A203870783B0A2020616C69676E2D73656C663A20666C65782D656E643B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(137266046891533083)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'css/aop.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A20436F6E666967202A2F0A3A726F6F74207B0A20202D2D736B2D73697A653A20343070783B0A20202D2D736B2D636F6C6F723A20233333333B0A7D0A0A0A2F2A205574696C69747920636C61737320666F722063656E746572696E67202A2F0A2E73';
wwv_flow_api.g_varchar2_table(2) := '6B2D63656E746572207B206D617267696E3A206175746F3B207D0A0A0A2F2A2020506C616E650A0A2020202020203C64697620636C6173733D22736B2D706C616E65223E3C2F6469763E0A202A2F0A2E736B2D706C616E65207B0A202077696474683A20';
wwv_flow_api.g_varchar2_table(3) := '766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D2D736B2D73697A65293B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A2020616E696D6174696F6E3A20736B2D706C616E65';
wwv_flow_api.g_varchar2_table(4) := '20312E327320696E66696E69746520656173652D696E2D6F75743B200A7D0A0A406B65796672616D657320736B2D706C616E65207B0A20203025207B0A202020207472616E73666F726D3A2070657273706563746976652831323070782920726F746174';
wwv_flow_api.g_varchar2_table(5) := '655828306465672920726F74617465592830646567293B200A20207D20353025207B0A202020207472616E73666F726D3A2070657273706563746976652831323070782920726F7461746558282D3138302E316465672920726F74617465592830646567';
wwv_flow_api.g_varchar2_table(6) := '293B200A20207D2031303025207B0A202020207472616E73666F726D3A2070657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567293B200A20207D200A7D0A0A0A2F2A2020';
wwv_flow_api.g_varchar2_table(7) := '43686173650A0A2020202020203C64697620636C6173733D22736B2D6368617365223E0A20202020202020203C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D';
wwv_flow_api.g_varchar2_table(8) := '63686173652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E0A';
wwv_flow_api.g_varchar2_table(9) := '20202020202020203C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E';
wwv_flow_api.g_varchar2_table(10) := '736B2D6368617365207B0A202077696474683A20766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D2D736B2D73697A65293B0A2020706F736974696F6E3A2072656C61746976653B0A2020616E696D6174696F6E3A20736B2D';
wwv_flow_api.g_varchar2_table(11) := '636861736520322E357320696E66696E697465206C696E65617220626F74683B200A7D0A0A2E736B2D63686173652D646F74207B0A202077696474683A20313030253B0A20206865696768743A20313030253B0A2020706F736974696F6E3A206162736F';
wwv_flow_api.g_varchar2_table(12) := '6C7574653B0A20206C6566743A20303B0A2020746F703A20303B200A2020616E696D6174696F6E3A20736B2D63686173652D646F7420322E307320696E66696E69746520656173652D696E2D6F757420626F74683B200A7D0A0A2E736B2D63686173652D';
wwv_flow_api.g_varchar2_table(13) := '646F743A6265666F7265207B0A2020636F6E74656E743A2027273B0A2020646973706C61793A20626C6F636B3B0A202077696474683A203235253B0A20206865696768743A203235253B0A20206261636B67726F756E642D636F6C6F723A20766172282D';
wwv_flow_api.g_varchar2_table(14) := '2D736B2D636F6C6F72293B0A2020626F726465722D7261646975733A20313030253B0A2020616E696D6174696F6E3A20736B2D63686173652D646F742D6265666F726520322E307320696E66696E69746520656173652D696E2D6F757420626F74683B20';
wwv_flow_api.g_varchar2_table(15) := '0A7D0A0A2E736B2D63686173652D646F743A6E74682D6368696C64283129207B20616E696D6174696F6E2D64656C61793A202D312E31733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C64283229207B20616E696D6174696F6E2D6465';
wwv_flow_api.g_varchar2_table(16) := '6C61793A202D312E30733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C64283329207B20616E696D6174696F6E2D64656C61793A202D302E39733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C64283429207B20616E';
wwv_flow_api.g_varchar2_table(17) := '696D6174696F6E2D64656C61793A202D302E38733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C64283529207B20616E696D6174696F6E2D64656C61793A202D302E37733B207D0A2E736B2D63686173652D646F743A6E74682D636869';
wwv_flow_api.g_varchar2_table(18) := '6C64283629207B20616E696D6174696F6E2D64656C61793A202D302E36733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C642831293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D312E31733B207D0A2E736B2D';
wwv_flow_api.g_varchar2_table(19) := '63686173652D646F743A6E74682D6368696C642832293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D312E30733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C642833293A6265666F7265207B20616E696D6174';
wwv_flow_api.g_varchar2_table(20) := '696F6E2D64656C61793A202D302E39733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C642834293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E38733B207D0A2E736B2D63686173652D646F743A6E74682D';
wwv_flow_api.g_varchar2_table(21) := '6368696C642835293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E37733B207D0A2E736B2D63686173652D646F743A6E74682D6368696C642836293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E';
wwv_flow_api.g_varchar2_table(22) := '36733B207D0A0A406B65796672616D657320736B2D6368617365207B0A202031303025207B207472616E73666F726D3A20726F7461746528333630646567293B207D200A7D0A0A406B65796672616D657320736B2D63686173652D646F74207B0A202038';
wwv_flow_api.g_varchar2_table(23) := '30252C2031303025207B207472616E73666F726D3A20726F7461746528333630646567293B207D200A7D0A0A406B65796672616D657320736B2D63686173652D646F742D6265666F7265207B0A2020353025207B0A202020207472616E73666F726D3A20';
wwv_flow_api.g_varchar2_table(24) := '7363616C6528302E34293B200A20207D20313030252C203025207B0A202020207472616E73666F726D3A207363616C6528312E30293B200A20207D200A7D0A0A0A2F2A2020426F756E63650A0A2020202020203C64697620636C6173733D22736B2D626F';
wwv_flow_api.g_varchar2_table(25) := '756E6365223E0A20202020202020203C64697620636C6173733D22736B2D626F756E63652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D626F756E63652D646F74223E3C2F6469763E0A2020202020203C2F64';
wwv_flow_api.g_varchar2_table(26) := '69763E0A20202A2F0A2E736B2D626F756E6365207B0A202077696474683A20766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D2D736B2D73697A65293B0A2020706F736974696F6E3A2072656C61746976653B0A7D0A0A2E73';
wwv_flow_api.g_varchar2_table(27) := '6B2D626F756E63652D646F74207B0A202077696474683A20313030253B0A20206865696768743A20313030253B0A2020626F726465722D7261646975733A203530253B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C';
wwv_flow_api.g_varchar2_table(28) := '6F72293B0A20206F7061636974793A20302E363B0A2020706F736974696F6E3A206162736F6C7574653B0A2020746F703A20303B0A20206C6566743A20303B0A2020616E696D6174696F6E3A20736B2D626F756E636520327320696E66696E6974652063';
wwv_flow_api.g_varchar2_table(29) := '756269632D62657A69657228302E3435352C20302E30332C20302E3531352C20302E393535293B200A7D0A0A2E736B2D626F756E63652D646F743A6E74682D6368696C64283229207B20616E696D6174696F6E2D64656C61793A202D312E30733B207D0A';
wwv_flow_api.g_varchar2_table(30) := '0A406B65796672616D657320736B2D626F756E6365207B0A202030252C2031303025207B0A202020207472616E73666F726D3A207363616C652830293B0A20207D203435252C20353525207B0A202020207472616E73666F726D3A207363616C65283129';
wwv_flow_api.g_varchar2_table(31) := '3B200A20207D200A7D0A0A0A2F2A2020576176650A0A2020202020203C64697620636C6173733D22736B2D77617665223E0A20202020202020203C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E0A20202020202020203C';
wwv_flow_api.g_varchar2_table(32) := '64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D77617665';
wwv_flow_api.g_varchar2_table(33) := '2D72656374223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E736B2D77617665207B0A202077696474683A20766172282D2D736B';
wwv_flow_api.g_varchar2_table(34) := '2D73697A65293B0A20206865696768743A20766172282D2D736B2D73697A65293B0A2020646973706C61793A20666C65783B0A20206A7573746966792D636F6E74656E743A2073706163652D6265747765656E3B0A7D0A0A2E736B2D776176652D726563';
wwv_flow_api.g_varchar2_table(35) := '74207B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A20206865696768743A20313030253B0A202077696474683A203135253B0A2020616E696D6174696F6E3A20736B2D7761766520312E327320696E66';
wwv_flow_api.g_varchar2_table(36) := '696E69746520656173652D696E2D6F75743B200A7D0A0A2E736B2D776176652D726563743A6E74682D6368696C64283129207B20616E696D6174696F6E2D64656C61793A202D312E32733B207D0A2E736B2D776176652D726563743A6E74682D6368696C';
wwv_flow_api.g_varchar2_table(37) := '64283229207B20616E696D6174696F6E2D64656C61793A202D312E31733B207D0A2E736B2D776176652D726563743A6E74682D6368696C64283329207B20616E696D6174696F6E2D64656C61793A202D312E30733B207D0A2E736B2D776176652D726563';
wwv_flow_api.g_varchar2_table(38) := '743A6E74682D6368696C64283429207B20616E696D6174696F6E2D64656C61793A202D302E39733B207D0A2E736B2D776176652D726563743A6E74682D6368696C64283529207B20616E696D6174696F6E2D64656C61793A202D302E38733B207D0A0A40';
wwv_flow_api.g_varchar2_table(39) := '6B65796672616D657320736B2D77617665207B0A202030252C203430252C2031303025207B0A202020207472616E73666F726D3A207363616C655928302E34293B200A20207D20323025207B0A202020207472616E73666F726D3A207363616C65592831';
wwv_flow_api.g_varchar2_table(40) := '293B200A20207D200A7D0A0A0A2F2A202050756C73650A0A2020202020203C64697620636C6173733D22736B2D70756C7365223E3C2F6469763E0A202A2F0A2E736B2D70756C7365207B0A202077696474683A20766172282D2D736B2D73697A65293B0A';
wwv_flow_api.g_varchar2_table(41) := '20206865696768743A20766172282D2D736B2D73697A65293B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A2020626F726465722D7261646975733A20313030253B0A2020616E696D6174696F6E3A2073';
wwv_flow_api.g_varchar2_table(42) := '6B2D70756C736520312E327320696E66696E6974652063756269632D62657A69657228302E3435352C20302E30332C20302E3531352C20302E393535293B200A7D0A0A406B65796672616D657320736B2D70756C7365207B0A20203025207B0A20202020';
wwv_flow_api.g_varchar2_table(43) := '7472616E73666F726D3A207363616C652830293B200A20207D2031303025207B0A202020207472616E73666F726D3A207363616C652831293B0A202020206F7061636974793A20303B200A20207D0A7D0A0A0A2F2A2020466C6F770A0A2020202020203C';
wwv_flow_api.g_varchar2_table(44) := '64697620636C6173733D22736B2D666C6F77223E0A20202020202020203C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E';
wwv_flow_api.g_varchar2_table(45) := '0A20202020202020203C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E736B2D666C6F77207B0A202077696474683A2063616C6328766172282D2D736B2D73697A6529202A20';
wwv_flow_api.g_varchar2_table(46) := '312E33293B0A20206865696768743A2063616C6328766172282D2D736B2D73697A6529202A20312E33293B0A2020646973706C61793A20666C65783B0A20206A7573746966792D636F6E74656E743A2073706163652D6265747765656E3B0A7D0A0A2E73';
wwv_flow_api.g_varchar2_table(47) := '6B2D666C6F772D646F74207B0A202077696474683A203235253B0A20206865696768743A203235253B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A2020626F726465722D7261646975733A203530253B';
wwv_flow_api.g_varchar2_table(48) := '0A2020616E696D6174696F6E3A20736B2D666C6F7720312E34732063756269632D62657A69657228302E3435352C20302E30332C20302E3531352C20302E3935352920307320696E66696E69746520626F74683B0A7D0A0A2E736B2D666C6F772D646F74';
wwv_flow_api.g_varchar2_table(49) := '3A6E74682D6368696C64283129207B20616E696D6174696F6E2D64656C61793A202D302E3330733B207D0A2E736B2D666C6F772D646F743A6E74682D6368696C64283229207B20616E696D6174696F6E2D64656C61793A202D302E3135733B207D0A0A40';
wwv_flow_api.g_varchar2_table(50) := '6B65796672616D657320736B2D666C6F77207B0A202030252C203830252C2031303025207B0A202020207472616E73666F726D3A207363616C6528302E33293B207D0A2020343025207B0A202020207472616E73666F726D3A207363616C652831293B20';
wwv_flow_api.g_varchar2_table(51) := '0A20207D0A7D0A0A0A2F2A20205377696E670A0A2020202020203C64697620636C6173733D22736B2D7377696E67223E0A20202020202020203C64697620636C6173733D22736B2D7377696E672D646F74223E3C2F6469763E0A20202020202020203C64';
wwv_flow_api.g_varchar2_table(52) := '697620636C6173733D22736B2D7377696E672D646F74223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E736B2D7377696E67207B0A202077696474683A20766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D';
wwv_flow_api.g_varchar2_table(53) := '2D736B2D73697A65293B0A2020706F736974696F6E3A2072656C61746976653B0A2020616E696D6174696F6E3A20736B2D7377696E6720312E387320696E66696E697465206C696E6561723B200A7D0A20200A2E736B2D7377696E672D646F74207B0A20';
wwv_flow_api.g_varchar2_table(54) := '2077696474683A203435253B0A20206865696768743A203435253B0A2020706F736974696F6E3A206162736F6C7574653B0A2020746F703A20303B0A20206C6566743A20303B0A202072696768743A20303B0A20206D617267696E3A206175746F3B0A20';
wwv_flow_api.g_varchar2_table(55) := '206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A2020626F726465722D7261646975733A20313030253B0A2020616E696D6174696F6E3A20736B2D7377696E672D646F7420327320696E66696E69746520656173';
wwv_flow_api.g_varchar2_table(56) := '652D696E2D6F75743B200A7D0A0A2E736B2D7377696E672D646F743A6E74682D6368696C64283229207B0A2020746F703A206175746F3B0A2020626F74746F6D3A20303B0A2020616E696D6174696F6E2D64656C61793A202D31733B200A7D0A0A406B65';
wwv_flow_api.g_varchar2_table(57) := '796672616D657320736B2D7377696E67207B0A202031303025207B0A202020207472616E73666F726D3A20726F7461746528333630646567293B200A20207D200A7D0A0A406B65796672616D657320736B2D7377696E672D646F74207B0A202030252C20';
wwv_flow_api.g_varchar2_table(58) := '31303025207B0A202020207472616E73666F726D3A207363616C6528302E32293B207D0A2020353025207B0A202020207472616E73666F726D3A207363616C652831293B200A20207D200A7D0A0A0A2F2A2020436972636C650A0A2020202020203C6469';
wwv_flow_api.g_varchar2_table(59) := '7620636C6173733D22736B2D636972636C65223E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F';
wwv_flow_api.g_varchar2_table(60) := '6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C6469';
wwv_flow_api.g_varchar2_table(61) := '7620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D63697263';
wwv_flow_api.g_varchar2_table(62) := '6C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20';
wwv_flow_api.g_varchar2_table(63) := '202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173';
wwv_flow_api.g_varchar2_table(64) := '733D22736B2D636972636C652D646F74223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E736B2D636972636C65207B0A202077696474683A20766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D2D736B2D73';
wwv_flow_api.g_varchar2_table(65) := '697A65293B0A2020706F736974696F6E3A2072656C61746976653B200A7D0A0A2E736B2D636972636C652D646F74207B0A202077696474683A20313030253B0A20206865696768743A20313030253B0A2020706F736974696F6E3A206162736F6C757465';
wwv_flow_api.g_varchar2_table(66) := '3B0A20206C6566743A20303B0A2020746F703A20303B0A7D0A0A2E736B2D636972636C652D646F743A6265666F7265207B0A20202020636F6E74656E743A2027273B0A20202020646973706C61793A20626C6F636B3B0A2020202077696474683A203135';
wwv_flow_api.g_varchar2_table(67) := '253B0A202020206865696768743A203135253B0A202020206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A20202020626F726465722D7261646975733A20313030253B0A20202020616E696D6174696F6E3A2073';
wwv_flow_api.g_varchar2_table(68) := '6B2D636972636C6520312E327320696E66696E69746520656173652D696E2D6F757420626F74683B200A7D0A0A2E736B2D636972636C652D646F743A6E74682D6368696C64283129207B207472616E73666F726D3A20726F74617465283330646567293B';
wwv_flow_api.g_varchar2_table(69) := '207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283229207B207472616E73666F726D3A20726F74617465283630646567293B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283329207B207472616E73666F726D';
wwv_flow_api.g_varchar2_table(70) := '3A20726F74617465283930646567293B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283429207B207472616E73666F726D3A20726F7461746528313230646567293B207D0A2E736B2D636972636C652D646F743A6E74682D636869';
wwv_flow_api.g_varchar2_table(71) := '6C64283529207B207472616E73666F726D3A20726F7461746528313530646567293B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283629207B207472616E73666F726D3A20726F7461746528313830646567293B207D0A2E736B2D';
wwv_flow_api.g_varchar2_table(72) := '636972636C652D646F743A6E74682D6368696C64283729207B207472616E73666F726D3A20726F7461746528323130646567293B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283829207B207472616E73666F726D3A20726F7461';
wwv_flow_api.g_varchar2_table(73) := '746528323430646567293B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283929207B207472616E73666F726D3A20726F7461746528323730646567293B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283130';
wwv_flow_api.g_varchar2_table(74) := '29207B207472616E73666F726D3A20726F7461746528333030646567293B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C6428313129207B207472616E73666F726D3A20726F7461746528333330646567293B207D0A2E736B2D636972';
wwv_flow_api.g_varchar2_table(75) := '636C652D646F743A6E74682D6368696C642831293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D312E31733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C642832293A6265666F7265207B20616E696D617469';
wwv_flow_api.g_varchar2_table(76) := '6F6E2D64656C61793A202D31733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C642833293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E39733B207D0A2E736B2D636972636C652D646F743A6E74682D63';
wwv_flow_api.g_varchar2_table(77) := '68696C642834293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E38733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C642835293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E';
wwv_flow_api.g_varchar2_table(78) := '37733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C642836293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E36733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C642837293A626566';
wwv_flow_api.g_varchar2_table(79) := '6F7265207B20616E696D6174696F6E2D64656C61793A202D302E35733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C642838293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E34733B207D0A2E736B2D63';
wwv_flow_api.g_varchar2_table(80) := '6972636C652D646F743A6E74682D6368696C642839293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E33733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283130293A6265666F7265207B20616E696D';
wwv_flow_api.g_varchar2_table(81) := '6174696F6E2D64656C61793A202D302E32733B207D0A2E736B2D636972636C652D646F743A6E74682D6368696C64283131293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E31733B207D0A0A406B65796672616D657320736B';
wwv_flow_api.g_varchar2_table(82) := '2D636972636C65207B0A202030252C203830252C2031303025207B0A202020207472616E73666F726D3A207363616C652830293B207D0A2020343025207B0A202020207472616E73666F726D3A207363616C652831293B200A20207D200A7D0A0A0A2F2A';
wwv_flow_api.g_varchar2_table(83) := '2020436972636C6520466164650A0A2020202020203C64697620636C6173733D22736B2D636972636C652D66616465223E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A202020';
wwv_flow_api.g_varchar2_table(84) := '20202020203C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C';
wwv_flow_api.g_varchar2_table(85) := '64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C';
wwv_flow_api.g_varchar2_table(86) := '6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D2273';
wwv_flow_api.g_varchar2_table(87) := '6B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D63697263';
wwv_flow_api.g_varchar2_table(88) := '6C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D636972636C652D666164';
wwv_flow_api.g_varchar2_table(89) := '652D646F74223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E736B2D636972636C652D66616465207B0A202077696474683A20766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D2D736B2D73697A65293B0A';
wwv_flow_api.g_varchar2_table(90) := '2020706F736974696F6E3A2072656C61746976653B200A7D0A0A2E736B2D636972636C652D666164652D646F74207B0A202077696474683A20313030253B0A20206865696768743A20313030253B0A2020706F736974696F6E3A206162736F6C7574653B';
wwv_flow_api.g_varchar2_table(91) := '0A20206C6566743A20303B0A2020746F703A20303B200A7D0A0A2E736B2D636972636C652D666164652D646F743A6265666F7265207B0A2020636F6E74656E743A2027273B0A2020646973706C61793A20626C6F636B3B0A202077696474683A20313525';
wwv_flow_api.g_varchar2_table(92) := '3B0A20206865696768743A203135253B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A2020626F726465722D7261646975733A20313030253B0A2020616E696D6174696F6E3A20736B2D636972636C652D';
wwv_flow_api.g_varchar2_table(93) := '6661646520312E327320696E66696E69746520656173652D696E2D6F757420626F74683B200A7D0A0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428312920207B207472616E73666F726D3A20726F74617465283330646567';
wwv_flow_api.g_varchar2_table(94) := '293B20207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428322920207B207472616E73666F726D3A20726F74617465283630646567293B20207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(95) := '28332920207B207472616E73666F726D3A20726F74617465283930646567293B20207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428342920207B207472616E73666F726D3A20726F7461746528313230646567293B207D';
wwv_flow_api.g_varchar2_table(96) := '0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428352920207B207472616E73666F726D3A20726F7461746528313530646567293B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642836292020';
wwv_flow_api.g_varchar2_table(97) := '7B207472616E73666F726D3A20726F7461746528313830646567293B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428372920207B207472616E73666F726D3A20726F7461746528323130646567293B207D0A2E736B2D';
wwv_flow_api.g_varchar2_table(98) := '636972636C652D666164652D646F743A6E74682D6368696C6428382920207B207472616E73666F726D3A20726F7461746528323430646567293B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428392920207B20747261';
wwv_flow_api.g_varchar2_table(99) := '6E73666F726D3A20726F7461746528323730646567293B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428313029207B207472616E73666F726D3A20726F7461746528333030646567293B207D0A2E736B2D636972636C';
wwv_flow_api.g_varchar2_table(100) := '652D666164652D646F743A6E74682D6368696C6428313129207B207472616E73666F726D3A20726F7461746528333330646567293B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642831293A6265666F726520207B2061';
wwv_flow_api.g_varchar2_table(101) := '6E696D6174696F6E2D64656C61793A202D312E31733B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642832293A6265666F726520207B20616E696D6174696F6E2D64656C61793A202D312E30733B207D0A2E736B2D6369';
wwv_flow_api.g_varchar2_table(102) := '72636C652D666164652D646F743A6E74682D6368696C642833293A6265666F726520207B20616E696D6174696F6E2D64656C61793A202D302E39733B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642834293A6265666F';
wwv_flow_api.g_varchar2_table(103) := '726520207B20616E696D6174696F6E2D64656C61793A202D302E38733B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642835293A6265666F726520207B20616E696D6174696F6E2D64656C61793A202D302E37733B207D';
wwv_flow_api.g_varchar2_table(104) := '0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642836293A6265666F726520207B20616E696D6174696F6E2D64656C61793A202D302E36733B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C6428';
wwv_flow_api.g_varchar2_table(105) := '37293A6265666F726520207B20616E696D6174696F6E2D64656C61793A202D302E35733B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642838293A6265666F726520207B20616E696D6174696F6E2D64656C61793A202D';
wwv_flow_api.g_varchar2_table(106) := '302E34733B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642839293A6265666F726520207B20616E696D6174696F6E2D64656C61793A202D302E33733B207D0A2E736B2D636972636C652D666164652D646F743A6E7468';
wwv_flow_api.g_varchar2_table(107) := '2D6368696C64283130293A6265666F7265207B20616E696D6174696F6E2D64656C61793A202D302E32733B207D0A2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283131293A6265666F7265207B20616E696D6174696F6E2D64';
wwv_flow_api.g_varchar2_table(108) := '656C61793A202D302E31733B207D0A0A406B65796672616D657320736B2D636972636C652D66616465207B0A202030252C203339252C2031303025207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C652830';
wwv_flow_api.g_varchar2_table(109) := '2E36293B0A20207D20343025207B0A202020206F7061636974793A20313B200A202020207472616E73666F726D3A207363616C652831293B0A20207D0A7D0A0A0A2F2A2020477269640A0A202020203C64697620636C6173733D22736B2D67726964223E';
wwv_flow_api.g_varchar2_table(110) := '0A2020202020203C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E0A2020202020203C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E0A2020202020203C64697620636C6173733D22736B2D';
wwv_flow_api.g_varchar2_table(111) := '677269642D63756265223E3C2F6469763E0A2020202020203C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E0A2020202020203C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E0A20202020';
wwv_flow_api.g_varchar2_table(112) := '20203C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E0A2020202020203C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E0A2020202020203C64697620636C6173733D22736B2D677269642D';
wwv_flow_api.g_varchar2_table(113) := '63756265223E3C2F6469763E0A2020202020203C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E0A202020203C2F6469763E0A202A2F0A2E736B2D67726964207B0A202077696474683A20766172282D2D736B2D73697A65';
wwv_flow_api.g_varchar2_table(114) := '293B0A20206865696768743A20766172282D2D736B2D73697A65293B0A20202F2A204375626520706F736974696F6E730A2020202A2031203220330A2020202A2034203520360A2020202A2037203820390A2020202A2F200A207D0A2E736B2D67726964';
wwv_flow_api.g_varchar2_table(115) := '2D63756265207B0A2020202077696474683A2033332E3333253B0A202020206865696768743A2033332E3333253B0A202020206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A20202020666C6F61743A206C6566';
wwv_flow_api.g_varchar2_table(116) := '743B0A20202020616E696D6174696F6E3A20736B2D6772696420312E337320696E66696E69746520656173652D696E2D6F75743B200A7D0A2E736B2D677269642D637562653A6E74682D6368696C64283129207B20616E696D6174696F6E2D64656C6179';
wwv_flow_api.g_varchar2_table(117) := '3A20302E32733B207D0A2E736B2D677269642D637562653A6E74682D6368696C64283229207B20616E696D6174696F6E2D64656C61793A20302E33733B207D0A2E736B2D677269642D637562653A6E74682D6368696C64283329207B20616E696D617469';
wwv_flow_api.g_varchar2_table(118) := '6F6E2D64656C61793A20302E34733B207D0A2E736B2D677269642D637562653A6E74682D6368696C64283429207B20616E696D6174696F6E2D64656C61793A20302E31733B207D0A2E736B2D677269642D637562653A6E74682D6368696C64283529207B';
wwv_flow_api.g_varchar2_table(119) := '20616E696D6174696F6E2D64656C61793A20302E32733B207D0A2E736B2D677269642D637562653A6E74682D6368696C64283629207B20616E696D6174696F6E2D64656C61793A20302E33733B207D0A2E736B2D677269642D637562653A6E74682D6368';
wwv_flow_api.g_varchar2_table(120) := '696C64283729207B20616E696D6174696F6E2D64656C61793A20302E30733B207D0A2E736B2D677269642D637562653A6E74682D6368696C64283829207B20616E696D6174696F6E2D64656C61793A20302E31733B207D0A2E736B2D677269642D637562';
wwv_flow_api.g_varchar2_table(121) := '653A6E74682D6368696C64283929207B20616E696D6174696F6E2D64656C61793A20302E32733B207D0A0A406B65796672616D657320736B2D67726964207B0A202030252C203730252C2031303025207B0A202020207472616E73666F726D3A20736361';
wwv_flow_api.g_varchar2_table(122) := '6C65334428312C20312C2031293B200A20207D20333525207B0A202020207472616E73666F726D3A207363616C65334428302C20302C2031293B200A20207D200A7D0A0A0A2F2A2020466F6C640A0A2020202020203C64697620636C6173733D22736B2D';
wwv_flow_api.g_varchar2_table(123) := '666F6C64223E0A20202020202020203C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E0A20202020202020203C6469';
wwv_flow_api.g_varchar2_table(124) := '7620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E736B2D666F6C64207B0A20';
wwv_flow_api.g_varchar2_table(125) := '2077696474683A20766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D2D736B2D73697A65293B0A2020706F736974696F6E3A2072656C61746976653B0A20207472616E73666F726D3A20726F746174655A283435646567293B';
wwv_flow_api.g_varchar2_table(126) := '200A7D0A2E736B2D666F6C642D63756265207B0A2020666C6F61743A206C6566743B0A202077696474683A203530253B0A20206865696768743A203530253B0A2020706F736974696F6E3A2072656C61746976653B0A20207472616E73666F726D3A2073';
wwv_flow_api.g_varchar2_table(127) := '63616C6528312E31293B200A7D0A0A2E736B2D666F6C642D637562653A6265666F7265207B0A2020636F6E74656E743A2027273B0A2020706F736974696F6E3A206162736F6C7574653B0A2020746F703A20303B0A20206C6566743A20303B0A20207769';
wwv_flow_api.g_varchar2_table(128) := '6474683A20313030253B0A20206865696768743A20313030253B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A2020616E696D6174696F6E3A20736B2D666F6C6420322E347320696E66696E697465206C';
wwv_flow_api.g_varchar2_table(129) := '696E65617220626F74683B0A20207472616E73666F726D2D6F726967696E3A203130302520313030253B200A7D0A2E736B2D666F6C642D637562653A6E74682D6368696C64283229207B207472616E73666F726D3A207363616C6528312E312920726F74';
wwv_flow_api.g_varchar2_table(130) := '6174655A283930646567293B207D0A2E736B2D666F6C642D637562653A6E74682D6368696C64283429207B207472616E73666F726D3A207363616C6528312E312920726F746174655A28313830646567293B207D0A2E736B2D666F6C642D637562653A6E';
wwv_flow_api.g_varchar2_table(131) := '74682D6368696C64283329207B207472616E73666F726D3A207363616C6528312E312920726F746174655A28323730646567293B207D0A2E736B2D666F6C642D637562653A6E74682D6368696C642832293A6265666F7265207B20616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(132) := '2D64656C61793A20302E33733B207D0A2E736B2D666F6C642D637562653A6E74682D6368696C642834293A6265666F7265207B20616E696D6174696F6E2D64656C61793A20302E36733B207D0A2E736B2D666F6C642D637562653A6E74682D6368696C64';
wwv_flow_api.g_varchar2_table(133) := '2833293A6265666F7265207B20616E696D6174696F6E2D64656C61793A20302E39733B207D0A0A406B65796672616D657320736B2D666F6C64207B0A202030252C20313025207B0A202020207472616E73666F726D3A2070657273706563746976652831';
wwv_flow_api.g_varchar2_table(134) := '343070782920726F7461746558282D313830646567293B0A202020206F7061636974793A20303B200A20207D203235252C20373525207B0A202020207472616E73666F726D3A2070657273706563746976652831343070782920726F7461746558283064';
wwv_flow_api.g_varchar2_table(135) := '6567293B0A202020206F7061636974793A20313B200A20207D203930252C2031303025207B0A202020207472616E73666F726D3A2070657273706563746976652831343070782920726F746174655928313830646567293B0A202020206F706163697479';
wwv_flow_api.g_varchar2_table(136) := '3A20303B0A20207D200A7D0A0A0A2F2A202057616E6465720A0A2020202020203C64697620636C6173733D22736B2D77616E646572223E0A20202020202020203C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E0A20';
wwv_flow_api.g_varchar2_table(137) := '202020202020203C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E0A20202020202020203C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E0A20202020202020203C64697620636C';
wwv_flow_api.g_varchar2_table(138) := '6173733D22736B2D77616E6465722D63756265223E3C2F6469763E0A2020202020203C2F6469763E0A202A2F0A2E736B2D77616E646572207B0A202077696474683A20766172282D2D736B2D73697A65293B0A20206865696768743A20766172282D2D73';
wwv_flow_api.g_varchar2_table(139) := '6B2D73697A65293B0A2020706F736974696F6E3A2072656C61746976653B200A7D0A0A2E736B2D77616E6465722D63756265207B0A20206261636B67726F756E642D636F6C6F723A20766172282D2D736B2D636F6C6F72293B0A202077696474683A2032';
wwv_flow_api.g_varchar2_table(140) := '30253B0A20206865696768743A203230253B0A2020706F736974696F6E3A206162736F6C7574653B0A2020746F703A20303B0A20206C6566743A20303B0A20202D2D736B2D77616E6465722D64697374616E63653A2063616C6328766172282D2D736B2D';
wwv_flow_api.g_varchar2_table(141) := '73697A6529202A20302E3735293B0A2020616E696D6174696F6E3A20736B2D77616E64657220322E307320656173652D696E2D6F7574202D322E307320696E66696E69746520626F74683B0A7D0A2E736B2D77616E6465722D637562653A6E74682D6368';
wwv_flow_api.g_varchar2_table(142) := '696C64283229207B20616E696D6174696F6E2D64656C61793A202D302E35733B207D0A2E736B2D77616E6465722D637562653A6E74682D6368696C64283329207B20616E696D6174696F6E2D64656C61793A202D312E30733B207D0A0A406B6579667261';
wwv_flow_api.g_varchar2_table(143) := '6D657320736B2D77616E646572207B0A20203025207B0A202020207472616E73666F726D3A20726F746174652830646567293B200A20207D20323525207B0A202020207472616E73666F726D3A207472616E736C6174655828766172282D2D736B2D7761';
wwv_flow_api.g_varchar2_table(144) := '6E6465722D64697374616E6365292920726F74617465282D393064656729207363616C6528302E36293B200A20207D20353025207B202F2A204D616B6520464620726F7461746520696E2074686520726967687420646972656374696F6E202A2F0A2020';
wwv_flow_api.g_varchar2_table(145) := '20207472616E73666F726D3A207472616E736C6174655828766172282D2D736B2D77616E6465722D64697374616E63652929207472616E736C6174655928766172282D2D736B2D77616E6465722D64697374616E6365292920726F74617465282D313739';
wwv_flow_api.g_varchar2_table(146) := '646567293B200A20207D2035302E3125207B0A202020207472616E73666F726D3A207472616E736C6174655828766172282D2D736B2D77616E6465722D64697374616E63652929207472616E736C6174655928766172282D2D736B2D77616E6465722D64';
wwv_flow_api.g_varchar2_table(147) := '697374616E6365292920726F74617465282D313830646567293B200A20207D20373525207B0A202020207472616E73666F726D3A207472616E736C61746558283029207472616E736C6174655928766172282D2D736B2D77616E6465722D64697374616E';
wwv_flow_api.g_varchar2_table(148) := '6365292920726F74617465282D32373064656729207363616C6528302E36293B0A20207D2031303025207B0A202020207472616E73666F726D3A20726F74617465282D333630646567293B200A20207D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(137266774934534168)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'css/spinkit.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E616F702D50726F63657373696E67207B0A20207A2D696E6465783A2039393939393939393B0A7D0A0A2E742D427574746F6E202E616F702D50726F63657373696E67207B0A20202D2D736B2D73697A653A20766172282D2D612D627574746F6E2D666F';
wwv_flow_api.g_varchar2_table(2) := '6E742D73697A652C2032307078293B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(137267441829535271)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'css/spinkit-aop.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210A202A20406F76657276696577206573362D70726F6D697365202D20612074696E7920696D706C656D656E746174696F6E206F662050726F6D697365732F412B2E0A202A2040636F7079726967687420436F707972696768742028632920323031';
wwv_flow_api.g_varchar2_table(2) := '3420596568756461204B61747A2C20546F6D2044616C652C2053746566616E2050656E6E657220616E6420636F6E7472696275746F72732028436F6E76657273696F6E20746F2045533620415049206279204A616B6520417263686962616C64290A202A';
wwv_flow_api.g_varchar2_table(3) := '20406C6963656E73652020204C6963656E73656420756E646572204D4954206C6963656E73650A202A2020202020202020202020205365652068747470733A2F2F7261772E67697468756275736572636F6E74656E742E636F6D2F73746566616E70656E';
wwv_flow_api.g_varchar2_table(4) := '6E65722F6573362D70726F6D6973652F6D61737465722F4C4943454E53450A202A204076657273696F6E20202076342E322E342B33313465343833310A202A2F0A0A2866756E6374696F6E2028676C6F62616C2C20666163746F727929207B0A09747970';
wwv_flow_api.g_varchar2_table(5) := '656F66206578706F727473203D3D3D20276F626A6563742720262620747970656F66206D6F64756C6520213D3D2027756E646566696E656427203F206D6F64756C652E6578706F727473203D20666163746F72792829203A0A09747970656F6620646566';
wwv_flow_api.g_varchar2_table(6) := '696E65203D3D3D202766756E6374696F6E2720262620646566696E652E616D64203F20646566696E6528666163746F727929203A0A0928676C6F62616C2E45533650726F6D697365203D20666163746F72792829293B0A7D28746869732C202866756E63';
wwv_flow_api.g_varchar2_table(7) := '74696F6E202829207B202775736520737472696374273B0A0A66756E6374696F6E206F626A6563744F7246756E6374696F6E287829207B0A20207661722074797065203D20747970656F6620783B0A202072657475726E207820213D3D206E756C6C2026';
wwv_flow_api.g_varchar2_table(8) := '26202874797065203D3D3D20276F626A65637427207C7C2074797065203D3D3D202766756E6374696F6E27293B0A7D0A0A66756E6374696F6E20697346756E6374696F6E287829207B0A202072657475726E20747970656F662078203D3D3D202766756E';
wwv_flow_api.g_varchar2_table(9) := '6374696F6E273B0A7D0A0A0A0A766172205F69734172726179203D20766F696420303B0A6966202841727261792E6973417272617929207B0A20205F69734172726179203D2041727261792E697341727261793B0A7D20656C7365207B0A20205F697341';
wwv_flow_api.g_varchar2_table(10) := '72726179203D2066756E6374696F6E20287829207B0A2020202072657475726E204F626A6563742E70726F746F747970652E746F537472696E672E63616C6C287829203D3D3D20275B6F626A6563742041727261795D273B0A20207D3B0A7D0A0A766172';
wwv_flow_api.g_varchar2_table(11) := '2069734172726179203D205F697341727261793B0A0A766172206C656E203D20303B0A7661722076657274784E657874203D20766F696420303B0A76617220637573746F6D5363686564756C6572466E203D20766F696420303B0A0A7661722061736170';
wwv_flow_api.g_varchar2_table(12) := '203D2066756E6374696F6E20617361702863616C6C6261636B2C2061726729207B0A202071756575655B6C656E5D203D2063616C6C6261636B3B0A202071756575655B6C656E202B20315D203D206172673B0A20206C656E202B3D20323B0A2020696620';
wwv_flow_api.g_varchar2_table(13) := '286C656E203D3D3D203229207B0A202020202F2F204966206C656E20697320322C2074686174206D65616E732074686174207765206E65656420746F207363686564756C6520616E206173796E6320666C7573682E0A202020202F2F2049662061646469';
wwv_flow_api.g_varchar2_table(14) := '74696F6E616C2063616C6C6261636B732061726520717565756564206265666F72652074686520717565756520697320666C75736865642C20746865790A202020202F2F2077696C6C2062652070726F636573736564206279207468697320666C757368';
wwv_flow_api.g_varchar2_table(15) := '207468617420776520617265207363686564756C696E672E0A2020202069662028637573746F6D5363686564756C6572466E29207B0A202020202020637573746F6D5363686564756C6572466E28666C757368293B0A202020207D20656C7365207B0A20';
wwv_flow_api.g_varchar2_table(16) := '20202020207363686564756C65466C75736828293B0A202020207D0A20207D0A7D3B0A0A66756E6374696F6E207365745363686564756C6572287363686564756C65466E29207B0A2020637573746F6D5363686564756C6572466E203D20736368656475';
wwv_flow_api.g_varchar2_table(17) := '6C65466E3B0A7D0A0A66756E6374696F6E20736574417361702861736170466E29207B0A202061736170203D2061736170466E3B0A7D0A0A7661722062726F7773657257696E646F77203D20747970656F662077696E646F7720213D3D2027756E646566';
wwv_flow_api.g_varchar2_table(18) := '696E656427203F2077696E646F77203A20756E646566696E65643B0A7661722062726F77736572476C6F62616C203D2062726F7773657257696E646F77207C7C207B7D3B0A7661722042726F777365724D75746174696F6E4F62736572766572203D2062';
wwv_flow_api.g_varchar2_table(19) := '726F77736572476C6F62616C2E4D75746174696F6E4F62736572766572207C7C2062726F77736572476C6F62616C2E5765624B69744D75746174696F6E4F627365727665723B0A7661722069734E6F6465203D20747970656F662073656C66203D3D3D20';
wwv_flow_api.g_varchar2_table(20) := '27756E646566696E65642720262620747970656F662070726F6365737320213D3D2027756E646566696E656427202626207B7D2E746F537472696E672E63616C6C2870726F6365737329203D3D3D20275B6F626A6563742070726F636573735D273B0A0A';
wwv_flow_api.g_varchar2_table(21) := '2F2F207465737420666F722077656220776F726B657220627574206E6F7420696E20494531300A766172206973576F726B6572203D20747970656F662055696E7438436C616D706564417272617920213D3D2027756E646566696E656427202626207479';
wwv_flow_api.g_varchar2_table(22) := '70656F6620696D706F72745363726970747320213D3D2027756E646566696E65642720262620747970656F66204D6573736167654368616E6E656C20213D3D2027756E646566696E6564273B0A0A2F2F206E6F64650A66756E6374696F6E207573654E65';
wwv_flow_api.g_varchar2_table(23) := '78745469636B2829207B0A20202F2F206E6F64652076657273696F6E20302E31302E7820646973706C6179732061206465707265636174696F6E207761726E696E67207768656E206E6578745469636B2069732075736564207265637572736976656C79';
wwv_flow_api.g_varchar2_table(24) := '0A20202F2F207365652068747470733A2F2F6769746875622E636F6D2F63756A6F6A732F7768656E2F6973737565732F34313020666F722064657461696C730A202072657475726E2066756E6374696F6E202829207B0A2020202072657475726E207072';
wwv_flow_api.g_varchar2_table(25) := '6F636573732E6E6578745469636B28666C757368293B0A20207D3B0A7D0A0A2F2F2076657274780A66756E6374696F6E20757365566572747854696D65722829207B0A202069662028747970656F662076657274784E65787420213D3D2027756E646566';
wwv_flow_api.g_varchar2_table(26) := '696E65642729207B0A2020202072657475726E2066756E6374696F6E202829207B0A20202020202076657274784E65787428666C757368293B0A202020207D3B0A20207D0A0A202072657475726E2075736553657454696D656F757428293B0A7D0A0A66';
wwv_flow_api.g_varchar2_table(27) := '756E6374696F6E207573654D75746174696F6E4F627365727665722829207B0A202076617220697465726174696F6E73203D20303B0A2020766172206F62736572766572203D206E65772042726F777365724D75746174696F6E4F627365727665722866';
wwv_flow_api.g_varchar2_table(28) := '6C757368293B0A2020766172206E6F6465203D20646F63756D656E742E637265617465546578744E6F6465282727293B0A20206F627365727665722E6F627365727665286E6F64652C207B20636861726163746572446174613A2074727565207D293B0A';
wwv_flow_api.g_varchar2_table(29) := '0A202072657475726E2066756E6374696F6E202829207B0A202020206E6F64652E64617461203D20697465726174696F6E73203D202B2B697465726174696F6E73202520323B0A20207D3B0A7D0A0A2F2F2077656220776F726B65720A66756E6374696F';
wwv_flow_api.g_varchar2_table(30) := '6E207573654D6573736167654368616E6E656C2829207B0A2020766172206368616E6E656C203D206E6577204D6573736167654368616E6E656C28293B0A20206368616E6E656C2E706F7274312E6F6E6D657373616765203D20666C7573683B0A202072';
wwv_flow_api.g_varchar2_table(31) := '657475726E2066756E6374696F6E202829207B0A2020202072657475726E206368616E6E656C2E706F7274322E706F73744D6573736167652830293B0A20207D3B0A7D0A0A66756E6374696F6E2075736553657454696D656F75742829207B0A20202F2F';
wwv_flow_api.g_varchar2_table(32) := '2053746F72652073657454696D656F7574207265666572656E636520736F206573362D70726F6D6973652077696C6C20626520756E61666665637465642062790A20202F2F206F7468657220636F6465206D6F64696679696E672073657454696D656F75';
wwv_flow_api.g_varchar2_table(33) := '7420286C696B652073696E6F6E2E75736546616B6554696D6572732829290A202076617220676C6F62616C53657454696D656F7574203D2073657454696D656F75743B0A202072657475726E2066756E6374696F6E202829207B0A202020207265747572';
wwv_flow_api.g_varchar2_table(34) := '6E20676C6F62616C53657454696D656F757428666C7573682C2031293B0A20207D3B0A7D0A0A766172207175657565203D206E65772041727261792831303030293B0A66756E6374696F6E20666C7573682829207B0A2020666F7220287661722069203D';
wwv_flow_api.g_varchar2_table(35) := '20303B2069203C206C656E3B2069202B3D203229207B0A202020207661722063616C6C6261636B203D2071756575655B695D3B0A2020202076617220617267203D2071756575655B69202B20315D3B0A0A2020202063616C6C6261636B28617267293B0A';
wwv_flow_api.g_varchar2_table(36) := '0A2020202071756575655B695D203D20756E646566696E65643B0A2020202071756575655B69202B20315D203D20756E646566696E65643B0A20207D0A0A20206C656E203D20303B0A7D0A0A66756E6374696F6E20617474656D70745665727478282920';
wwv_flow_api.g_varchar2_table(37) := '7B0A2020747279207B0A20202020766172207665727478203D2046756E6374696F6E282772657475726E2074686973272928292E726571756972652827766572747827293B0A2020202076657274784E657874203D2076657274782E72756E4F6E4C6F6F';
wwv_flow_api.g_varchar2_table(38) := '70207C7C2076657274782E72756E4F6E436F6E746578743B0A2020202072657475726E20757365566572747854696D657228293B0A20207D20636174636820286529207B0A2020202072657475726E2075736553657454696D656F757428293B0A20207D';
wwv_flow_api.g_varchar2_table(39) := '0A7D0A0A766172207363686564756C65466C757368203D20766F696420303B0A2F2F204465636964652077686174206173796E63206D6574686F6420746F2075736520746F2074726967676572696E672070726F63657373696E67206F66207175657565';
wwv_flow_api.g_varchar2_table(40) := '642063616C6C6261636B733A0A6966202869734E6F646529207B0A20207363686564756C65466C757368203D207573654E6578745469636B28293B0A7D20656C7365206966202842726F777365724D75746174696F6E4F6273657276657229207B0A2020';
wwv_flow_api.g_varchar2_table(41) := '7363686564756C65466C757368203D207573654D75746174696F6E4F6273657276657228293B0A7D20656C736520696620286973576F726B657229207B0A20207363686564756C65466C757368203D207573654D6573736167654368616E6E656C28293B';
wwv_flow_api.g_varchar2_table(42) := '0A7D20656C7365206966202862726F7773657257696E646F77203D3D3D20756E646566696E656420262620747970656F662072657175697265203D3D3D202766756E6374696F6E2729207B0A20207363686564756C65466C757368203D20617474656D70';
wwv_flow_api.g_varchar2_table(43) := '74566572747828293B0A7D20656C7365207B0A20207363686564756C65466C757368203D2075736553657454696D656F757428293B0A7D0A0A66756E6374696F6E207468656E286F6E46756C66696C6C6D656E742C206F6E52656A656374696F6E29207B';
wwv_flow_api.g_varchar2_table(44) := '0A202076617220706172656E74203D20746869733B0A0A2020766172206368696C64203D206E657720746869732E636F6E7374727563746F72286E6F6F70293B0A0A2020696620286368696C645B50524F4D4953455F49445D203D3D3D20756E64656669';
wwv_flow_api.g_varchar2_table(45) := '6E656429207B0A202020206D616B6550726F6D697365286368696C64293B0A20207D0A0A2020766172205F7374617465203D20706172656E742E5F73746174653B0A0A0A2020696620285F737461746529207B0A202020207661722063616C6C6261636B';
wwv_flow_api.g_varchar2_table(46) := '203D20617267756D656E74735B5F7374617465202D20315D3B0A20202020617361702866756E6374696F6E202829207B0A20202020202072657475726E20696E766F6B6543616C6C6261636B285F73746174652C206368696C642C2063616C6C6261636B';
wwv_flow_api.g_varchar2_table(47) := '2C20706172656E742E5F726573756C74293B0A202020207D293B0A20207D20656C7365207B0A2020202073756273637269626528706172656E742C206368696C642C206F6E46756C66696C6C6D656E742C206F6E52656A656374696F6E293B0A20207D0A';
wwv_flow_api.g_varchar2_table(48) := '0A202072657475726E206368696C643B0A7D0A0A2F2A2A0A20206050726F6D6973652E7265736F6C7665602072657475726E7320612070726F6D69736520746861742077696C6C206265636F6D65207265736F6C7665642077697468207468650A202070';
wwv_flow_api.g_varchar2_table(49) := '6173736564206076616C7565602E2049742069732073686F727468616E6420666F722074686520666F6C6C6F77696E673A0A0A20206060606A6176617363726970740A20206C65742070726F6D697365203D206E65772050726F6D6973652866756E6374';
wwv_flow_api.g_varchar2_table(50) := '696F6E287265736F6C76652C2072656A656374297B0A202020207265736F6C76652831293B0A20207D293B0A0A202070726F6D6973652E7468656E2866756E6374696F6E2876616C7565297B0A202020202F2F2076616C7565203D3D3D20310A20207D29';
wwv_flow_api.g_varchar2_table(51) := '3B0A20206060600A0A2020496E7374656164206F662077726974696E67207468652061626F76652C20796F757220636F6465206E6F772073696D706C79206265636F6D65732074686520666F6C6C6F77696E673A0A0A20206060606A6176617363726970';
wwv_flow_api.g_varchar2_table(52) := '740A20206C65742070726F6D697365203D2050726F6D6973652E7265736F6C76652831293B0A0A202070726F6D6973652E7468656E2866756E6374696F6E2876616C7565297B0A202020202F2F2076616C7565203D3D3D20310A20207D293B0A20206060';
wwv_flow_api.g_varchar2_table(53) := '600A0A2020406D6574686F64207265736F6C76650A2020407374617469630A202040706172616D207B416E797D2076616C75652076616C75652074686174207468652072657475726E65642070726F6D6973652077696C6C206265207265736F6C766564';
wwv_flow_api.g_varchar2_table(54) := '20776974680A202055736566756C20666F7220746F6F6C696E672E0A20204072657475726E207B50726F6D6973657D20612070726F6D69736520746861742077696C6C206265636F6D652066756C66696C6C656420776974682074686520676976656E0A';
wwv_flow_api.g_varchar2_table(55) := '20206076616C7565600A2A2F0A66756E6374696F6E207265736F6C76652431286F626A65637429207B0A20202F2A6A7368696E742076616C6964746869733A74727565202A2F0A202076617220436F6E7374727563746F72203D20746869733B0A0A2020';
wwv_flow_api.g_varchar2_table(56) := '696620286F626A65637420262620747970656F66206F626A656374203D3D3D20276F626A65637427202626206F626A6563742E636F6E7374727563746F72203D3D3D20436F6E7374727563746F7229207B0A2020202072657475726E206F626A6563743B';
wwv_flow_api.g_varchar2_table(57) := '0A20207D0A0A20207661722070726F6D697365203D206E657720436F6E7374727563746F72286E6F6F70293B0A20207265736F6C76652870726F6D6973652C206F626A656374293B0A202072657475726E2070726F6D6973653B0A7D0A0A766172205052';
wwv_flow_api.g_varchar2_table(58) := '4F4D4953455F4944203D204D6174682E72616E646F6D28292E746F537472696E67283336292E737562737472696E672832293B0A0A66756E6374696F6E206E6F6F702829207B7D0A0A7661722050454E44494E47203D20766F696420303B0A7661722046';
wwv_flow_api.g_varchar2_table(59) := '554C46494C4C4544203D20313B0A7661722052454A4543544544203D20323B0A0A766172205452595F43415443485F4552524F52203D207B206572726F723A206E756C6C207D3B0A0A66756E6374696F6E2073656C6646756C66696C6C6D656E74282920';
wwv_flow_api.g_varchar2_table(60) := '7B0A202072657475726E206E657720547970654572726F722822596F752063616E6E6F74207265736F6C766520612070726F6D697365207769746820697473656C6622293B0A7D0A0A66756E6374696F6E2063616E6E6F7452657475726E4F776E282920';
wwv_flow_api.g_varchar2_table(61) := '7B0A202072657475726E206E657720547970654572726F722827412070726F6D697365732063616C6C6261636B2063616E6E6F742072657475726E20746861742073616D652070726F6D6973652E27293B0A7D0A0A66756E6374696F6E20676574546865';
wwv_flow_api.g_varchar2_table(62) := '6E2870726F6D69736529207B0A2020747279207B0A2020202072657475726E2070726F6D6973652E7468656E3B0A20207D20636174636820286572726F7229207B0A202020205452595F43415443485F4552524F522E6572726F72203D206572726F723B';
wwv_flow_api.g_varchar2_table(63) := '0A2020202072657475726E205452595F43415443485F4552524F523B0A20207D0A7D0A0A66756E6374696F6E207472795468656E287468656E2424312C2076616C75652C2066756C66696C6C6D656E7448616E646C65722C2072656A656374696F6E4861';
wwv_flow_api.g_varchar2_table(64) := '6E646C657229207B0A2020747279207B0A202020207468656E2424312E63616C6C2876616C75652C2066756C66696C6C6D656E7448616E646C65722C2072656A656374696F6E48616E646C6572293B0A20207D20636174636820286529207B0A20202020';
wwv_flow_api.g_varchar2_table(65) := '72657475726E20653B0A20207D0A7D0A0A66756E6374696F6E2068616E646C65466F726569676E5468656E61626C652870726F6D6973652C207468656E61626C652C207468656E24243129207B0A2020617361702866756E6374696F6E202870726F6D69';
wwv_flow_api.g_varchar2_table(66) := '736529207B0A20202020766172207365616C6564203D2066616C73653B0A20202020766172206572726F72203D207472795468656E287468656E2424312C207468656E61626C652C2066756E6374696F6E202876616C756529207B0A2020202020206966';
wwv_flow_api.g_varchar2_table(67) := '20287365616C656429207B0A202020202020202072657475726E3B0A2020202020207D0A2020202020207365616C6564203D20747275653B0A202020202020696620287468656E61626C6520213D3D2076616C756529207B0A2020202020202020726573';
wwv_flow_api.g_varchar2_table(68) := '6F6C76652870726F6D6973652C2076616C7565293B0A2020202020207D20656C7365207B0A202020202020202066756C66696C6C2870726F6D6973652C2076616C7565293B0A2020202020207D0A202020207D2C2066756E6374696F6E2028726561736F';
wwv_flow_api.g_varchar2_table(69) := '6E29207B0A202020202020696620287365616C656429207B0A202020202020202072657475726E3B0A2020202020207D0A2020202020207365616C6564203D20747275653B0A0A20202020202072656A6563742870726F6D6973652C20726561736F6E29';
wwv_flow_api.g_varchar2_table(70) := '3B0A202020207D2C2027536574746C653A2027202B202870726F6D6973652E5F6C6162656C207C7C202720756E6B6E6F776E2070726F6D6973652729293B0A0A2020202069662028217365616C6564202626206572726F7229207B0A2020202020207365';
wwv_flow_api.g_varchar2_table(71) := '616C6564203D20747275653B0A20202020202072656A6563742870726F6D6973652C206572726F72293B0A202020207D0A20207D2C2070726F6D697365293B0A7D0A0A66756E6374696F6E2068616E646C654F776E5468656E61626C652870726F6D6973';
wwv_flow_api.g_varchar2_table(72) := '652C207468656E61626C6529207B0A2020696620287468656E61626C652E5F7374617465203D3D3D2046554C46494C4C454429207B0A2020202066756C66696C6C2870726F6D6973652C207468656E61626C652E5F726573756C74293B0A20207D20656C';
wwv_flow_api.g_varchar2_table(73) := '736520696620287468656E61626C652E5F7374617465203D3D3D2052454A454354454429207B0A2020202072656A6563742870726F6D6973652C207468656E61626C652E5F726573756C74293B0A20207D20656C7365207B0A2020202073756273637269';
wwv_flow_api.g_varchar2_table(74) := '6265287468656E61626C652C20756E646566696E65642C2066756E6374696F6E202876616C756529207B0A20202020202072657475726E207265736F6C76652870726F6D6973652C2076616C7565293B0A202020207D2C2066756E6374696F6E20287265';
wwv_flow_api.g_varchar2_table(75) := '61736F6E29207B0A20202020202072657475726E2072656A6563742870726F6D6973652C20726561736F6E293B0A202020207D293B0A20207D0A7D0A0A66756E6374696F6E2068616E646C654D617962655468656E61626C652870726F6D6973652C206D';
wwv_flow_api.g_varchar2_table(76) := '617962655468656E61626C652C207468656E24243129207B0A2020696620286D617962655468656E61626C652E636F6E7374727563746F72203D3D3D2070726F6D6973652E636F6E7374727563746F72202626207468656E242431203D3D3D207468656E';
wwv_flow_api.g_varchar2_table(77) := '202626206D617962655468656E61626C652E636F6E7374727563746F722E7265736F6C7665203D3D3D207265736F6C7665243129207B0A2020202068616E646C654F776E5468656E61626C652870726F6D6973652C206D617962655468656E61626C6529';
wwv_flow_api.g_varchar2_table(78) := '3B0A20207D20656C7365207B0A20202020696620287468656E242431203D3D3D205452595F43415443485F4552524F5229207B0A20202020202072656A6563742870726F6D6973652C205452595F43415443485F4552524F522E6572726F72293B0A2020';
wwv_flow_api.g_varchar2_table(79) := '202020205452595F43415443485F4552524F522E6572726F72203D206E756C6C3B0A202020207D20656C736520696620287468656E242431203D3D3D20756E646566696E656429207B0A20202020202066756C66696C6C2870726F6D6973652C206D6179';
wwv_flow_api.g_varchar2_table(80) := '62655468656E61626C65293B0A202020207D20656C73652069662028697346756E6374696F6E287468656E2424312929207B0A20202020202068616E646C65466F726569676E5468656E61626C652870726F6D6973652C206D617962655468656E61626C';
wwv_flow_api.g_varchar2_table(81) := '652C207468656E242431293B0A202020207D20656C7365207B0A20202020202066756C66696C6C2870726F6D6973652C206D617962655468656E61626C65293B0A202020207D0A20207D0A7D0A0A66756E6374696F6E207265736F6C76652870726F6D69';
wwv_flow_api.g_varchar2_table(82) := '73652C2076616C756529207B0A20206966202870726F6D697365203D3D3D2076616C756529207B0A2020202072656A6563742870726F6D6973652C2073656C6646756C66696C6C6D656E742829293B0A20207D20656C736520696620286F626A6563744F';
wwv_flow_api.g_varchar2_table(83) := '7246756E6374696F6E2876616C75652929207B0A2020202068616E646C654D617962655468656E61626C652870726F6D6973652C2076616C75652C206765745468656E2876616C756529293B0A20207D20656C7365207B0A2020202066756C66696C6C28';
wwv_flow_api.g_varchar2_table(84) := '70726F6D6973652C2076616C7565293B0A20207D0A7D0A0A66756E6374696F6E207075626C69736852656A656374696F6E2870726F6D69736529207B0A20206966202870726F6D6973652E5F6F6E6572726F7229207B0A2020202070726F6D6973652E5F';
wwv_flow_api.g_varchar2_table(85) := '6F6E6572726F722870726F6D6973652E5F726573756C74293B0A20207D0A0A20207075626C6973682870726F6D697365293B0A7D0A0A66756E6374696F6E2066756C66696C6C2870726F6D6973652C2076616C756529207B0A20206966202870726F6D69';
wwv_flow_api.g_varchar2_table(86) := '73652E5F737461746520213D3D2050454E44494E4729207B0A2020202072657475726E3B0A20207D0A0A202070726F6D6973652E5F726573756C74203D2076616C75653B0A202070726F6D6973652E5F7374617465203D2046554C46494C4C45443B0A0A';
wwv_flow_api.g_varchar2_table(87) := '20206966202870726F6D6973652E5F73756273637269626572732E6C656E67746820213D3D203029207B0A2020202061736170287075626C6973682C2070726F6D697365293B0A20207D0A7D0A0A66756E6374696F6E2072656A6563742870726F6D6973';
wwv_flow_api.g_varchar2_table(88) := '652C20726561736F6E29207B0A20206966202870726F6D6973652E5F737461746520213D3D2050454E44494E4729207B0A2020202072657475726E3B0A20207D0A202070726F6D6973652E5F7374617465203D2052454A45435445443B0A202070726F6D';
wwv_flow_api.g_varchar2_table(89) := '6973652E5F726573756C74203D20726561736F6E3B0A0A202061736170287075626C69736852656A656374696F6E2C2070726F6D697365293B0A7D0A0A66756E6374696F6E2073756273637269626528706172656E742C206368696C642C206F6E46756C';
wwv_flow_api.g_varchar2_table(90) := '66696C6C6D656E742C206F6E52656A656374696F6E29207B0A2020766172205F7375627363726962657273203D20706172656E742E5F73756273637269626572733B0A2020766172206C656E677468203D205F73756273637269626572732E6C656E6774';
wwv_flow_api.g_varchar2_table(91) := '683B0A0A0A2020706172656E742E5F6F6E6572726F72203D206E756C6C3B0A0A20205F73756273637269626572735B6C656E6774685D203D206368696C643B0A20205F73756273637269626572735B6C656E677468202B2046554C46494C4C45445D203D';
wwv_flow_api.g_varchar2_table(92) := '206F6E46756C66696C6C6D656E743B0A20205F73756273637269626572735B6C656E677468202B2052454A45435445445D203D206F6E52656A656374696F6E3B0A0A2020696620286C656E677468203D3D3D203020262620706172656E742E5F73746174';
wwv_flow_api.g_varchar2_table(93) := '6529207B0A2020202061736170287075626C6973682C20706172656E74293B0A20207D0A7D0A0A66756E6374696F6E207075626C6973682870726F6D69736529207B0A2020766172207375627363726962657273203D2070726F6D6973652E5F73756273';
wwv_flow_api.g_varchar2_table(94) := '637269626572733B0A202076617220736574746C6564203D2070726F6D6973652E5F73746174653B0A0A20206966202873756273637269626572732E6C656E677468203D3D3D203029207B0A2020202072657475726E3B0A20207D0A0A20207661722063';
wwv_flow_api.g_varchar2_table(95) := '68696C64203D20766F696420302C0A20202020202063616C6C6261636B203D20766F696420302C0A20202020202064657461696C203D2070726F6D6973652E5F726573756C743B0A0A2020666F7220287661722069203D20303B2069203C207375627363';
wwv_flow_api.g_varchar2_table(96) := '7269626572732E6C656E6774683B2069202B3D203329207B0A202020206368696C64203D2073756273637269626572735B695D3B0A2020202063616C6C6261636B203D2073756273637269626572735B69202B20736574746C65645D3B0A0A2020202069';
wwv_flow_api.g_varchar2_table(97) := '6620286368696C6429207B0A202020202020696E766F6B6543616C6C6261636B28736574746C65642C206368696C642C2063616C6C6261636B2C2064657461696C293B0A202020207D20656C7365207B0A20202020202063616C6C6261636B2864657461';
wwv_flow_api.g_varchar2_table(98) := '696C293B0A202020207D0A20207D0A0A202070726F6D6973652E5F73756273637269626572732E6C656E677468203D20303B0A7D0A0A66756E6374696F6E2074727943617463682863616C6C6261636B2C2064657461696C29207B0A2020747279207B0A';
wwv_flow_api.g_varchar2_table(99) := '2020202072657475726E2063616C6C6261636B2864657461696C293B0A20207D20636174636820286529207B0A202020205452595F43415443485F4552524F522E6572726F72203D20653B0A2020202072657475726E205452595F43415443485F455252';
wwv_flow_api.g_varchar2_table(100) := '4F523B0A20207D0A7D0A0A66756E6374696F6E20696E766F6B6543616C6C6261636B28736574746C65642C2070726F6D6973652C2063616C6C6261636B2C2064657461696C29207B0A20207661722068617343616C6C6261636B203D20697346756E6374';
wwv_flow_api.g_varchar2_table(101) := '696F6E2863616C6C6261636B292C0A20202020202076616C7565203D20766F696420302C0A2020202020206572726F72203D20766F696420302C0A202020202020737563636565646564203D20766F696420302C0A2020202020206661696C6564203D20';
wwv_flow_api.g_varchar2_table(102) := '766F696420303B0A0A20206966202868617343616C6C6261636B29207B0A2020202076616C7565203D2074727943617463682863616C6C6261636B2C2064657461696C293B0A0A202020206966202876616C7565203D3D3D205452595F43415443485F45';
wwv_flow_api.g_varchar2_table(103) := '52524F5229207B0A2020202020206661696C6564203D20747275653B0A2020202020206572726F72203D2076616C75652E6572726F723B0A20202020202076616C75652E6572726F72203D206E756C6C3B0A202020207D20656C7365207B0A2020202020';
wwv_flow_api.g_varchar2_table(104) := '20737563636565646564203D20747275653B0A202020207D0A0A202020206966202870726F6D697365203D3D3D2076616C756529207B0A20202020202072656A6563742870726F6D6973652C2063616E6E6F7452657475726E4F776E2829293B0A202020';
wwv_flow_api.g_varchar2_table(105) := '20202072657475726E3B0A202020207D0A20207D20656C7365207B0A2020202076616C7565203D2064657461696C3B0A20202020737563636565646564203D20747275653B0A20207D0A0A20206966202870726F6D6973652E5F737461746520213D3D20';
wwv_flow_api.g_varchar2_table(106) := '50454E44494E4729207B0A202020202F2F206E6F6F700A20207D20656C7365206966202868617343616C6C6261636B2026262073756363656564656429207B0A202020207265736F6C76652870726F6D6973652C2076616C7565293B0A20207D20656C73';
wwv_flow_api.g_varchar2_table(107) := '6520696620286661696C656429207B0A2020202072656A6563742870726F6D6973652C206572726F72293B0A20207D20656C73652069662028736574746C6564203D3D3D2046554C46494C4C454429207B0A2020202066756C66696C6C2870726F6D6973';
wwv_flow_api.g_varchar2_table(108) := '652C2076616C7565293B0A20207D20656C73652069662028736574746C6564203D3D3D2052454A454354454429207B0A2020202072656A6563742870726F6D6973652C2076616C7565293B0A20207D0A7D0A0A66756E6374696F6E20696E697469616C69';
wwv_flow_api.g_varchar2_table(109) := '7A6550726F6D6973652870726F6D6973652C207265736F6C76657229207B0A2020747279207B0A202020207265736F6C7665722866756E6374696F6E207265736F6C766550726F6D6973652876616C756529207B0A2020202020207265736F6C76652870';
wwv_flow_api.g_varchar2_table(110) := '726F6D6973652C2076616C7565293B0A202020207D2C2066756E6374696F6E2072656A65637450726F6D69736528726561736F6E29207B0A20202020202072656A6563742870726F6D6973652C20726561736F6E293B0A202020207D293B0A20207D2063';
wwv_flow_api.g_varchar2_table(111) := '6174636820286529207B0A2020202072656A6563742870726F6D6973652C2065293B0A20207D0A7D0A0A766172206964203D20303B0A66756E6374696F6E206E65787449642829207B0A202072657475726E2069642B2B3B0A7D0A0A66756E6374696F6E';
wwv_flow_api.g_varchar2_table(112) := '206D616B6550726F6D6973652870726F6D69736529207B0A202070726F6D6973655B50524F4D4953455F49445D203D2069642B2B3B0A202070726F6D6973652E5F7374617465203D20756E646566696E65643B0A202070726F6D6973652E5F726573756C';
wwv_flow_api.g_varchar2_table(113) := '74203D20756E646566696E65643B0A202070726F6D6973652E5F7375627363726962657273203D205B5D3B0A7D0A0A66756E6374696F6E2076616C69646174696F6E4572726F722829207B0A202072657475726E206E6577204572726F72282741727261';
wwv_flow_api.g_varchar2_table(114) := '79204D6574686F6473206D7573742062652070726F766964656420616E20417272617927293B0A7D0A0A76617220456E756D657261746F72203D2066756E6374696F6E202829207B0A202066756E6374696F6E20456E756D657261746F7228436F6E7374';
wwv_flow_api.g_varchar2_table(115) := '727563746F722C20696E70757429207B0A20202020746869732E5F696E7374616E6365436F6E7374727563746F72203D20436F6E7374727563746F723B0A20202020746869732E70726F6D697365203D206E657720436F6E7374727563746F72286E6F6F';
wwv_flow_api.g_varchar2_table(116) := '70293B0A0A202020206966202821746869732E70726F6D6973655B50524F4D4953455F49445D29207B0A2020202020206D616B6550726F6D69736528746869732E70726F6D697365293B0A202020207D0A0A20202020696620286973417272617928696E';
wwv_flow_api.g_varchar2_table(117) := '7075742929207B0A202020202020746869732E6C656E677468203D20696E7075742E6C656E6774683B0A202020202020746869732E5F72656D61696E696E67203D20696E7075742E6C656E6774683B0A0A202020202020746869732E5F726573756C7420';
wwv_flow_api.g_varchar2_table(118) := '3D206E657720417272617928746869732E6C656E677468293B0A0A20202020202069662028746869732E6C656E677468203D3D3D203029207B0A202020202020202066756C66696C6C28746869732E70726F6D6973652C20746869732E5F726573756C74';
wwv_flow_api.g_varchar2_table(119) := '293B0A2020202020207D20656C7365207B0A2020202020202020746869732E6C656E677468203D20746869732E6C656E677468207C7C20303B0A2020202020202020746869732E5F656E756D657261746528696E707574293B0A20202020202020206966';
wwv_flow_api.g_varchar2_table(120) := '2028746869732E5F72656D61696E696E67203D3D3D203029207B0A2020202020202020202066756C66696C6C28746869732E70726F6D6973652C20746869732E5F726573756C74293B0A20202020202020207D0A2020202020207D0A202020207D20656C';
wwv_flow_api.g_varchar2_table(121) := '7365207B0A20202020202072656A65637428746869732E70726F6D6973652C2076616C69646174696F6E4572726F722829293B0A202020207D0A20207D0A0A2020456E756D657261746F722E70726F746F747970652E5F656E756D6572617465203D2066';
wwv_flow_api.g_varchar2_table(122) := '756E6374696F6E205F656E756D657261746528696E70757429207B0A20202020666F7220287661722069203D20303B20746869732E5F7374617465203D3D3D2050454E44494E472026262069203C20696E7075742E6C656E6774683B20692B2B29207B0A';
wwv_flow_api.g_varchar2_table(123) := '202020202020746869732E5F65616368456E74727928696E7075745B695D2C2069293B0A202020207D0A20207D3B0A0A2020456E756D657261746F722E70726F746F747970652E5F65616368456E747279203D2066756E6374696F6E205F65616368456E';
wwv_flow_api.g_varchar2_table(124) := '74727928656E7472792C206929207B0A202020207661722063203D20746869732E5F696E7374616E6365436F6E7374727563746F723B0A20202020766172207265736F6C7665242431203D20632E7265736F6C76653B0A0A0A2020202069662028726573';
wwv_flow_api.g_varchar2_table(125) := '6F6C7665242431203D3D3D207265736F6C7665243129207B0A202020202020766172205F7468656E203D206765745468656E28656E747279293B0A0A202020202020696620285F7468656E203D3D3D207468656E20262620656E7472792E5F7374617465';
wwv_flow_api.g_varchar2_table(126) := '20213D3D2050454E44494E4729207B0A2020202020202020746869732E5F736574746C6564417428656E7472792E5F73746174652C20692C20656E7472792E5F726573756C74293B0A2020202020207D20656C73652069662028747970656F66205F7468';
wwv_flow_api.g_varchar2_table(127) := '656E20213D3D202766756E6374696F6E2729207B0A2020202020202020746869732E5F72656D61696E696E672D2D3B0A2020202020202020746869732E5F726573756C745B695D203D20656E7472793B0A2020202020207D20656C736520696620286320';
wwv_flow_api.g_varchar2_table(128) := '3D3D3D2050726F6D697365243129207B0A20202020202020207661722070726F6D697365203D206E65772063286E6F6F70293B0A202020202020202068616E646C654D617962655468656E61626C652870726F6D6973652C20656E7472792C205F746865';
wwv_flow_api.g_varchar2_table(129) := '6E293B0A2020202020202020746869732E5F77696C6C536574746C6541742870726F6D6973652C2069293B0A2020202020207D20656C7365207B0A2020202020202020746869732E5F77696C6C536574746C654174286E657720632866756E6374696F6E';
wwv_flow_api.g_varchar2_table(130) := '20287265736F6C766524243129207B0A2020202020202020202072657475726E207265736F6C766524243128656E747279293B0A20202020202020207D292C2069293B0A2020202020207D0A202020207D20656C7365207B0A202020202020746869732E';
wwv_flow_api.g_varchar2_table(131) := '5F77696C6C536574746C654174287265736F6C766524243128656E747279292C2069293B0A202020207D0A20207D3B0A0A2020456E756D657261746F722E70726F746F747970652E5F736574746C65644174203D2066756E6374696F6E205F736574746C';
wwv_flow_api.g_varchar2_table(132) := '656441742873746174652C20692C2076616C756529207B0A202020207661722070726F6D697365203D20746869732E70726F6D6973653B0A0A0A202020206966202870726F6D6973652E5F7374617465203D3D3D2050454E44494E4729207B0A20202020';
wwv_flow_api.g_varchar2_table(133) := '2020746869732E5F72656D61696E696E672D2D3B0A0A202020202020696620287374617465203D3D3D2052454A454354454429207B0A202020202020202072656A6563742870726F6D6973652C2076616C7565293B0A2020202020207D20656C7365207B';
wwv_flow_api.g_varchar2_table(134) := '0A2020202020202020746869732E5F726573756C745B695D203D2076616C75653B0A2020202020207D0A202020207D0A0A2020202069662028746869732E5F72656D61696E696E67203D3D3D203029207B0A20202020202066756C66696C6C2870726F6D';
wwv_flow_api.g_varchar2_table(135) := '6973652C20746869732E5F726573756C74293B0A202020207D0A20207D3B0A0A2020456E756D657261746F722E70726F746F747970652E5F77696C6C536574746C654174203D2066756E6374696F6E205F77696C6C536574746C6541742870726F6D6973';
wwv_flow_api.g_varchar2_table(136) := '652C206929207B0A2020202076617220656E756D657261746F72203D20746869733B0A0A202020207375627363726962652870726F6D6973652C20756E646566696E65642C2066756E6374696F6E202876616C756529207B0A2020202020207265747572';
wwv_flow_api.g_varchar2_table(137) := '6E20656E756D657261746F722E5F736574746C656441742846554C46494C4C45442C20692C2076616C7565293B0A202020207D2C2066756E6374696F6E2028726561736F6E29207B0A20202020202072657475726E20656E756D657261746F722E5F7365';
wwv_flow_api.g_varchar2_table(138) := '74746C656441742852454A45435445442C20692C20726561736F6E293B0A202020207D293B0A20207D3B0A0A202072657475726E20456E756D657261746F723B0A7D28293B0A0A2F2A2A0A20206050726F6D6973652E616C6C6020616363657074732061';
wwv_flow_api.g_varchar2_table(139) := '6E206172726179206F662070726F6D697365732C20616E642072657475726E732061206E65772070726F6D6973652077686963680A202069732066756C66696C6C6564207769746820616E206172726179206F662066756C66696C6C6D656E742076616C';
wwv_flow_api.g_varchar2_table(140) := '75657320666F7220746865207061737365642070726F6D697365732C206F720A202072656A656374656420776974682074686520726561736F6E206F6620746865206669727374207061737365642070726F6D69736520746F2062652072656A65637465';
wwv_flow_api.g_varchar2_table(141) := '642E20497420636173747320616C6C0A2020656C656D656E7473206F662074686520706173736564206974657261626C6520746F2070726F6D697365732061732069742072756E73207468697320616C676F726974686D2E0A0A20204578616D706C653A';
wwv_flow_api.g_varchar2_table(142) := '0A0A20206060606A6176617363726970740A20206C65742070726F6D69736531203D207265736F6C76652831293B0A20206C65742070726F6D69736532203D207265736F6C76652832293B0A20206C65742070726F6D69736533203D207265736F6C7665';
wwv_flow_api.g_varchar2_table(143) := '2833293B0A20206C65742070726F6D69736573203D205B2070726F6D697365312C2070726F6D697365322C2070726F6D69736533205D3B0A0A202050726F6D6973652E616C6C2870726F6D69736573292E7468656E2866756E6374696F6E286172726179';
wwv_flow_api.g_varchar2_table(144) := '297B0A202020202F2F20546865206172726179206865726520776F756C64206265205B20312C20322C2033205D3B0A20207D293B0A20206060600A0A2020496620616E79206F6620746865206070726F6D697365736020676976656E20746F2060616C6C';
wwv_flow_api.g_varchar2_table(145) := '60206172652072656A65637465642C207468652066697273742070726F6D6973650A2020746861742069732072656A65637465642077696C6C20626520676976656E20617320616E20617267756D656E7420746F207468652072657475726E6564207072';
wwv_flow_api.g_varchar2_table(146) := '6F6D6973657327730A202072656A656374696F6E2068616E646C65722E20466F72206578616D706C653A0A0A20204578616D706C653A0A0A20206060606A6176617363726970740A20206C65742070726F6D69736531203D207265736F6C76652831293B';
wwv_flow_api.g_varchar2_table(147) := '0A20206C65742070726F6D69736532203D2072656A656374286E6577204572726F722822322229293B0A20206C65742070726F6D69736533203D2072656A656374286E6577204572726F722822332229293B0A20206C65742070726F6D69736573203D20';
wwv_flow_api.g_varchar2_table(148) := '5B2070726F6D697365312C2070726F6D697365322C2070726F6D69736533205D3B0A0A202050726F6D6973652E616C6C2870726F6D69736573292E7468656E2866756E6374696F6E286172726179297B0A202020202F2F20436F64652068657265206E65';
wwv_flow_api.g_varchar2_table(149) := '7665722072756E732062656361757365207468657265206172652072656A65637465642070726F6D69736573210A20207D2C2066756E6374696F6E286572726F7229207B0A202020202F2F206572726F722E6D657373616765203D3D3D202232220A2020';
wwv_flow_api.g_varchar2_table(150) := '7D293B0A20206060600A0A2020406D6574686F6420616C6C0A2020407374617469630A202040706172616D207B41727261797D20656E7472696573206172726179206F662070726F6D697365730A202040706172616D207B537472696E677D206C616265';
wwv_flow_api.g_varchar2_table(151) := '6C206F7074696F6E616C20737472696E6720666F72206C6162656C696E67207468652070726F6D6973652E0A202055736566756C20666F7220746F6F6C696E672E0A20204072657475726E207B50726F6D6973657D2070726F6D69736520746861742069';
wwv_flow_api.g_varchar2_table(152) := '732066756C66696C6C6564207768656E20616C6C206070726F6D69736573602068617665206265656E0A202066756C66696C6C65642C206F722072656A656374656420696620616E79206F66207468656D206265636F6D652072656A65637465642E0A20';
wwv_flow_api.g_varchar2_table(153) := '20407374617469630A2A2F0A66756E6374696F6E20616C6C28656E747269657329207B0A202072657475726E206E657720456E756D657261746F7228746869732C20656E7472696573292E70726F6D6973653B0A7D0A0A2F2A2A0A20206050726F6D6973';
wwv_flow_api.g_varchar2_table(154) := '652E72616365602072657475726E732061206E65772070726F6D69736520776869636820697320736574746C656420696E207468652073616D6520776179206173207468650A20206669727374207061737365642070726F6D69736520746F2073657474';
wwv_flow_api.g_varchar2_table(155) := '6C652E0A0A20204578616D706C653A0A0A20206060606A6176617363726970740A20206C65742070726F6D69736531203D206E65772050726F6D6973652866756E6374696F6E287265736F6C76652C2072656A656374297B0A2020202073657454696D65';
wwv_flow_api.g_varchar2_table(156) := '6F75742866756E6374696F6E28297B0A2020202020207265736F6C7665282770726F6D697365203127293B0A202020207D2C20323030293B0A20207D293B0A0A20206C65742070726F6D69736532203D206E65772050726F6D6973652866756E6374696F';
wwv_flow_api.g_varchar2_table(157) := '6E287265736F6C76652C2072656A656374297B0A2020202073657454696D656F75742866756E6374696F6E28297B0A2020202020207265736F6C7665282770726F6D697365203227293B0A202020207D2C20313030293B0A20207D293B0A0A202050726F';
wwv_flow_api.g_varchar2_table(158) := '6D6973652E72616365285B70726F6D697365312C2070726F6D697365325D292E7468656E2866756E6374696F6E28726573756C74297B0A202020202F2F20726573756C74203D3D3D202770726F6D69736520322720626563617573652069742077617320';
wwv_flow_api.g_varchar2_table(159) := '7265736F6C766564206265666F72652070726F6D697365310A202020202F2F20776173207265736F6C7665642E0A20207D293B0A20206060600A0A20206050726F6D6973652E72616365602069732064657465726D696E697374696320696E2074686174';
wwv_flow_api.g_varchar2_table(160) := '206F6E6C7920746865207374617465206F66207468652066697273740A2020736574746C65642070726F6D697365206D6174746572732E20466F72206578616D706C652C206576656E206966206F746865722070726F6D6973657320676976656E20746F';
wwv_flow_api.g_varchar2_table(161) := '207468650A20206070726F6D697365736020617272617920617267756D656E7420617265207265736F6C7665642C206275742074686520666972737420736574746C65642070726F6D697365206861730A20206265636F6D652072656A65637465642062';
wwv_flow_api.g_varchar2_table(162) := '65666F726520746865206F746865722070726F6D6973657320626563616D652066756C66696C6C65642C207468652072657475726E65640A202070726F6D6973652077696C6C206265636F6D652072656A65637465643A0A0A20206060606A6176617363';
wwv_flow_api.g_varchar2_table(163) := '726970740A20206C65742070726F6D69736531203D206E65772050726F6D6973652866756E6374696F6E287265736F6C76652C2072656A656374297B0A2020202073657454696D656F75742866756E6374696F6E28297B0A2020202020207265736F6C76';
wwv_flow_api.g_varchar2_table(164) := '65282770726F6D697365203127293B0A202020207D2C20323030293B0A20207D293B0A0A20206C65742070726F6D69736532203D206E65772050726F6D6973652866756E6374696F6E287265736F6C76652C2072656A656374297B0A2020202073657454';
wwv_flow_api.g_varchar2_table(165) := '696D656F75742866756E6374696F6E28297B0A20202020202072656A656374286E6577204572726F72282770726F6D69736520322729293B0A202020207D2C20313030293B0A20207D293B0A0A202050726F6D6973652E72616365285B70726F6D697365';
wwv_flow_api.g_varchar2_table(166) := '312C2070726F6D697365325D292E7468656E2866756E6374696F6E28726573756C74297B0A202020202F2F20436F64652068657265206E657665722072756E730A20207D2C2066756E6374696F6E28726561736F6E297B0A202020202F2F20726561736F';
wwv_flow_api.g_varchar2_table(167) := '6E2E6D657373616765203D3D3D202770726F6D69736520322720626563617573652070726F6D697365203220626563616D652072656A6563746564206265666F72650A202020202F2F2070726F6D697365203120626563616D652066756C66696C6C6564';
wwv_flow_api.g_varchar2_table(168) := '0A20207D293B0A20206060600A0A2020416E206578616D706C65207265616C2D776F726C6420757365206361736520697320696D706C656D656E74696E672074696D656F7574733A0A0A20206060606A6176617363726970740A202050726F6D6973652E';
wwv_flow_api.g_varchar2_table(169) := '72616365285B616A61782827666F6F2E6A736F6E27292C2074696D656F75742835303030295D290A20206060600A0A2020406D6574686F6420726163650A2020407374617469630A202040706172616D207B41727261797D2070726F6D69736573206172';
wwv_flow_api.g_varchar2_table(170) := '726179206F662070726F6D6973657320746F206F6273657276650A202055736566756C20666F7220746F6F6C696E672E0A20204072657475726E207B50726F6D6973657D20612070726F6D69736520776869636820736574746C657320696E2074686520';
wwv_flow_api.g_varchar2_table(171) := '73616D652077617920617320746865206669727374207061737365640A202070726F6D69736520746F20736574746C652E0A2A2F0A66756E6374696F6E207261636528656E747269657329207B0A20202F2A6A7368696E742076616C6964746869733A74';
wwv_flow_api.g_varchar2_table(172) := '727565202A2F0A202076617220436F6E7374727563746F72203D20746869733B0A0A202069662028216973417272617928656E74726965732929207B0A2020202072657475726E206E657720436F6E7374727563746F722866756E6374696F6E20285F2C';
wwv_flow_api.g_varchar2_table(173) := '2072656A65637429207B0A20202020202072657475726E2072656A656374286E657720547970654572726F722827596F75206D757374207061737320616E20617272617920746F20726163652E2729293B0A202020207D293B0A20207D20656C7365207B';
wwv_flow_api.g_varchar2_table(174) := '0A2020202072657475726E206E657720436F6E7374727563746F722866756E6374696F6E20287265736F6C76652C2072656A65637429207B0A202020202020766172206C656E677468203D20656E74726965732E6C656E6774683B0A202020202020666F';
wwv_flow_api.g_varchar2_table(175) := '7220287661722069203D20303B2069203C206C656E6774683B20692B2B29207B0A2020202020202020436F6E7374727563746F722E7265736F6C766528656E74726965735B695D292E7468656E287265736F6C76652C2072656A656374293B0A20202020';
wwv_flow_api.g_varchar2_table(176) := '20207D0A202020207D293B0A20207D0A7D0A0A2F2A2A0A20206050726F6D6973652E72656A656374602072657475726E7320612070726F6D6973652072656A6563746564207769746820746865207061737365642060726561736F6E602E0A2020497420';
wwv_flow_api.g_varchar2_table(177) := '69732073686F727468616E6420666F722074686520666F6C6C6F77696E673A0A0A20206060606A6176617363726970740A20206C65742070726F6D697365203D206E65772050726F6D6973652866756E6374696F6E287265736F6C76652C2072656A6563';
wwv_flow_api.g_varchar2_table(178) := '74297B0A2020202072656A656374286E6577204572726F72282757484F4F50532729293B0A20207D293B0A0A202070726F6D6973652E7468656E2866756E6374696F6E2876616C7565297B0A202020202F2F20436F6465206865726520646F65736E2774';
wwv_flow_api.g_varchar2_table(179) := '2072756E2062656361757365207468652070726F6D6973652069732072656A6563746564210A20207D2C2066756E6374696F6E28726561736F6E297B0A202020202F2F20726561736F6E2E6D657373616765203D3D3D202757484F4F5053270A20207D29';
wwv_flow_api.g_varchar2_table(180) := '3B0A20206060600A0A2020496E7374656164206F662077726974696E67207468652061626F76652C20796F757220636F6465206E6F772073696D706C79206265636F6D65732074686520666F6C6C6F77696E673A0A0A20206060606A6176617363726970';
wwv_flow_api.g_varchar2_table(181) := '740A20206C65742070726F6D697365203D2050726F6D6973652E72656A656374286E6577204572726F72282757484F4F50532729293B0A0A202070726F6D6973652E7468656E2866756E6374696F6E2876616C7565297B0A202020202F2F20436F646520';
wwv_flow_api.g_varchar2_table(182) := '6865726520646F65736E27742072756E2062656361757365207468652070726F6D6973652069732072656A6563746564210A20207D2C2066756E6374696F6E28726561736F6E297B0A202020202F2F20726561736F6E2E6D657373616765203D3D3D2027';
wwv_flow_api.g_varchar2_table(183) := '57484F4F5053270A20207D293B0A20206060600A0A2020406D6574686F642072656A6563740A2020407374617469630A202040706172616D207B416E797D20726561736F6E2076616C75652074686174207468652072657475726E65642070726F6D6973';
wwv_flow_api.g_varchar2_table(184) := '652077696C6C2062652072656A656374656420776974682E0A202055736566756C20666F7220746F6F6C696E672E0A20204072657475726E207B50726F6D6973657D20612070726F6D6973652072656A656374656420776974682074686520676976656E';
wwv_flow_api.g_varchar2_table(185) := '2060726561736F6E602E0A2A2F0A66756E6374696F6E2072656A656374243128726561736F6E29207B0A20202F2A6A7368696E742076616C6964746869733A74727565202A2F0A202076617220436F6E7374727563746F72203D20746869733B0A202076';
wwv_flow_api.g_varchar2_table(186) := '61722070726F6D697365203D206E657720436F6E7374727563746F72286E6F6F70293B0A202072656A6563742870726F6D6973652C20726561736F6E293B0A202072657475726E2070726F6D6973653B0A7D0A0A66756E6374696F6E206E656564735265';
wwv_flow_api.g_varchar2_table(187) := '736F6C7665722829207B0A20207468726F77206E657720547970654572726F722827596F75206D75737420706173732061207265736F6C7665722066756E6374696F6E2061732074686520666972737420617267756D656E7420746F207468652070726F';
wwv_flow_api.g_varchar2_table(188) := '6D69736520636F6E7374727563746F7227293B0A7D0A0A66756E6374696F6E206E656564734E65772829207B0A20207468726F77206E657720547970654572726F7228224661696C656420746F20636F6E737472756374202750726F6D697365273A2050';
wwv_flow_api.g_varchar2_table(189) := '6C65617365207573652074686520276E657727206F70657261746F722C2074686973206F626A65637420636F6E7374727563746F722063616E6E6F742062652063616C6C656420617320612066756E6374696F6E2E22293B0A7D0A0A2F2A2A0A20205072';
wwv_flow_api.g_varchar2_table(190) := '6F6D697365206F626A6563747320726570726573656E7420746865206576656E7475616C20726573756C74206F6620616E206173796E6368726F6E6F7573206F7065726174696F6E2E205468650A20207072696D61727920776179206F6620696E746572';
wwv_flow_api.g_varchar2_table(191) := '616374696E67207769746820612070726F6D697365206973207468726F7567682069747320607468656E60206D6574686F642C2077686963680A20207265676973746572732063616C6C6261636B7320746F207265636569766520656974686572206120';
wwv_flow_api.g_varchar2_table(192) := '70726F6D6973652773206576656E7475616C2076616C7565206F722074686520726561736F6E0A2020776879207468652070726F6D6973652063616E6E6F742062652066756C66696C6C65642E0A0A20205465726D696E6F6C6F67790A20202D2D2D2D2D';
wwv_flow_api.g_varchar2_table(193) := '2D2D2D2D2D2D0A0A20202D206070726F6D6973656020697320616E206F626A656374206F722066756E6374696F6E2077697468206120607468656E60206D6574686F642077686F7365206265686176696F7220636F6E666F726D7320746F207468697320';
wwv_flow_api.g_varchar2_table(194) := '73706563696669636174696F6E2E0A20202D20607468656E61626C656020697320616E206F626A656374206F722066756E6374696F6E207468617420646566696E6573206120607468656E60206D6574686F642E0A20202D206076616C75656020697320';
wwv_flow_api.g_varchar2_table(195) := '616E79206C6567616C204A6176615363726970742076616C75652028696E636C7564696E6720756E646566696E65642C2061207468656E61626C652C206F7220612070726F6D697365292E0A20202D2060657863657074696F6E6020697320612076616C';
wwv_flow_api.g_varchar2_table(196) := '75652074686174206973207468726F776E207573696E6720746865207468726F772073746174656D656E742E0A20202D2060726561736F6E6020697320612076616C7565207468617420696E646963617465732077687920612070726F6D697365207761';
wwv_flow_api.g_varchar2_table(197) := '732072656A65637465642E0A20202D2060736574746C656460207468652066696E616C2072657374696E67207374617465206F6620612070726F6D6973652C2066756C66696C6C6564206F722072656A65637465642E0A0A2020412070726F6D69736520';
wwv_flow_api.g_varchar2_table(198) := '63616E20626520696E206F6E65206F66207468726565207374617465733A2070656E64696E672C2066756C66696C6C65642C206F722072656A65637465642E0A0A202050726F6D697365732074686174206172652066756C66696C6C6564206861766520';
wwv_flow_api.g_varchar2_table(199) := '612066756C66696C6C6D656E742076616C756520616E642061726520696E207468652066756C66696C6C65640A202073746174652E202050726F6D697365732074686174206172652072656A6563746564206861766520612072656A656374696F6E2072';
wwv_flow_api.g_varchar2_table(200) := '6561736F6E20616E642061726520696E207468650A202072656A65637465642073746174652E2020412066756C66696C6C6D656E742076616C7565206973206E657665722061207468656E61626C652E0A0A202050726F6D697365732063616E20616C73';
wwv_flow_api.g_varchar2_table(201) := '6F206265207361696420746F202A7265736F6C76652A20612076616C75652E2020496620746869732076616C756520697320616C736F20610A202070726F6D6973652C207468656E20746865206F726967696E616C2070726F6D69736527732073657474';
wwv_flow_api.g_varchar2_table(202) := '6C65642073746174652077696C6C206D61746368207468652076616C756527730A2020736574746C65642073746174652E2020536F20612070726F6D6973652074686174202A7265736F6C7665732A20612070726F6D69736520746861742072656A6563';
wwv_flow_api.g_varchar2_table(203) := '74732077696C6C0A2020697473656C662072656A6563742C20616E6420612070726F6D6973652074686174202A7265736F6C7665732A20612070726F6D69736520746861742066756C66696C6C732077696C6C0A2020697473656C662066756C66696C6C';
wwv_flow_api.g_varchar2_table(204) := '2E0A0A0A202042617369632055736167653A0A20202D2D2D2D2D2D2D2D2D2D2D2D0A0A20206060606A730A20206C65742070726F6D697365203D206E65772050726F6D6973652866756E6374696F6E287265736F6C76652C2072656A65637429207B0A20';
wwv_flow_api.g_varchar2_table(205) := '2020202F2F206F6E20737563636573730A202020207265736F6C76652876616C7565293B0A0A202020202F2F206F6E206661696C7572650A2020202072656A65637428726561736F6E293B0A20207D293B0A0A202070726F6D6973652E7468656E286675';
wwv_flow_api.g_varchar2_table(206) := '6E6374696F6E2876616C756529207B0A202020202F2F206F6E2066756C66696C6C6D656E740A20207D2C2066756E6374696F6E28726561736F6E29207B0A202020202F2F206F6E2072656A656374696F6E0A20207D293B0A20206060600A0A2020416476';
wwv_flow_api.g_varchar2_table(207) := '616E6365642055736167653A0A20202D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0A0A202050726F6D69736573207368696E65207768656E206162737472616374696E672061776179206173796E6368726F6E6F757320696E746572616374696F6E7320737563';
wwv_flow_api.g_varchar2_table(208) := '682061730A202060584D4C487474705265717565737460732E0A0A20206060606A730A202066756E6374696F6E206765744A534F4E2875726C29207B0A2020202072657475726E206E65772050726F6D6973652866756E6374696F6E287265736F6C7665';
wwv_flow_api.g_varchar2_table(209) := '2C2072656A656374297B0A2020202020206C657420786872203D206E657720584D4C487474705265717565737428293B0A0A2020202020207868722E6F70656E2827474554272C2075726C293B0A2020202020207868722E6F6E72656164797374617465';
wwv_flow_api.g_varchar2_table(210) := '6368616E6765203D2068616E646C65723B0A2020202020207868722E726573706F6E736554797065203D20276A736F6E273B0A2020202020207868722E736574526571756573744865616465722827416363657074272C20276170706C69636174696F6E';
wwv_flow_api.g_varchar2_table(211) := '2F6A736F6E27293B0A2020202020207868722E73656E6428293B0A0A20202020202066756E6374696F6E2068616E646C65722829207B0A202020202020202069662028746869732E72656164795374617465203D3D3D20746869732E444F4E4529207B0A';
wwv_flow_api.g_varchar2_table(212) := '2020202020202020202069662028746869732E737461747573203D3D3D2032303029207B0A2020202020202020202020207265736F6C766528746869732E726573706F6E7365293B0A202020202020202020207D20656C7365207B0A2020202020202020';
wwv_flow_api.g_varchar2_table(213) := '2020202072656A656374286E6577204572726F7228276765744A534F4E3A206027202B2075726C202B202760206661696C65642077697468207374617475733A205B27202B20746869732E737461747573202B20275D2729293B0A202020202020202020';
wwv_flow_api.g_varchar2_table(214) := '207D0A20202020202020207D0A2020202020207D3B0A202020207D293B0A20207D0A0A20206765744A534F4E28272F706F7374732E6A736F6E27292E7468656E2866756E6374696F6E286A736F6E29207B0A202020202F2F206F6E2066756C66696C6C6D';
wwv_flow_api.g_varchar2_table(215) := '656E740A20207D2C2066756E6374696F6E28726561736F6E29207B0A202020202F2F206F6E2072656A656374696F6E0A20207D293B0A20206060600A0A2020556E6C696B652063616C6C6261636B732C2070726F6D697365732061726520677265617420';
wwv_flow_api.g_varchar2_table(216) := '636F6D706F7361626C65207072696D6974697665732E0A0A20206060606A730A202050726F6D6973652E616C6C285B0A202020206765744A534F4E28272F706F73747327292C0A202020206765744A534F4E28272F636F6D6D656E747327290A20205D29';
wwv_flow_api.g_varchar2_table(217) := '2E7468656E2866756E6374696F6E2876616C756573297B0A2020202076616C7565735B305D202F2F203D3E20706F7374734A534F4E0A2020202076616C7565735B315D202F2F203D3E20636F6D6D656E74734A534F4E0A0A2020202072657475726E2076';
wwv_flow_api.g_varchar2_table(218) := '616C7565733B0A20207D293B0A20206060600A0A202040636C6173732050726F6D6973650A202040706172616D207B46756E6374696F6E7D207265736F6C7665720A202055736566756C20666F7220746F6F6C696E672E0A202040636F6E737472756374';
wwv_flow_api.g_varchar2_table(219) := '6F720A2A2F0A0A7661722050726F6D6973652431203D2066756E6374696F6E202829207B0A202066756E6374696F6E2050726F6D697365287265736F6C76657229207B0A20202020746869735B50524F4D4953455F49445D203D206E657874496428293B';
wwv_flow_api.g_varchar2_table(220) := '0A20202020746869732E5F726573756C74203D20746869732E5F7374617465203D20756E646566696E65643B0A20202020746869732E5F7375627363726962657273203D205B5D3B0A0A20202020696620286E6F6F7020213D3D207265736F6C76657229';
wwv_flow_api.g_varchar2_table(221) := '207B0A202020202020747970656F66207265736F6C76657220213D3D202766756E6374696F6E27202626206E656564735265736F6C76657228293B0A2020202020207468697320696E7374616E63656F662050726F6D697365203F20696E697469616C69';
wwv_flow_api.g_varchar2_table(222) := '7A6550726F6D69736528746869732C207265736F6C76657229203A206E656564734E657728293B0A202020207D0A20207D0A0A20202F2A2A0A2020546865207072696D61727920776179206F6620696E746572616374696E67207769746820612070726F';
wwv_flow_api.g_varchar2_table(223) := '6D697365206973207468726F7567682069747320607468656E60206D6574686F642C0A20207768696368207265676973746572732063616C6C6261636B7320746F20726563656976652065697468657220612070726F6D6973652773206576656E747561';
wwv_flow_api.g_varchar2_table(224) := '6C2076616C7565206F72207468650A2020726561736F6E20776879207468652070726F6D6973652063616E6E6F742062652066756C66696C6C65642E0A2020206060606A730A202066696E645573657228292E7468656E2866756E6374696F6E28757365';
wwv_flow_api.g_varchar2_table(225) := '72297B0A202020202F2F207573657220697320617661696C61626C650A20207D2C2066756E6374696F6E28726561736F6E297B0A202020202F2F207573657220697320756E617661696C61626C652C20616E6420796F752061726520676976656E207468';
wwv_flow_api.g_varchar2_table(226) := '6520726561736F6E207768790A20207D293B0A20206060600A202020436861696E696E670A20202D2D2D2D2D2D2D2D0A2020205468652072657475726E2076616C7565206F6620607468656E6020697320697473656C6620612070726F6D6973652E2020';
wwv_flow_api.g_varchar2_table(227) := '54686973207365636F6E642C2027646F776E73747265616D270A202070726F6D697365206973207265736F6C7665642077697468207468652072657475726E2076616C7565206F66207468652066697273742070726F6D69736527732066756C66696C6C';
wwv_flow_api.g_varchar2_table(228) := '6D656E740A20206F722072656A656374696F6E2068616E646C65722C206F722072656A6563746564206966207468652068616E646C6572207468726F777320616E20657863657074696F6E2E0A2020206060606A730A202066696E645573657228292E74';
wwv_flow_api.g_varchar2_table(229) := '68656E2866756E6374696F6E20287573657229207B0A2020202072657475726E20757365722E6E616D653B0A20207D2C2066756E6374696F6E2028726561736F6E29207B0A2020202072657475726E202764656661756C74206E616D65273B0A20207D29';
wwv_flow_api.g_varchar2_table(230) := '2E7468656E2866756E6374696F6E2028757365724E616D6529207B0A202020202F2F204966206066696E6455736572602066756C66696C6C65642C2060757365724E616D65602077696C6C2062652074686520757365722773206E616D652C206F746865';
wwv_flow_api.g_varchar2_table(231) := '72776973652069740A202020202F2F2077696C6C20626520602764656661756C74206E616D6527600A20207D293B0A20202066696E645573657228292E7468656E2866756E6374696F6E20287573657229207B0A202020207468726F77206E6577204572';
wwv_flow_api.g_varchar2_table(232) := '726F722827466F756E6420757365722C20627574207374696C6C20756E686170707927293B0A20207D2C2066756E6374696F6E2028726561736F6E29207B0A202020207468726F77206E6577204572726F7228276066696E6455736572602072656A6563';
wwv_flow_api.g_varchar2_table(233) := '74656420616E6420776527726520756E686170707927293B0A20207D292E7468656E2866756E6374696F6E202876616C756529207B0A202020202F2F206E6576657220726561636865640A20207D2C2066756E6374696F6E2028726561736F6E29207B0A';
wwv_flow_api.g_varchar2_table(234) := '202020202F2F206966206066696E6455736572602066756C66696C6C65642C2060726561736F6E602077696C6C2062652027466F756E6420757365722C20627574207374696C6C20756E6861707079272E0A202020202F2F204966206066696E64557365';
wwv_flow_api.g_varchar2_table(235) := '72602072656A65637465642C2060726561736F6E602077696C6C20626520276066696E6455736572602072656A656374656420616E6420776527726520756E6861707079272E0A20207D293B0A20206060600A202049662074686520646F776E73747265';
wwv_flow_api.g_varchar2_table(236) := '616D2070726F6D69736520646F6573206E6F74207370656369667920612072656A656374696F6E2068616E646C65722C2072656A656374696F6E20726561736F6E732077696C6C2062652070726F70616761746564206675727468657220646F776E7374';
wwv_flow_api.g_varchar2_table(237) := '7265616D2E0A2020206060606A730A202066696E645573657228292E7468656E2866756E6374696F6E20287573657229207B0A202020207468726F77206E65772050656461676F676963616C457863657074696F6E2827557073747265616D206572726F';
wwv_flow_api.g_varchar2_table(238) := '7227293B0A20207D292E7468656E2866756E6374696F6E202876616C756529207B0A202020202F2F206E6576657220726561636865640A20207D292E7468656E2866756E6374696F6E202876616C756529207B0A202020202F2F206E6576657220726561';
wwv_flow_api.g_varchar2_table(239) := '636865640A20207D2C2066756E6374696F6E2028726561736F6E29207B0A202020202F2F2054686520605065646761676F6369616C457863657074696F6E602069732070726F7061676174656420616C6C207468652077617920646F776E20746F206865';
wwv_flow_api.g_varchar2_table(240) := '72650A20207D293B0A20206060600A202020417373696D696C6174696F6E0A20202D2D2D2D2D2D2D2D2D2D2D2D0A202020536F6D6574696D6573207468652076616C756520796F752077616E7420746F2070726F70616761746520746F206120646F776E';
wwv_flow_api.g_varchar2_table(241) := '73747265616D2070726F6D6973652063616E206F6E6C792062650A2020726574726965766564206173796E6368726F6E6F75736C792E20546869732063616E2062652061636869657665642062792072657475726E696E6720612070726F6D6973652069';
wwv_flow_api.g_varchar2_table(242) := '6E207468650A202066756C66696C6C6D656E74206F722072656A656374696F6E2068616E646C65722E2054686520646F776E73747265616D2070726F6D6973652077696C6C207468656E2062652070656E64696E670A2020756E74696C20746865207265';
wwv_flow_api.g_varchar2_table(243) := '7475726E65642070726F6D69736520697320736574746C65642E20546869732069732063616C6C6564202A617373696D696C6174696F6E2A2E0A2020206060606A730A202066696E645573657228292E7468656E2866756E6374696F6E20287573657229';
wwv_flow_api.g_varchar2_table(244) := '207B0A2020202072657475726E2066696E64436F6D6D656E74734279417574686F722875736572293B0A20207D292E7468656E2866756E6374696F6E2028636F6D6D656E747329207B0A202020202F2F205468652075736572277320636F6D6D656E7473';
wwv_flow_api.g_varchar2_table(245) := '20617265206E6F7720617661696C61626C650A20207D293B0A20206060600A20202049662074686520617373696D6C69617465642070726F6D6973652072656A656374732C207468656E2074686520646F776E73747265616D2070726F6D697365207769';
wwv_flow_api.g_varchar2_table(246) := '6C6C20616C736F2072656A6563742E0A2020206060606A730A202066696E645573657228292E7468656E2866756E6374696F6E20287573657229207B0A2020202072657475726E2066696E64436F6D6D656E74734279417574686F722875736572293B0A';
wwv_flow_api.g_varchar2_table(247) := '20207D292E7468656E2866756E6374696F6E2028636F6D6D656E747329207B0A202020202F2F204966206066696E64436F6D6D656E74734279417574686F72602066756C66696C6C732C207765276C6C2068617665207468652076616C75652068657265';
wwv_flow_api.g_varchar2_table(248) := '0A20207D2C2066756E6374696F6E2028726561736F6E29207B0A202020202F2F204966206066696E64436F6D6D656E74734279417574686F72602072656A656374732C207765276C6C20686176652074686520726561736F6E20686572650A20207D293B';
wwv_flow_api.g_varchar2_table(249) := '0A20206060600A20202053696D706C65204578616D706C650A20202D2D2D2D2D2D2D2D2D2D2D2D2D2D0A20202053796E6368726F6E6F7573204578616D706C650A2020206060606A6176617363726970740A20206C657420726573756C743B0A20202074';
wwv_flow_api.g_varchar2_table(250) := '7279207B0A20202020726573756C74203D2066696E64526573756C7428293B0A202020202F2F20737563636573730A20207D20636174636828726561736F6E29207B0A202020202F2F206661696C7572650A20207D0A20206060600A2020204572726261';
wwv_flow_api.g_varchar2_table(251) := '636B204578616D706C650A2020206060606A730A202066696E64526573756C742866756E6374696F6E28726573756C742C20657272297B0A202020206966202865727229207B0A2020202020202F2F206661696C7572650A202020207D20656C7365207B';
wwv_flow_api.g_varchar2_table(252) := '0A2020202020202F2F20737563636573730A202020207D0A20207D293B0A20206060600A20202050726F6D697365204578616D706C653B0A2020206060606A6176617363726970740A202066696E64526573756C7428292E7468656E2866756E6374696F';
wwv_flow_api.g_varchar2_table(253) := '6E28726573756C74297B0A202020202F2F20737563636573730A20207D2C2066756E6374696F6E28726561736F6E297B0A202020202F2F206661696C7572650A20207D293B0A20206060600A202020416476616E636564204578616D706C650A20202D2D';
wwv_flow_api.g_varchar2_table(254) := '2D2D2D2D2D2D2D2D2D2D2D2D0A20202053796E6368726F6E6F7573204578616D706C650A2020206060606A6176617363726970740A20206C657420617574686F722C20626F6F6B733B0A202020747279207B0A20202020617574686F72203D2066696E64';
wwv_flow_api.g_varchar2_table(255) := '417574686F7228293B0A20202020626F6F6B7320203D2066696E64426F6F6B734279417574686F7228617574686F72293B0A202020202F2F20737563636573730A20207D20636174636828726561736F6E29207B0A202020202F2F206661696C7572650A';
wwv_flow_api.g_varchar2_table(256) := '20207D0A20206060600A2020204572726261636B204578616D706C650A2020206060606A730A20202066756E6374696F6E20666F756E64426F6F6B7328626F6F6B7329207B0A2020207D0A20202066756E6374696F6E206661696C75726528726561736F';
wwv_flow_api.g_varchar2_table(257) := '6E29207B0A2020207D0A20202066696E64417574686F722866756E6374696F6E28617574686F722C20657272297B0A202020206966202865727229207B0A2020202020206661696C75726528657272293B0A2020202020202F2F206661696C7572650A20';
wwv_flow_api.g_varchar2_table(258) := '2020207D20656C7365207B0A202020202020747279207B0A202020202020202066696E64426F6F6F6B734279417574686F7228617574686F722C2066756E6374696F6E28626F6F6B732C2065727229207B0A202020202020202020206966202865727229';
wwv_flow_api.g_varchar2_table(259) := '207B0A2020202020202020202020206661696C75726528657272293B0A202020202020202020207D20656C7365207B0A202020202020202020202020747279207B0A2020202020202020202020202020666F756E64426F6F6B7328626F6F6B73293B0A20';
wwv_flow_api.g_varchar2_table(260) := '20202020202020202020207D20636174636828726561736F6E29207B0A20202020202020202020202020206661696C75726528726561736F6E293B0A2020202020202020202020207D0A202020202020202020207D0A20202020202020207D293B0A2020';
wwv_flow_api.g_varchar2_table(261) := '202020207D206361746368286572726F7229207B0A20202020202020206661696C75726528657272293B0A2020202020207D0A2020202020202F2F20737563636573730A202020207D0A20207D293B0A20206060600A20202050726F6D69736520457861';
wwv_flow_api.g_varchar2_table(262) := '6D706C653B0A2020206060606A6176617363726970740A202066696E64417574686F7228292E0A202020207468656E2866696E64426F6F6B734279417574686F72292E0A202020207468656E2866756E6374696F6E28626F6F6B73297B0A202020202020';
wwv_flow_api.g_varchar2_table(263) := '2F2F20666F756E6420626F6F6B730A20207D292E63617463682866756E6374696F6E28726561736F6E297B0A202020202F2F20736F6D657468696E672077656E742077726F6E670A20207D293B0A20206060600A202020406D6574686F64207468656E0A';
wwv_flow_api.g_varchar2_table(264) := '202040706172616D207B46756E6374696F6E7D206F6E46756C66696C6C65640A202040706172616D207B46756E6374696F6E7D206F6E52656A65637465640A202055736566756C20666F7220746F6F6C696E672E0A20204072657475726E207B50726F6D';
wwv_flow_api.g_varchar2_table(265) := '6973657D0A20202A2F0A0A20202F2A2A0A2020606361746368602069732073696D706C7920737567617220666F7220607468656E28756E646566696E65642C206F6E52656A656374696F6E2960207768696368206D616B6573206974207468652073616D';
wwv_flow_api.g_varchar2_table(266) := '650A202061732074686520636174636820626C6F636B206F662061207472792F63617463682073746174656D656E742E0A20206060606A730A202066756E6374696F6E2066696E64417574686F7228297B0A20207468726F77206E6577204572726F7228';
wwv_flow_api.g_varchar2_table(267) := '27636F756C646E27742066696E64207468617420617574686F7227293B0A20207D0A20202F2F2073796E6368726F6E6F75730A2020747279207B0A202066696E64417574686F7228293B0A20207D20636174636828726561736F6E29207B0A20202F2F20';
wwv_flow_api.g_varchar2_table(268) := '736F6D657468696E672077656E742077726F6E670A20207D0A20202F2F206173796E6320776974682070726F6D697365730A202066696E64417574686F7228292E63617463682866756E6374696F6E28726561736F6E297B0A20202F2F20736F6D657468';
wwv_flow_api.g_varchar2_table(269) := '696E672077656E742077726F6E670A20207D293B0A20206060600A2020406D6574686F642063617463680A202040706172616D207B46756E6374696F6E7D206F6E52656A656374696F6E0A202055736566756C20666F7220746F6F6C696E672E0A202040';
wwv_flow_api.g_varchar2_table(270) := '72657475726E207B50726F6D6973657D0A20202A2F0A0A0A202050726F6D6973652E70726F746F747970652E6361746368203D2066756E6374696F6E205F6361746368286F6E52656A656374696F6E29207B0A2020202072657475726E20746869732E74';
wwv_flow_api.g_varchar2_table(271) := '68656E286E756C6C2C206F6E52656A656374696F6E293B0A20207D3B0A0A20202F2A2A0A202020206066696E616C6C79602077696C6C20626520696E766F6B6564207265676172646C657373206F66207468652070726F6D69736527732066617465206A';
wwv_flow_api.g_varchar2_table(272) := '757374206173206E61746976650A202020207472792F63617463682F66696E616C6C7920626568617665730A20200A2020202053796E6368726F6E6F7573206578616D706C653A0A20200A202020206060606A730A2020202066696E64417574686F7228';
wwv_flow_api.g_varchar2_table(273) := '29207B0A202020202020696620284D6174682E72616E646F6D2829203E20302E3529207B0A20202020202020207468726F77206E6577204572726F7228293B0A2020202020207D0A20202020202072657475726E206E657720417574686F7228293B0A20';
wwv_flow_api.g_varchar2_table(274) := '2020207D0A20200A20202020747279207B0A20202020202072657475726E2066696E64417574686F7228293B202F2F2073756363656564206F72206661696C0A202020207D206361746368286572726F7229207B0A20202020202072657475726E206669';
wwv_flow_api.g_varchar2_table(275) := '6E644F7468657241757468657228293B0A202020207D2066696E616C6C79207B0A2020202020202F2F20616C776179732072756E730A2020202020202F2F20646F65736E277420616666656374207468652072657475726E2076616C75650A202020207D';
wwv_flow_api.g_varchar2_table(276) := '0A202020206060600A20200A202020204173796E6368726F6E6F7573206578616D706C653A0A20200A202020206060606A730A2020202066696E64417574686F7228292E63617463682866756E6374696F6E28726561736F6E297B0A2020202020207265';
wwv_flow_api.g_varchar2_table(277) := '7475726E2066696E644F7468657241757468657228293B0A202020207D292E66696E616C6C792866756E6374696F6E28297B0A2020202020202F2F20617574686F72207761732065697468657220666F756E642C206F72206E6F740A202020207D293B0A';
wwv_flow_api.g_varchar2_table(278) := '202020206060600A20200A20202020406D6574686F642066696E616C6C790A2020202040706172616D207B46756E6374696F6E7D2063616C6C6261636B0A202020204072657475726E207B50726F6D6973657D0A20202A2F0A0A0A202050726F6D697365';
wwv_flow_api.g_varchar2_table(279) := '2E70726F746F747970652E66696E616C6C79203D2066756E6374696F6E205F66696E616C6C792863616C6C6261636B29207B0A202020207661722070726F6D697365203D20746869733B0A2020202076617220636F6E7374727563746F72203D2070726F';
wwv_flow_api.g_varchar2_table(280) := '6D6973652E636F6E7374727563746F723B0A0A2020202072657475726E2070726F6D6973652E7468656E2866756E6374696F6E202876616C756529207B0A20202020202072657475726E20636F6E7374727563746F722E7265736F6C76652863616C6C62';
wwv_flow_api.g_varchar2_table(281) := '61636B2829292E7468656E2866756E6374696F6E202829207B0A202020202020202072657475726E2076616C75653B0A2020202020207D293B0A202020207D2C2066756E6374696F6E2028726561736F6E29207B0A20202020202072657475726E20636F';
wwv_flow_api.g_varchar2_table(282) := '6E7374727563746F722E7265736F6C76652863616C6C6261636B2829292E7468656E2866756E6374696F6E202829207B0A20202020202020207468726F7720726561736F6E3B0A2020202020207D293B0A202020207D293B0A20207D3B0A0A2020726574';
wwv_flow_api.g_varchar2_table(283) := '75726E2050726F6D6973653B0A7D28293B0A0A50726F6D69736524312E70726F746F747970652E7468656E203D207468656E3B0A50726F6D69736524312E616C6C203D20616C6C3B0A50726F6D69736524312E72616365203D20726163653B0A50726F6D';
wwv_flow_api.g_varchar2_table(284) := '69736524312E7265736F6C7665203D207265736F6C766524313B0A50726F6D69736524312E72656A656374203D2072656A65637424313B0A50726F6D69736524312E5F7365745363686564756C6572203D207365745363686564756C65723B0A50726F6D';
wwv_flow_api.g_varchar2_table(285) := '69736524312E5F73657441736170203D20736574417361703B0A50726F6D69736524312E5F61736170203D20617361703B0A0A2F2A676C6F62616C2073656C662A2F0A66756E6374696F6E20706F6C7966696C6C2829207B0A2020766172206C6F63616C';
wwv_flow_api.g_varchar2_table(286) := '203D20766F696420303B0A0A202069662028747970656F6620676C6F62616C20213D3D2027756E646566696E65642729207B0A202020206C6F63616C203D20676C6F62616C3B0A20207D20656C73652069662028747970656F662073656C6620213D3D20';
wwv_flow_api.g_varchar2_table(287) := '27756E646566696E65642729207B0A202020206C6F63616C203D2073656C663B0A20207D20656C7365207B0A20202020747279207B0A2020202020206C6F63616C203D2046756E6374696F6E282772657475726E2074686973272928293B0A202020207D';
wwv_flow_api.g_varchar2_table(288) := '20636174636820286529207B0A2020202020207468726F77206E6577204572726F722827706F6C7966696C6C206661696C6564206265636175736520676C6F62616C206F626A65637420697320756E617661696C61626C6520696E207468697320656E76';
wwv_flow_api.g_varchar2_table(289) := '69726F6E6D656E7427293B0A202020207D0A20207D0A0A20207661722050203D206C6F63616C2E50726F6D6973653B0A0A2020696620285029207B0A202020207661722070726F6D697365546F537472696E67203D206E756C6C3B0A2020202074727920';
wwv_flow_api.g_varchar2_table(290) := '7B0A20202020202070726F6D697365546F537472696E67203D204F626A6563742E70726F746F747970652E746F537472696E672E63616C6C28502E7265736F6C76652829293B0A202020207D20636174636820286529207B0A2020202020202F2F207369';
wwv_flow_api.g_varchar2_table(291) := '6C656E746C792069676E6F7265640A202020207D0A0A202020206966202870726F6D697365546F537472696E67203D3D3D20275B6F626A6563742050726F6D6973655D272026262021502E6361737429207B0A20202020202072657475726E3B0A202020';
wwv_flow_api.g_varchar2_table(292) := '207D0A20207D0A0A20206C6F63616C2E50726F6D697365203D2050726F6D69736524313B0A7D0A0A2F2F20537472616E676520636F6D7061742E2E0A50726F6D69736524312E706F6C7966696C6C203D20706F6C7966696C6C3B0A50726F6D6973652431';
wwv_flow_api.g_varchar2_table(293) := '2E50726F6D697365203D2050726F6D69736524313B0A0A72657475726E2050726F6D69736524313B0A0A7D2929293B0A0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(180173280183221848)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'js/es6-promise.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '48544D4C43616E766173456C656D656E742E70726F746F747970652E676574436F6E746578743D66756E6374696F6E2865297B72657475726E2066756E6374696F6E28742C69297B72657475726E22776562676C223D3D3D74262628693D4F626A656374';
wwv_flow_api.g_varchar2_table(2) := '2E61737369676E287B7D2C692C7B707265736572766544726177696E674275666665723A21307D29292C652E63616C6C28746869732C742C69297D7D2848544D4C43616E766173456C656D656E742E70726F746F747970652E676574436F6E7465787429';
wwv_flow_api.g_varchar2_table(3) := '2C77696E646F772E414F503D77696E646F772E414F507C7C7B7D2C66756E6374696F6E28652C742C692C612C6F2C732C6E2C722C642C6C297B2275736520737472696374223B652E73637265656E73686F74733D7B6974656D733A5B5D7D2C652E67414F';
wwv_flow_api.g_varchar2_table(4) := '504F7074696F6E733D7B616A61784964656E7469666965723A22222C74726967676572456C656D49643A22222C737461746963526567696F6E4964733A22222C6F7574707574546F3A22222C64614E616D653A22222C776169745370696E6E65723A2222';
wwv_flow_api.g_varchar2_table(5) := '2C70726F63657373696E67496E64696361746F723A7B7D2C70726F63657373696E67547970653A7B7370696E6E65723A227370696E6E6572222C6F7665726C61793A226F7665726C6179222C627574746F6E3A22627574746F6E227D2C7370696E6E6572';
wwv_flow_api.g_varchar2_table(6) := '49636F6E3A7B617065783A2241504558227D2C73686F774E6F74696669636174696F6E3A21302C6E6F746966696361746F6E4D6573736167653A22222C7375626D69744974656D7341727261793A5B5D2C7375626D697456616C75657341727261793A5B';
wwv_flow_api.g_varchar2_table(7) := '5D2C4947526567696F6E496473416E6453656C6563746564504B3A7B7D2C6630313A7B6461746141727261793A5B5D7D7D2C652E67657442726F777365724E616D653D2828293D3E7B76617220652C742C693D6E6176696761746F722E75736572416765';
wwv_flow_api.g_varchar2_table(8) := '6E742C613D6E6176696761746F722E6170704E616D653B72657475726E2D31213D28743D692E696E6465784F6628224F706572612229293F613D226F70657261223A2D31213D28743D692E696E6465784F6628224D5349452229293F613D226965223A2D';
wwv_flow_api.g_varchar2_table(9) := '31213D28743D692E696E6465784F66282254726964656E742229293F613D226965223A2D31213D28743D692E696E6465784F662822456467652229293F613D2265646765223A2D31213D28743D692E696E6465784F6628224368726F6D652229293F613D';
wwv_flow_api.g_varchar2_table(10) := '226368726F6D65223A2D31213D28743D692E696E6465784F6628225361666172692229293F613D22736166617269223A2D31213D28743D692E696E6465784F66282246697265666F782229293F613D2266697265666F78223A28653D692E6C617374496E';
wwv_flow_api.g_varchar2_table(11) := '6465784F6628222022292B31293C28743D692E6C617374496E6465784F6628222F222929262628613D692E737562737472696E6728652C74292C612E746F4C6F7765724361736528293D3D612E746F5570706572436173652829262628613D6E61766967';
wwv_flow_api.g_varchar2_table(12) := '61746F722E6170704E616D6529292C617D292C652E73686F774572726F724D6573736167653D28653D3E7B7472797B732E636C6561724572726F727328292C732E73686F774572726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A';
wwv_flow_api.g_varchar2_table(13) := '2270616765222C6D6573736167653A652C756E736166653A21317D5D297D63617463682865297B612E696E666F2822414F502073686F774572726F724D657373616765222C65297D7D292C652E73686F77537563636573734D6573736167653D28653D3E';
wwv_flow_api.g_varchar2_table(14) := '7B7472797B732E73686F7750616765537563636573732865297D63617463682865297B612E696E666F2822414F502073686F77537563636573734D657373616765222C65297D7D292C652E73686F774E6F74696669636174696F6E3D2828742C69293D3E';
wwv_flow_api.g_varchar2_table(15) := '7B696628652E67414F504F7074696F6E732E73686F774E6F74696669636174696F6E297B76617220613D652E67414F504F7074696F6E732E6E6F746966696361746F6E4D6573736167657C7C693B2273756363657373223D3D743F652E73686F77537563';
wwv_flow_api.g_varchar2_table(16) := '636573734D6573736167652861293A226572726F72223D3D742626652E73686F774572726F724D6573736167652861297D7D293B636F6E737420633D28652C742C69293D3E7B636F6E737420613D722E68746D6C4275696C64657228293B737769746368';
wwv_flow_api.g_varchar2_table(17) := '28612E6D61726B757028273C64697620636C6173733D22616F702D50726F63657373696E67223E27292C65297B636173652274687265652D626F756E6365223A6361736522666C6F77223A612E6D61726B757028273C64697620636C6173733D22736B2D';
wwv_flow_api.g_varchar2_table(18) := '666C6F7720736B2D63656E746572223E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D666C6F772D646F';
wwv_flow_api.g_varchar2_table(19) := '74223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522726F746174696E672D706C616E65223A6361736522706C616E65223A612E6D61726B757028273C64697620636C6173733D22736B2D706C616E6520736B2D63656E746572223E3C';
wwv_flow_api.g_varchar2_table(20) := '2F6469763E27293B627265616B3B6361736522666164696E672D636972636C65223A6361736522636972636C652D66616465223A612E6D61726B757028273C64697620636C6173733D22736B2D636972636C652D6661646520736B2D63656E746572223E';
wwv_flow_api.g_varchar2_table(21) := '3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D6661';
wwv_flow_api.g_varchar2_table(22) := '64652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C617373';
wwv_flow_api.g_varchar2_table(23) := '3D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F';
wwv_flow_api.g_varchar2_table(24) := '6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C';
wwv_flow_api.g_varchar2_table(25) := '652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522666F6C64696E672D63756265223A6361736522666F6C6422';
wwv_flow_api.g_varchar2_table(26) := '3A612E6D61726B757028273C64697620636C6173733D22736B2D666F6C6420736B2D63656E746572223E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D666F6C642D63756265223E';
wwv_flow_api.g_varchar2_table(27) := '3C2F6469763E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522646F75626C652D626F75';
wwv_flow_api.g_varchar2_table(28) := '6E6365223A6361736522626F756E6365223A612E6D61726B757028273C64697620636C6173733D22736B2D626F756E636520736B2D63656E746572223E3C64697620636C6173733D22736B2D626F756E63652D646F74223E3C2F6469763E3C6469762063';
wwv_flow_api.g_varchar2_table(29) := '6C6173733D22736B2D626F756E63652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652277617665223A612E6D61726B757028273C64697620636C6173733D22736B2D7761766520736B2D63656E746572223E3C6469762063';
wwv_flow_api.g_varchar2_table(30) := '6C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C617373';
wwv_flow_api.g_varchar2_table(31) := '3D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652277616E646572696E672D6375626573223A636173652277616E64';
wwv_flow_api.g_varchar2_table(32) := '6572223A612E6D61726B757028273C64697620636C6173733D22736B2D77616E64657220736B2D63656E746572223E3C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D77616E64';
wwv_flow_api.g_varchar2_table(33) := '65722D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652270756C7365223A612E6D61726B757028273C64697620636C6173733D22736B';
wwv_flow_api.g_varchar2_table(34) := '2D70756C736520736B2D63656E746572223E3C2F6469763E27293B627265616B3B636173652263686173696E672D646F7473223A63617365226368617365223A612E6D61726B757028273C64697620636C6173733D22736B2D636861736520736B2D6365';
wwv_flow_api.g_varchar2_table(35) := '6E746572223E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469';
wwv_flow_api.g_varchar2_table(36) := '763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C2F';
wwv_flow_api.g_varchar2_table(37) := '6469763E27293B627265616B3B6361736522636972636C65223A612E6D61726B757028273C64697620636C6173733D22736B2D636972636C6520736B2D63656E746572223E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469';
wwv_flow_api.g_varchar2_table(38) := '763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F646976';
wwv_flow_api.g_varchar2_table(39) := '3E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E';
wwv_flow_api.g_varchar2_table(40) := '3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C';
wwv_flow_api.g_varchar2_table(41) := '64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522637562652D67726964223A63617365';
wwv_flow_api.g_varchar2_table(42) := '2267726964223A612E6D61726B757028273C64697620636C6173733D22736B2D6772696420736B2D63656E746572223E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D';
wwv_flow_api.g_varchar2_table(43) := '63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265';
wwv_flow_api.g_varchar2_table(44) := '223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F';
wwv_flow_api.g_varchar2_table(45) := '6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C2F6469763E27293B627265616B3B64656661756C743A612E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D50726F63657373';
wwv_flow_api.g_varchar2_table(46) := '696E67222B28743F2220222B743A222229292E617474722822726F6C65222C22616C65727422292E6D61726B757028223E22292E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D50726F63657373696E672D7370696E6E';
wwv_flow_api.g_varchar2_table(47) := '657222292E6D61726B757028223E22292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D56697375616C6C7948696464656E22292E6D61726B757028223E22292E636F6E74';
wwv_flow_api.g_varchar2_table(48) := '656E742869292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C2F7370616E3E22297D72657475726E20612E6D61726B757028223C2F6469763E22292C612E746F537472696E6728297D2C673D28652C61293D3E7B636F6E7374206F';
wwv_flow_api.g_varchar2_table(49) := '3D692877696E646F77293B6C657420732C6E2C722C642C6C2C672C703D692E657874656E64287B616C6572743A742E6765744D6573736167652822415045582E50524F43455353494E4722292C7370696E6E6572436C6173733A22227D2C61292C753D65';
wwv_flow_api.g_varchar2_table(50) := '262621702E66697865643F22737472696E67223D3D747970656F6620653F6928646F63756D656E74292E66696E642865293A692865293A692822626F647922292C763D752E6F666673657428292C663D7B746F703A6F2E7363726F6C6C546F7028292C6C';
wwv_flow_api.g_varchar2_table(51) := '6566743A6F2E7363726F6C6C4C65667428297D3B72657475726E20733D69286328702E7370696E6E657249636F6E2C702E7370696E6E6572436C6173732C702E616C65727429292C732E617070656E64546F2875292C702E66697865643F28723D286F2E';
wwv_flow_api.g_varchar2_table(52) := '68656967687428292D732E6865696768742829292F322C6E3D286F2E776964746828292D732E77696474682829292F322C732E637373287B706F736974696F6E3A226669786564222C746F703A722B227078222C6C6566743A6E2B227078227D29293A28';
wwv_flow_api.g_varchar2_table(53) := '662E626F74746F6D3D662E746F702B6F2E68656967687428292C662E72696768743D662E6C6566742B6F2E776964746828292C762E626F74746F6D3D762E746F702B752E6F7574657248656967687428292C762E72696768743D762E6C6566742B752E6F';
wwv_flow_api.g_varchar2_table(54) := '75746572576964746828292C723D762E746F703E662E746F703F762E746F703A662E746F702C643D762E626F74746F6D3C662E626F74746F6D3F762E626F74746F6D3A662E626F74746F6D2C6C3D28642D72292F322C673D662E746F702D762E746F702C';
wwv_flow_api.g_varchar2_table(55) := '673E302626286C2B3D67292C732E706F736974696F6E287B6D793A2263656E746572222C61743A226C6566742B35302520746F702B222B6C2B227078222C6F663A752C636F6C6C6973696F6E3A22666974227D29292C732E617474722822646174612D63';
wwv_flow_api.g_varchar2_table(56) := '617074757265222C226578636C75646522292C737D2C703D28293D3E7B6C657420653B72657475726E20653D6928273C6469762069643D22617065785F776169745F6F7665726C61792220636C6173733D22617065785F776169745F6F7665726C617920';
wwv_flow_api.g_varchar2_table(57) := '616F705F776169745F6F7665726C6179223E3C2F6469763E27292E617070656E64546F2822626F647922292C652E617474722822646174612D63617074757265222C226578636C75646522292C657D2C753D653D3E7B6C657420612C6F3D692E65787465';
wwv_flow_api.g_varchar2_table(58) := '6E64287B616C6572743A742E6765744D6573736167652822415045582E50524F43455353494E4722292C7370696E6E6572436C6173733A22227D2C65292C733D652E627574746F6E2C6E3D22737472696E67223D3D747970656F6620733F6928646F6375';
wwv_flow_api.g_varchar2_table(59) := '6D656E74292E66696E64282223222B73293A692873293B72657475726E206E2E616464436C6173732822617065782D64697361626C656422292E70726F70282264697361626C6564222C2130292E66696E642822203E202A22292E616464436C61737328';
wwv_flow_api.g_varchar2_table(60) := '22752D68696464656E22292C613D692863286F2E7370696E6E657249636F6E2C6F2E7370696E6E6572436C6173732C6F2E616C65727429292C612E617070656E64546F286E292C6E7D3B652E73686F775370696E6E65723D2828742C69293D3E7B6C6574';
wwv_flow_api.g_varchar2_table(61) := '20612C6F2C733B72657475726E20692E747970653D3D3D652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E65723F28613D6728742C69292C7B72656D6F76653A66756E6374696F6E28297B612E72656D6F766528297D';
wwv_flow_api.g_varchar2_table(62) := '7D293A692E747970653D3D3D652E67414F504F7074696F6E732E70726F63657373696E67547970652E6F7665726C61793F28613D6728742C69292C6F3D7028292C7B72656D6F76653A66756E6374696F6E28297B6F2E72656D6F766528292C612E72656D';
wwv_flow_api.g_varchar2_table(63) := '6F766528297D7D293A692E747970653D3D3D652E67414F504F7074696F6E732E70726F63657373696E67547970652E627574746F6E3F28733D752869292C7B72656D6F76653A66756E6374696F6E28297B732E72656D6F7665436C617373282261706578';
wwv_flow_api.g_varchar2_table(64) := '2D64697361626C656422292E70726F70282264697361626C6564222C2131292C732E66696E642822203E202A22292E72656D6F7665436C6173732822752D68696464656E22292C732E66696E6428222E616F702D50726F63657373696E6722292E72656D';
wwv_flow_api.g_varchar2_table(65) := '6F766528297D7D293A766F696420307D292C652E6275696C6441666665637465644974656D41727261793D28653D3E7B612E696E666F2822414F5020704166666563746564456C656D656E7473222C65293B76617220743D5B5D3B72657475726E206526';
wwv_flow_api.g_varchar2_table(66) := '2628743D652E7265706C616365282F5C732F672C2222292E73706C697428222C2229292C747D292C652E6275696C6441666665637465644974656D56616C756541727261793D28653D3E7B612E696E666F2822414F50206275696C644166666563746564';
wwv_flow_api.g_varchar2_table(67) := '4974656D56616C75654172726179222C65293B76617220743D5B5D2C693D5B5D3B69662865297B743D652E7265706C616365282F5C732F672C2222292E73706C697428222C22293B666F7228766172206F3D303B6F3C742E6C656E6774683B6F2B2B2969';
wwv_flow_api.g_varchar2_table(68) := '2E7075736828247628745B6F5D29297D72657475726E20697D292C652E737667456E68616E63653D2828742C6F293D3E7B7472797B612E696E666F2822414F5020737667456E68616E6365222C74293B76617220733D692874292E66696E642822737667';
wwv_flow_api.g_varchar2_table(69) := '22292C6E3D303B612E696E666F2822414F5020737667456E68616E6365222C6E2C732E6C656E677468293B76617220723D66756E6374696F6E28297B6E2B2B2C612E696E666F2822414F5020737667456E68616E636520737667446F6E65222C6E2C732E';
wwv_flow_api.g_varchar2_table(70) := '6C656E677468292C6E3D3D732E6C656E677468262628612E696E666F2822414F5020737667456E68616E636520737667446F6E652063616C6C6261636B22292C6F2829297D3B732E656163682866756E6374696F6E28297B612E696E666F2822414F5020';
wwv_flow_api.g_varchar2_table(71) := '737667456E68616E636520222C74686973293B76617220743D746869732C6F3D692874292E696E6E6572576964746828292C733D692874292E696E6E657248656967687428293B692874292E6174747228227769647468222C6F292C692874292E617474';
wwv_flow_api.g_varchar2_table(72) := '722822686569676874222C73292C692874292E617474722822786D6C6E73222C22687474703A2F2F7777772E77332E6F72672F323030302F73766722292C692874292E617474722822786D6C6E733A786C696E6B222C22687474703A2F2F7777772E7733';
wwv_flow_api.g_varchar2_table(73) := '2E6F72672F313939392F786C696E6B22293B666F7228766172206E3D742E676574456C656D656E747342795461674E616D652822696D61676522292C643D302C6C3D66756E6374696F6E28297B612E696E666F2822414F5020737667456E68616E636520';
wwv_flow_api.g_varchar2_table(74) := '696D616765446F6E65222C642C6E2E6C656E677468292C642B2B2C643E3D6E2E6C656E677468262628612E696E666F2822414F5020737667456E68616E636520696D616765446F6E652063616C6C696E6720737667446F6E65222C642C6E2E6C656E6774';
wwv_flow_api.g_varchar2_table(75) := '68292C722829297D2C633D303B633C6E2E6C656E6774683B632B2B292866756E6374696F6E28297B76617220743D6E5B635D3B652E67657442617365363446726F6D55524C28652E6765744162736F6C75746555726C28742E6765744174747269627574';
wwv_flow_api.g_varchar2_table(76) := '6528226872656622297C7C742E6765744174747269627574652822786C696E6B3A687265662229292C66756E6374696F6E2865297B742E7365744174747269627574652822786C696E6B3A68726566222C65292C742E7365744174747269627574652822';
wwv_flow_api.g_varchar2_table(77) := '68726566222C65292C612E696E666F2822414F5020446174612052657475726E65643A222C65292C6C28297D297D2928293B303D3D3D6E2E6C656E67746826267228297D292C303D3D3D732E6C656E67746826266F28297D63617463682865297B612E69';
wwv_flow_api.g_varchar2_table(78) := '6E666F2822414F5020737667456E68616E636520636175676874206572726F72222C65292C6F28297D7D292C652E63616E76617332446174615552493D2828652C74293D3E7B76617220693D652E746F4461746155524C2874293B72657475726E20697D';
wwv_flow_api.g_varchar2_table(79) := '292C652E64617461555249326261736536343D28653D3E7B76617220743D652E73756273747228652E696E6465784F6628222C22292B31293B72657475726E20747D292C652E636C6F623241727261793D2828652C742C69293D3E7B666F722876617220';
wwv_flow_api.g_varchar2_table(80) := '613D4D6174682E666C6F6F7228652E6C656E6774682F74292B312C6F3D303B6F3C613B6F2B2B29692E7075736828652E736C69636528742A6F2C742A286F2B312929293B72657475726E20697D292C652E676574496D6167654261736536343D2828742C';
wwv_flow_api.g_varchar2_table(81) := '6F293D3E7B76617220733D692874292C6E3D732E696E6E6572576964746828292C723D732E696E6E657248656967687428293B696628612E6765744C6576656C28293E302C22636C69656E745F63616E766173223D3D3D735B305D2E6765744174747269';
wwv_flow_api.g_varchar2_table(82) := '627574652822616F702D726567696F6E2D6173222929612E696E666F2822414F5020676574496D6167654261736536342063616C6C696E67207468652063616E7661732067657420696D616765206F7074696F6E20776974682073656C6563746F72222B';
wwv_flow_api.g_varchar2_table(83) := '742B222063616E766173222C6928742B222063616E76617322295B305D2E746F4461746155524C2829292C6F286928742B222063616E76617322295B305D2E746F4461746155524C28292E73706C697428223B6261736536342C22295B315D293B656C73';
wwv_flow_api.g_varchar2_table(84) := '657B612E696E666F2822414F5020676574496D61676542617365363420736E6170646F6D20776974682073656C6563746F72222B742B222022293B76617220643D6E657720446174653B652E737667456E68616E636528742C66756E6374696F6E28297B';
wwv_flow_api.g_varchar2_table(85) := '612E696E666F28225573696E672063616E7661732073656C6563746F72206F6E20222C735B305D292C736E6170646F6D28735B305D2C7B7363616C653A312E312C6261636B67726F756E64436F6C6F723A2223666666222C77696474683A6E2C68656967';
wwv_flow_api.g_varchar2_table(86) := '68743A722C747970653A22706E67227D292E7468656E28693D3E7B692E746F506E6728292E7468656E28693D3E7B612E696E666F2869293B76617220733D652E646174615552493262617365363428692E67657441747472696275746528227372632229';
wwv_flow_api.g_varchar2_table(87) := '293B612E696E666F2822414F5020676574496D61676542617365363420736E6170646F6D20776974682073656C6563746F72222B742B2220746F6F6B20222B286E657720446174652D64292F3165332B22207322292C6F2873297D297D297D297D7D292C';
wwv_flow_api.g_varchar2_table(88) := '652E626173653634746F426C6F623D2828652C74293D3E7B666F722876617220693D61746F622865292C613D742C6F3D6E657720417272617942756666657228692E6C656E677468292C733D6E65772055696E74384172726179286F292C6E3D303B6E3C';
wwv_flow_api.g_varchar2_table(89) := '692E6C656E6774683B6E2B2B29735B6E5D3D692E63686172436F64654174286E293B7472797B72657475726E206E657720426C6F62285B6F5D2C7B747970653A617D297D63617463682865297B76617220723D77696E646F772E5765624B6974426C6F62';
wwv_flow_api.g_varchar2_table(90) := '4275696C6465727C7C77696E646F772E4D6F7A426C6F624275696C6465727C7C77696E646F772E4D53426C6F624275696C6465722C643D6E657720723B72657475726E20642E617070656E64286F292C642E676574426C6F622861297D7D292C652E646F';
wwv_flow_api.g_varchar2_table(91) := '776E6C6F61644261736536343D2828742C6F2C73293D3E7B612E696E666F2822414F5020646F776E6C6F61644261736536342064617461222C74293B766172206E3D652E67657442726F777365724E616D6528293B696628226965223D3D6E7C7C226564';
wwv_flow_api.g_varchar2_table(92) := '6765223D3D6E297B76617220723D652E626173653634746F426C6F6228742C6F293B77696E646F772E6E6176696761746F722E6D7353617665426C6F6228722C73297D656C73657B76617220643D22646174613A222B6F2B223B6261736536342C222B74';
wwv_flow_api.g_varchar2_table(93) := '3B612E696E666F2822414F50204D696D6554797065222C6F293B766172206C3D646F63756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E617070656E644368696C64286C292C6C2E7374796C653D226469';
wwv_flow_api.g_varchar2_table(94) := '73706C61793A206E6F6E65222C6C2E7461726765743D225F626C616E6B222C6C2E636C6173734E616D653D22616F705F6C696E6B222C6C2E687265663D642C226368726F6D6522213D6E26262273616661726922213D6E7C7C286C2E687265663D55524C';
wwv_flow_api.g_varchar2_table(95) := '2E6372656174654F626A65637455524C28652E626173653634746F426C6F6228742C6F2929292C6C2E646F776E6C6F61643D732C6C2E636C69636B28292C692822612E616F705F6C696E6B22292E72656D6F766528297D7D292C652E6765744162736F6C';
wwv_flow_api.g_varchar2_table(96) := '75746555726C3D2828293D3E7B76617220653B72657475726E2066756E6374696F6E2874297B72657475726E20653D657C7C646F63756D656E742E637265617465456C656D656E7428226122292C652E687265663D742C652E636C6F6E654E6F64652821';
wwv_flow_api.g_varchar2_table(97) := '31292E687265667D7D292C652E67657442617365363446726F6D55524C3D2828652C74293D3E7B612E696E666F2822414F502067657442617365363446726F6D55524C222C65293B76617220693D6E657720584D4C48747470526571756573743B692E6F';
wwv_flow_api.g_varchar2_table(98) := '70656E2822474554222C652C2130292C692E726573706F6E7365547970653D226172726179627566666572222C692E6F6E6C6F61643D66756E6374696F6E2865297B76617220693D6E65772055696E7438417272617928746869732E726573706F6E7365';
wwv_flow_api.g_varchar2_table(99) := '292C613D537472696E672E66726F6D43686172436F64652E6170706C79286E756C6C2C69292C6F3D62746F612861292C733D22646174613A696D6167652F706E673B6261736536342C222B6F3B742873297D2C692E73656E6428297D292C652E696E6C69';
wwv_flow_api.g_varchar2_table(100) := '6E654261736536343D2828742C6F2C732C6E2C72293D3E7B76617220643D723B6966286E297B612E696E666F2822526567696F6E20646566696E6564222C6E293B766172206C3D69282223222B6E297D656C73657B612E696E666F2822526567696F6E20';
wwv_flow_api.g_varchar2_table(101) := '6E6F7420646566696E6564222C64293B6C3D6928275B646174612D616F702D696E6C696E652D7064663D22272B642B27225D27297D76617220633D6C2E617474722822696422297C7C22616F70223B6966286C2E68746D6C282222292E616464436C6173';
wwv_flow_api.g_varchar2_table(102) := '732822616F702D496E6C696E655072657669657722292C226965223D3D3D652E67657442726F777365724E616D6528292972657475726E20652E646F776E6C6F616442617365363428742C6F2C73293B76617220673D652E626173653634746F426C6F62';
wwv_flow_api.g_varchar2_table(103) := '28742C6F293B672E6E616D653D733B76617220703D55524C2E6372656174654F626A65637455524C2867293B6C657420753D6928273C627574746F6E20747970653D22627574746F6E22207469746C653D22446F776E6C6F61642220617269612D6C6162';
wwv_flow_api.g_varchar2_table(104) := '656C3D22446F776E6C6F61642220636C6173733D22616F702D496E6C696E65507265766965772D2D646F776E6C6F6164427574746F6E20742D427574746F6E20742D427574746F6E2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E223E3C73';
wwv_flow_api.g_varchar2_table(105) := '70616E20617269612D68696464656E3D22747275652220636C6173733D22742D49636F6E2066612066612D646F776E6C6F6164223E3C2F7370616E3E3C2F627574746F6E3E27293B752E616464436C6173732822616F702D496E6C696E65507265766965';
wwv_flow_api.g_varchar2_table(106) := '772D2D646F776E6C6F6164427574746F6E22292C6C2E617070656E642875293B636F6E737420763D28652C74293D3E7B636F6E737420693D646F63756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E6170';
wwv_flow_api.g_varchar2_table(107) := '70656E644368696C642869292C692E687265663D652C692E646F776E6C6F61643D742C692E636C69636B28292C646F63756D656E742E626F64792E72656D6F76654368696C642869297D3B752E636C69636B2866756E6374696F6E28297B7628702C7329';
wwv_flow_api.g_varchar2_table(108) := '7D293B76617220663D6928273C696672616D652069643D22696E6C696E655F7064665F6F626A6563745F272B632B2722207372633D2222207469746C653D22272B732B27222077696474683D223130302522206865696768743D22313030252220747970';
wwv_flow_api.g_varchar2_table(109) := '653D22272B6F2B27223E3C2F6F626A6563743E27293B6C2E617070656E642866292C662E617474722822737263222C70297D292C652E696E6C696E65546578743D2828742C612C6F2C732C6E293D3E7B76617220723D652E6236344465636F6465556E69';
wwv_flow_api.g_varchar2_table(110) := '636F64652874292C643D6E3B6966287329766172206C3D69282223222B73293B656C7365206C3D6928275B646174612D616F702D696E6C696E652D7478743D22272B642B27225D27293B6C2E76616C2872297D292C652E6236344465636F6465556E6963';
wwv_flow_api.g_varchar2_table(111) := '6F64653D28653D3E6465636F6465555249436F6D706F6E656E742841727261792E70726F746F747970652E6D61702E63616C6C2861746F622865292C66756E6374696F6E2865297B72657475726E2225222B28223030222B652E63686172436F64654174';
wwv_flow_api.g_varchar2_table(112) := '2830292E746F537472696E6728313629292E736C696365282D32297D292E6A6F696E2822222929292C652E676574496E646976696475616C496D61676555706C6F61644172726179733D2828742C6F293D3E7B7472797B696628612E696E666F2822414F';
wwv_flow_api.g_varchar2_table(113) := '5020676574496E646976696475616C496D61676555706C6F616441727261797320636865636B696E6720666F722074797065206F6620726567696F6E20776974682073656C6563746F7220222B74292C766F696420303D3D3D692874295B305D29726574';
wwv_flow_api.g_varchar2_table(114) := '75726E20612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F616441727261797320726567696F6E206E6F7420666F756E642069676E6F72696E672C20222B74292C766F6964206F28293B73776974636828612E696E66';
wwv_flow_api.g_varchar2_table(115) := '6F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732020222B692874295B305D2E6765744174747269627574652822616F702D726567696F6E2D617322292C692874295B305D292C692874295B305D2E67657441';
wwv_flow_api.g_varchar2_table(116) := '74747269627574652822616F702D726567696F6E2D61732229297B63617365227365727665725F68746D6C223A6361736522636C69656E745F68746D6C223A612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F616441';
wwv_flow_api.g_varchar2_table(117) := '72726179732068746D6C20666F756E642070617373696E672069742061732069742069732E222C74293B76617220733D7B6E616D653A742E7375627374722831297D3B7472797B732E6261736536343D6928742B22202E742D526567696F6E2D626F6479';
wwv_flow_api.g_varchar2_table(118) := '22295B305D2E696E6E657248544D4C2C612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C2069733A222C6928742B22202E742D526567696F6E2D626F647922295B305D2E696E6E6572';
wwv_flow_api.g_varchar2_table(119) := '48544D4C297D63617463682865297B732E6261736536343D692874295B305D2E696E6E657248544D4C2C612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C2069733A222C692874295B';
wwv_flow_api.g_varchar2_table(120) := '305D2E696E6E657248544D4C297D612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F616441727261797320737667206265696E672073656E74222C732E626173653634292C652E73637265656E73686F74732E697465';
wwv_flow_api.g_varchar2_table(121) := '6D732E707573682873292C6F28293B627265616B3B6361736522636C69656E745F737667223A652E737667456E68616E636528742C66756E6374696F6E28297B76617220733D7B6E616D653A742E7375627374722831292C6261736536343A286E657720';
wwv_flow_api.g_varchar2_table(122) := '584D4C53657269616C697A6572292E73657269616C697A65546F537472696E67286928742B222073766722295B305D292C77696474683A692874292E646174612822616F702D776964746822297C7C692874292E696E6E6572576964746828292C686569';
wwv_flow_api.g_varchar2_table(123) := '6768743A692874292E646174612822616F702D68656967687422297C7C692874292E696E6E657248656967687428297D3B732E6D61785F77696474683D692874292E646174612822616F702D6D61782D776964746822297C7C732E77696474682C732E6D';
wwv_flow_api.g_varchar2_table(124) := '61785F6865696768743D692874292E646174612822616F702D6D61782D68656967687422297C7C732E6865696768742C612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F616441727261797320737667206265696E67';
wwv_flow_api.g_varchar2_table(125) := '2073656E74222C732E626173653634292C652E73637265656E73686F74732E6974656D732E707573682873292C6F28297D293B627265616B3B64656661756C743A652E676574496D61676542617365363428742C66756E6374696F6E2861297B76617220';
wwv_flow_api.g_varchar2_table(126) := '733D7B6E616D653A742E7375627374722831292C77696474683A692874292E646174612822616F702D776964746822297C7C692874292E696E6E6572576964746828292C6865696768743A692874292E646174612822616F702D68656967687422297C7C';
wwv_flow_api.g_varchar2_table(127) := '692874292E696E6E657248656967687428292C6261736536343A617D3B732E6D61785F77696474683D692874292E646174612822616F702D6D61782D776964746822297C7C732E77696474682C732E6D61785F6865696768743D692874292E6461746128';
wwv_flow_api.g_varchar2_table(128) := '22616F702D6D61782D68656967687422297C7C732E6865696768742C652E73637265656E73686F74732E6974656D732E707573682873292C6F28297D297D7D63617463682865297B612E696E666F2822414F5020457863657074696F6E3A222C65292C6F';
wwv_flow_api.g_varchar2_table(129) := '28297D7D292C652E676574416C6C496D61676555706C6F61644172726179733D286173796E6328742C69293D3E7B612E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204944204172726179222C74';
wwv_flow_api.g_varchar2_table(130) := '293B636F6E7374206F3D742E6C656E6774683B612E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204172726179204C656E677468222C6F293B666F72286C657420693D303B693C6F3B692B2B2961';
wwv_flow_api.g_varchar2_table(131) := '2E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204172726179204C6F6F7020697465726174696F6E222C69292C745B695D3F6177616974206E65772050726F6D69736528613D3E7B652E67657449';
wwv_flow_api.g_varchar2_table(132) := '6E646976696475616C496D61676555706C6F6164417272617973282223222B745B695D2C61297D293A612E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320536B697070696E6720696E76616C696420726567696F6E';
wwv_flow_api.g_varchar2_table(133) := '20494420617420696E646578222C69293B6928297D292C652E646F776E6C6F6164414F5046696C653D2828742C73293D3E7B612E696E666F2822414F5020646F776E6C6F6164414F5046696C6520414F502E67414F504F7074696F6E73222C652E67414F';
wwv_flow_api.g_varchar2_table(134) := '504F7074696F6E73293B766172206E3D7B705F7769646765745F616374696F6E3A22414F50222C705F726571756573743A22504C5547494E3D222B652E67414F504F7074696F6E732E616A61784964656E7469666965722C705F666C6F775F69643A2476';
wwv_flow_api.g_varchar2_table(135) := '282270466C6F77496422292C705F666C6F775F737465705F69643A2476282270466C6F7753746570496422292C705F696E7374616E63653A2476282270496E7374616E636522292C705F64656275673A2476282270646562756722292C705F6172675F6E';
wwv_flow_api.g_varchar2_table(136) := '616D65733A652E67414F504F7074696F6E732E7375626D69744974656D7341727261792C705F6172675F76616C7565733A652E67414F504F7074696F6E732E7375626D697456616C75657341727261792C7830313A652E67414F504F7074696F6E732E73';
wwv_flow_api.g_varchar2_table(137) := '7461746963526567696F6E4964732C7830323A652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B7D3B6E2E6630313D652E636C6F62324172726179284A534F4E2E737472696E6769667928652E7363726565';
wwv_flow_api.g_varchar2_table(138) := '6E73686F7473292C3365342C5B5D292C652E73637265656E73686F74733D7B6974656D733A5B5D7D2C692E616A6178287B64617461547970653A2274657874222C747970653A22504F5354222C75726C3A77696E646F772E6C6F636174696F6E2E687265';
wwv_flow_api.g_varchar2_table(139) := '662E73756273747228302C77696E646F772E6C6F636174696F6E2E687265662E696E6465784F6628222F663F703D22292B31292B227777765F666C6F772E73686F77222C6173796E633A21302C747261646974696F6E616C3A21302C646174613A6E2C73';
wwv_flow_api.g_varchar2_table(140) := '7563636573733A66756E6374696F6E286E2C722C63297B76617220673B7472797B673D6A51756572792E70617273654A534F4E286E297D63617463682865297B612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520526573706F6E736520';
wwv_flow_api.g_varchar2_table(141) := '50617273654572726F72222C65293B76617220703D6928223C6469763E3C2F6469763E22293B702E68746D6C286E293B76617220753D6928222E742D416C6572742D626F6479206833222C70292E7465787428293B753D752E7265706C616365282F222F';
wwv_flow_api.g_varchar2_table(142) := '672C275C5C2227292C753D752E7265706C616365282F5C6E2F672C222022292C22223D3D75262628753D22414F5020414A41582043616C6C6261636B2069737375652E22292C673D6A51756572792E70617273654A534F4E28277B202273746174757322';
wwv_flow_api.g_varchar2_table(143) := '3A20226572726F72222C20226D657373616765223A2022526573706F6E73652050617273654572726F72222C2022636F6465223A2022414A41582043616C6C6261636B20287044617461292050617273654572726F72222C20226E6F7469666963617469';
wwv_flow_api.g_varchar2_table(144) := '6F6E223A22272B752B2722207D27297D696628226572726F72223D3D672E73746174757329612E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C672E6D6573736167652C672E636F6465292C6F2E747269676765722865';
wwv_flow_api.g_varchar2_table(145) := '2E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F72222C67292C652E73686F774E6F74696669636174696F6E28226572726F72222C672E6E6F74696669636174696F6E292C7428293B656C73652069';
wwv_flow_api.g_varchar2_table(146) := '66282273756363657373223D3D672E737461747573297B696628612E6C6F672822414F5020646F776E6C6F6164414F5046696C65205375636365737322292C6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D4964';
wwv_flow_api.g_varchar2_table(147) := '2C22616F702D66696C652D73756363657373222C67292C612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520446F776E6C6F6164696E672066696C6522292C224449524543544F5259223D3D652E67414F504F7074696F6E732E6F757470';
wwv_flow_api.g_varchar2_table(148) := '7574546F262622746578742F706C61696E223D3D672E6D696D657479706529612E6C6F672822414F503A204F757470757420746F206469726563746F727922292C652E73686F774E6F74696669636174696F6E282273756363657373222C672E64617461';
wwv_flow_api.g_varchar2_table(149) := '293B656C7365206966282242524F57534552223D3D652E67414F504F7074696F6E732E6F7574707574546F7C7C2250524F4345445552455F42524F57534552223D3D652E67414F504F7074696F6E732E6F7574707574546F7C7C224449524543544F5259';
wwv_flow_api.g_varchar2_table(150) := '223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520646F776E6C6F616442617365363422292C652E646F776E6C6F616442617365363428672E646174612C672E6D696D65';
wwv_flow_api.g_varchar2_table(151) := '747970652C672E66696C656E616D65293B656C7365206966282242524F575345525F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C226170706C69636174696F6E2F70646622213D672E6D696D657479706526262274';
wwv_flow_api.g_varchar2_table(152) := '6578742F68746D6C22213D672E6D696D6574797065296966282242524F575345525F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B646F776E22213D672E6D696D6574797065262622746578';
wwv_flow_api.g_varchar2_table(153) := '742F706C61696E22213D672E6D696D6574797065262622746578742F63737622213D672E6D696D6574797065296966282250524F4345445552455F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C226170706C696361';
wwv_flow_api.g_varchar2_table(154) := '74696F6E2F70646622213D672E6D696D6574797065262622746578742F68746D6C22213D672E6D696D6574797065296966282250524F4345445552455F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C22746578742F';
wwv_flow_api.g_varchar2_table(155) := '6D61726B646F776E22213D672E6D696D6574797065262622746578742F706C61696E22213D672E6D696D6574797065262622746578742F63737622213D672E6D696D65747970652969662822434C4F5544223D3D652E67414F504F7074696F6E732E6F75';
wwv_flow_api.g_varchar2_table(156) := '74707574546F29612E6C6F672822414F503A204F757470757420746F20636C6F756422292C652E73686F774E6F74696669636174696F6E282273756363657373222C22446F63756D656E7420736176656420746F20636C6F75642E22293B656C73652069';
wwv_flow_api.g_varchar2_table(157) := '6628224153594E43223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F503A204F757470757420746F204173796E6368726F6E6F757322292C652E73686F774E6F74696669636174696F6E282273756363657373222C';
wwv_flow_api.g_varchar2_table(158) := '22446F63756D656E742077696C6C20626520726561647920666F7220646F776E6C6F616420736F6F6E2E22293B656C736520696628225745425F53455256494345223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F';
wwv_flow_api.g_varchar2_table(159) := '503A204F757470757420746F20576562205365727669636522292C652E73686F774E6F74696669636174696F6E282273756363657373222C22446F63756D656E742077696C6C2062652073656E7420746F20746865205765622053657276696365206F6E';
wwv_flow_api.g_varchar2_table(160) := '63652072656164792E22293B656C73652069662822415045585F4F46464943455F45444954223D3D652E67414F504F7074696F6E732E6F7574707574546F297B612E6C6F672822414F503A204F757470757420746F2041504558204F6666696365204564';
wwv_flow_api.g_varchar2_table(161) := '697422292C612E6C6F672822414F503A20726567696F6E3A20222B672E726567696F6E292C612E6C6F672822414F503A206974656D733A20222B672E6974656D73293B666F722876617220763D303B763C672E6974656D732E6C656E6774683B762B2B29';
wwv_flow_api.g_varchar2_table(162) := '6428672E6974656D735B765D2E6974656D292E73657456616C756528672E6974656D735B765D2E76616C7565293B69662822616F655F616F705F7461677322213D3D672E66696C656E616D65262628612E6C6F67282252656672657368696E6720414F45';
wwv_flow_api.g_varchar2_table(163) := '22292C6C28672E726567696F6E292E726566726573682829292C672E64617461297B612E6C6F6728224C6F6164207461677320696E20414F4522293B6C657420653D7B4D65737361676549643A2255435F4C6F61645F4A534F4E222C56616C7565733A7B';
wwv_flow_api.g_varchar2_table(164) := '7D7D3B652E56616C7565732E76616C75653D4A534F4E2E737472696E6769667928672E64617461293B6C657420743D6C28672E726567696F6E292E656C656D656E745B305D2E676574456C656D656E747342795461674E616D652822696672616D652229';
wwv_flow_api.g_varchar2_table(165) := '5B305D3B22616F655F616F705F74616773223D3D3D672E66696C656E616D653F28612E6C6F67282252656672657368696E6720414F4522292C73657454696D656F75742866756E6374696F6E28297B742E636F6E74656E7457696E646F772E706F73744D';
wwv_flow_api.g_varchar2_table(166) := '657373616765284A534F4E2E737472696E676966792865292C222A22297D2C35303029293A69282223222B672E726567696F6E292E6F6E28227563616F65696E697469616C697A6564222C66756E6374696F6E28297B73657454696D656F75742866756E';
wwv_flow_api.g_varchar2_table(167) := '6374696F6E28297B742E636F6E74656E7457696E646F772E706F73744D657373616765284A534F4E2E737472696E676966792865292C222A22297D2C326533297D297D7D656C736520696628225044465F524547494F4E5F50524F223D3D652E67414F50';
wwv_flow_api.g_varchar2_table(168) := '4F7074696F6E732E6F7574707574546F297B612E6C6F672822414F503A204F757470757420746F2050444620526567696F6E2050726F22292C612E6C6F672822414F503A20726567696F6E3A20222B672E726567696F6E292C612E6C6F672822414F503A';
wwv_flow_api.g_varchar2_table(169) := '206974656D733A20222B672E6974656D73293B666F7228763D303B763C672E6974656D732E6C656E6774683B762B2B296428672E6974656D735B765D2E6974656D292E73657456616C756528672E6974656D735B765D2E76616C7565293B6C28672E7265';
wwv_flow_api.g_varchar2_table(170) := '67696F6E292E7265667265736828297D656C736520612E6C6F672822414F503A204E6F20737570706F72746564206F7574707574206D6574686F6422293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E65';
wwv_flow_api.g_varchar2_table(171) := '5465787422292C612E6C6F672822414F503A20726567696F6E3A20222B672E726567696F6E292C652E696E6C696E655465787428672E646174612C672E6D696D65747970652C672E66696C656E616D652C672E726567696F6E2C73293B656C736520612E';
wwv_flow_api.g_varchar2_table(172) := '6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C612E6C6F672822414F503A20726567696F6E3A20222B672E726567696F6E292C652E696E6C696E6542617365363428672E646174612C672E6D696D65';
wwv_flow_api.g_varchar2_table(173) := '747970652C672E66696C656E616D652C672E726567696F6E2C73293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C612E6C6F672822414F503A20726567696F6E3A20222B672E726567';
wwv_flow_api.g_varchar2_table(174) := '696F6E292C652E696E6C696E655465787428672E646174612C672E6D696D65747970652C672E66696C656E616D652C672E726567696F6E2C73293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E65426173';
wwv_flow_api.g_varchar2_table(175) := '65363422292C612E6C6F672822414F503A20726567696F6E3A20222B672E726567696F6E292C652E696E6C696E6542617365363428672E646174612C672E6D696D65747970652C672E66696C656E616D652C672E726567696F6E2C73293B742867297D65';
wwv_flow_api.g_varchar2_table(176) := '6C7365206966282273756363657373223D3D722626224C6F63616C223D3D672E616F705F72656D6F74655F6465627567297B612E6C6F672822414F50204465627567204A534F4E20666F72206173796E632E2E2E2E22293B76617220663D6E657720426C';
wwv_flow_api.g_varchar2_table(177) := '6F62285B6E5D2C7B747970653A226170706C69636174696F6E2F6A736F6E227D293B662E6E616D653D28672E6C6F6767696E672626672E6C6F6767696E672E6F75747075745F66696C656E616D657C7C22616F705F646562756722292B222E6A736F6E22';
wwv_flow_api.g_varchar2_table(178) := '3B766172206D3D55524C2E6372656174654F626A65637455524C2866293B636F6E737420653D646F63756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E617070656E644368696C642865292C652E687265';
wwv_flow_api.g_varchar2_table(179) := '663D6D2C652E646F776E6C6F61643D662E6E616D652C652E636C69636B28292C646F63756D656E742E626F64792E72656D6F76654368696C642865292C7428297D7D2C6572726F723A66756E6374696F6E28692C73297B612E6C6F672822414F5020646F';
wwv_flow_api.g_varchar2_table(180) := '776E6C6F6164414F5046696C65204572726F72222C73292C6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F72222C73292C652E73686F774E6F74696669636174696F6E';
wwv_flow_api.g_varchar2_table(181) := '28226572726F72222C73292C7428297D2C7868723A66756E6374696F6E28297B76617220743D692E616A617853657474696E67732E78687228293B72657475726E20742E75706C6F61643F742E75706C6F61642E6164644576656E744C697374656E6572';
wwv_flow_api.g_varchar2_table(182) := '282270726F6772657373222C66756E6374696F6E2874297B696628742E6C656E677468436F6D70757461626C65297B76617220693D742E6C6F616465642F742E746F74616C2A3130303B6F2E7472696767657228652E67414F504F7074696F6E732E7472';
wwv_flow_api.g_varchar2_table(183) := '6967676572456C656D49642C22616F702D66696C652D70726F6772657373222C69297D7D2C2131293A612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520584852222C2250726F6772657373206973206E6F7420737570706F7274656420';
wwv_flow_api.g_varchar2_table(184) := '62792042726F777365722E22292C747D7D297D292C652E63616C6C414F503D66756E6374696F6E28297B7472797B50726F6D6973657C7C2850726F6D6973653D45533650726F6D697365297D63617463682865297B50726F6D6973653D45533650726F6D';
wwv_flow_api.g_varchar2_table(185) := '6973657D76617220742C733D746869732C723D732E616374696F6E2E616A61784964656E7469666965722C643D732E616374696F6E2E61747472696275746530312C633D732E616374696F6E2E61747472696275746530352C673D732E616374696F6E2E';
wwv_flow_api.g_varchar2_table(186) := '61747472696275746531322C703D732E616374696F6E2E61747472696275746531332C753D732E616374696F6E2E61747472696275746531342C763D732E74726967676572696E67456C656D656E743B743D692876292E697328225B69645D22293F2223';
wwv_flow_api.g_varchar2_table(187) := '222B692876292E617474722822696422293A22626F6479223B76617220663D5B5D3B70262628663D702E73706C697428222C2229293B766172206D3D5B5D3B6C6574204F3B672626286D3D672E73706C697428222C2229292C652E67414F504F7074696F';
wwv_flow_api.g_varchar2_table(188) := '6E732E616A61784964656E7469666965723D722C652E67414F504F7074696F6E732E74726967676572456C656D49643D742C652E67414F504F7074696F6E732E737461746963526567696F6E4964733D702C652E67414F504F7074696F6E732E6F757470';
wwv_flow_api.g_varchar2_table(189) := '7574546F3D752C224954454D223D3D732E616374696F6E2E6166666563746564456C656D656E747354797065262628652E67414F504F7074696F6E732E7375626D69744974656D7341727261793D652E6275696C6441666665637465644974656D417272';
wwv_flow_api.g_varchar2_table(190) := '617928732E616374696F6E2E6166666563746564456C656D656E7473292C652E67414F504F7074696F6E732E7375626D697456616C75657341727261793D652E6275696C6441666665637465644974656D56616C7565417272617928732E616374696F6E';
wwv_flow_api.g_varchar2_table(191) := '2E6166666563746564456C656D656E747329292C652E67414F504F7074696F6E732E6630312E6461746141727261793D5B5D2C612E696E666F2822414F502076416A61784964656E746966696572222C72292C612E696E666F2822414F50207654726967';
wwv_flow_api.g_varchar2_table(192) := '676572456C656D4964222C74292C612E696E666F2822414F50207644614E616D65222C64292C612E696E666F2822414F5020764461746154797065222C63292C612E696E666F2822414F502076526567696F6E496473222C70292C612E696E666F282241';
wwv_flow_api.g_varchar2_table(193) := '4F5020764F7574707574546F222C75292C612E696E666F2822414F5020414F502E67414F504F7074696F6E73222C652E67414F504F7074696F6E73292C652E67414F504F7074696F6E732E776169745370696E6E65722E6C656E6774683E303F28612E77';
wwv_flow_api.g_varchar2_table(194) := '61726E2822414F5020596F75277265207573696E672061206C6567616379207370696E6E6572206F7074696F6E2E20506C656173652075706461746520796F757220636F646520746F2075736520746865206E65772070726F63657373696E67496E6469';
wwv_flow_api.g_varchar2_table(195) := '6361746F72206174747269627574652E22292C4F3D7B747970653A652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E65722C7370696E6E657249636F6E3A652E67414F504F7074696F6E732E776169745370696E6E65';
wwv_flow_api.g_varchar2_table(196) := '727D293A4F3D692E657874656E64287B747970653A652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E65722C7370696E6E657249636F6E3A2241504558227D2C652E67414F504F7074696F6E732E70726F6365737369';
wwv_flow_api.g_varchar2_table(197) := '6E67496E64696361746F72293B6C657420413D652E73686F775370696E6E657228692822626F647922292C4F293B7472797B612E696E666F2822414F50206C4947526567696F6E4964733A222C6D292C652E67414F504F7074696F6E732E494752656769';
wwv_flow_api.g_varchar2_table(198) := '6F6E496473416E6453656C6563746564504B3D7B7D2C6D2E666F72456163682866756E6374696F6E2874297B7472797B76617220693D742C6F3D6C2869292E77696467657428292C733D6F2E696E74657261637469766547726964282267657456696577';
wwv_flow_api.g_varchar2_table(199) := '73222C226772696422292C6E3D6F2E696E7465726163746976654772696428226765745669657773222C226772696422292E6D6F64656C2C723D5B5D3B732E67657453656C65637465645265636F72647328292E666F72456163682866756E6374696F6E';
wwv_flow_api.g_varchar2_table(200) := '2865297B722E70757368286E2E5F6765745072696D6172794B65792865295B305D297D292C652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B5B745D3D722C612E696E666F2822414F502049472052656769';
wwv_flow_api.g_varchar2_table(201) := '6F6E2053656C656374696F6E3A222C742C72297D63617463682865297B7D7D292C652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B3D4A534F4E2E737472696E6769667928652E67414F504F7074696F6E73';
wwv_flow_api.g_varchar2_table(202) := '2E4947526567696F6E496473416E6453656C6563746564504B292C612E696E666F2822414F50204947526567696F6E496473416E6453656C6563746564504B3A222C652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C656374';
wwv_flow_api.g_varchar2_table(203) := '6564504B292C224952223D3D632626703F28612E696E666F2822414F502047657474696E6720746865206461746120666F722076526567696F6E496473222C70292C652E676574416C6C496D61676555706C6F616441727261797328662C66756E637469';
wwv_flow_api.g_varchar2_table(204) := '6F6E28297B652E646F776E6C6F6164414F5046696C652866756E6374696F6E28297B412E72656D6F766528292C6E2E726573756D6528732E726573756D6543616C6C6261636B2C2131297D2C64297D29293A652E646F776E6C6F6164414F5046696C6528';
wwv_flow_api.g_varchar2_table(205) := '66756E6374696F6E28297B412E72656D6F766528292C6E2E726573756D6528732E726573756D6543616C6C6261636B2C2131297D2C64297D63617463682874297B6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D';
wwv_flow_api.g_varchar2_table(206) := '49642C22616F702D66696C652D6572726F7222292C412E72656D6F766528292C6E2E726573756D6528732E726573756D6543616C6C6261636B2C2131297D7D7D28414F502C617065782E6C616E672C617065782E6A51756572792C617065782E64656275';
wwv_flow_api.g_varchar2_table(207) := '672C617065782E6576656E742C617065782E6D6573736167652C617065782E64612C617065782E7574696C2C617065782E6974656D2C617065782E726567696F6E293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(206764702935742597)
,p_plugin_id=>wwv_flow_api.id(1964743008618968609)
,p_file_name=>'js/aop_da.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
