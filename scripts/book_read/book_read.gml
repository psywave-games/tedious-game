/// @arg0 ...
var _last_second = variable_global_exists("book_lasted_second")? global.book_lasted_second: 0
var _book_page = variable_global_exists("book_page")? global.book_page: 0
var _book_id = variable_global_exists("book_id")? global.book_id: self.id

if _book_id != self.id
	or _book_page >= argument_count 
	or  (current_second - _last_second) > 6 begin
	_book_page = 0
end


speak(game.app.player, t(argument[_book_page]), p_head_direction(self.bbox_bottom, self.bbox_top))
global.book_lasted_second = current_second
global.book_page = _book_page + 1
global.book_id = self.id

return _book_page >= (argument_count - 1)