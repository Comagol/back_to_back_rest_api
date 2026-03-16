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
--   Date and Time:   09:24 Wednesday December 17, 2025
--   Exported By:     SUNIL
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 2226913700991115594
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     199076768067146
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/be_apexrnd_aop_convert_da
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(2226913700991115594)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.APEXRND.AOP_CONVERT_DA'
,p_display_name=>'UC - APEX Office Print (AOP) - Convert DA'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#js/es6-promise.min.js',
'#PLUGIN_FILES#js/aop_da.min.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#css/spinkit.min.css',
'#PLUGIN_FILES#css/spinkit-aop.min.css',
'#PLUGIN_FILES#css/aop.min.css'))
,p_api_version=>1
,p_render_function=>'aop_convert_pkg.f_render_aop'
,p_ajax_function=>'aop_convert_pkg.f_ajax_aop'
,p_standard_attributes=>'ITEM:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT:INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) is created by United Codes to facilitate exporting data and printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel, PowerPoint) or HTML, Markdown, CSV, or Text. This plugin can only be'
||' used to print to AOP and is copyrighted by APEX R&D and United Codes. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!'))
,p_version_identifier=>'25.2'
,p_about_url=>'https://www.apexofficeprint.com'
,p_files_version=>243
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2226930209236461490)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(2113746992674496783)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(1813560926083974943)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(1559809571788001516)
,p_plugin_attribute_id=>wwv_flow_api.id(1813560926083974943)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1813568392756976333)
,p_plugin_attribute_id=>wwv_flow_api.id(1813560926083974943)
,p_display_sequence=>25
,p_display_value=>'AOP Cloud (Remote)'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is available in your dashboard at https://www.apexofficeprint.com. So note that with this option your data is sent to us.',
'This makes debugging your JSON easier, checking if it''s valid, and contacting us if you need support. This option only works when you use http(s)://api.apexofficeprint.com/in your AOP settings.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(171730874589246286)
,p_plugin_attribute_id=>wwv_flow_api.id(1813560926083974943)
,p_display_sequence=>30
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set AOP debugging.<br/>',
'The application item needs to be called AOP_DEBUG and can have values: No, Yes (=Remote) or Local.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1816448312449158750)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(1816470746115185798)
,p_plugin_attribute_id=>wwv_flow_api.id(1816448312449158750)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1816471195276188977)
,p_plugin_attribute_id=>wwv_flow_api.id(1816448312449158750)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
,p_help_text=>'Specify the name of the custom converter defined at the AOP Server.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1006037001307953903)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(1055274164297571614)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(1081531764774597260)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>9000
,p_prompt=>'Failover procedure'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1055274164297571614)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'aop_sample_pkg.failover_procedure;'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Specify the procedure that should be called when the failover url is used.',
'The procedure can for example send an email to notify the primary AOP url is not used, but the fallback url.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(920705178784045037)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
'  p_data_type             in varchar2,',
'  p_data_source           in clob,',
'  p_template_type         in varchar2,',
'  p_template_source       in clob,',
'  p_output_type           in varchar2,',
'  p_output_filename       in varchar2,',
'  p_output_type_item_name in varchar2,',
'  p_output_to             in varchar2,',
'  p_procedure             in varchar2,',
'  p_binds                 in varchar2,',
'  p_special               in varchar2,',
'  p_aop_remote_debug      in varchar2,',
'  p_output_converter      in varchar2,',
'  p_aop_url               in varchar2,',
'  p_api_key               in varchar2,',
'  p_app_id                in number,',
'  p_page_id               in number,',
'  p_user_name             in varchar2,',
'  p_init_code             in clob,',
'  p_output_encoding       in varchar2,',
'  p_failover_aop_url      in varchar2,',
'  p_failover_procedure    in varchar2',
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
 p_id=>wwv_flow_api.id(479835321216112418)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>4050
,p_prompt=>'Custom Converter'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(1816448312449158750)
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
 p_id=>wwv_flow_api.id(369379607253596645)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(369380052284597443)
,p_plugin_attribute_id=>wwv_flow_api.id(369379607253596645)
,p_display_sequence=>10
,p_display_value=>'Development'
,p_return_value=>'development'
,p_help_text=>'In development mode no credits are used.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(369380502386599006)
,p_plugin_attribute_id=>wwv_flow_api.id(369379607253596645)
,p_display_sequence=>20
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set the AOP mode.<br/>',
'The application item needs to be called AOP_MODE and can have values: development, production  or null (=production).'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(1556442640728276144)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Init PL/SQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'aop_api_pkg.g_output_filename      := ''output'';',
'aop_api_pkg.g_output_filename      := v(''P1_FILENAME'');',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'You can define global variables of the aop_api_pkg in this area.<br/>',
'</p>',
'Available variables:',
'<pre>',
'-- Global variables',
'g_output_filename         varchar2(100) := null;',
'g_language                varchar2(2)   := ''en'';  -- Language can be: en, fr, nl, de',
'</pre>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2226955415859451162)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>31
,p_prompt=>'Output Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'pdf'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2226957603782456835)
,p_plugin_attribute_id=>wwv_flow_api.id(2226955415859451162)
,p_display_sequence=>40
,p_display_value=>'PDF (pdf)'
,p_return_value=>'pdf'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2227086418600384894)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2226955415859451162)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2055094851980608102)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'SQL Query'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>3
,p_sql_max_column_count=>7
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select filename, mime_type, [file_blob, file_base64, url_call_from_db, url_call_from_aop, file_on_aop_server]',
'  from my_table',
' where instr()',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Enter the SQL statement in following format. At least 3 columns are necessary up to a maximum of 7.',
'<br/>The columns between [] are optional.',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2021614123480930026)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
 p_id=>wwv_flow_api.id(2021619246580931450)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format. This option is useful in case you don''t need the file on your own harddrive, but for example you want to mail the document automatically.',
'In that case you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(2021619609770933000)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser (file)'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your harddrive.',
'An example is when you first want to store the generated document in a table before letting the browser to download it.'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1221009799655472968)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>30
,p_display_value=>'Inline Region (pdf/html/md/txt only)'
,p_return_value=>'BROWSER_INLINE'
,p_help_text=>'add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(1082931170065595546)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>40
,p_display_value=>'Directory (on AOP Server)'
,p_return_value=>'DIRECTORY'
,p_help_text=>'Save the file to a directory specified with g_output_directory. The default directory on the AOP Server is outputfiles.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(375746148142577915)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>50
,p_display_value=>'Directory (on Database Server)'
,p_return_value=>'DB_DIRECTORY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the file to a database directory specified with g_output_directory. ',
'<br/>',
'Example how to create Database directory: <br/>',
'CREATE DIRECTORY AOP_TEMPLATE AS ''/home/oracle/aop_output'';'))
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354801529026810364)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>60
,p_display_value=>'Defined in Post Process (e.g. Printer)'
,p_return_value=>'NA'
,p_help_text=>'Use when an external post-process command is specified and the output is only needed to be passed to that process. For example when you want to print directly to a Printer or call an OS command.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354801938832808803)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>70
,p_display_value=>'Asynchronous (Returns URL)'
,p_return_value=>'ASYNC'
,p_help_text=>'AOP will process the request asynchronously. This is especially useful for long-running processes. A URL will be passed to g_async_url where the file will be available to download when AOP is finished. Use the aop_api_pkg.poll_async_file procedure to'
||' check and download the file. Optionally a procedure can be defined (see definition in procedure help).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354802279864807040)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>80
,p_display_value=>'Web Service (POST Request)'
,p_return_value=>'WEB_SERVICE'
,p_help_text=>'AOP will call the web service (a POST Request) defined in g_web_service_url once AOP is finished producing the file. Extra headers can be added to the POST request by defining them in g_web_service_headers e.g. {"file_id": "F123", "access_token": "A4'
||'56789"}'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(354802725124802752)
,p_plugin_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_display_sequence=>90
,p_display_value=>'APEX Office Edit (AOE)'
,p_return_value=>'APEX_OFFICE_EDIT'
,p_help_text=>'This option allows you to call a procedure first and next show the output in APEX Office Edit (AOE), the editor that can show and edit Word, Excel, PowerPoint, PDF, and Text straight from the browser.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(2021620004291964331)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(2021614123480930026)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PROCEDURE,PROCEDURE_BROWSER,PROCEDURE_INLINE,ASYNC'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Create following procedure in the database:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob      in blob,',
'    p_output_filename  in varchar2,',
'    p_output_mime_type in varchar2)',
'is',
'  l_id number;',
'begin',
'  l_id := apex_mail.send( ',
'            p_to => ''support@apexofficeprint.com'', ',
'            p_from => ''support@apexofficeprint.com'', ',
'            p_subj => ''Mail from APEX with attachment'', ',
'            p_body => ''Please review the attachment.'', ',
'            p_body_html => ''<b>Please</b> review the attachment.'') ;',
'  apex_mail.add_attachment( ',
'      p_mail_id    => l_id, ',
'      p_attachment => p_output_blob, ',
'      p_filename   => p_output_filename, ',
'      p_mime_type  => p_output_mime_type) ;',
'  commit;    ',
'end send_email_prc;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter only the procedure name in this field (so without parameters) for example "download_prc".',
'The procedure in the database needs to be structured with the parameters as in the example. ',
'The procedure name can be any name, but the parameters need to match exactly as in the example.',
'You can add other parameters with a default value.'))
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(1084425372000920817)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
,p_depending_on_has_to_exist=>true
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.spinner,',
'  spinnerIcon: ''bounce''',
'};<br>',
'AOP.gAOPOptions.showNotification = false;<br>',
'AOP.gAOPOptions.notificatonMessage = ''An AOP error occurred'';'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'<br><br>'))
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1358909978162658308)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_name=>'aop-file-error'
,p_display_name=>'AOP Print File Error'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1358910448647658308)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_name=>'aop-file-progress'
,p_display_name=>'AOP Print File Progress'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(1358910823228658308)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_name=>'aop-file-success'
,p_display_name=>'AOP Print File Success'
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
 p_id=>wwv_flow_api.id(369170596469252467)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_file_name=>'js/es6-promise.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '48544D4C43616E766173456C656D656E742E70726F746F747970652E676574436F6E746578743D66756E6374696F6E2865297B72657475726E2066756E6374696F6E28742C69297B72657475726E22776562676C223D3D3D74262628693D4F626A656374';
