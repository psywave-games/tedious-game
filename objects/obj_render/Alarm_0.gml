/// @description auto resolution
var browser_ratio = browser_width/browser_height

var ratio = 0
var resolution = 0

#region SELECT DESKTOP RESOLUTION
if os_browser == browser_not_a_browser begin
	resolution_set(self.mode_resolution,self.mode_ratio)
	exit
end
#endregion

#region SELECT BETTER RESOLUTION
/// get ratio
do begin 
	if ratio == array_length_1d(self.size_ratio) then
		break

	ratio += 1
end until browser_ratio < self.size_ratio[ratio]


/// get resolution
for (resolution = 0; resolution < array_length_1d(self.resolutions); resolution++) begin
	if browser_height < self.resolutions[resolution + 1] then
		break
		
	if browser_width < (self.size_ratio[ratio] * self.resolutions[resolution + 1]) then
		break
end


#endregion

resolution_set(resolution, ratio)
