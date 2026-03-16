--as the always free oracle cloud doesn't support native compilation we won't do it
--feel free to do it manually in your environment, AOP will be a bit faster with native compilation
--ALTER SESSION SET PLSQL_CODE_TYPE='NATIVE';

ALTER PACKAGE aop_api25_pkg COMPILE;
ALTER PACKAGE aop_plsql25_pkg COMPILE;
