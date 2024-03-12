---@meta Exit
---
---Functions for interacting with room exits.
---@class Exit
Exit = {}

---create a new exit between two rooms.
---Be sure to fold the area if you want to control whether the exit persists in the long run.
---
---Usage:
---```
---    self:onCommand("lever", function(self, ch)
---    ch:echoAt("You push the lever...")
---    ch:echoAround("{1} pushes the lever...", ch)
---    Exit.create(self, north, 12345, true)
---    self:echo("A hidden passage reveals itself to the north, leading to a snowy expanse!")
---    self:getInArea():fold() -- save the area now
---    end)
---    Exit.create(self, "trapdoor", 12345) -- Create a custom exit named 'trapdoor'
---```
---@param from Room the room (or vnum) to link from
---@param direction string the exit direction (e.g. north, n, or a custom string)
---@param to Room the room (or vnum) to link to
---@param both boolean whether to create a mirroring exit back from the target room to the source (optional, defaults to true)
---@return Exit # the new exit
function Exit.create (from, direction, to, both) end

---delete this exit.
---
function Exit:delete () end

---get the description for this exit.
---@return string # the description for this exit.
function Exit:getDescription () end

---get the key code or object vnum for this exit.
---@return integer # the key code or key object vnum for this exit.
function Exit:getKey () end

---get the name for this exit, either a set keyword or the directional name.
---@return string # the exit name.
function Exit:getName () end

---get the room this exit leads to.
---@return Room # the room this exit leads to
function Exit:getToRoom () end

---get whether a flag is set on this exit.
---
---Usage:
---```
---    if exit:hasFlag("closed") do
---    ch:echoAt("The door is closed.")
---    end
---```
---@param flag string The flag to check for
---@return boolean # True if the flag is set, false otherwise
function Exit:hasFlag (flag) end

---set the description for this exit.
---@param the string new description
---@return Exit # the exit, for call chaining
function Exit:setDescription (the) end

---set a flag on this exit.
---
---Usage:
---```
---    -- Open the door from both sides
---    room:setFlag("closed", false, true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
---@param both boolean If true, when the exit is two-way, the flag will be set on the other side as well.
---@return Exit # the exit, for call chaining
function Exit:setFlag (flag, value, both) end

---set the key code or object vnum for this exit.
---@param key integer the object vnum or key code
---@return Exit # the exit, for call chaining
function Exit:setKey (key) end

