---@meta Room
---
---Functions for rooms
---@class Room
Room = {}

---finds a room by vnum
---
function Room.getFromVNum (vnum) end

---get an iterator over characters in the room
---
function Room:characters () end

---returns the number of mobs in the room.
---
function Room:countNPC () end

---send a message to the occupants of a room.
---
function Room:echo (message, args) end

---returns the number of players in the room.
---
function Room:countPC () end

---get an iterator over exits in the room
---
function Room:exits () end

---convenient handle to use the Agent within a room to perform actions
---
function Room:force (to) end

---find a object in this room by name.
---
function Room:findObj (args, asChar) end

---returns the first character found in this room with the given vnum.
---
function Room:getCharByVNum () end

---return the room's description
---
function Room:getDescription () end

---get an exit by keyword/direction.
---
function Room:getExit (name) end

---return the area containing the room
---
function Room:getInArea () end

---return the ship this room is part of
---
function Room:getInShip () end

---return the structure this room is part of
---
function Room:getInStructure () end

---return the maximum ship class number for this room
---
function Room:getMaxShipClass () end

---find a character in this room by name.
---
function Room:findChar (args, asChar) end

---get an iterator over furniture in the room
---
function Room:furniture () end

---get the planet for this room.
---
function Room:getOnPlanet () end

---return the minimum ship class number for this room
---
function Room:getMinShipClass () end

---return the room's name
---
function Room:getName () end

---gets a table of the currently accessible exits from a room (no closed door, not window or hidden)
---
function Room:getOpenExits (forMob) end

---return the ship size capacity for this room.
---
function Room:getShipCapacity () end

---get a room's variable by name
---
function Room:getVar (varName, default) end

---return the room's vnum
---
function Room:getVNum () end

---get whether a flag is set on this room.
---
function Room:hasFlag (flag) end

---return the combined size of all ships and frames in the room.
---
function Room:getShipSizeUsed () end

---get the remaining time on a room's variable, by name
---
function Room:getVarTimer (varName) end

---registers a hook function to run when a character gets knocked out due to damage
---
function Room:hookKnockout (callback) end

---returns whether this room is accessible by hail or public landing pad.
---
function Room:isPublicSpace () end

---get an iterator over objects in the room
---
function Room:objects () end

---registers a function to run when the given action message is shown in the room.
---
function Room:onAct (message, callback) end

---registers a function to run when a character (player or NPC) enters a custom command.
---
function Room:onCommand (command, callback) end

---registers a function to run when a character drop an object in the room.
---
function Room:onDrop (callback) end

---registers a function to run when a character (player or NPC) enters a room.
---
function Room:onEnter (callback) end

---registers a function to run when a character (player or NPC) leaves a room.
---
function Room:onLeave (callback) end

---registers a function to run when a character looks, either at the room or a given keyword.
---
function Room:onLook (keyword, callback) end

---registers a function with a chance to run every main tick (52-87 seconds, random).
---
function Room:onRandom (chance, callback) end

---registers a function to run when the given text is spoken in the room.
---
function Room:onSpeech (message, callback) end

---registers a function to run every time the hour changes to a certain value.
---
function Room:onTime (hour, callback) end

---chooses a random player in the room and returns them.
---
function Room:randomPlayer () end

---sets up a voice-activated locked door.
---
function Room:setAccessDoor (dir, keywords, accessCheck) end

---sets up a voice-activated locked door which works for members of the given clan.
---
function Room:setClanAccessDoor (dir, keywords, clanName) end

---set the description of a room.
---
function Room:setDescription (description) end

---sets up a voice-activated locked door which works for leader/first/second of the given clan.
---
function Room:setClanLeaderAccessDoor (dir, keywords, clanName) end

---set a flag on this room.
---
function Room:setFlag (flag, value) end

---set a variable on a room
---
function Room:setVar (varName, value, ttl) end

---set the name of a room.
---
function Room:setName (name) end

---get an iterator over ships in the room
---
function Room:ships () end

