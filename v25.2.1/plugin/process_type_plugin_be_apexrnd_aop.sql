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
--     PLUGIN: 379890939526789624
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     199076768067146
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/process_type/be_apexrnd_aop
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(379890939526789624)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'BE.APEXRND.AOP'
,p_display_name=>'UC - APEX Office Print (AOP) - Process'
,p_supported_ui_types=>'DESKTOP'
,p_api_version=>1
,p_execution_function=>'aop_api_pkg.f_process_aop'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) is created by United Codes to facilitate exporting data and printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel, PowerPoint) or HTML, Markdown, CSV, or Text. This plugin can only be'
||' used to print to AOP and is copyrighted by APEX R&D and United Codes. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!',
'',
'Note that your page attribute "Reload on Submit" need to be set to "Always" and NOT "Only for Success" to use the process type plugin in the After Processing section. If you want to keep "Only for Success", please specify the process before header or'
||' use the APEX Office Print (AOP) Dynamic Action plugin.'))
,p_version_identifier=>'25.2'
,p_about_url=>'https://www.apexofficeprint.com'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379891255590789626)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379891600144789626)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379892091511789627)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379892934505789628)
,p_plugin_attribute_id=>wwv_flow_api.id(379892091511789627)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379892459008789627)
,p_plugin_attribute_id=>wwv_flow_api.id(379892091511789627)
,p_display_sequence=>25
,p_display_value=>'AOP Cloud (Remote)'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is available in your dashboard at https://www.apexofficeprint.com. So note that with this option your data is sent to us.',
'This makes debugging your JSON easier, checking if it''s valid, and contacting us if you need support. This option only works when you use http(s)://api.apexofficeprint.com/in your AOP settings.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(382378631811502520)
,p_plugin_attribute_id=>wwv_flow_api.id(379892091511789627)
,p_display_sequence=>30
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set AOP debugging.<br/>',
'The application item needs to be called AOP_DEBUG and can have values: No, Yes (=Remote) or Local.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379893499254789628)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379893874713789628)
,p_plugin_attribute_id=>wwv_flow_api.id(379893499254789628)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379894360589789629)
,p_plugin_attribute_id=>wwv_flow_api.id(379893499254789628)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
,p_help_text=>'Specify the name of the custom converter defined at the AOP Server.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379894825935789629)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>5000
,p_prompt=>'Settings package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_examples=>'aop_settings_pkg'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'When you use a different AOP server in DEV, TEST, PROD it might be easier to define the package where the settings (e.g. AOP server) is defined.<br/>',
'This makes deployments seamless and you don''t need to update the plug-in component settings manually afterwards.<br/>',
'When a package is defined, we will always read those settings, regardless what is filled in above.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379895242801789629)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379895676143789630)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>9000
,p_prompt=>'Failover procedure'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379895242801789629)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'aop_sample_pkg.failover_procedure;'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Specify the procedure that should be called when the failover url is used.',
'The procedure can for example send an email to notify the primary AOP url is not used, but the fallback url.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379896064387789630)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(335654406378245772)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>4050
,p_prompt=>'Custom Converter'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379893499254789628)
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
 p_id=>wwv_flow_api.id(369587440570555037)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(369587941815557482)
,p_plugin_attribute_id=>wwv_flow_api.id(369587440570555037)
,p_display_sequence=>10
,p_display_value=>'Development'
,p_return_value=>'development'
,p_help_text=>'In development mode no credits are used.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(369588381899559278)
,p_plugin_attribute_id=>wwv_flow_api.id(369587440570555037)
,p_display_sequence=>20
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set the AOP mode.<br/>',
'The application item needs to be called AOP_MODE and can have values: development, production  or null (=production).'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379896497295789631)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>23
,p_prompt=>'Data Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379906446249789636)
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
'Here''s an example of a query in ORDS which contains a parameter too:',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379896834558789631)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>27
,p_prompt=>'Special'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SQL,PLSQL_SQL,IR'
,p_lov_type=>'STATIC'
,p_help_text=>'Specific features of APEX Office Print'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379897712750789631)
,p_plugin_attribute_id=>wwv_flow_api.id(379896834558789631)
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
 p_id=>wwv_flow_api.id(379898226645789632)
