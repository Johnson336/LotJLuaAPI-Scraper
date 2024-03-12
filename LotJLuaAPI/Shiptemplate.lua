---@meta Shiptemplate
---
---Functions for ship templates, including triggers
---@class Shiptemplate
Shiptemplate = {}

---returns the basename for this ship template.
---@return string # the template's basename
function Shiptemplate:getBaseName () end

---returns the filename for this ship template
---@return string # the template's filename
function Shiptemplate:getFilename () end

---registers a function to run when a ship is first built or created.
---
---Usage:
---```
---    self:onCreate(function(self)
---    -- Place a mob in the ship's cockpit
---    Character.invoke(12345):toRoom(self:getCockpit())
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Ship being created 2. the Character who finished it. Can be nil.       
function Shiptemplate:onCreate (callback) end

---registers a function to run when a ship is destroyed.
---This function will run after the ship destruction message is shown to the system,
---but before any players inside the ship are dealt with. You can use it to move
---players off of the ship before they're killed.
---
---Usage:
---```
---    self:onDestroyed(function(self, byShip, byChar)
---    if not byChar then
---    return
---    end
---    ch:echoAt("Good job, you destroyed the pirate!")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Ship being destroyed 2. the Ship destroying it (can be nil) 3. the Character destroying it (can be nil)       
function Shiptemplate:onDestroyed (callback) end

---registers a function to run when a ship is placed in a system via a space spawn.
---
---Usage:
---```
---    self:onSpawned(function(self)
---    -- Place a mob in the ship's cockpit
---    Character.invoke(12345):toRoom(self:getCockpit())
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Ship being spawned       
function Shiptemplate:onSpawned (callback) end

---registers a function to run when a ship is targeted by another ship.
---
---Usage:
---```
---    self:onTargeted(function(self, targeter)
---    self:radio("Help! I'm being attacked by "..targeter:getName())
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Ship being targeted 2. the Ship targeting it       
function Shiptemplate:onTargeted (callback) end

---registers a function to run every space tick (20 seconds, when the space prompt shows).
---Only fires for ships which are in a starsystem, not landed/in hyperspace/launching/etc
---
---Usage:
---```
---    self:onTick(function(self)
---    self:echoToSystem("Red lights flash on the exterior of "..self:getName())
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Ship       
function Shiptemplate:onTick (callback) end

