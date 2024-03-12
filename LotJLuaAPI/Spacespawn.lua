---@meta Spacespawn
---
---Functions for getting and spawning space spawns.
---@class Spacespawn
Spacespawn = {}

---spawns a new instance of this space spawn.
---Optional arguments allow you to specify any arbitrary system, even ones populated by planets.
---If coordinates are not specified, a random location will be picked inside the range allowed by
---the space spawn settings.
---@param sysX? integer The system X coordinate (optional)
---@param sysY? integer The system Y coordinate (optional)
---@return Starsystem # the system where the spawn was placed, or nil if it could not be placed.
function Spacespawn:spawn (sysX, sysY) end

---finds a space spawn by name
---@param name string the space spawn name
---@return Spacespawn # the space spawn, or nil if not found
function Spacespawn.getFromName (name) end

