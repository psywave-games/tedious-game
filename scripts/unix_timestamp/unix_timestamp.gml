/// unix_timestamp([datetime])
//
//  Returns a Unix timestamp for the current time
//  or optionally given GameMaker datetime value.
//
//      datetime    GameMaker datetime, real
//
/// GMLscripts.com/license
var _timezone = date_get_timezone();
 
date_set_timezone(timezone_utc);
 
if (argument_count > 0) {
    var _datetime = argument[0];
} else {
    var _datetime = date_current_datetime();
}
 
var _timestamp = round(date_second_span(25569, _datetime));
 
date_set_timezone(_timezone);
 
return _timestamp;
