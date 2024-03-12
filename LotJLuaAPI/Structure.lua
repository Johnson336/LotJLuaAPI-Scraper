---@meta Structure
---
---Functions for handling structures.
---@class Structure
Structure = {}

---returns an iterator over all structures.
---
---Usage:
---```
---    for structure in Structure.all() do
---    -- do something
---    end
---```
---@return Structure # an iterator of Structure
function Structure.all () end

---finds a structure by ID
---@param id integer the structure ID
---@return Structure # the structure, or nil if not found
function Structure.getFromID (id) end

---finds a structure by name
---@param name string the structure name
---@return Structure # the structure, or nil if not found
function Structure.getFromName (name) end

---get the structure's blueprint name
---@return string # the structure's blueprint name, or nil if not set.
function Structure:getBlueprint () end

---gets the interior entrance room for the structure
---@return Room # the structure's entrance room, or nil if not set.
function Structure:getEntrance () end

---get the first vnum in the range assigned to the structure
---@return integer # the structure's first vnum
function Structure:getFirstVNum () end

---get the structure's ID
---@return integer # the structure's id.
function Structure:getID () end

---gets the room the structure is located in
---@return Room # the room the structure is in, or nil if not set.
function Structure:getInRoom () end

---get the last vnum in the range assigned to the structure
---@return integer # the structure's last vnum
function Structure:getLastVNum () end

---get the structure's name
---@return string # the structure's name, or nil if not set.
function Structure:getName () end

---get the structure's owner's name
---@return string # the structure's owner's name, or nil if not set.
function Structure:getOwner () end

---gets the planet this structure is on, or nil if not set.
---@return Planet # the planet where the structure is located, or nil if not set.
function Structure:getPlanet () end

---get an iterator over rooms in the structure.
---
---Usage:
---```
---    for room in structure:rooms() do
---    -- do something
---    end
---```
---@return Room # an iterator of Room
function Structure:rooms () end

