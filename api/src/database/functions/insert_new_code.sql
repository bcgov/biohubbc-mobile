CREATE OR REPLACE FUNCTION codes.insert_new_code(
  p_code_header_id integer,
  p_code_name text,
  p_code_description text, 
  p_code_sort_order integer,
  p_valid_to timestamp without time zone,
  p_user_id integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
	declare new_code_id integer;
  declare current_ts timestamp without time zone;
begin
  --
  -- Update a code

  -- determine current timestamp
  current_ts = now();

  -- Insert a new record with the new values
  INSERT INTO codes.code(code_header_id, code_name, code_description, code_sort_order, valid_from, valid_to, created_at, updated_at, created_by_user_id, updated_by_user_id)
  VALUES( p_code_header_id, p_code_name, p_code_description, p_code_sort_order, current_ts, p_valid_to, current_ts, current_ts, p_user_id, p_user_id);
  return new_code_id;
end;$function$
;
