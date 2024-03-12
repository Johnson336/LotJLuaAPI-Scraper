---@meta Object
---
---Functions for object instances
---@class Object
Object = {}

---create an instance of an object.
---
---Usage:
---```
---    -- invoke object 10000 and give it to a character
---    Object.invoke(10000):toChar(self)
---    -- invoke object 1234 and do a few things with it
---    local newObj = Object.invoke(1234)
---    newObj:toChar(self)
---    newObj:echo("{1} appears in your hands out of nowhere!", newObj)
---```
---@param vnum number the object vnum
---@return Object # the new object
function Object.invoke (vnum) end

---get an iterator over objects inside this one
---
---Usage:
---```
---    for obj in self:contents() do
---    -- do something
---    end
---```
---@return Object # an iterator of Object
function Object:contents () end

---send a message to the occupants of the room the object is in.
---This will do nothing if the object is inside a container, but works if the object is on a
---character's inventory, equipped, or in a room.
---
---Usage:
---```
---    self:onSpeech("activate", function(self)
---    local ch = self:getCarriedBy()
---    if ch then
---    self:echo("{1} in {2.'s} inventory begins humming softly.", self, ch)
---    else
---    self:echo("{1} begins humming softly on the ground.", self)
---    end
---    end)
---```
---@param message string the message to send. Can contain tokens referring to subsequent arguments, substituted appropriately for viewers.
---@param args any any number of arguments corresponding to the {#} tokens in the message. {1} will refer to the first arg, etc.
function Object:echo (message, args) end

---return the object's blueprint string
---@return string # the object's blueprint string
function Object:getBlueprint () end

---get the character holding this object.
---@return Character # the character holding this object. Will be nil if it's on the ground or in any container.
function Object:getCarriedBy () end

---return an extradesc on the object, or nil
---@param the string key of the extradesc to get
---@return string # the extradesc or nil
function Object:getExtraDesc (the) end

---get the object directly containing this object.
---@return Object # the object containing this object, or nil if it's in someone's inventory, worn, or on the ground.
function Object:getInObject () end

---get the room containing this object.
---Will work even if it's in a container or carried by someone.
---@return Room # the room containing this object.
function Object:getInRoom () end

---return the object's long description.
---@return string # the object's long description
function Object:getLongDescription () end

---return the object's name (keywords).
---@return string # the object's name (keywords)
function Object:getName () end

---return the object's short description.
---@return string # the object's short description
function Object:getShortDescription () end

---return the object's type
---@return string # the object's type
function Object:getType () end

---return the object's vnum
---@return integer # the object's vnum
function Object:getVNum () end

---get the value0 for this object.
---@return integer # the current value0
function Object:getValue0 () end

---get the value1 for this object.
---@return integer # the current value1
function Object:getValue1 () end

---get the value2 for this object.
---@return integer # the current value2
function Object:getValue2 () end

---get the value3 for this object.
---@return integer # the current value3
function Object:getValue3 () end

---get the value4 for this object.
---@return integer # the current value4
function Object:getValue4 () end

---get the value5 for this object.
---@return integer # the current value5
function Object:getValue5 () end

---get an object's variable by name
---@param varName string the name of the variable to get
---@param default? any an optional default value (string, number, or boolean) to return if the variable is unset
---@return boolean|number|string|nil # the value, or the default or nil if it's not set. Can be a bool, number, or string.
function Object:getVar (varName, default) end

---get the remaining time on an object's variable, by name
---@param varName string the name of the variable whose timer you want to get
---@return integer|nil # the integer value of seconds remaining in the timer, or 0 if it's expired, or nil if the variable is not set.
function Object:getVarTimer (varName) end

---get the object's weight.
---@return integer # the object's weight
function Object:getWeight () end

---get whether a flag is set on this object.
---
---Usage:
---```
---    if obj:hasFlag("antigood") do
---    ch:echoAt("The cube glows red and zaps you!")
---    end
---```
---@param flag string The flag to check for
---@return boolean # True if the flag is set, false otherwise
function Object:hasFlag (flag) end

---get whether a wearloc is set on this object.
---
---Usage:
---```
---    if obj:hasWearloc("finger") do
---    ch:echoAt("You think this would fit on your finger.")
---    end
---```
---@param wearloc string The wearloc name to check for
---@return boolean # True if the wearloc is set, false otherwise
function Object:hasWearloc (wearloc) end

---get whether the object is directly on the ground.
---@return boolean # true if the object is directly on the ground, false if carried or in an object.
function Object:isOnGround () end

---Extracts the object.
---
function Object:purge () end

---set the blueprint string on an object
---@param blueprint string the new blueprint string
function Object:setBlueprint (blueprint) end

---set an extradesc on an object
---@param the string key of the extradesc to set
---@return string # the extradesc to set
function Object:setExtraDesc (the) end

---set a flag on this object.
---
---Usage:
---```
---    obj:setFlag("antigood", true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
function Object:setFlag (flag, value) end

---set the object's long description.
---@param long string The new long description
function Object:setLongDescription (long) end

---set the object's name (keywords).
---@param name string The new name (keywords)
function Object:setName (name) end

---set the object's short description.
---@param short string The new short description
function Object:setShortDescription (short) end

---set the object's type
---@param type string the new type
function Object:setType (type) end

---set the value0 for this object.
---@param value number the new value0
function Object:setValue0 (value) end

---set the value0 for this object.
---@param value number the new value1
function Object:setValue1 (value) end

---set the value0 for this object.
---@param value number the new value2
function Object:setValue2 (value) end

---set the value0 for this object.
---@param value number the new value3
function Object:setValue3 (value) end

---set the value0 for this object.
---@param value number the new value4
function Object:setValue4 (value) end

---set the value0 for this object.
---@param value number the new value5
function Object:setValue5 (value) end

---set a variable on an object
---
---Usage:
---```
---    -- Set timesDropped to 1 more than the last value, handling the case where
---    -- it hasn't been set yet by using 0 as the default
---    obj:setVar("timesDropped", obj:getVar("timesDropped", 0)+1)
---```
---@param varName string the name of the variable to set
---@param value any the value, a string, number, or boolean. Pass in nil here to remove a variable.
---@param ttl? number the number of seconds to keep the variable, in seconds. (optional, if not specified it's kept indefinitely)
function Object:setVar (varName, value, ttl) end

---set a wearloc on this object.
---
---Usage:
---```
---    obj:setWearloc("finger", true)
---```
---@param wearloc string The wearloc to set
---@param value boolean The new value to set
function Object:setWearloc (wearloc, value) end

---set the object's weight.
---@param weight integer The new weight
function Object:setWeight (weight) end

---send an object to the given character.
---This will remove it from wherever it currently is, whether in a container, on the ground,
---or carried by someone else.
---
---Usage:
---```
---    Object.invoke(12345):toChar(someCharacter)
---```
---@param ch Character The character to send the object to
function Object:toChar (ch) end

---put an object inside the given target object.
---
---Usage:
---```
---    Object.invoke(12345):toObject(backpack)
---```
---@param target Object The object instance to put the object in
function Object:toObject (target) end

---send an object to the given room on the ground.
---This will remove it from wherever it currently is, whether in a container, on the ground,
---or carried by someone else.
---
---Usage:
---```
---    Object.invoke(12345):toRoom(someRoom)
---    obj:toRoom(4)
---```
---@param room Room The room to send the object to (can be a room variable or the vnum)
function Object:toRoom (room) end

