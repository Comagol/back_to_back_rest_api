Thank you for downloading APEX Office Print!


Content of the zip file:
- /db: sql files to install the back-end database objects for the Oracle APEX plug-ins (run install.sql)
- /plugin: the APEX plug-ins for APEX Office Print (AOP)
- /app: the five sample applications
- /server: the server side component (** for on-premises packages only **)


Pre-requisites:
- Oracle Database 12.2 or above
- Oracle Application Express (APEX) 19.2 or above

(** for on-premises packages only **)
- Windows or Linux (Red Hat / Oracle 8 and higher and Ubuntu 18.04 and higher)
- Java 8 or higher installed 


Quick start guide (AOP Sample Apps):
- import the AOP Sample APEX applications which you find in the /app directory. You can import the ones you like and import them in any order.
- make sure you run the supporting objects, and all back-end database objects will be created for you


Quick start: using AOP in your application:
- Go to SQL Workshop > SQL Scripts and upload (and run) the files aop_db_pkg.sql and aop_modal_pkg.sql from the /db directory
  This will create the database objects used by the Oracle APEX plug-ins
- Go to App Builder > Your application > Shared Components > Plug-ins > Import
  Select the file process_type_plugin_be_apexrnd_aop.sql from the /apex_version_<your_version>/plugin directory (for the AOP Process type plug-in)
  Select the file dynamic_action_plugin_be_apexrnd_aop_da.sql from the /apex_version_<your_version>/plugin directory (for the AOP Dynamic Action type plug-in)
  Select the file dynamic_action_plugin_be_apexrnd_aop_convert_da.sql from the /apex_version_<your_version>/plugin directory (for the Convert Dynamic Action type plug-in)
  Select the file dynamic_action_plugin_be_apexrnd_aop_modal.sql from the /apex_version_<your_version>/plugin directory (for the Modal Dynamic Action type plug-in)
- On your Page, create a dynamic action; on click of a button for example and select the True Action: APEX Office Print (AOP) [Plug-in]


Upgrading the plug-in:
- Go to SQL Workshop > SQL Scripts and upload (and run) the files aop_db_pkg.sql and aop_modal_pkg.sql from the /db directory
  This will create the database objects used by the APEX plug-ins
- Go to App Builder > Your application > Shared Components > Plug-ins > Import
  Select the file process_type_plugin_be_apexrnd_aop.sql from the /apex_version_<your_version>/plugin directory (for the AOP Process type plug-in)
  Select the file dynamic_action_plugin_be_apexrnd_aop_da.sql from the /apex_version_<your_version>/plugin directory (for the AOP Dynamic Action type plug-in)
  Select the file dynamic_action_plugin_be_apexrnd_aop_convert_da.sql from the /apex_version_<your_version>/plugin directory (for the Convert Dynamic Action type plug-in)
  Select the file dynamic_action_plugin_be_apexrnd_aop_modal.sql from the /apex_version_<your_version>/plugin directory (for the Modal Dynamic Action type plug-in)


Change API Key:
- Note that by default the AOP Sample App will connect to our AOP Cloud
- To use our AOP Cloud, you need to enter your API key.
- You can obtain your API key by signing up or logging in at https://www.apexofficeprint.com
- Once you have your API key, update the API key in the AOP_CONFIG table or through the sample application


Install/Upgrade the AOP Server (** only for on-premises version **):
- Copy the server folder to your server
- Stop the previous version of AOP (in case of upgrade)
  Note: you can run the old and new AOP simultaneously but on different ports
- Start the AOP executable with -a to activate the license. This will generate a license file
- Start the AOP executable normally


Install Sample Applications:
- There are 5 AOP Sample Applications in the /app directory. You can import the ones you like and import them in any order.
  - Getting started (aop_app_getting_started.sql): Connecting to the AOP Server, using the APEX Plug-ins and PL/SQL API.
  - Integration with APEX Components (aop_app_apex_features_192.sql/aop_app_apex_features_232.sql): Showcasing AOP with native APEX Components, such as Classic Reports, Interactive Reports, Interactive Grids, and more (use the 232 version for the latest version of APEX, or 192 for any previous version of APEX).
  - AOP Modal Plug-in (aop_app_modal_down_subscr.sql): Download & Subscription Manager application showing how to use the AOP Modal plug-in, the management of custom templates, and report scheduling.
  - AOP Features (aop_app_aop_features.sql): Take a look at all the amazing things AOP can do.  Various Word, Excel, PowerPoint, HTML, and Text examples along with batch printing, PL/SQL API samples, and interfacing with external data sources.
  - PDF Features (aop_app_pdf_examples.sql): Examples of creating, editing, annotating, splitting, and merging PDFs. Plus filling and reading forms, security, signature capability, and more!
- make sure you run the supporting objects, and all back-end database objects will be created for you


Documentation:
- You find the latest documentation at https://www.apexofficeprint.com/docs/


Support:
- If you need any help with APEX Office Print, please use the AOP Support Portal (after logging in at apexofficeprint.com).


APEX Office Print is a commercial product of APEX R&D and United Codes - Copyright 2015-2024 - https://www.apexofficeprint.com