,p_plugin_attribute_id=>wwv_flow_api.id(379896834558789631)
,p_display_sequence=>20
,p_display_value=>'Report as Labels'
,p_return_value=>'REPORT_AS_LABELS'
,p_help_text=>'Check this box in case you want to use the Classic or Interactive Report data source but print them as Labels (using the Mailings feature in Word).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379898793264789632)
,p_plugin_attribute_id=>wwv_flow_api.id(379896834558789631)
,p_display_sequence=>30
,p_display_value=>'IR/IG: Show Filters on top'
,p_return_value=>'FILTERS_ON_TOP'
,p_help_text=>'When there''re filters applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379899281931789632)
,p_plugin_attribute_id=>wwv_flow_api.id(379896834558789631)
,p_display_sequence=>40
,p_display_value=>'IR/IG: Show Highlights on top'
,p_return_value=>'HIGHLIGHTS_ON_TOP'
,p_help_text=>'When there''re highlights applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379899711768789633)
,p_plugin_attribute_id=>wwv_flow_api.id(379896834558789631)
,p_display_sequence=>50
,p_display_value=>'IR/IG: Show header with filter (Excel)'
,p_return_value=>'HEADER_WITH_FILTER'
,p_help_text=>'When exporting the Interactive Report to Excel, show the header with filter option.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379900237359789633)
,p_plugin_attribute_id=>wwv_flow_api.id(379896834558789631)
,p_display_sequence=>60
,p_display_value=>'IR/IG: Use Saved Report instead of Report in Session'
,p_return_value=>'ALWAYS_REPORT_ALIAS'
,p_help_text=>'When defining the Interactive Report source ir1|my_saved_report, the "my_saved_report" will be used, even when the person is looking at a different report in his session session.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379897210127789631)
,p_plugin_attribute_id=>wwv_flow_api.id(379896834558789631)
,p_display_sequence=>70
,p_display_value=>'IR/IG: Repeat header on every page'
,p_return_value=>'repeat_header'
,p_help_text=>'When the table spans multiple pages, the header row will be repeated on every page.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379900765973789633)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Output Filename'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Static: my_file',
'</p>',
'<p>',
'APEX Item: &P1_FILENAME.',
'</p>'))
,p_help_text=>'The filename can be a hard coded string or reference an APEX item. It does not need to include the file extension. If a file extension is defined that is different the the output type selected, a new file extension will be appended to the filename.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379901110749789633)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379905999967789636)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>10
,p_display_value=>'Word (docx)'
,p_return_value=>'docx'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379903051965789635)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>20
,p_display_value=>'Excel (xlsx)'
,p_return_value=>'xlsx'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379903482224789635)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>30
,p_display_value=>'PowerPoint (pptx)'
,p_return_value=>'pptx'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379903990958789635)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>40
,p_display_value=>'PDF (pdf)'
,p_return_value=>'pdf'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379904951029789636)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>60
,p_display_value=>'HTML (html)'
,p_return_value=>'html'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379902577507789634)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>65
,p_display_value=>'Markdown (md)'
,p_return_value=>'md'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379902030755789634)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>66
,p_display_value=>'Text (txt)'
,p_return_value=>'txt'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379904406535789635)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>67
,p_display_value=>'Rich Text Format (rtf)'
,p_return_value=>'rtf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(358972445475484377)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>68
,p_display_value=>'CSV (csv)'
,p_return_value=>'csv'
,p_help_text=>'Comma separated values file. Text file containing information separated by commas.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379901599407789634)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>69
,p_display_value=>'One Page PDF (pdf)'
,p_return_value=>'onepagepdf'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(179683944005373412)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>70
,p_display_value=>'PDF Form Fields (pdf)'
,p_return_value=>'form_fields'
,p_help_text=>'Get the form fields defined on a PDF.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(91267603213506293)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>75
,p_display_value=>'PDF Attachments (pdf)'
,p_return_value=>'get_attachments'
,p_help_text=>'Retrieve attachments from a PDF'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(370152986187783144)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>80
,p_display_value=>'Word with macros (docm)'
,p_return_value=>'docm'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(370153372697784007)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>90
,p_display_value=>'Excel with macros (xlsm)'
,p_return_value=>'xlsm'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(370153713966785195)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>100
,p_display_value=>'PowerPoint with macros (pptm)'
,p_return_value=>'pptm'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(370154119219786031)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>110
,p_display_value=>'Calendar (ics)'
,p_return_value=>'ics'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(370154580138786781)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>120
,p_display_value=>'Calendar (ifb)'
,p_return_value=>'ifb'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17251519180665395)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>130
,p_display_value=>'Word (doc)'
,p_return_value=>'doc'
,p_help_text=>'Old Microsoft Word version'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17251914466666811)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>140
,p_display_value=>'Excel (xls)'
,p_return_value=>'xls'
,p_help_text=>'Old Microsoft Excel version'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(17252295571668521)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>150
,p_display_value=>'PowerPoint (ppt)'
,p_return_value=>'ppt'
,p_help_text=>'Old Microsoft PowerPoint version'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(182170750856420679)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>220
,p_display_value=>'OpenDocument Text (odt)'
,p_return_value=>'odt'
,p_help_text=>'OpenOffice Word'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(182171074381419702)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>230
,p_display_value=>'OpenDocument Spreadsheet (ods)'
,p_return_value=>'ods'
,p_help_text=>'OpenOffice Excel'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(182171480687418441)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>240
,p_display_value=>'OpenDocument Presentation (odp)'
,p_return_value=>'odp'
,p_help_text=>'OpenOffice Powerpoint'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(232678338950277360)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>250
,p_display_value=>'XML (xml)'
,p_return_value=>'XML'
,p_help_text=>'Extensible Markup Language is a markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(266458677357437913)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>260
,p_display_value=>'JSON (json)'
,p_return_value=>'json'
,p_help_text=>'JSON stands for JavaScript Object Notation. JSON is a lightweight data-interchange format.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379905466678789636)
,p_plugin_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_display_sequence=>900
,p_display_value=>'Defined by APEX Item'
,p_return_value=>'apex_item'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379906446249789636)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379906888436789637)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
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
 p_id=>wwv_flow_api.id(379907340682789637)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns as select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379907873883789637)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON as defined in the URL example above.',
