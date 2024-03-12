---@meta Furniture
---
---Functions for handling furniture.
---@class Furniture
Furniture = {}

---create a new piece of furniture.
---@param short string the short description (required)
---@param long string the long description (optional, defaults to short description)
---@return Furniture # the new furniture object.
function Furniture.create (short, long) end

---finds a furniture by ID
---@param id number the furniture ID
---@return Furniture # the furniture, or nil if not found
function Furniture.getFromID (id) end

---gets the comfort value of this furniture.
---@return number # the furniture's current comfort value.
function Furniture:getComfort () end

---gets the ID of this furniture.
---@return number # the ID of this furniture.
function Furniture:getId () end

---gets the room this furniture is in, or nil if not set.
---@return Room # the room where the furniture is located, or nil if not set.
function Furniture:getInRoom () end

---gets the long description of this furniture.
---Can return nil if it's not set, in which case the short description is used in the room.
---@return string # the furniture's current long description, or nil if unset.
function Furniture:getLongDescription () end

---gets the short description of this furniture.
---@return string # the furniture's current short description.
function Furniture:getShortDescription () end

---gets whether a given position is enabled on this furniture.
---@param position string (sitat, sit, rest, or lie)
---@return boolean # true whether the given position is enabled on this furniture.
function Furniture:hasPosition (position) end

---sets the comfort value of this furniture.
---@param the number new comfort value for the furniture (currently does nothing).
---@return Furniture # this furniture, for call chaining.
function Furniture:setComfort (the) end

---sets whether a position is enabled on this furniture.
---@param position string (sitat, sit, rest, or lie)
---@param boolean any enabled whether the position should be enabled or disabled
---@return Furniture # this furniture, for call chaining.
function Furniture:setPosition (position, boolean) end

---sets the long description of this furniture.
---@param the string new long description of the furniture. Can pass empty string to clear it and use the short desc instead.
---@return Furniture # this furniture, for call chaining.
function Furniture:setLongDescription (the) end

---sets the short description of this furniture.
---@param the string new short description of the furniture.
---@return Furniture # this furniture, for call chaining.
function Furniture:setShortDescription (the) end

---moves this furniture to a new room
---@param the Room room (or vnum) to move the furniture to. Nil will remove it from any room.
---@return Furniture # this furniture, for call chaining.
function Furniture:toRoom (the) end

