---@meta Starsystem
---
---Functions for starsystems
---@class Starsystem
Starsystem = {}

---finds (or generates) any starsystem by coordinates
---@param xval integer the x coordinate
---@param yval integer the y coordinate
---@return Starsystem # the system, or nil if not found and cannot be created
function Starsystem.getFromCoordinates (xval, yval) end

---finds any starsystem by name
---@param name string the system name. Works with the full name or a prefix, like Corusca or Corusca Sector.
---@return Starsystem # the system, or nil if not found
function Starsystem.getFromName (name) end

---echo to all ships in the system, visible to any players in cockpits/viewports/turrets/etc
---@param text string the text to echo
function Starsystem:echoToSystem (text) end

---get whether a system is affected by comms blackout.
---This effectively acts the same as disrupt_network but for the entire system.
---@return boolean # true if under comms blackout, false otherwise.
function Starsystem:getBlackout () end

---get the X coordinate of the starsystem
---
---Usage:
---```
---    local x, y = system:getCoords()
---    ch:echoAt("The system is at "..x..", "..y)
---```
---@return integer # the X coordinate for this starsystem
---@return integer # the Y coordinate for this starsystem
function Starsystem:getCoords () end

---get whether a system is hidden and inaccessible without a navchart.
---Systems with this set can't be accessed without a navchart. Attempting to navigate by
---coordinate will bring you (-1, -1) from the system instead. It'll also not show on
---starsystem lists to players.
---@return boolean # true if hidden, false otherwise.
function Starsystem:getHidden () end

---get the maximum ship class allowed in this system.
---Uses the same class numbers as the images and setship commands: 0 = fighter, 1 = transport, etc.
---All systems default to 10 (satellite) to allow all ships.
---@return integer # the maximum ship class allowed in the system.
function Starsystem:getMaxShipClass () end

---get the name of the starsystem
---@return string # the name of the starsystem. For uncharted space, this will be a random number.
function Starsystem:getName () end

---get whether a system is inaccessible to frigates or larger.
---@return boolean # true if inaccessible to frigates or larger, false otherwise.
function Starsystem:getNoCaps () end

---get whether a system blocks hyperspace travel.
---This blocks hyperspace which passes through any part of the system, effectively turning
---it into a space wall. Ships within the system can't do any hyperspace jumps at all.
---@return boolean # true if the system blocks hyperspace travel, false otherwise.
function Starsystem:getNoHyper () end

---get whether a system blocks PVP in its space.
---This affects only ship targeting. For a full no-PVP system, also add the flag to its planets.
---@return boolean # true if PVP ship combat is disabled here, false otherwise.
function Starsystem:getNoPvp () end

---get whether a system is hidden from public starsystem lists.
---If true, starsystems will hide this from players. They can still navigate to it if
---they know the name or coordinates, however.
---@return boolean # true if hidden from starsystem lists, false otherwise.
function Starsystem:getNotPublic () end

---get whether a starsystem is a virtual system.
---@return boolean # true if the system was created by jumping to coordinates, false if it's a manually created system
function Starsystem:getVirtualSys () end

---set whether a system is affected by comms blackout.
---This effectively acts the same as disrupt_network but for the entire system.
---@param blackout boolean whether the system is affected by comms blackout
function Starsystem:setBlackout (blackout) end

---set whether a system is hidden and inaccessible without a navchart.
---Systems with this set can't be accessed without a navchart. Attempting to navigate by
---coordinate will bring you (-1, -1) from the system instead. It'll also not show on
---starsystem lists to players.
---@param hidden boolean whether to hide and block access to the system without a navchart
function Starsystem:setHidden (hidden) end

---set the maximum ship class allowed in this system.
---Uses the same class numbers as the images and setship commands: 0 = fighter, 1 = transport, etc.
---All systems default to 10 (satellite) to allow all ships.
---@param maxShipClass integer the maximum ship class allowed in the system
function Starsystem:setMaxShipClass (maxShipClass) end

---set whether a system is inaccessible to frigates or larger.
---@param noCaps boolean whether the system is inaccessible to frigates or larger
function Starsystem:setNoCaps (noCaps) end

---set whether a system blocks hyperspace travel.
---This blocks hyperspace which passes through any part of the system, effectively turning
---it into a space wall. Ships within the system can't do any hyperspace jumps at all.
---@param noHyper boolean whether the system blocks hyperspace travel
function Starsystem:setNoHyper (noHyper) end

---set whether a system blocks PVP in its space.
---This affects only ship targeting. For a full no-PVP system, also add the flag to its planets.
---@param noPvp boolean whether the system blocks PVP in its space
function Starsystem:setNoPvp (noPvp) end

---set whether a system is hidden from public starsystem lists.
---@param noCaps boolean whether the system is hidden from starsystem lists
function Starsystem:setNotPublic (noCaps) end

---get an iterator over ships in the starsystem
---
---Usage:
---```
---    for ship in system:ships() do
---    -- do something
---    end
---```
---@return Ship # an iterator of Ship
function Starsystem:ships () end