'(see example in help of Data Source)'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379908356282789637)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
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
 p_id=>wwv_flow_api.id(379908863918789638)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_display_sequence=>40
,p_display_value=>'Classic and/or Interactive Report/Grid(s)'
,p_return_value=>'IR'
);
end;
/
begin
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(374318867281847669)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_display_sequence=>50
,p_display_value=>'XML (data part)'
,p_return_value=>'XML'
,p_help_text=>'Data in XML format. No need to specify files or filename.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(374319263900848485)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_display_sequence=>60
,p_display_value=>'JSON (data part)'
,p_return_value=>'JSON'
,p_help_text=>'Data in JSON format. No need to specify files or filename.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(375965368099855078)
,p_plugin_attribute_id=>wwv_flow_api.id(379906446249789636)
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
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379909340242789638)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
'Documentation is also added on the next page(s) that describe the functions AOP will understand.',
'</p>'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(374319948479853452)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>1
,p_display_value=>'AOP Report'
,p_return_value=>'AOP_REPORT'
,p_help_text=>'AOP will generate a report for you based on the Print Attributes specified in the given region (in case multiple regions are specified, the first region is used for the Print Attributes).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(218098385431790209)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>3
,p_display_value=>'APEX Report'
,p_return_value=>'APEX_REPORT'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(218098866963791679)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>4
,p_display_value=>'APEX Report (Data only)'
,p_return_value=>'APEX_REPORT_DO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Data only will remove highlights etc. and just export the data. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379910259107789639)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>5
,p_display_value=>'Static Application Files'
,p_return_value=>'APEX'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Application Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379910738789789639)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>7
,p_display_value=>'Static Workspace Files'
,p_return_value=>'WORKSPACE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Workspace Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379911219693789639)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Query that returns two columns: template_type and file (in this order) <br/>',
'- template_type: docx,xlsx,pptx <br/>',
'- file: blob column'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379909750955789638)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
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
 p_id=>wwv_flow_api.id(379911782074789639)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
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
 p_id=>wwv_flow_api.id(384448541918213670)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
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
 p_id=>wwv_flow_api.id(379912245746789640)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>30
,p_display_value=>'Filename (with path relative to AOP server)'
,p_return_value=>'FILENAME'
,p_help_text=>'Enter the path and filename of the template which is stored on the same server AOP is running at.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(375955450938570486)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
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
 p_id=>wwv_flow_api.id(379912745587789640)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>40
,p_display_value=>'URL (call from DB)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. http://apexofficeprint.com/templates/aop_template_d01.docx',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from the database, so the database server needs to have access to the url.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(369594865144661057)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>50
,p_display_value=>'URL (call from AOP)'
,p_return_value=>'URL_AOP'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. https://www.apexofficeprint.com/templates/aop_template_d01.docx',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from AOP, so the AOP server needs to have access to the url.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(179681563562422733)
,p_plugin_attribute_id=>wwv_flow_api.id(379909340242789638)
,p_display_sequence=>60
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_help_text=>'To only append or prepend files or to fill PDFs, set the template type to none.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379913270548789640)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>11
,p_prompt=>'Template Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379909340242789638)
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
'<p>The templates need to be of format: Word (docx), Excel (xlsx), Powerpoint (pptx), HTML (html) or Markdown (md).',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379913625594789640)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379901110749789633)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379914042745789641)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'Template Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379909340242789638)
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
 p_id=>wwv_flow_api.id(379914416237789641)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>13
