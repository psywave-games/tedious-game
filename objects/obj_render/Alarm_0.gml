/// @description set browser resolution


var max_width = browser_width
var max_height = browser_height

var resolution = 0
var ratio = 0

#region SELECT BETTER RESOLUTION
do begin
	resolution += 1
end until resolutions[resolution + 1] > max_height


do begin
	ratio += 1
end until (size_ratio[ratio + 1] * resolutions[resolution]) > max_width
#endregion

resolution_set(resolution, ratio)
