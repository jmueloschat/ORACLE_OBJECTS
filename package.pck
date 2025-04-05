create or replace package PKGEMP001 is

  -- Author  : JULIANO.MUELOSCHAT
  -- Created : 05/04/2025 20:03:21
  -- Purpose : --general employee
  
  function FNC_CALC_TAXSAL(p_idEmployee integer) return float;

end PKGEMP001;
/
create or replace package body PKGEMP001 is

  function FNC_CALC_TAXSAL(p_idEmployee integer) return float is
    v_Employee Employee%rowtype;
    v_result float;
  begin
    v_result := 0.0;
    
    begin
      select * into v_Employee from Employee where id = p_idEmployee;
    exception
      when no_data_found then
        raise_application_error(-20050,'Employee id '||p_idEmployee||' not found');
      when others then
        raise;    
    end; 
    
    if v_Employee.Salary is null
    or  v_Employee.Salary <= 0 then
      raise_application_error(-20050,'Employee id '||p_idEmployee||' invalid salary');  
    end if;  
    
    case
      when v_Employee.Salary < 1000 then
        v_result := v_Employee.Salary * 0.10;
      when v_Employee.Salary < 2000 then
        v_result := v_Employee.Salary * 0.15;    
     else 
        v_result := v_Employee.Salary * 0.22;    
    end case;
              
    return v_result;
  end;
      
end PKGEMP001;
/
