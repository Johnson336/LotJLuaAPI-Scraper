---@meta Starsystem
---
---Functions for starsystems
---@class Starsystem
Starsystem = {}

---finds (or generates) any starsystem by coordinates
---
function Starsystem.getFromCoordinates (xval, yval) end

---finds any starsystem by name
---
function Starsystem.getFromName (name) end

---echo to all ships in the system, visible to any players in cockpits/viewports/turrets/etc
---
function Starsystem:echoToSystem (text) end

---get whether a system is affected by comms blackout.
---
function Starsystem:getBlackout () end

---get the X coordinate of the starsystem
---
function Starsystem:getCoords () end

---get whether a system is hidden and inaccessible without a navchart.
---
function Starsystem:getHidden () end

---get the maximum ship class allowed in this system.
---
function Starsystem:getMaxShipClass () end

---get the name of the starsystem
---
function Starsystem:getName () end

---get whether a system is inaccessible to frigates or larger.
---
function Starsystem:getNoCaps () end

---get whether a system blocks hyperspace travel.
---
function Starsystem:getNoHyper () end

---get whether a system blocks PVP in its space.
---
function Starsystem:getNoPvp () end

---get whether a system is hidden from public starsystem lists.
---
function Starsystem:getNotPublic () end

---get whether a starsystem is a virtual system.
---
function Starsystem:getVirtualSys () end

---set whether a system is affected by comms blackout.
---
function Starsystem:setBlackout (blackout) end

---set whether a system is hidden and inaccessible without a navchart.
---
function Starsystem:setHidden (hidden) end

---set the maximum ship class allowed in this system.
---
function Starsystem:setMaxShipClass (maxShipClass) end

---set whether a system is inaccessible to frigates or larger.
---
function Starsystem:setNoCaps (noCaps) end

---set whether a system blocks hyperspace travel.
---
function Starsystem:setNoHyper (noHyper) end

---set whether a system blocks PVP in its space.
---
function Starsystem:setNoPvp (noPvp) end

---set whether a system is hidden from public starsystem lists.
---
function Starsystem:setNotPublic (noCaps) end

---get an iterator over ships in the starsystem
---
function Starsystem:ships () end

