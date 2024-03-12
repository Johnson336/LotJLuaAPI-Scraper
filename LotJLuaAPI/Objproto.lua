---@meta Objproto
---
---Functions for object prototypes, including triggers
---@class Objproto
Objproto = {}

---registers a function to run when the given action message is shown in the object's room.
---Only applies to objects on the ground in the room, not anything in character inventories.
---
---Usage:
---```
---    self:onAct("grips the piloting controls", function(self, actor, fullText)
---    actor:echoAt("The console beeps loudly and the controls are disabled.")
---    actor:force("pilot")
---    end)
---```
---@param message string the message to trigger on
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who did the action 3. the full text of the action message       
function Objproto:onAct (message, callback) end

---registers a function to run when a character (player or NPC) enters a custom command.
---Works on any objects in the room or in the character's inventory (including equipped items).
---Does not work for objects in a container.
---
---Usage:
---```
---    self:onCommand("repair", function(self, ch, argument)
---    ch:echoAt("You repaired "..self:getShortDescription()..".")
---    end)
---```
---@param command string the command name
---@param callback function  the function to run, taking arguments: 1. the Object instance 1. the Character who entered the command 2. the argument they entered to the command, if any       
function Objproto:onCommand (command, callback) end

---registers a function to run after a character drops this object.
---
---Usage:
---```
---    self:onDrop(function(self, ch)
---    ch:echoAt(self:getShortDescription().." falls to the ground with a loud clunk.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who dropped the object       
function Objproto:onDrop (callback) end

---registers a function to run after an object gets damaged.
---This function runs before the object is potentially reduced to scraps. For objects
---tracking durability as a value, you can modify that durability here to prevent it
---from being destroyed. Other object types just have a random chance to break, and
---you can't prevent that here.
---
---Usage:
---```
---    self:onDamage(function(self, ch)
---    ch:echoAt(self:getShortDescription().." emits a sad noise.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who is wearing the object (will be nil if it's on the ground)       
function Objproto:onDamage (callback) end

---registers a function to run after a character examines this object.
---This covers both look <thing> and examine <thing>.
---
---Usage:
---```
---    self:onExamine(function(self, ch)
---    ch:echoAt("You notice bright red button on the underside of the device.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who examined the object       
function Objproto:onExamine (callback) end

---registers a function to run after a character gets this object from the room.
---
---Usage:
---```
---    self:onGet(function(self, ch)
---    ch:echoAt("You carefully scoop up the pile of powder.")
---    end)
---```
---@param room any an optional flag to only trigger if the object is gotten from the room (as opposed to a container)
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who picked up the object       
function Objproto:onGet (room, callback) end

---registers a function to run when a character enters the room.
---Only works for objects on the ground.
---
---Usage:
---```
---    self:onGreet(function(self, target)
---    target:echoAt("You notice "..self:getShortDescription().." blinking red.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who entered       
function Objproto:onGreet (callback) end

---registers a function to run after a button object is pulled.
---
---Usage:
---```
---    self:onPull(function(self, ch)
---    ch:echoAt(self:getShortDescription().." does something because you pulled it.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who pulled it       
function Objproto:onPull (callback) end

---registers a function to run after a button object is pushed.
---
---Usage:
---```
---    self:onPush(function(self, ch)
---    ch:echoAt(self:getShortDescription().." does something because you pushed it.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who pushed it       
function Objproto:onPush (callback) end

---registers a function with a chance to run every main tick (52-87 seconds, random).
---
---Usage:
---```
---    self:onRandom(25, function(self)
---    -- Do stuff
---    end)
---```
---@param chance integer the chance, 1-100, that the trigger will fire on a given tick
---@param callback function  the function to run, taking arguments: 1. this Object       
function Objproto:onRandom (chance, callback) end

---registers a function to run after a character unequips this object.
---
---Usage:
---```
---    self:onRemove(function(self, ch)
---    ch:emote("makes a controlled descent and removes their jetpack.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who removed the object       
function Objproto:onRemove (callback) end

---registers a function to run when the given text is spoken in the room.
---Works for objects on the ground or in the direct inventory/equip of any characters in the room.
---
---Usage:
---```
---    self:onSpeech("activate", function(self, speaker, fullText)
---    speaker:echoAt("The trash compactor whirs as it activates.")
---    end)
---```
---@param message string the message to trigger on
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who spoke 3. the full text spoken       
function Objproto:onSpeech (message, callback) end

---registers a function to run every time the hour changes to a certain value.
---
---Usage:
---```
---    self:onTime(6, function(self)
---    -- Do something at 6am every day
---    end)
---```
---@param hour integer the hour of day to trigger at, 0-23
---@param callback function  the function to run, taking arguments: 1. this Object       
function Objproto:onTime (hour, callback) end

---registers a function to run after an object is used.
---Setting an onUse allows the use command on any object regardless of its type.
---When an onUse happens, the default messages about using the object are suppressed,
---although the default behavior still kicks in (toggling lights, etc).
---For objects of type device, the object can be used with a target. This can be a
---character or object accessible to the player, and if present, either of these arguments
---will be passed to the onUse function.
---For consumable objects (food, drink, and cybernetics) the onUse prog is triggered when
---the object is consumed.
---
---Usage:
---```
---    self:onUse(function(self, ch)
---    ch:echoAt(self:getShortDescription().." does something because you used it.")
---    end)
---    self:onUse(function(self, ch, targetCh, targetObj)
---    if not targetCh then
---    ch:echoAt("This can only be used on a character.")
---    return
---    end
---    targetCh:echoAt("You feel a surge of static electricity.")
---    targetCh:echoAround("$n's hair sticks out in every direction.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who used it 3. the Character targeted by the use command, for devices 4. the Object targeted by the use command, for devices       
function Objproto:onUse (callback) end

---registers a function to run after a character equips this object.
---
---Usage:
---```
---    self:onWear(function(self, ch)
---    ch:emote("loosely straps "..self:getShortDescription().." over their shoulder.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Object 2. the Character who wore the object       
function Objproto:onWear (callback) end

