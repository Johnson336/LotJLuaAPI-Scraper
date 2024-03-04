---@meta Structure
---
---Functions for handling structures.
---@class Structure
Structure = {}

---returns an iterator over all structures.
---
function Structure.all () end

---get the structure's blueprint name
---
function Structure:getBlueprint () end

---finds a structure by name
---
function Structure.getFromName (name) end

---gets the interior entrance room for the structure
---
function Structure:getEntrance () end

---finds a structure by ID
---
function Structure.getFromID (id) end

---get the structure's ID
---
function Structure:getID () end

---get the structure's name
---
function Structure:getName () end

---get the last vnum in the range assigned to the structure
---
function Structure:getLastVNum () end

---gets the room the structure is located in
---
function Structure:getInRoom () end

---get the first vnum in the range assigned to the structure
---
function Structure:getFirstVNum () end

---get the structure's owner's name
---
function Structure:getOwner () end

---gets the planet this structure is on, or nil if not set.
---
function Structure:getPlanet () end

---get an iterator over rooms in the structure.
---
function Structure:rooms () end