,p_prompt=>'Template Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379909340242789638)
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
 p_id=>wwv_flow_api.id(379914852018789641)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>21
,p_prompt=>'Data Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>1
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><b>Cursor syntax:</b></p>',
'<p>List of all customers e.g. to send letter to all</p>',
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
'                              APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
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
 p_id=>wwv_flow_api.id(379915244887789642)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>22
,p_prompt=>'Data Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379906446249789636)
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
'                  APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
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
 p_id=>wwv_flow_api.id(379915689992789642)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>25
,p_prompt=>'Region Static Id(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379906446249789636)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Define one or more Static Id(s) of the report region. Static ids should be separated by a comma. e.g. ir1,ir2 <br/>',
'You can set the Static ID of the region in the region attributes.',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379916039193789642)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
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
 p_id=>wwv_flow_api.id(379917950040789643)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format. This option is useful in case you don''t need the file on your own harddrive, but for example you want to mail the document automatically.',
'In that case you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379916977879789643)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser (file)'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your harddrive.',
'An example is when you first want to store the generated document in a table before letting the browser to download it.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379917454075789643)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>30
,p_display_value=>'Inline Region (pdf/html/md only)'
,p_return_value=>'BROWSER_INLINE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(186250008255129288)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>35
,p_display_value=>'Procedure and Inline Region (pdf/html/md/txt only)'
,p_return_value=>'PROCEDURE_INLINE'
,p_help_text=>'This option allows you to call a procedure first and next show the output in a region. Add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(379916453388789642)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>40
,p_display_value=>'Directory (on AOP Server)'
,p_return_value=>'DIRECTORY'
,p_help_text=>'Save the file to a directory specified with g_output_directory. The default directory on the AOP Server is outputfiles.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(375954979539566617)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
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
 p_id=>wwv_flow_api.id(382148511639005540)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
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
 p_id=>wwv_flow_api.id(190628927594175704)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>60
,p_display_value=>'Defined in Post Process (e.g. Printer)'
,p_return_value=>'NA'
,p_help_text=>'Use when an external post-process command is specified and the output is only needed to be passed to that process. For example when you want to print directly to a Printer or call an OS command.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354800161227825203)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>70
,p_display_value=>'Asynchronous (Returns URL)'
,p_return_value=>'ASYNC'
,p_help_text=>'AOP will process the request asynchronously. This is especially useful for long-running processes. A URL will be passed to g_async_url where the file will be available to download when AOP is finished. Use the aop_api_pkg.poll_async_file procedure to'
||' check and download the file. Optionally a procedure can be defined (see definition in procedure help).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354800565477823471)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>80
,p_display_value=>'Web Service (POST Request)'
,p_return_value=>'WEB_SERVICE'
,p_help_text=>'AOP will call the web service (a POST Request) defined in g_web_service_url once AOP is finished producing the file. Extra headers can be added to the POST request by defining them in g_web_service_headers e.g. {"file_id": "F123", "access_token": "A4'
||'56789"}'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354800877423821710)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>90
,p_display_value=>'APEX Office Edit (AOE)'
,p_return_value=>'APEX_OFFICE_EDIT'
,p_help_text=>'This option allows you to call a procedure first and next show the output in APEX Office Edit (AOE), the editor that can show and edit Word, Excel, PowerPoint, PDF, and Text straight from the browser.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(87268065499051356)
,p_plugin_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_display_sequence=>100
,p_display_value=>'PDF Region Pro'
,p_return_value=>'PDF_REGION_PRO'
,p_help_text=>'This option allows you to call a procedure first and next show the output in the Plug-ins Pro PDF Region Pro, the PDF Viewer that show and edit a PDF from the browser.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(379918411094789644)
,p_plugin_id=>wwv_flow_api.id(379890939526789624)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(379916039193789642)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PROCEDURE,PROCEDURE_BROWSER,PROCEDURE_INLINE,ASYNC'
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
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter only the procedure name in this field (so without parameters) for example "download_prc".',
'The procedure in the database needs to be structured with the parameters as in the example. ',
'The procedure name can be any name, but the parameters need to match exactly as in the example.',
'You can add other parameters with a default value. ',
'You can reference page items in the procedure by using the v() function.'))
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
