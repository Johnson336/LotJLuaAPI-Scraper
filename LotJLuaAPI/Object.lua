---@meta Object
---
---Functions for object instances
---@class Object
Object = {}

---send a message to the occupants of the room the object is in.
---
function Object:echo (message, args) end

---create an instance of an object.
---
function Object.invoke (vnum) end

---get the character holding this object.
---
function Object:getCarriedBy () end

---get the object directly containing this object.
---
function Object:getInObject () end

---get the room containing this object.
---
function Object:getInRoom () end

---return the object's long description.
---
function Object:getLongDescription () end

---return the object's name (keywords).
---
function Object:getName () end

---return the object's short description.
---
function Object:getShortDescription () end

---return the object's type
---
function Object:getType () end

---get the value0 for this object.
---
function Object:getValue0 () end

---return the object's vnum
---
function Object:getVNum () end

---get the value1 for this object.
---
function Object:getValue1 () end

---get the value2 for this object.
---
function Object:getValue2 () end

---get the value3 for this object.
---
function Object:getValue3 () end

---return an extradesc on the object, or nil
---
function Object:getExtraDesc (the) end

---return the object's blueprint string
---
function Object:getBlueprint () end

---get the value4 for this object.
---
function Object:getValue4 () end

---get an iterator over objects inside this one
---
function Object:contents () end

---get the value5 for this object.
---
function Object:getValue5 () end

---get the object's weight.
---
function Object:getWeight () end

---get whether a flag is set on this object.
---
function Object:hasFlag (flag) end

---get whether a wearloc is set on this object.
---
function Object:hasWearloc (wearloc) end

---get whether the object is directly on the ground.
---
function Object:isOnGround () end

---Extracts the object.
---
function Object:purge () end

---set the blueprint string on an object
---
function Object:setBlueprint (blueprint) end

---get the remaining time on an object's variable, by name
---
function Object:getVarTimer (varName) end

---set an extradesc on an object
---
function Object:setExtraDesc (the) end

---set a flag on this object.
---
function Object:setFlag (flag, value) end

---set the object's long description.
---
function Object:setLongDescription (long) end

---set the object's name (keywords).
---
function Object:setName (name) end

---set the object's short description.
---
function Object:setShortDescription (short) end

---set the object's type
---
function Object:setType (type) end

---set the value0 for this object.
---
function Object:setValue0 (value) end

---set the value0 for this object.
---
function Object:setValue1 (value) end

---set the value0 for this object.
---
function Object:setValue2 (value) end

---set the value0 for this object.
---
function Object:setValue3 (value) end

---set the value0 for this object.
---
function Object:setValue4 (value) end

---set the value0 for this object.
---
function Object:setValue5 (value) end

---set a variable on an object
---
function Object:setVar (varName, value, ttl) end

---set a wearloc on this object.
---
function Object:setWearloc (wearloc, value) end

---set the object's weight.
---
function Object:setWeight (weight) end

---send an object to the given character.
---
function Object:toChar (ch) end

---put an object inside the given target object.
---
function Object:toObject (target) end

---send an object to the given room on the ground.
---
function Object:toRoom (room) end

---get an object's variable by name
---
function Object:getVar (varName, default) end

