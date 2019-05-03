PROCEDURE Test_openweathermap 
IS 
  v_json       CLOB; 
  v_json_query CLOB; 
  v_json_value CLOB; 
BEGIN 
    v_json := 
    bda.Return_web_page('api.openweathermap.org/data/2.5/weather?q=Guarda,pt' 
                        ||'&' 
                        ||'APPID=d103b 79e27bc64c2d4d6cc7c50c4b714'); 

    --dbms_output.put_line(v_json); 
    SELECT Json_query(v_json, '$.coord') 
    INTO   v_json_query 
    FROM   dual; 

    dbms_output.Put_line(v_json_query); 

    SELECT Json_value(v_json_query, '$.lon') 
    INTO   v_json_value 
    FROM   dual; 

    dbms_output.Put_line(v_json_value); 

    SELECT Json_value(v_json_query, '$.lon') 
    INTO   v_json_value 
    FROM   dual; 

    dbms_output.Put_line(v_json_value); 

    SELECT Json_query(v_json, '$.weather') 
    INTO   v_json_query 
    FROM   dual; 

    dbms_output.Put_line(v_json_query); 

    SELECT Json_value(v_json_query, '$.id') 
    INTO   v_json_value 
    FROM   dual; 

    dbms_output.Put_line(v_json_value); 
END test_openweathermap; 