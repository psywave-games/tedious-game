/// @description gj_result_data_field_num(string fieldname, real fieldnumber)
/// @function gj_result_data_field_num
/// @param string fieldname
/// @param  real fieldnumber
//Returns: string of the info in the field
//After calling gj_checkstatus(), you can use this to find a field other than the first in the result. For all possible fields, see the documentation.
return ds_map_find_value(gj_infomap,string(argument1)+argument0);


