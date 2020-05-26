//gj_user_autologin()
//returns: boolean
//Returns boolean: if user logged in
//New way of doing this
if(parameter_count()>=2)
{
    var gj_loop,parameterstring;
    if(os_browser!=browser_not_a_browser)
    {
        for(gj_loop=1;gj_loop<=parameter_count();gj_loop++)
        {
            parameterstring=parameter_string(gj_loop)
            switch(string_copy(parameterstring,1,string_pos("=",parameterstring)-1))
            {
                case "gjapi_username":
                gj_user=string_delete(parameterstring,1,string_pos("=",parameterstring));
                break;
                case "gjapi_token":
                gj_token=string_delete(parameterstring,1,string_pos("=",parameterstring));
                break;
            }
        }
    }
    else
    {
        for(gj_loop=1;gj_loop<parameter_count();gj_loop++)
        {
            parameterstring=parameter_string(gj_loop)
            switch(string_copy(parameterstring,1,string_pos("=",parameterstring)-1))
            {
                case "gjapi_username":
                gj_user=string_delete(parameterstring,1,string_pos("=",parameterstring));
                break;
                case "gjapi_token":
                gj_token=string_delete(parameterstring,1,string_pos("=",parameterstring));
                break;
            }
        }
    }
    return true;
}
else return false;
//Old way of doing this
/*if (file_exists("gjapi-credentials.txt"))
{
    var file=file_text_open_read("gjapi-credentials.txt")
    gj_user=file_text_read_string(file) 
    file_text_readln(file)
    gj_token=file_text_read_string(file)
    file_text_close(file)
    return true;
}
else
return false;

