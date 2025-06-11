create or replace procedure GET_CURRENCY
as 
    l_http_request  utl_http.req;
    l_http_response utl_http.resp;
    l_text varchar2(32767);
begin
    l_http_request := utl_http.begin_request('127.0.0.1:5000/get_latest');

    l_http_response := utl_http.get_response(l_http_request);

    begin
        loop
            utl_http.read_text(l_http_response, l_text, 32766);
            dbms_output.put_line(l_text);
        end loop;
    exception 
        when utl_http.end_of_body then
            utl_http.end_response(l_http_response);
    end;

exception 
    when utl_http.end_of_body then
        utl_http.end_response(l_http_response);
        raise;
end;