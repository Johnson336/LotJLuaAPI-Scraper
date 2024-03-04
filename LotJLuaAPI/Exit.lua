---@meta Exit
---
---Functions for interacting with room exits.
---@class Exit
Exit = {}

---create a new exit between two rooms.
---
function Exit.create (from, direction, to, both) end

---get the description for this exit.
---
function Exit:getDescription () end

---get the key code or object vnum for this exit.
---
function Exit:getKey () end

---delete this exit.
---
function Exit:delete () end

---get the room this exit leads to.
---
function Exit:getToRoom () end

---set the description for this exit.
---
function Exit:setDescription (the) end

---set a flag on this exit.
---
function Exit:setFlag (flag, value, both) end

---set the key code or object vnum for this exit.
---
function Exit:setKey (key) end

---get the name for this exit, either a set keyword or the directional name.
---
function Exit:getName () end

---get whether a flag is set on this exit.
---
function Exit:hasFlag (flag) end

