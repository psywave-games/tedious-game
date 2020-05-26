//gj_result_data_count()
//Returns: number of recieved users, achievements, etc.
//After calling gj_checkstatus(), you can use this to find the number of users, achievements, etc. 
return ds_map_find_value(gj_infomap,"fieldnum")+1;


