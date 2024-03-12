---@meta Room
---
---Functions for rooms
---@class Room
Room = {}

---finds a room by vnum
---@param vnum number the room vnum
---@return Room # the room, or nil if not found
function Room.getFromVNum (vnum) end

---get an iterator over characters in the room
---
---Usage:
---```
---    for char in room:characters() do
---    -- do something
---    end
---```
---@return Character # an iterator of Character
function Room:characters () end

---returns the number of players in the room.
---@return integer # the number of players in the room.
function Room:countPC () end

---returns the number of mobs in the room.
---@return integer # the number of mobs in the room.
function Room:countNPC () end

---send a message to the occupants of a room.
---
---Usage:
---```
---    self:onEnter(function(self, ch)
---    -- This will show 'focus on you ... illuminates your features' to the character who entered.
---    -- For anyone else, it will show their name and correct possessive pronoun.
---    self:echo("A security camera turns to focus on {1} and a spotlight illuminates {1.s} features.", ch)
---    end)
---```
---@param message string the message to send. Can contain tokens referring to subsequent arguments, substituted appropriately for viewers.
---@param args any any number of arguments corresponding to the {#} tokens in the message. {1} will refer to the first arg, etc.
function Room:echo (message, args) end

---get an iterator over exits in the room
---
---Usage:
---```
---    for exit in room:exits() do
---    -- do something
---    end
---```
---@return Exit # an iterator of Exit
function Room:exits () end

---find a character in this room by name.
---
---Usage:
---```
---    self:onCommand("tag", function(self, ch, args)
---    -- We want to let them do "tag <target>", so look for the target they entered by name
---    local target = self:findChar(args, ch)
---    if not target then
---    ch:echoAt("You don't see '{1}' here.", args)
---    else
---    target:echoAt("TAG! You're it!")
---    ch:echoAt("You tagged {1}!", target)
---    end
---    end)
---    -- Get the character named "Sherlock" in this room, regardless of restrung armor, invis state, etc.
---    local sherlock = self:findChar("sherlock")
---```
---@param args string the name(s) to search for. Just like targeting characters ingame, can use multiple words to get exact matches against a mob with multiple keywords.
---@param asChar Character Optional, the character to search as. If specified, matches names as this character would see them and will not return targets they can't see.
---@return Character # a valid matching target, or nil if no match was found
function Room:findChar (args, asChar) end

---find a object in this room by name.
---
---Usage:
---```
---    self:onCommand("enable", function(self, ch, args)
---    -- We want to let them do "enable <object>", so look for the object they entered by name
---    local obj = self:findObj(args, ch)
---    if not obj then
---    ch:echoAt("You don't see '{1}' here.", args)
---    else
---    obj:echo("{1} has been enabled by {2}.", obj, ch)
---    end
---    end)
---    -- Get the object named "controlpanel" in this room regardless of hidden/invis state, etc.
---    local panel = self:findObj("controlpanel")
---```
---@param args string the name(s) to search for. Just like targeting objects ingame, can use multiple words to get exact matches against an object with multiple keywords.
---@param asChar Character Optional, the character to search as. If specified, matches names as this character would see them and will not return objects they can't see.
---@return Object # a valid matching target, or nil if no match was found
function Room:findObj (args, asChar) end

---convenient handle to use the Agent within a room to perform actions
---@param command string # command to force the agent to perform
function Room:force (command) end

---get an iterator over furniture in the room
---
---Usage:
---```
---    for furn in room:furniture() do
---    -- do something
---    end
---```
---@return Furniture # an iterator of Furniture
function Room:furniture () end

---returns the first character found in this room with the given vnum.
---@return Character # the first character in this room with the given vnum, or nil if none are there
function Room:getCharByVNum () end

---return the room's description
---@return string # the room's description, including color codes
function Room:getDescription () end

---get an exit by keyword/direction.
---@param name string the direction or exit keyword
---@return Exit # an exit matching the name, or nil if one could not be found.
function Room:getExit (name) end

---return the area containing the room
---@return Area # the area containing the room
function Room:getInArea () end

---return the ship this room is part of
---@return Ship # the ship containing the room, or nil if it's not part of a ship
function Room:getInShip () end

---return the structure this room is part of
---@return Structure # the structure containing the room, or nil if it's not part of a structure
function Room:getInStructure () end

---return the maximum ship class number for this room
---@return number # the maximum ship class supported by this room
function Room:getMaxShipClass () end

---return the minimum ship class number for this room
---@return number # the minimum ship class supported by this room
function Room:getMinShipClass () end

---return the room's name
---@return string # the room's name, including color codes
function Room:getName () end

---get the planet for this room.
---@return Planet # the planet the room is on, or nil if not on one
function Room:getOnPlanet () end

---gets a table of the currently accessible exits from a room (no closed door, not window or hidden)
---
---Usage:
---```
---    -- For a mob lprog, we want our mob to wander randomly, so pick a random available mob-friendly exit.
---    self:onRandom(100, function(self)
---    local room = self:getInRoom()
---    local exits = room:getOpenExits(true)
---    -- No available exits? Do nothing.
---    if #exits == 0 then return end
---    -- Pick a random exit, then force the mob to use the exit direction command.
---    local randomExit = exits[math.random(#exits)]
---    self:force(randomExit:getName())
---    end)
---```
---@param forMob boolean if true, only returns exits which mobs are allowed through (exit and target room aren't flagged nomob)
---@return table # the list of exits matching from this room, empty if none were valid
function Room:getOpenExits (forMob) end

---return the ship size capacity for this room.
---Accounts for the redit-based size limit, not any hangar size limit for ships.
---@return number # the total number of combined ship size supported by this room
function Room:getShipCapacity () end

---return the combined size of all ships and frames in the room.
---@return number # the combined size of all ships and frames in the room
function Room:getShipSizeUsed () end

---return the room's vnum
---@return number # the room's vnum
function Room:getVNum () end

---get a room's variable by name
---@param varName string the name of the variable to get
---@param default any an optional default value (string, number, or boolean) to return if the variable is unset
---@return boolean|number|string|nil # the value, or the default or nil if it's not set. Can be a bool, number, or string.
function Room:getVar (varName, default) end

---get the remaining time on a room's variable, by name
---@param varName string the name of the variable whose timer you want to get
---@return integer|nil # the integer value of seconds remaining in the timer, or 0 if it's expired, or nil if the variable is not set.
function Room:getVarTimer (varName) end

---get whether a flag is set on this room.
---
---Usage:
---```
---    if room:hasFlag("silence") do
---    ch:echoAt("You can't hear anything!")
---    end
---```
---@param flag string The flag to check for
---@return boolean # True if the flag is set, false otherwise
function Room:hasFlag (flag) end

---registers a hook function to run when a character gets knocked out due to damage
---
---Usage:
---```
---    self:hookKnockout(function(self, ch)
---    -- boost hp so they don't go down
---    ch:setHP(100)
---    ch:echoAt("You feel a surge of adrenaline and manage to stay on your feet!")
---    return true
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Room 2. the Character who was knocked out the command    
---@return boolean # true if the hook should supercede the default behavior, false otherwise
function Room:hookKnockout (callback) end

---returns whether this room is accessible by hail or public landing pad.
---@return boolean # true if there's a path to a hail point or public landing pad, false otherwise
function Room:isPublicSpace () end

---get an iterator over objects in the room
---
---Usage:
---```
---    for obj in room:objects() do
---    -- do something
---    end
---```
---@return Object # an iterator of Object
function Room:objects () end

---registers a function to run when the given action message is shown in the room.
---
---Usage:
---```
---    self:onAct("grips the piloting controls", function(self, actor, fullText)
---    actor:echoAt("The console beeps loudly and the controls are disabled.")
---    actor:force("pilot")
---    end)
---```
---@param message string the message to trigger on
---@param callback function  the function to run, taking arguments: 1. this Room 2. the Character who did the action 3. the full text of the action message       
function Room:onAct (message, callback) end

---registers a function to run when a character (player or NPC) enters a custom command.
---
---Usage:
---```
---    self:onCommand("keypad", function(self, ch, argument)
---    ch:echoAt("You input the following code into the keypad: "..argument)
---    end)
---```
---@param command string the command name
---@param callback function  the function to run, taking arguments: 1. the Room 2. the Character who entered the command 3. the argument they entered to the command, if any       
function Room:onCommand (command, callback) end

---registers a function to run when a character (player or NPC) enters a room.
---
---Usage:
---```
---    self:onEnter(function(self, ch, fromRoom)
---    ch:echoAt("As you enter from "..fromRoom:getName()..", you notice something interesting!")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Room 2. the Character entering the room 3. the Room they came from       
function Room:onEnter (callback) end

---registers a function to run when a character (player or NPC) leaves a room.
---
---Usage:
---```
---    self:onLeave(function(self, ch, toRoom)
---    ch:echoAt("Right before you leave for "..toRoom:getName()..", you hear a loud noise!")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Room 2. the Character entering the room       
function Room:onLeave (callback) end

---registers a function to run when a character looks, either at the room or a given keyword.
---
---Usage:
---```
---    self:onLook("", function(self, ch)
---    ch:echoAt("As you look around, you notice something strange behind the &kcurtain&k.")
---    end)
---    self:onLook("curtain", function(self, ch)
---    ch:echoAt("You look behind the curtain and find a hidden treasure!")
---    end)
---```
---@param keyword string the keyword the character must look at to trigger the function. To trigger on using just plain "look", including when they enter a room, use an empty string. If it's not empty, this will only be matched if nothing else in the room matched the same keyword.
---@param callback function the function to run, taking arguments: 1. the Room 2. the Character who looked
function Room:onLook (keyword, callback) end

---registers a function with a chance to run every main tick (52-87 seconds, random).
---
---Usage:
---```
---    self:onRandom(25, function(self)
---    -- Do stuff
---    end)
---```
---@param chance integer the chance, 1-100, that the trigger will fire on a given tick
---@param callback function  the function to run, taking arguments: 1. this Room       
function Room:onRandom (chance, callback) end

---registers a function to run when the given text is spoken in the room.
---
---Usage:
---```
---    self:onSpeech("activate", function(self, speaker, fullText)
---    speaker:echoAt("The trash compactor whirs as it activates.")
---    end)
---```
---@param message string the message to trigger on
---@param callback function  the function to run, taking arguments: 1. this Room 2. the Character who spoke 3. the full text spoken       
function Room:onSpeech (message, callback) end

---registers a function to run every time the hour changes to a certain value.
---
---Usage:
---```
---    self:onTime(6, function(self)
---    -- Do something at 6am every day
---    end)
---```
---@param hour integer the hour of day to trigger at, 0-23
---@param callback function  the function to run, taking arguments: 1. this Room       
function Room:onTime (hour, callback) end

---registers a function to run when a character drop an object in the room.
---
---Usage:
---```
---    self:onDrop(function(self, obj, ch)
---    ch:echoAt("An alarm rings out and a voice blares over the loudspeaker blaming you for littering "..obj:getShortDescription())
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Room 2. the Object which was dropped 3. the Character dropping the object       
function Room:onDrop (callback) end

---sets up a voice-activated locked door.
---All optional arguments can be omitted or set to nil.
---After the accessCheck, four additional strings can be given to control:
---1. The message to show in the speaker's room when the door opens. (Optional, uses a default message if not set.)
---2. The message to show in the speaker's room when the door closes. (Optional, uses a default message if not set.)
---3. The message to show in the other room when the door opens. (Optional, uses the doorOpenMessage if not set.)
---4. The message to show in the other room when the door closes. (Optional, uses the doorCloseMessage if not set.)
---
---Usage:
---```
---    -- Set up a basic access door which works for everyone
---    self:setAccessDoor("north")
---    -- Set up an access door to the east which uses custom keywords
---    self:setAccessDoor("east", "east letmein")
---    -- Set up an access door to the north which uses default keywords but only allows
---    -- characters with the "myArea.hasDoorAccess" variable set to true.
---    self:setAccessDoor("north", nil, function(ch)
---    if ch:getVar("myArea.hasDoorAccess") == true then
---    -- You can use this opportunity to add any echoes you want.
---    self:echo("&cThe door panel blinks green and chimes pleasantly.")
---    return true
---    else
---    -- This function should handle any 'access denied' output appropriately.
---    self:echo("&zThe door panel issues a loud warning: &RAccess Denied")
---    return false
---    end
---    end)
---    -- Set up an access door on the up exit using default keywords, no access check,
---    -- but custom open/close messages
---    self:setAccessDoor("up", nil, nil,
---    "The manhole cover sides out of the way automatically.",
---    "Grinding loudly, the manhole cover is replaced, blocking the way up.",
---    "The manhole cover in the middle of the street spontaneously slides out of view!",
---    "Just as quickly as it opened, the manhole cover slides closed again."
---    )
---```
---@param dir string the name of the exit (n, north, etc)
---@param keywords string the list of words to trigger the door. (Optional, uses " access enter entry" if not set.)
---@param accessCheck function  A function which determines whether a character can use the door. (Optional, use nil if not specifying.)       
function Room:setAccessDoor (dir, keywords, accessCheck) end

---sets up a voice-activated locked door which works for members of the given clan.
---As with setAccessDoor, optional arguments can be sent after the keywords arg to control the messages:
---1. The message to show to the speaker's room when access is granted. Empty string can be used to suppress. (Optional, uses a default if not set.)
---2. The message to show to the speaker's room when access is denied. Empty string can be used to suppress. (Optional, uses a default if not set.)
---3. The message to show in the speaker's room when the door opens. (Optional, uses a default message if not set.)
---4. The message to show in the speaker's room when the door closes. (Optional, uses a default message if not set.)
---5. The message to show in the other room when the door opens. (Optional, uses the doorOpenMessage if not set.)
---6. The message to show in the other room when the door closes. (Optional, uses the doorCloseMessage if not set.)
---
---Usage:
---```
---    -- Set up a basic access door which works for everyone in the Galactic Empire
---    self:setClanAccessDoor("north", nil, "The Galactic Empire")
---    -- Set up a basic access door which works for everyone in the Galactic Empire, with custom messages
---    self:setClanAccessDoor("north", nil, "The Galactic Empire",
---    "", -- No happy message when it works. This is the Empire, after all.
---    "&zA harsh voice barks out, \"&REntry is only permitted to Imperial personnel!&z\""
---    )
---```
---@param dir string the name of the exit (n, north, etc)
---@param keywords string the list of words to trigger the door. (Optional, uses " access enter entry" if not set.)
---@param clanName string the clan which the door works for
function Room:setClanAccessDoor (dir, keywords, clanName) end

---chooses a random player in the room and returns them.
---@return Character # the randomly picked player character, or nil if there were no players
function Room:randomPlayer () end

---set the description of a room.
---@param description string the new description
function Room:setDescription (description) end

---set a flag on this room.
---
---Usage:
---```
---    room:setFlag("silence", true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
function Room:setFlag (flag, value) end

---set the name of a room.
---@param name string the new name
function Room:setName (name) end

---set a variable on a room
---@param varName string the name of the variable to set
---@param value any the value, a string, number, or boolean. Pass in nil here to remove a variable.
---@param ttl number the number of seconds to keep the variable, in seconds. (optional, if not specified it's kept indefinitely)
function Room:setVar (varName, value, ttl) end

---get an iterator over ships in the room
---
---Usage:
---```
---    for ship in room:ships() do
---    -- do something
---    end
---```
---@return Ship # an iterator of Ship
function Room:ships () end

---sets up a voice-activated locked door which works for leader/first/second of the given clan.
---As with setAccessDoor, optional arguments can be sent after the keywords arg to control the messages:
---1. The message to show to the speaker's room when access is granted. Empty string can be used to suppress. (Optional, uses a default if not set.)
---2. The message to show to the speaker's room when access is denied. Empty string can be used to suppress. (Optional, uses a default if not set.)
---3. The message to show in the speaker's room when the door opens. (Optional, uses a default message if not set.)
---4. The message to show in the speaker's room when the door closes. (Optional, uses a default message if not set.)
---5. The message to show in the other room when the door opens. (Optional, uses the doorOpenMessage if not set.)
---6. The message to show in the other room when the door closes. (Optional, uses the doorCloseMessage if not set.)
---
---Usage:
---```
---    -- Set up a basic access door which works for leaders in the Galactic Empire
---    self:setClanLeaderAccessDoor("north", nil, "The Galactic Empire")
---    -- Set up a basic access door which works for leaders in the Galactic Empire, with custom messages
---    self:setClanLeaderAccessDoor("north", nil, "The Galactic Empire",
---    "&zA speaker says, \"&GImperial vault access granted.&z\"",
---    "&zA harsh voice barks out, \"&RVault access denied!&z\""
---    )
---```
---@param dir string the name of the exit (n, north, etc)
---@param keywords string the list of words to trigger the door. (Optional, uses " access enter entry" if not set.)
---@param clanName string the clan which the door works for. Use "local" to check the current planet government.
function Room:setClanLeaderAccessDoor (dir, keywords, clanName) end

