---@meta Furniture
---
---Functions for handling furniture.
---@class Furniture
Furniture = {}

---create a new piece of furniture.
---
function Furniture.create (short, long) end

---finds a furniture by ID
---
function Furniture.getFromID (id) end

---gets the ID of this furniture.
---
function Furniture:getId () end

---gets the comfort value of this furniture.
---
function Furniture:getComfort () end

---gets the short description of this furniture.
---
function Furniture:getShortDescription () end

---gets the long description of this furniture.
---
function Furniture:getLongDescription () end

---gets whether a given position is enabled on this furniture.
---
function Furniture:hasPosition (position) end

---gets the room this furniture is in, or nil if not set.
---
function Furniture:getInRoom () end

---sets the long description of this furniture.
---
function Furniture:setLongDescription (the) end

---sets the comfort value of this furniture.
---
function Furniture:setComfort (the) end

---sets whether a position is enabled on this furniture.
---
function Furniture:setPosition (position, boolean) end

---moves this furniture to a new room
---
function Furniture:toRoom (the) end

---sets the short description of this furniture.
---
function Furniture:setShortDescription (the) end

