---@meta Area
---
---Functions for areas
---@class Area
Area = {}

---returns the clan currently assigned to the area.
---@return Clan # the clan who is assigned to the area, or nil if none is set.
function Area:getClan () end

---Saves the area, useful after changing room flags or variables.
---
function Area:fold () end

---Get the area's filename
---@return string # the area's filename
function Area:getFilename () end

---Get the area's display name
---@return string # the area's name
function Area:getName () end

---Get a map of hail names to their rooms
---
---Usage:
---```
---    local hotelRoom = room:hails()["hotel"]
---    if hotelRoom then
---    ch:echoAt("You can hail to this hotel: "..hotelRoom:getName())
---    end
---```
---@return string # a map of hail names to their rooms
function Area:hails () end

---get an iterator over rooms in the area.
---
---Usage:
---```
---    for room in planet:rooms() do
---    -- do something
---    end
---```
---@return Room # an iterator of Room
function Area:rooms () end

