//gj_checkstatus()
//Returns: true if the function is completed, false if there is an GameJolt error, <0 if there is a GameMaker error (for example, if GM couldn't find the site).
//If returns 0, more info will be available when you call gj_error()
//Returns the status and makes the info available, so ALWAYS call this before you request any info.
var httpstatus=ds_map_find_value(async_load,"status");
if(httpstatus<0)
{
    return httpstatus;
}
else
{
    var datatype=ds_map_find_value(gj_handletypemap,ds_map_find_value(async_load,"id"));
    if(datatype==4) //dump format
    {
        var gj_returnstring=ds_map_find_value(async_load,"result");
        ds_map_delete(gj_handletypemap,ds_map_find_value(async_load,"id"))
        switch(string_copy(gj_returnstring,1,7))
        {
            case "SUCCESS":
                gj_returnstring=string_delete(gj_returnstring,1,9)
                ds_map_clear(gj_infomap)
                ds_map_add(gj_infomap,"0data",gj_returnstring)
                return true;
            break;
            case "FAILURE":
                gj_returnstring=string_delete(gj_returnstring,1,9)
                ds_map_clear(gj_infomap)
                ds_map_add(gj_infomap,"error",gj_returnstring)
                return false;
            break;
        }
    }
    else
    {
        //Make a ds_map with the information
        //First clear our info map
        ds_map_clear(gj_infomap)
        var gj_key="",gj_value="",gj_returnstring=ds_map_find_value(async_load,"result");
        //Now removed because of HTML5
        //gj_returnstring=string_replace_all(gj_returnstring,"
//","") //make it easier to read the map by removing all newlines.
        //show_message(gj_returnstring) //Debugging
        gj_returnstring=string_replace_all(gj_returnstring,"\\\"","''") //Sorry, couldn't find a better way to do this.
        //First always check the first line, as this always contains the status
        gj_key=string_copy(gj_returnstring,1,string_pos(":\"",gj_returnstring)-1)
        gj_returnstring=string_delete(gj_returnstring,1,string_pos(":\"",gj_returnstring)+1)
        gj_value=string_copy(gj_returnstring,1,string_pos("\"",gj_returnstring)-1)
        gj_returnstring=string_delete(gj_returnstring,1,string_pos("\"",gj_returnstring)+2)
        if(gj_value="true")
        {
            //Succes! Now we can read the rest of the map, if the call needs it, else just return true.
            switch(datatype)
            {
                case 0:
                    gj_user=gj_tempuser
                    gj_token=gj_temptoken
                    gj_tempuser=""
                    gj_temptoken=""
                break;
                case 1:
                    var gj_currnum=0;
                    while(gj_returnstring!="")
                    {
                            gj_key=string_copy(gj_returnstring,1,string_pos(":\"",gj_returnstring)-1)
                            gj_returnstring=string_delete(gj_returnstring,1,string_pos(":\"",gj_returnstring)+1)
                            gj_value=string_copy(gj_returnstring,1,string_pos("\"",gj_returnstring)-1)
                            gj_returnstring=string_delete(gj_returnstring,1,string_pos("\"",gj_returnstring)+2)
                            if(ds_map_exists(gj_infomap,string(gj_currnum)+gj_key))
                            {
                                gj_currnum+=1
                            }
                            ds_map_add(gj_infomap,string(gj_currnum)+gj_key,gj_value)
                    }
                    ds_map_add(gj_infomap,"fieldnum",gj_currnum)
                break;
                //Case 3 is the same as 1, but then for highscores with guests. We add the is_guest var here.
                case 3:
                    var gj_currnum=0;
                    while(gj_returnstring!="")
                    {
                            gj_key=string_copy(gj_returnstring,1,string_pos(":\"",gj_returnstring)-1)
                            gj_returnstring=string_delete(gj_returnstring,1,string_pos(":\"",gj_returnstring)+1)
                            gj_value=string_copy(gj_returnstring,1,string_pos("\"",gj_returnstring)-1)
                            gj_returnstring=string_delete(gj_returnstring,1,string_pos("\"",gj_returnstring)+2)
                            //show_message(gj_returnstring) //Debugging
                            if(ds_map_exists(gj_infomap,string(gj_currnum)+gj_key))
                            {
                                gj_currnum+=1
                            }
                            if(gj_key=="user")
                            {
                                if(gj_value=="")
                                ds_map_add(gj_infomap,string(gj_currnum)+"is_guest",1)
                                else
                                {
                                    ds_map_add(gj_infomap,string(gj_currnum)+"is_guest",0)
                                    ds_map_add(gj_infomap,string(gj_currnum)+"display_name",gj_value)
                                }
                            }
                            if(gj_key="guest")and(gj_value!="")
                            {
                                ds_map_add(gj_infomap,string(gj_currnum)+"display_name",gj_value)
                            }
                            ds_map_add(gj_infomap,string(gj_currnum)+gj_key,gj_value)
                    }
                    ds_map_add(gj_infomap,"fieldnum",gj_currnum)
                break;
            }
            //Then remove the handle id from the map, as it is no longer needed.
            ds_map_delete(gj_handletypemap,ds_map_find_value(async_load,"id"))
            return true;
        }
        else
        {
            //The error is on the next line now
            gj_key=string_copy(gj_returnstring,1,string_pos(":\"",gj_returnstring)-1)
            gj_returnstring=string_delete(gj_returnstring,1,string_pos(":\"",gj_returnstring)+1)
            gj_value=string_copy(gj_returnstring,1,string_pos("\"",gj_returnstring)-1)
            gj_returnstring=string_delete(gj_returnstring,1,string_pos("\"",gj_returnstring)+2)
            //Add it to our ds_map so we can find it later if gj_error is called
            ds_map_add(gj_infomap,"error",gj_value)
            return false;
        }
    }
}



