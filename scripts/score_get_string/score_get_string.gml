/// @description return score string format {%06d}
/// @arg0 score

var _score = argument_count? string(argument[0]): string(score_get())
return string_repeat("0", 6 - string_length(_score)) + _score