/// @description auto resolution
var browser_ratio = browser_width/browser_height

var ratio = 0
var resolution = 0

#region SELECT DESKTOP RESOLUTION
if not browser() begin
	resolution_set(self.mode_resolution,self.mode_ratio)
	exit
end
#endregion

#region SELECT BETTER RESOLUTION
/// VERTICAL MOBILE
if browser_height >= browser_width begin
	ratio = browser_height >= (browser_width * 1.33333333)
end

/// HORIZONTAL MOBILE
else begin
/// get ratio
	do begin 
		if ratio == array_length_1d(self.size_ratio) then
			break

		ratio += 1
	end until browser_ratio < self.size_ratio[ratio]
end



/// get resolution
for (resolution = 0; resolution < array_length_1d(self.resolutions); resolution++) begin
	if browser_height < self.resolutions[resolution + 1] then
		break
		
	if browser_width < (self.size_ratio[ratio] * self.resolutions[resolution + 1]) then
		break
end


#endregion

game.app.render.mode_fullscreen_web = true
resolution_set(resolution, ratio)
