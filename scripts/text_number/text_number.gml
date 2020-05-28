/// @description formats number in string with separators
/// @argument0 value
/// @argument1 OPTIONAL_SEPRATOR
/// @argument3 OPTIONAL_digits
/// @author Dmi7ry

var value = string(round(argument[0]));
var sep = argument_count > 1? argument[1]: ".";
var digits = argument_count > 1? argument[2] - 1: 2;

var res = "";

var cnt = 0;
for (var i=string_length(value); i>0; i--)
{
    res = string_char_at(value, i) + res;
    if cnt++ == digits and i > 1
    {
        cnt = 0;
        res = sep + res;
    }
}

return res;