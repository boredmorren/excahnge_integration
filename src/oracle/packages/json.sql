create or replace package PARSE_JSON
as 
    procedure parser
    (
        cJSON   in clob
    );

end PARSE_JSON;