wwv_flow_api.g_varchar2_table(2) := '2E61737369676E287B7D2C692C7B707265736572766544726177696E674275666665723A21307D29292C652E63616C6C28746869732C742C69297D7D2848544D4C43616E766173456C656D656E742E70726F746F747970652E676574436F6E7465787429';
wwv_flow_api.g_varchar2_table(3) := '2C77696E646F772E414F503D77696E646F772E414F507C7C7B7D2C66756E6374696F6E28652C742C692C612C6F2C732C6E2C722C642C6C297B2275736520737472696374223B652E67414F504F7074696F6E733D7B616A61784964656E7469666965723A';
wwv_flow_api.g_varchar2_table(4) := '22222C74726967676572456C656D49643A22222C737461746963526567696F6E4964733A22222C6F7574707574546F3A22222C64614E616D653A22222C776169745370696E6E65723A22222C70726F63657373696E67496E64696361746F723A7B7D2C70';
wwv_flow_api.g_varchar2_table(5) := '726F63657373696E67547970653A7B7370696E6E65723A227370696E6E6572222C6F7665726C61793A226F7665726C6179222C627574746F6E3A22627574746F6E227D2C7370696E6E657249636F6E3A7B617065783A2241504558227D2C73686F774E6F';
wwv_flow_api.g_varchar2_table(6) := '74696669636174696F6E3A21302C6E6F746966696361746F6E4D6573736167653A22222C7375626D69744974656D7341727261793A5B5D2C7375626D697456616C75657341727261793A5B5D2C4947526567696F6E496473416E6453656C656374656450';
wwv_flow_api.g_varchar2_table(7) := '4B3A7B7D2C6630313A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630323A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D';
wwv_flow_api.g_varchar2_table(8) := '617857696474683A302C6D61784865696768743A307D2C6630333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630343A7B6461746141727261793A5B5D2C';
wwv_flow_api.g_varchar2_table(9) := '77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C';
wwv_flow_api.g_varchar2_table(10) := '6630363A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630373A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D6178576964';
wwv_flow_api.g_varchar2_table(11) := '74683A302C6D61784865696768743A307D2C6630383A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630393A7B6461746141727261793A5B5D2C7769647468';
wwv_flow_api.g_varchar2_table(12) := '3A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631303A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631313A7B';
wwv_flow_api.g_varchar2_table(13) := '6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631323A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C';
wwv_flow_api.g_varchar2_table(14) := '6D61784865696768743A307D2C6631333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631343A7B6461746141727261793A5B5D2C77696474683A302C6865';
wwv_flow_api.g_varchar2_table(15) := '696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D7D2C652E67657442726F77';
wwv_flow_api.g_varchar2_table(16) := '7365724E616D653D28293D3E7B76617220652C742C693D6E6176696761746F722E757365724167656E742C613D6E6176696761746F722E6170704E616D653B72657475726E2D31213D28743D692E696E6465784F6628224F706572612229293F613D226F';
wwv_flow_api.g_varchar2_table(17) := '70657261223A2D31213D28743D692E696E6465784F6628224D5349452229297C7C2D31213D28743D692E696E6465784F66282254726964656E742229293F613D226965223A2D31213D28743D692E696E6465784F662822456467652229293F613D226564';
wwv_flow_api.g_varchar2_table(18) := '6765223A2D31213D28743D692E696E6465784F6628224368726F6D652229293F613D226368726F6D65223A2D31213D28743D692E696E6465784F6628225361666172692229293F613D22736166617269223A2D31213D28743D692E696E6465784F662822';
wwv_flow_api.g_varchar2_table(19) := '46697265666F782229293F613D2266697265666F78223A28653D692E6C617374496E6465784F6628222022292B31293C28743D692E6C617374496E6465784F6628222F222929262628613D692E737562737472696E6728652C7429292E746F4C6F776572';
wwv_flow_api.g_varchar2_table(20) := '4361736528293D3D612E746F5570706572436173652829262628613D6E6176696761746F722E6170704E616D65292C617D2C652E73686F774572726F724D6573736167653D653D3E7B7472797B732E636C6561724572726F727328292C732E73686F7745';
wwv_flow_api.g_varchar2_table(21) := '72726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A2270616765222C6D6573736167653A652C756E736166653A21317D5D297D63617463682865297B612E696E666F2822414F502073686F774572726F724D657373616765222C65';
wwv_flow_api.g_varchar2_table(22) := '297D7D2C652E73686F77537563636573734D6573736167653D653D3E7B7472797B732E73686F7750616765537563636573732865297D63617463682865297B612E696E666F2822414F502073686F77537563636573734D657373616765222C65297D7D2C';
wwv_flow_api.g_varchar2_table(23) := '652E73686F774E6F74696669636174696F6E3D28742C69293D3E7B696628652E67414F504F7074696F6E732E73686F774E6F74696669636174696F6E297B76617220613D652E67414F504F7074696F6E732E6E6F746966696361746F6E4D657373616765';
wwv_flow_api.g_varchar2_table(24) := '7C7C693B2273756363657373223D3D743F652E73686F77537563636573734D6573736167652861293A226572726F72223D3D742626652E73686F774572726F724D6573736167652861297D7D3B636F6E737420633D28652C742C69293D3E7B636F6E7374';
wwv_flow_api.g_varchar2_table(25) := '20613D722E68746D6C4275696C64657228293B73776974636828612E6D61726B757028273C64697620636C6173733D22616F702D50726F63657373696E67223E27292C65297B636173652274687265652D626F756E6365223A6361736522666C6F77223A';
wwv_flow_api.g_varchar2_table(26) := '612E6D61726B757028273C64697620636C6173733D22736B2D666C6F7720736B2D63656E746572223E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F64';
wwv_flow_api.g_varchar2_table(27) := '69763E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522726F746174696E672D706C616E65223A6361736522706C616E65223A612E6D61726B757028273C64697620636C61';
wwv_flow_api.g_varchar2_table(28) := '73733D22736B2D706C616E6520736B2D63656E746572223E3C2F6469763E27293B627265616B3B6361736522666164696E672D636972636C65223A6361736522636972636C652D66616465223A612E6D61726B757028273C64697620636C6173733D2273';
wwv_flow_api.g_varchar2_table(29) := '6B2D636972636C652D6661646520736B2D63656E746572223E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F646976';
wwv_flow_api.g_varchar2_table(30) := '3E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D66';
wwv_flow_api.g_varchar2_table(31) := '6164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173';
wwv_flow_api.g_varchar2_table(32) := '733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C';
wwv_flow_api.g_varchar2_table(33) := '2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B63617365';
wwv_flow_api.g_varchar2_table(34) := '22666F6C64696E672D63756265223A6361736522666F6C64223A612E6D61726B757028273C64697620636C6173733D22736B2D666F6C6420736B2D63656E746572223E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C';
wwv_flow_api.g_varchar2_table(35) := '64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C2F646976';
wwv_flow_api.g_varchar2_table(36) := '3E27293B627265616B3B6361736522646F75626C652D626F756E6365223A6361736522626F756E6365223A612E6D61726B757028273C64697620636C6173733D22736B2D626F756E636520736B2D63656E746572223E3C64697620636C6173733D22736B';
wwv_flow_api.g_varchar2_table(37) := '2D626F756E63652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D626F756E63652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652277617665223A612E6D61726B757028273C64697620636C6173733D22';
wwv_flow_api.g_varchar2_table(38) := '736B2D7761766520736B2D63656E746572223E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D7761';
wwv_flow_api.g_varchar2_table(39) := '76652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652277';
wwv_flow_api.g_varchar2_table(40) := '616E646572696E672D6375626573223A636173652277616E646572223A612E6D61726B757028273C64697620636C6173733D22736B2D77616E64657220736B2D63656E746572223E3C64697620636C6173733D22736B2D77616E6465722D63756265223E';
wwv_flow_api.g_varchar2_table(41) := '3C2F6469763E3C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652270756C736522';
wwv_flow_api.g_varchar2_table(42) := '3A612E6D61726B757028273C64697620636C6173733D22736B2D70756C736520736B2D63656E746572223E3C2F6469763E27293B627265616B3B636173652263686173696E672D646F7473223A63617365226368617365223A612E6D61726B757028273C';
wwv_flow_api.g_varchar2_table(43) := '64697620636C6173733D22736B2D636861736520736B2D63656E746572223E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620';
wwv_flow_api.g_varchar2_table(44) := '636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173';
wwv_flow_api.g_varchar2_table(45) := '733D22736B2D63686173652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522636972636C65223A612E6D61726B757028273C64697620636C6173733D22736B2D636972636C6520736B2D63656E746572223E3C6469762063';
wwv_flow_api.g_varchar2_table(46) := '6C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C';
wwv_flow_api.g_varchar2_table(47) := '6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C61';
wwv_flow_api.g_varchar2_table(48) := '73733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173';
wwv_flow_api.g_varchar2_table(49) := '733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C2F6469763E27293B62';
wwv_flow_api.g_varchar2_table(50) := '7265616B3B6361736522637562652D67726964223A636173652267726964223A612E6D61726B757028273C64697620636C6173733D22736B2D6772696420736B2D63656E746572223E3C64697620636C6173733D22736B2D677269642D63756265223E3C';
wwv_flow_api.g_varchar2_table(51) := '2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F646976';
wwv_flow_api.g_varchar2_table(52) := '3E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C6469';
wwv_flow_api.g_varchar2_table(53) := '7620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C2F6469763E27293B627265616B3B64656661756C743A612E6D61726B757028223C7370616E22';
wwv_flow_api.g_varchar2_table(54) := '292E617474722822636C617373222C22752D50726F63657373696E67222B28743F2220222B743A222229292E617474722822726F6C65222C22616C65727422292E6D61726B757028223E22292E6D61726B757028223C7370616E22292E61747472282263';
wwv_flow_api.g_varchar2_table(55) := '6C617373222C22752D50726F63657373696E672D7370696E6E657222292E6D61726B757028223E22292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D56697375616C6C79';
wwv_flow_api.g_varchar2_table(56) := '48696464656E22292E6D61726B757028223E22292E636F6E74656E742869292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C2F7370616E3E22297D72657475726E20612E6D61726B757028223C2F6469763E22292C612E746F5374';
wwv_flow_api.g_varchar2_table(57) := '72696E6728297D2C673D28652C61293D3E7B636F6E7374206F3D692877696E646F77293B6C657420732C6E2C722C642C6C2C672C703D692E657874656E64287B616C6572743A742E6765744D6573736167652822415045582E50524F43455353494E4722';
wwv_flow_api.g_varchar2_table(58) := '292C7370696E6E6572436C6173733A22227D2C61292C753D65262621702E66697865643F22737472696E67223D3D747970656F6620653F6928646F63756D656E74292E66696E642865293A692865293A692822626F647922292C763D752E6F6666736574';
wwv_flow_api.g_varchar2_table(59) := '28292C683D7B746F703A6F2E7363726F6C6C546F7028292C6C6566743A6F2E7363726F6C6C4C65667428297D3B72657475726E20733D69286328702E7370696E6E657249636F6E2C702E7370696E6E6572436C6173732C702E616C65727429292C732E61';
wwv_flow_api.g_varchar2_table(60) := '7070656E64546F2875292C702E66697865643F28723D286F2E68656967687428292D732E6865696768742829292F322C6E3D286F2E776964746828292D732E77696474682829292F322C732E637373287B706F736974696F6E3A226669786564222C746F';
wwv_flow_api.g_varchar2_table(61) := '703A722B227078222C6C6566743A6E2B227078227D29293A28682E626F74746F6D3D682E746F702B6F2E68656967687428292C682E72696768743D682E6C6566742B6F2E776964746828292C762E626F74746F6D3D762E746F702B752E6F757465724865';
wwv_flow_api.g_varchar2_table(62) := '6967687428292C762E72696768743D762E6C6566742B752E6F75746572576964746828292C723D762E746F703E682E746F703F762E746F703A682E746F702C643D762E626F74746F6D3C682E626F74746F6D3F762E626F74746F6D3A682E626F74746F6D';
wwv_flow_api.g_varchar2_table(63) := '2C6C3D28642D72292F322C673D682E746F702D762E746F702C673E302626286C2B3D67292C732E706F736974696F6E287B6D793A2263656E746572222C61743A226C6566742B35302520746F702B222B6C2B227078222C6F663A752C636F6C6C6973696F';
wwv_flow_api.g_varchar2_table(64) := '6E3A22666974227D29292C732E617474722822646174612D68746D6C3263616E7661732D69676E6F7265222C227472756522292C737D3B652E73686F775370696E6E65723D28612C6F293D3E7B6C657420732C6E2C723B72657475726E206F2E74797065';
wwv_flow_api.g_varchar2_table(65) := '3D3D3D652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E65723F28733D6728612C6F292C7B72656D6F76653A66756E6374696F6E28297B732E72656D6F766528297D7D293A6F2E747970653D3D3D652E67414F504F70';
wwv_flow_api.g_varchar2_table(66) := '74696F6E732E70726F63657373696E67547970652E6F7665726C61793F28733D6728612C6F292C6E3D2828293D3E7B6C657420653B72657475726E20653D6928273C6469762069643D22617065785F776169745F6F7665726C61792220636C6173733D22';
wwv_flow_api.g_varchar2_table(67) := '617065785F776169745F6F7665726C617920616F705F776169745F6F7665726C6179223E3C2F6469763E27292E617070656E64546F2822626F647922292C652E617474722822646174612D68746D6C3263616E7661732D69676E6F7265222C2274727565';
wwv_flow_api.g_varchar2_table(68) := '22292C657D2928292C7B72656D6F76653A66756E6374696F6E28297B6E2E72656D6F766528292C732E72656D6F766528297D7D293A6F2E747970653D3D3D652E67414F504F7074696F6E732E70726F63657373696E67547970652E627574746F6E3F2872';
wwv_flow_api.g_varchar2_table(69) := '3D28653D3E7B6C657420612C6F3D692E657874656E64287B616C6572743A742E6765744D6573736167652822415045582E50524F43455353494E4722292C7370696E6E6572436C6173733A22227D2C65292C733D652E627574746F6E2C6E3D2273747269';
wwv_flow_api.g_varchar2_table(70) := '6E67223D3D747970656F6620733F6928646F63756D656E74292E66696E64282223222B73293A692873293B72657475726E206E2E616464436C6173732822617065782D64697361626C656422292E70726F70282264697361626C6564222C2130292E6669';
wwv_flow_api.g_varchar2_table(71) := '6E642822203E202A22292E616464436C6173732822752D68696464656E22292C613D692863286F2E7370696E6E657249636F6E2C6F2E7370696E6E6572436C6173732C6F2E616C65727429292C612E617070656E64546F286E292C6E7D29286F292C7B72';
wwv_flow_api.g_varchar2_table(72) := '656D6F76653A66756E6374696F6E28297B722E72656D6F7665436C6173732822617065782D64697361626C656422292E70726F70282264697361626C6564222C2131292C722E66696E642822203E202A22292E72656D6F7665436C6173732822752D6869';
wwv_flow_api.g_varchar2_table(73) := '6464656E22292C722E66696E6428222E616F702D50726F63657373696E6722292E72656D6F766528297D7D293A766F696420307D2C652E6173796E634C6F6F703D28652C742C69293D3E7B76617220613D302C6F3D21312C733D7B6E6578743A66756E63';
wwv_flow_api.g_varchar2_table(74) := '74696F6E28297B6F7C7C28613C3D653F28612B2B2C74287329293A286F3D21302C69282929297D2C697465726174696F6E3A66756E6374696F6E28297B72657475726E20612D317D2C627265616B3A66756E6374696F6E28297B6F3D21302C6928297D7D';
wwv_flow_api.g_varchar2_table(75) := '3B72657475726E20732E6E65787428292C737D2C652E6275696C6441666665637465644974656D41727261793D653D3E7B612E696E666F2822414F5020704166666563746564456C656D656E7473222C65293B76617220743D5B5D3B72657475726E2065';
wwv_flow_api.g_varchar2_table(76) := '262628743D652E7265706C616365282F5C732F672C2222292E73706C697428222C2229292C747D2C652E6275696C6441666665637465644974656D56616C756541727261793D653D3E7B612E696E666F2822414F50206275696C64416666656374656449';
wwv_flow_api.g_varchar2_table(77) := '74656D56616C75654172726179222C65293B76617220743D5B5D2C693D5B5D3B69662865297B743D652E7265706C616365282F5C732F672C2222292E73706C697428222C22293B666F7228766172206F3D303B6F3C742E6C656E6774683B6F2B2B29692E';
wwv_flow_api.g_varchar2_table(78) := '7075736828247628745B6F5D29297D72657475726E20697D2C652E737667456E68616E63653D28742C6F293D3E7B7472797B612E696E666F2822414F5020737667456E68616E6365222C74293B76617220733D692874292E66696E64282273766722292C';
wwv_flow_api.g_varchar2_table(79) := '6E3D303B612E696E666F2822414F5020737667456E68616E6365222C6E2C732E6C656E677468293B76617220723D66756E6374696F6E28297B6E2B2B2C612E696E666F2822414F5020737667456E68616E636520737667446F6E65222C6E2C732E6C656E';
wwv_flow_api.g_varchar2_table(80) := '677468292C6E3D3D732E6C656E677468262628612E696E666F2822414F5020737667456E68616E636520737667446F6E652063616C6C6261636B22292C6F2829297D3B732E65616368282866756E6374696F6E28297B612E696E666F2822414F50207376';
wwv_flow_api.g_varchar2_table(81) := '67456E68616E636520222C74686973293B76617220743D746869732C6F3D692874292E696E6E6572576964746828292C733D692874292E696E6E657248656967687428293B692874292E6174747228227769647468222C6F292C692874292E6174747228';
wwv_flow_api.g_varchar2_table(82) := '22686569676874222C73292C692874292E617474722822786D6C6E73222C22687474703A2F2F7777772E77332E6F72672F323030302F73766722292C692874292E617474722822786D6C6E733A786C696E6B222C22687474703A2F2F7777772E77332E6F';
wwv_flow_api.g_varchar2_table(83) := '72672F313939392F786C696E6B22293B666F7228766172206E3D742E676574456C656D656E747342795461674E616D652822696D61676522292C643D302C6C3D303B6C3C6E2E6C656E6774683B6C2B2B292166756E6374696F6E28297B76617220743D6E';
wwv_flow_api.g_varchar2_table(84) := '5B6C5D3B652E67657442617365363446726F6D55524C28652E6765744162736F6C75746555726C28742E67657441747472696275746528226872656622297C7C742E6765744174747269627574652822786C696E6B3A687265662229292C2866756E6374';
wwv_flow_api.g_varchar2_table(85) := '696F6E2865297B742E7365744174747269627574652822786C696E6B3A68726566222C65292C742E736574417474726962757465282268726566222C65292C612E696E666F2822414F5020446174612052657475726E65643A222C65292C612E696E666F';
wwv_flow_api.g_varchar2_table(86) := '2822414F5020737667456E68616E636520696D616765446F6E65222C642C6E2E6C656E677468292C2B2B643E3D6E2E6C656E677468262628612E696E666F2822414F5020737667456E68616E636520696D616765446F6E652063616C6C696E6720737667';
wwv_flow_api.g_varchar2_table(87) := '446F6E65222C642C6E2E6C656E677468292C722829297D29297D28293B303D3D3D6E2E6C656E67746826267228297D29292C303D3D3D732E6C656E67746826266F28297D63617463682865297B612E696E666F2822414F5020737667456E68616E636520';
wwv_flow_api.g_varchar2_table(88) := '636175676874206572726F72222C65292C6F28297D7D2C652E63616E76617332446174615552493D28652C74293D3E652E746F4461746155524C2874292C652E64617461555249326261736536343D653D3E652E73756273747228652E696E6465784F66';
wwv_flow_api.g_varchar2_table(89) := '28222C22292B31292C652E636C6F623241727261793D28652C742C69293D3E7B666F722876617220613D4D6174682E666C6F6F7228652E6C656E6774682F74292B312C6F3D303B6F3C613B6F2B2B29692E7075736828652E736C69636528742A6F2C742A';
wwv_flow_api.g_varchar2_table(90) := '286F2B312929293B72657475726E20697D2C652E676574496D6167654261736536343D28742C6F293D3E7B76617220732C6E3D692874292C723D6E2E696E6E6572576964746828292C643D6E2E696E6E657248656967687428293B696628733D612E6765';
wwv_flow_api.g_varchar2_table(91) := '744C6576656C28293E302C22636C69656E745F63616E766173223D3D3D6E5B305D2E6765744174747269627574652822616F702D726567696F6E2D6173222929612E696E666F2822414F5020676574496D6167654261736536342063616C6C696E672074';
wwv_flow_api.g_varchar2_table(92) := '68652063616E7661732067657420696D616765206F7074696F6E20776974682073656C6563746F72222B742B222063616E766173222C6928742B222063616E76617322295B305D2E746F4461746155524C2829292C6F286928742B222063616E76617322';
wwv_flow_api.g_varchar2_table(93) := '295B305D2E746F4461746155524C28292E73706C697428223B6261736536342C22295B315D293B656C73657B612E696E666F2822414F5020676574496D6167654261736536342068746D6C3263616E76617320776974682073656C6563746F72222B742B';
wwv_flow_api.g_varchar2_table(94) := '222022293B766172206C3D6E657720446174653B652E737667456E68616E636528742C2866756E6374696F6E28297B68746D6C3263616E766173286E5B305D2C7B6261636B67726F756E64436F6C6F723A2223666666222C77696474683A722C68656967';
wwv_flow_api.g_varchar2_table(95) := '68743A642C616C6C6F775461696E743A21312C6C6F6767696E673A732C757365434F52533A21307D292E7468656E282866756E6374696F6E2869297B76617220733D652E63616E766173324461746155524928692C22696D6167652F706E6722292C6E3D';
wwv_flow_api.g_varchar2_table(96) := '652E64617461555249326261736536342873293B612E696E666F2822414F5020676574496D6167654261736536342068746D6C3263616E76617320776974682073656C6563746F72222B742B2220746F6F6B20222B286E657720446174652D6C292F3165';
wwv_flow_api.g_varchar2_table(97) := '332B22207322292C6F286E297D29297D29297D7D2C652E676574496D61676542617365363441727261793D28742C692C61293D3E7B652E676574496D61676542617365363428742C2866756E6374696F6E2874297B693D652E636C6F6232417272617928';
wwv_flow_api.g_varchar2_table(98) := '742C3365342C69292C612869297D29297D2C652E626173653634746F426C6F623D28652C74293D3E7B666F722876617220693D61746F622865292C613D742C6F3D6E657720417272617942756666657228692E6C656E677468292C733D6E65772055696E';
wwv_flow_api.g_varchar2_table(99) := '74384172726179286F292C6E3D303B6E3C692E6C656E6774683B6E2B2B29735B6E5D3D692E63686172436F64654174286E293B7472797B72657475726E206E657720426C6F62285B6F5D2C7B747970653A617D297D63617463682865297B76617220723D';
wwv_flow_api.g_varchar2_table(100) := '6E65772877696E646F772E5765624B6974426C6F624275696C6465727C7C77696E646F772E4D6F7A426C6F624275696C6465727C7C77696E646F772E4D53426C6F624275696C646572293B72657475726E20722E617070656E64286F292C722E67657442';
wwv_flow_api.g_varchar2_table(101) := '6C6F622861297D7D2C652E646F776E6C6F61644261736536343D28742C6F2C73293D3E7B612E696E666F2822414F5020646F776E6C6F61644261736536342064617461222C74293B766172206E3D652E67657442726F777365724E616D6528293B696628';
wwv_flow_api.g_varchar2_table(102) := '226965223D3D6E7C7C2265646765223D3D6E297B76617220723D652E626173653634746F426C6F6228742C6F293B77696E646F772E6E6176696761746F722E6D7353617665426C6F6228722C73297D656C73657B76617220643D22646174613A222B6F2B';
wwv_flow_api.g_varchar2_table(103) := '223B6261736536342C222B743B612E696E666F2822414F50204D696D6554797065222C6F293B766172206C3D646F63756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E617070656E644368696C64286C29';
wwv_flow_api.g_varchar2_table(104) := '2C6C2E7374796C653D22646973706C61793A206E6F6E65222C6C2E7461726765743D225F626C616E6B222C6C2E636C6173734E616D653D22616F705F6C696E6B222C6C2E687265663D642C226368726F6D6522213D6E26262273616661726922213D6E7C';
wwv_flow_api.g_varchar2_table(105) := '7C286C2E687265663D55524C2E6372656174654F626A65637455524C28652E626173653634746F426C6F6228742C6F2929292C6C2E646F776E6C6F61643D732C6C2E636C69636B28292C692822612E616F705F6C696E6B22292E72656D6F766528297D7D';
wwv_flow_api.g_varchar2_table(106) := '2C652E6765744162736F6C75746555726C3D28293D3E7B76617220653B72657475726E2066756E6374696F6E2874297B72657475726E28653D657C7C646F63756D656E742E637265617465456C656D656E742822612229292E687265663D742C652E636C';
wwv_flow_api.g_varchar2_table(107) := '6F6E654E6F6465282131292E687265667D7D2C652E67657442617365363446726F6D55524C3D28652C74293D3E7B612E696E666F2822414F502067657442617365363446726F6D55524C222C65293B76617220693D6E657720584D4C4874747052657175';
wwv_flow_api.g_varchar2_table(108) := '6573743B692E6F70656E2822474554222C652C2130292C692E726573706F6E7365547970653D226172726179627566666572222C692E6F6E6C6F61643D66756E6374696F6E2865297B76617220693D6E65772055696E7438417272617928746869732E72';
wwv_flow_api.g_varchar2_table(109) := '6573706F6E7365292C613D537472696E672E66726F6D43686172436F64652E6170706C79286E756C6C2C69292C6F3D62746F612861293B742822646174613A696D6167652F706E673B6261736536342C222B6F297D2C692E73656E6428297D2C652E696E';
wwv_flow_api.g_varchar2_table(110) := '6C696E654261736536343D28742C612C6F293D3E7B76617220733D652E67414F504F7074696F6E732E64614E616D652C6E3D6928275B646174612D616F702D696E6C696E652D7064663D22272B732B27225D27292C723D6E2E617474722822696422297C';
wwv_flow_api.g_varchar2_table(111) := '7C22616F70223B6966286E2E68746D6C282222292E616464436C6173732822616F702D496E6C696E655072657669657722292C226965223D3D3D652E67657442726F777365724E616D6528292972657475726E20652E646F776E6C6F6164426173653634';
wwv_flow_api.g_varchar2_table(112) := '28742C612C6F293B76617220643D652E626173653634746F426C6F6228742C61293B642E6E616D653D6F3B766172206C3D55524C2E6372656174654F626A65637455524C2864293B6C657420633D6928273C627574746F6E20747970653D22627574746F';
wwv_flow_api.g_varchar2_table(113) := '6E22207469746C653D22446F776E6C6F61642220617269612D6C6162656C3D22446F776E6C6F61642220636C6173733D22616F702D496E6C696E65507265766965772D2D646F776E6C6F6164427574746F6E20742D427574746F6E20742D427574746F6E';
wwv_flow_api.g_varchar2_table(114) := '2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E223E3C7370616E20617269612D68696464656E3D22747275652220636C6173733D22742D49636F6E2066612066612D646F776E6C6F6164223E3C2F7370616E3E3C2F627574746F6E3E27293B';
wwv_flow_api.g_varchar2_table(115) := '632E616464436C6173732822616F702D496E6C696E65507265766965772D2D646F776E6C6F6164427574746F6E22292C6E2E617070656E642863293B632E636C69636B282866756E6374696F6E28297B2828652C74293D3E7B636F6E737420693D646F63';
wwv_flow_api.g_varchar2_table(116) := '756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E617070656E644368696C642869292C692E687265663D652C692E646F776E6C6F61643D742C692E636C69636B28292C646F63756D656E742E626F64792E';
wwv_flow_api.g_varchar2_table(117) := '72656D6F76654368696C642869297D29286C2C6F297D29293B76617220673D6928273C696672616D652069643D22696E6C696E655F7064665F6F626A6563745F272B722B2722207372633D2222207469746C653D22272B6F2B27222077696474683D2231';
wwv_flow_api.g_varchar2_table(118) := '30302522206865696768743D22313030252220747970653D22272B612B27223E3C2F6F626A6563743E27293B6E2E617070656E642867292C672E617474722822737263222C6C297D2C652E696E6C696E65546578743D28742C612C6F293D3E7B76617220';
wwv_flow_api.g_varchar2_table(119) := '733D652E6236344465636F6465556E69636F64652874293B6C44614E616D653D652E67414F504F7074696F6E732E64614E616D652C6928275B646174612D616F702D696E6C696E652D7478743D22272B6C44614E616D652B27225D27292E76616C287329';
wwv_flow_api.g_varchar2_table(120) := '7D2C652E6236344465636F6465556E69636F64653D653D3E6465636F6465555249436F6D706F6E656E742841727261792E70726F746F747970652E6D61702E63616C6C2861746F622865292C2866756E6374696F6E2865297B72657475726E2225222B28';
wwv_flow_api.g_varchar2_table(121) := '223030222B652E63686172436F646541742830292E746F537472696E6728313629292E736C696365282D32297D29292E6A6F696E28222229292C652E676574496E646976696475616C496D61676555706C6F61644172726179733D28742C6F2C73293D3E';
wwv_flow_api.g_varchar2_table(122) := '7B7472797B766172206E3D742B312C723D2266222B286E3E3D31303F6E2E746F537472696E6728293A2230222B6E2E746F537472696E672829293B696628612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172';
wwv_flow_api.g_varchar2_table(123) := '7261797320636865636B696E6720666F722074797065206F6620726567696F6E20776974682073656C6563746F7220222B6F292C766F696420303D3D3D69286F295B305D2972657475726E20612E696E666F2822414F5020676574496E64697669647561';
wwv_flow_api.g_varchar2_table(124) := '6C496D61676555706C6F616441727261797320726567696F6E206E6F7420666F756E642069676E6F72696E672C20222B6F292C766F6964207328293B73776974636828612E696E666F2822414F5020676574496E646976696475616C496D61676555706C';
wwv_flow_api.g_varchar2_table(125) := '6F61644172726179732020222B69286F295B305D2E6765744174747269627574652822616F702D726567696F6E2D617322292C69286F295B305D292C69286F295B305D2E6765744174747269627574652822616F702D726567696F6E2D61732229297B63';
wwv_flow_api.g_varchar2_table(126) := '617365227365727665725F68746D6C223A6361736522636C69656E745F68746D6C223A612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C20666F756E642070617373696E6720697420';
wwv_flow_api.g_varchar2_table(127) := '61732069742069732E222C6F293B7472797B612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C2069733A222C69286F2B22202E742D526567696F6E2D626F647922295B305D2E696E6E';
wwv_flow_api.g_varchar2_table(128) := '657248544D4C292C652E636C6F623241727261792869286F2B22202E742D526567696F6E2D626F647922295B305D2E696E6E657248544D4C2C3365332C652E67414F504F7074696F6E735B725D2E646174614172726179297D63617463682874297B612E';
wwv_flow_api.g_varchar2_table(129) := '696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C2069733A222C69286F295B305D2E696E6E657248544D4C292C652E636C6F623241727261792869286F295B305D2E696E6E657248544D4C';
wwv_flow_api.g_varchar2_table(130) := '2C3365332C652E67414F504F7074696F6E735B725D2E646174614172726179297D7328293B627265616B3B6361736522636C69656E745F737667223A652E737667456E68616E6365286F2C2866756E6374696F6E28297B612E696E666F2822414F502067';
wwv_flow_api.g_varchar2_table(131) := '6574496E646976696475616C496D61676555706C6F616441727261797320737667206265696E672073656E74222C286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E672869286F2B222073766722295B305D2929';
wwv_flow_api.g_varchar2_table(132) := '2C652E636C6F6232417272617928286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E672869286F2B222073766722295B305D292C3365332C652E67414F504F7074696F6E735B725D2E646174614172726179292C';
wwv_flow_api.g_varchar2_table(133) := '652E67414F504F7074696F6E735B725D2E77696474683D69286F292E646174612822616F702D776964746822297C7C69286F292E696E6E6572576964746828292C652E67414F504F7074696F6E735B725D2E6865696768743D69286F292E646174612822';
wwv_flow_api.g_varchar2_table(134) := '616F702D68656967687422297C7C69286F292E696E6E657248656967687428292C652E67414F504F7074696F6E735B725D2E6D617857696474683D69286F292E646174612822616F702D6D61782D776964746822297C7C652E67414F504F7074696F6E73';
wwv_flow_api.g_varchar2_table(135) := '5B725D2E77696474682C652E67414F504F7074696F6E735B725D2E6D61784865696768743D69286F292E646174612822616F702D6D61782D68656967687422297C7C652E67414F504F7074696F6E735B725D2E6865696768742C7328297D29293B627265';
wwv_flow_api.g_varchar2_table(136) := '616B3B64656661756C743A652E676574496D6167654261736536344172726179286F2C652E67414F504F7074696F6E735B725D2E6461746141727261792C2866756E6374696F6E2874297B612E696E666F2822414F5020676574496E646976696475616C';
wwv_flow_api.g_varchar2_table(137) := '496D61676555706C6F61644172726179732073657474696E6720646174614172726179222C74292C652E67414F504F7074696F6E735B725D2E6461746141727261793D742C652E67414F504F7074696F6E735B725D2E77696474683D69286F292E646174';
wwv_flow_api.g_varchar2_table(138) := '612822616F702D776964746822297C7C69286F292E696E6E6572576964746828292C652E67414F504F7074696F6E735B725D2E6865696768743D69286F292E646174612822616F702D68656967687422297C7C69286F292E696E6E657248656967687428';
wwv_flow_api.g_varchar2_table(139) := '292C652E67414F504F7074696F6E735B725D2E6D617857696474683D69286F292E646174612822616F702D6D61782D776964746822297C7C652E67414F504F7074696F6E735B725D2E77696474682C652E67414F504F7074696F6E735B725D2E6D617848';
wwv_flow_api.g_varchar2_table(140) := '65696768743D69286F292E646174612822616F702D6D61782D68656967687422297C7C652E67414F504F7074696F6E735B725D2E6865696768742C612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179';
wwv_flow_api.g_varchar2_table(141) := '732063616C6C696E67206E65787420737465702061667465722067657474696E6720696D616765206461746122292C7328297D29297D7D63617463682865297B612E696E666F2822414F5020457863657074696F6E3A222C65292C7328297D7D2C652E67';
wwv_flow_api.g_varchar2_table(142) := '6574416C6C496D61676555706C6F61644172726179733D28742C69293D3E7B612E696E666F2822414F5020676574416C6C496D61676555706C6F6164417261797320526567696F6E204944204172726179222C74293B766172206F3B6F3D742E6C656E67';
wwv_flow_api.g_varchar2_table(143) := '74683E31353F31353A742E6C656E6774682C612E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204172726179204C656E677468222C6F293B666F722876617220733D302C6E3D66756E6374696F6E';
wwv_flow_api.g_varchar2_table(144) := '28297B2B2B733D3D6F26266928297D2C723D303B723C6F3B722B2B29612E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204172726179204C6F6F7020697465726174696F6E222C72292C745B725D';
wwv_flow_api.g_varchar2_table(145) := '2626652E676574496E646976696475616C496D61676555706C6F616441727261797328722C2223222B745B725D2C6E297D2C652E646F776E6C6F6164414F5046696C653D743D3E7B612E696E666F2822414F5020646F776E6C6F6164414F5046696C6520';
wwv_flow_api.g_varchar2_table(146) := '414F502E67414F504F7074696F6E73222C652E67414F504F7074696F6E73293B666F722876617220733D5B5D2C6E3D5B5D2C723D5B5D2C633D5B5D2C673D7B705F7769646765745F616374696F6E3A22414F50222C705F726571756573743A22504C5547';
wwv_flow_api.g_varchar2_table(147) := '494E3D222B652E67414F504F7074696F6E732E616A61784964656E7469666965722C705F666C6F775F69643A2476282270466C6F77496422292C705F666C6F775F737465705F69643A2476282270466C6F7753746570496422292C705F696E7374616E63';
wwv_flow_api.g_varchar2_table(148) := '653A2476282270496E7374616E636522292C705F64656275673A2476282270646562756722292C705F6172675F6E616D65733A652E67414F504F7074696F6E732E7375626D69744974656D7341727261792C705F6172675F76616C7565733A652E67414F';
wwv_flow_api.g_varchar2_table(149) := '504F7074696F6E732E7375626D697456616C75657341727261792C7830313A652E67414F504F7074696F6E732E737461746963526567696F6E4964732C7830323A652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C65637465';
wwv_flow_api.g_varchar2_table(150) := '64504B7D2C703D313B703C3D31353B702B2B297B76617220753D2266222B28703E3D31303F702E746F537472696E6728293A2230222B702E746F537472696E672829293B732E7075736828652E67414F504F7074696F6E735B755D2E7769647468292C6E';
wwv_flow_api.g_varchar2_table(151) := '2E7075736828652E67414F504F7074696F6E735B755D2E686569676874292C722E7075736828652E67414F504F7074696F6E735B755D2E6D61785769647468292C632E7075736828652E67414F504F7074696F6E735B755D2E6D6178486569676874292C';
wwv_flow_api.g_varchar2_table(152) := '675B755D3D652E67414F504F7074696F6E735B755D2E6461746141727261797D672E6631363D732C672E6631373D6E2C672E6631383D722C672E6631393D632C692E616A6178287B64617461547970653A2274657874222C747970653A22504F5354222C';
wwv_flow_api.g_varchar2_table(153) := '75726C3A77696E646F772E6C6F636174696F6E2E687265662E73756273747228302C77696E646F772E6C6F636174696F6E2E687265662E696E6465784F6628222F663F703D22292B31292B227777765F666C6F772E73686F77222C6173796E633A21302C';
wwv_flow_api.g_varchar2_table(154) := '747261646974696F6E616C3A21302C646174613A672C737563636573733A66756E6374696F6E28732C6E2C72297B76617220633B7472797B633D6A51756572792E70617273654A534F4E2873297D63617463682865297B612E6C6F672822414F5020646F';
wwv_flow_api.g_varchar2_table(155) := '776E6C6F6164414F5046696C6520526573706F6E73652050617273654572726F72222C65293B76617220673D6928223C6469763E3C2F6469763E22293B672E68746D6C2873293B76617220703D6928222E742D416C6572742D626F6479206833222C6729';
wwv_flow_api.g_varchar2_table(156) := '2E7465787428293B22223D3D28703D28703D702E7265706C616365282F222F672C275C5C222729292E7265706C616365282F5C6E2F672C2220222929262628703D22414F5020414A41582043616C6C6261636B2069737375652E22292C633D6A51756572';
wwv_flow_api.g_varchar2_table(157) := '792E70617273654A534F4E28277B2022737461747573223A20226572726F72222C20226D657373616765223A2022526573706F6E73652050617273654572726F72222C2022636F6465223A2022414A41582043616C6C6261636B20287044617461292050';
wwv_flow_api.g_varchar2_table(158) := '617273654572726F72222C20226E6F74696669636174696F6E223A22272B702B2722207D27297D696628226572726F72223D3D632E73746174757329612E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C632E6D657373';
wwv_flow_api.g_varchar2_table(159) := '6167652C632E636F6465292C6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F72222C63292C652E73686F774E6F74696669636174696F6E28226572726F72222C632E6E';
wwv_flow_api.g_varchar2_table(160) := '6F74696669636174696F6E292C7428293B656C7365206966282273756363657373223D3D632E737461747573297B696628612E6C6F672822414F5020646F776E6C6F6164414F5046696C65205375636365737322292C6F2E7472696767657228652E6741';
wwv_flow_api.g_varchar2_table(161) := '4F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D73756363657373222C63292C612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520446F776E6C6F6164696E672066696C6522292C224449524543544F';
wwv_flow_api.g_varchar2_table(162) := '5259223D3D652E67414F504F7074696F6E732E6F7574707574546F262622746578742F706C61696E223D3D632E6D696D657479706529612E6C6F672822414F503A204F757470757420746F206469726563746F727922292C652E73686F774E6F74696669';
wwv_flow_api.g_varchar2_table(163) := '636174696F6E282273756363657373222C632E64617461293B656C7365206966282242524F57534552223D3D652E67414F504F7074696F6E732E6F7574707574546F7C7C2250524F4345445552455F42524F57534552223D3D652E67414F504F7074696F';
wwv_flow_api.g_varchar2_table(164) := '6E732E6F7574707574546F7C7C224449524543544F5259223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520646F776E6C6F616442617365363422292C652E646F776E6C';
wwv_flow_api.g_varchar2_table(165) := '6F616442617365363428632E646174612C632E6D696D65747970652C632E66696C656E616D65293B656C7365206966282242524F575345525F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C226170706C6963617469';
wwv_flow_api.g_varchar2_table(166) := '6F6E2F70646622213D632E6D696D6574797065262622746578742F68746D6C22213D632E6D696D6574797065296966282242524F575345525F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B';
wwv_flow_api.g_varchar2_table(167) := '646F776E22213D632E6D696D6574797065262622746578742F706C61696E22213D632E6D696D6574797065262622746578742F63737622213D632E6D696D6574797065296966282250524F4345445552455F494E4C494E4522213D652E67414F504F7074';
wwv_flow_api.g_varchar2_table(168) := '696F6E732E6F7574707574546F7C7C226170706C69636174696F6E2F70646622213D632E6D696D6574797065262622746578742F68746D6C22213D632E6D696D6574797065296966282250524F4345445552455F494E4C494E4522213D652E67414F504F';
wwv_flow_api.g_varchar2_table(169) := '7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B646F776E22213D632E6D696D6574797065262622746578742F706C61696E22213D632E6D696D6574797065262622746578742F63737622213D632E6D696D6574797065296966282243';
wwv_flow_api.g_varchar2_table(170) := '4C4F5544223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F503A204F757470757420746F20636C6F756422292C652E73686F774E6F74696669636174696F6E282273756363657373222C22446F63756D656E742073';
wwv_flow_api.g_varchar2_table(171) := '6176656420746F20636C6F75642E22293B656C736520696628224153594E43223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F503A204F757470757420746F204173796E6368726F6E6F757322292C652E73686F77';
wwv_flow_api.g_varchar2_table(172) := '4E6F74696669636174696F6E282273756363657373222C22446F63756D656E742077696C6C20626520726561647920666F7220646F776E6C6F616420736F6F6E2E22293B656C736520696628225745425F53455256494345223D3D652E67414F504F7074';
wwv_flow_api.g_varchar2_table(173) := '696F6E732E6F7574707574546F29612E6C6F672822414F503A204F757470757420746F20576562205365727669636522292C652E73686F774E6F74696669636174696F6E282273756363657373222C22446F63756D656E742077696C6C2062652073656E';
wwv_flow_api.g_varchar2_table(174) := '7420746F20746865205765622053657276696365206F6E63652072656164792E22293B656C73652069662822415045585F4F46464943455F45444954223D3D652E67414F504F7074696F6E732E6F7574707574546F297B612E6C6F672822414F503A204F';
wwv_flow_api.g_varchar2_table(175) := '757470757420746F2041504558204F6666696365204564697422292C612E6C6F672822414F503A20726567696F6E3A20222B632E726567696F6E292C612E6C6F672822414F503A206974656D733A20222B632E6974656D73293B666F722876617220753D';
wwv_flow_api.g_varchar2_table(176) := '303B753C632E6974656D732E6C656E6774683B752B2B296428632E6974656D735B755D2E6974656D292E73657456616C756528632E6974656D735B755D2E76616C7565293B6C28632E726567696F6E292E7265667265736828297D656C736520612E6C6F';
wwv_flow_api.g_varchar2_table(177) := '672822414F503A204E6F20737570706F72746564206F7574707574206D6574686F6422293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C652E696E6C696E655465787428632E646174';
wwv_flow_api.g_varchar2_table(178) := '612C632E6D696D65747970652C632E66696C656E616D65293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C652E696E6C696E6542617365363428632E646174612C632E6D696D65';
wwv_flow_api.g_varchar2_table(179) := '747970652C632E66696C656E616D65293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C652E696E6C696E655465787428632E646174612C632E6D696D65747970652C632E66696C656E';
wwv_flow_api.g_varchar2_table(180) := '616D65293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C652E696E6C696E6542617365363428632E646174612C632E6D696D65747970652C632E66696C656E616D65293B742863';
wwv_flow_api.g_varchar2_table(181) := '297D7D2C6572726F723A66756E6374696F6E28692C73297B612E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C73292C6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22';
wwv_flow_api.g_varchar2_table(182) := '616F702D66696C652D6572726F72222C73292C652E73686F774E6F74696669636174696F6E28226572726F72222C73292C7428297D2C7868723A66756E6374696F6E28297B76617220743D692E616A617853657474696E67732E78687228293B72657475';
wwv_flow_api.g_varchar2_table(183) := '726E20742E75706C6F61643F742E75706C6F61642E6164644576656E744C697374656E6572282270726F6772657373222C2866756E6374696F6E2874297B696628742E6C656E677468436F6D70757461626C65297B76617220693D742E6C6F616465642F';
wwv_flow_api.g_varchar2_table(184) := '742E746F74616C2A3130303B6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D70726F6772657373222C69297D7D292C2131293A612E6C6F672822414F5020646F776E6C6F616441';
wwv_flow_api.g_varchar2_table(185) := '4F5046696C6520584852222C2250726F6772657373206973206E6F7420737570706F727465642062792042726F777365722E22292C747D7D297D2C652E63616C6C414F503D66756E6374696F6E28297B7472797B50726F6D6973657C7C2850726F6D6973';
wwv_flow_api.g_varchar2_table(186) := '653D45533650726F6D697365297D63617463682865297B50726F6D6973653D45533650726F6D6973657D76617220742C733D746869732C723D732E616374696F6E2E616A61784964656E7469666965722C643D732E616374696F6E2E6174747269627574';
wwv_flow_api.g_varchar2_table(187) := '6530312C633D732E616374696F6E2E61747472696275746530352C673D732E616374696F6E2E61747472696275746531322C703D732E616374696F6E2E61747472696275746531332C753D732E616374696F6E2E61747472696275746531342C763D732E';
wwv_flow_api.g_varchar2_table(188) := '74726967676572696E67456C656D656E743B743D692876292E697328225B69645D22293F2223222B692876292E617474722822696422293A22626F6479223B76617220683D5B5D3B70262628683D702E73706C697428222C2229293B76617220663D5B5D';
wwv_flow_api.g_varchar2_table(189) := '3B67262628663D672E73706C697428222C2229292C652E67414F504F7074696F6E732E616A61784964656E7469666965723D722C652E67414F504F7074696F6E732E74726967676572456C656D49643D742C652E67414F504F7074696F6E732E73746174';
wwv_flow_api.g_varchar2_table(190) := '6963526567696F6E4964733D702C652E67414F504F7074696F6E732E64614E616D653D642C652E67414F504F7074696F6E732E6F7574707574546F3D752C224954454D223D3D732E616374696F6E2E6166666563746564456C656D656E74735479706526';
wwv_flow_api.g_varchar2_table(191) := '2628652E67414F504F7074696F6E732E7375626D69744974656D7341727261793D652E6275696C6441666665637465644974656D417272617928732E616374696F6E2E6166666563746564456C656D656E7473292C652E67414F504F7074696F6E732E73';
wwv_flow_api.g_varchar2_table(192) := '75626D697456616C75657341727261793D652E6275696C6441666665637465644974656D56616C7565417272617928732E616374696F6E2E6166666563746564456C656D656E747329293B666F7228766172204F3D313B4F3C3D31353B4F2B2B297B7661';
wwv_flow_api.g_varchar2_table(193) := '7220413D2266222B284F3E3D31303F4F2E746F537472696E6728293A2230222B4F2E746F537472696E672829293B652E67414F504F7074696F6E735B415D2E6461746141727261793D5B5D2C652E67414F504F7074696F6E735B415D2E77696474683D30';
wwv_flow_api.g_varchar2_table(194) := '2C652E67414F504F7074696F6E735B415D2E6865696768743D302C652E67414F504F7074696F6E735B415D2E6D617857696474683D302C652E67414F504F7074696F6E735B415D2E6D61784865696768743D307D6C6574206D3B612E696E666F2822414F';
wwv_flow_api.g_varchar2_table(195) := '502076416A61784964656E746966696572222C72292C612E696E666F2822414F50207654726967676572456C656D4964222C74292C612E696E666F2822414F50207644614E616D65222C64292C612E696E666F2822414F5020764461746154797065222C';
wwv_flow_api.g_varchar2_table(196) := '63292C612E696E666F2822414F502076526567696F6E496473222C70292C612E696E666F2822414F5020764F7574707574546F222C75292C612E696E666F2822414F5020414F502E67414F504F7074696F6E73222C652E67414F504F7074696F6E73292C';
wwv_flow_api.g_varchar2_table(197) := '652E67414F504F7074696F6E732E776169745370696E6E65722E6C656E6774683E303F28612E7761726E2822414F5020596F75277265207573696E672061206C6567616379207370696E6E6572206F7074696F6E2E20506C656173652075706461746520';
wwv_flow_api.g_varchar2_table(198) := '796F757220636F646520746F2075736520746865206E65772070726F63657373696E67496E64696361746F72206174747269627574652E22292C6D3D7B747970653A652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E';
wwv_flow_api.g_varchar2_table(199) := '65722C7370696E6E657249636F6E3A652E67414F504F7074696F6E732E776169745370696E6E65727D293A6D3D692E657874656E64287B747970653A652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E65722C737069';
wwv_flow_api.g_varchar2_table(200) := '6E6E657249636F6E3A2241504558227D2C652E67414F504F7074696F6E732E70726F63657373696E67496E64696361746F72293B6C657420503D652E73686F775370696E6E657228692822626F647922292C6D293B7472797B612E696E666F2822414F50';
wwv_flow_api.g_varchar2_table(201) := '206C4947526567696F6E4964733A222C66292C652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B3D7B7D2C662E666F7245616368282866756E6374696F6E2874297B7472797B76617220693D6C2874292E77';
wwv_flow_api.g_varchar2_table(202) := '696467657428292C6F3D692E696E7465726163746976654772696428226765745669657773222C226772696422292C733D692E696E7465726163746976654772696428226765745669657773222C226772696422292E6D6F64656C2C6E3D5B5D3B6F2E67';
wwv_flow_api.g_varchar2_table(203) := '657453656C65637465645265636F72647328292E666F7245616368282866756E6374696F6E2865297B6E2E7075736828732E5F6765745072696D6172794B65792865295B305D297D29292C652E67414F504F7074696F6E732E4947526567696F6E496473';
wwv_flow_api.g_varchar2_table(204) := '416E6453656C6563746564504B5B745D3D6E2C612E696E666F2822414F5020494720526567696F6E2053656C656374696F6E3A222C742C6E297D63617463682865297B7D7D29292C652E67414F504F7074696F6E732E4947526567696F6E496473416E64';
wwv_flow_api.g_varchar2_table(205) := '53656C6563746564504B3D4A534F4E2E737472696E6769667928652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B292C612E696E666F2822414F50204947526567696F6E496473416E6453656C6563746564';
wwv_flow_api.g_varchar2_table(206) := '504B3A222C652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B292C224952223D3D632626703F28612E696E666F2822414F502047657474696E6720746865206461746120666F722076526567696F6E496473';
wwv_flow_api.g_varchar2_table(207) := '222C70292C652E676574416C6C496D61676555706C6F616441727261797328682C2866756E6374696F6E28297B652E646F776E6C6F6164414F5046696C65282866756E6374696F6E28297B502E72656D6F766528292C6E2E726573756D6528732E726573';
wwv_flow_api.g_varchar2_table(208) := '756D6543616C6C6261636B2C2131297D29297D2929293A652E646F776E6C6F6164414F5046696C65282866756E6374696F6E28297B502E72656D6F766528292C6E2E726573756D6528732E726573756D6543616C6C6261636B2C2131297D29297D636174';
wwv_flow_api.g_varchar2_table(209) := '63682874297B6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F7222292C502E72656D6F766528292C6E2E726573756D6528732E726573756D6543616C6C6261636B2C21';
wwv_flow_api.g_varchar2_table(210) := '31297D7D7D28414F502C617065782E6C616E672C617065782E6A51756572792C617065782E64656275672C617065782E6576656E742C617065782E6D6573736167652C617065782E64612C617065782E7574696C2C617065782E6974656D2C617065782E';
wwv_flow_api.g_varchar2_table(211) := '726567696F6E293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(411730947562332785)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_file_name=>'js/aop_da.min.js'
,p_mime_type=>'application/javascript'
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
 p_id=>wwv_flow_api.id(411731387807333929)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_file_name=>'css/spinkit-aop.min.css'
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
 p_id=>wwv_flow_api.id(411731700114333931)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
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
wwv_flow_api.g_varchar2_table(2) := '7D2E616F702D496E6C696E65507265766965777B646973706C61793A666C65783B666C65782D646972656374696F6E3A636F6C756D6E7D2E616F702D496E6C696E6550726576696577202E616F702D496E6C696E65507265766965772D2D646F776E6C6F';
wwv_flow_api.g_varchar2_table(3) := '6164427574746F6E7B6D617267696E2D626F74746F6D3A3870783B616C69676E2D73656C663A666C65782D656E647D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(412049218254331170)
,p_plugin_id=>wwv_flow_api.id(2226913700991115594)
,p_file_name=>'css/aop.min.css'
,p_mime_type=>'text/css'
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
