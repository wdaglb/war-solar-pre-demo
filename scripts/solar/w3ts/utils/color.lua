local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__NumberToString = ____lualib.__TS__NumberToString
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 154,["10"] = 185,["11"] = 186,["12"] = 187,["13"] = 188,["15"] = 190,["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 5,["21"] = 5,["22"] = 6,["23"] = 7,["24"] = 10,["25"] = 11,["27"] = 13,["29"] = 4,["34"] = 19,["42"] = 49,["43"] = 50,["44"] = 51,["46"] = 53,["54"] = 61,["55"] = 62,["56"] = 63,["58"] = 65,["62"] = 25,["63"] = 26,["64"] = 25,["65"] = 34,["66"] = 35,["68"] = 36,["69"] = 37,["72"] = 36,["75"] = 41,["76"] = 34,["77"] = 87,["78"] = 92,["79"] = 92,["80"] = 92,["81"] = 92,["82"] = 92,["83"] = 87,["86"] = 98,["87"] = 98,["88"] = 98,["89"] = 98,["90"] = 98,["91"] = 98,["92"] = 98,["93"] = 98,["94"] = 98,["95"] = 98,["96"] = 98,["97"] = 98,["98"] = 98,["99"] = 98,["100"] = 98,["101"] = 98,["102"] = 98,["103"] = 98,["104"] = 98,["105"] = 98,["106"] = 98,["107"] = 98,["108"] = 98,["109"] = 98,["110"] = 98,["111"] = 98,["113"] = 126,["114"] = 126,["115"] = 126,["116"] = 126,["117"] = 126,["118"] = 126,["119"] = 126,["120"] = 126,["121"] = 126,["122"] = 126,["123"] = 126,["124"] = 126,["125"] = 126,["126"] = 126,["127"] = 126,["128"] = 126,["129"] = 126,["130"] = 126,["131"] = 126,["132"] = 126,["133"] = 126,["134"] = 126,["135"] = 126,["136"] = 126,["137"] = 126,["138"] = 126,["140"] = 154,["141"] = 154,["142"] = 154,["143"] = 154,["144"] = 154,["145"] = 154,["146"] = 154,["147"] = 154,["148"] = 154,["149"] = 154,["150"] = 154,["151"] = 154,["152"] = 154,["153"] = 154});
local ____exports = {}
local toHex, orderedPlayerColors
function toHex(self, value)
    local hex = __TS__NumberToString(value, 16)
    if #hex < 2 then
        hex = "0" .. hex
    end
    return hex
end
____exports.Color = __TS__Class()
local Color = ____exports.Color
Color.name = "Color"
function Color.prototype.____constructor(self, red, green, blue, alpha)
    self.red = red
    self.green = green
    self.blue = blue
    if alpha then
        self.alpha = alpha
    else
        self.alpha = 255
    end
end
__TS__SetDescriptor(
    Color.prototype,
    "code",
    {get = function(self)
        return (("|c" .. toHex(nil, self.alpha)) .. toHex(nil, self.red)) .. toHex(nil, self.green) .. toHex(nil, self.blue)
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "name",
    {get = function(self)
        local index = self:playerColorIndex()
        if index < #____exports.playerColors then
            return ____exports.playerColorNames[index + 1]
        end
        return "unknown"
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "playerColor",
    {get = function(self)
        local index = self:playerColorIndex()
        if index < #____exports.playerColors then
            return orderedPlayerColors[index + 1]
        end
        return PLAYER_COLOR_RED
    end},
    true
)
function Color.prototype.equals(self, other)
    return self.red == other.red and self.green == other.green and self.blue == other.blue and self.alpha == other.alpha
end
function Color.prototype.playerColorIndex(self)
    local i = 0
    do
        while i < #____exports.playerColors do
            if ____exports.playerColors[i + 1]:equals(self) then
                break
            end
            i = i + 1
        end
    end
    return i
end
____exports.color = function(____, red, green, blue, alpha) return __TS__New(
    ____exports.Color,
    red,
    green,
    blue,
    alpha
) end
--- The player colors sorted by index. Does not include
-- neutrals colors.
____exports.playerColors = {
    ____exports.color(nil, 255, 3, 3),
    ____exports.color(nil, 0, 66, 255),
    ____exports.color(nil, 28, 230, 185),
    ____exports.color(nil, 84, 0, 129),
    ____exports.color(nil, 255, 252, 0),
    ____exports.color(nil, 254, 138, 14),
    ____exports.color(nil, 32, 192, 0),
    ____exports.color(nil, 229, 91, 176),
    ____exports.color(nil, 149, 150, 151),
    ____exports.color(nil, 126, 191, 241),
    ____exports.color(nil, 16, 98, 70),
    ____exports.color(nil, 78, 42, 3),
    ____exports.color(nil, 155, 0, 0),
    ____exports.color(nil, 0, 0, 195),
    ____exports.color(nil, 0, 234, 255),
    ____exports.color(nil, 190, 0, 254),
    ____exports.color(nil, 235, 205, 135),
    ____exports.color(nil, 248, 164, 139),
    ____exports.color(nil, 191, 255, 128),
    ____exports.color(nil, 220, 185, 235),
    ____exports.color(nil, 80, 79, 85),
    ____exports.color(nil, 235, 240, 255),
    ____exports.color(nil, 0, 120, 30),
    ____exports.color(nil, 164, 111, 51)
}
--- The names of players colors sorted by player index.
____exports.playerColorNames = {
    "red",
    "blue",
    "teal",
    "purple",
    "yellow",
    "orange",
    "green",
    "pink",
    "gray",
    "light blue",
    "dark green",
    "brown",
    "maroon",
    "navy",
    "turquoise",
    "violet",
    "wheat",
    "peach",
    "mint",
    "lavender",
    "coal",
    "snow",
    "emerald",
    "peanut"
}
--- An ordered list of `playercolor`s, for lookup
orderedPlayerColors = {
    PLAYER_COLOR_RED,
    PLAYER_COLOR_BLUE,
    PLAYER_COLOR_CYAN,
    PLAYER_COLOR_PURPLE,
    PLAYER_COLOR_YELLOW,
    PLAYER_COLOR_ORANGE,
    PLAYER_COLOR_GREEN,
    PLAYER_COLOR_PINK,
    PLAYER_COLOR_LIGHT_GRAY,
    PLAYER_COLOR_LIGHT_BLUE,
    PLAYER_COLOR_AQUA,
    PLAYER_COLOR_BROWN
}
return ____exports
