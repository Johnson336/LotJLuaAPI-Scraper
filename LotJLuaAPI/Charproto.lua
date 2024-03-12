---@meta Charproto
---
---Functions for mob prototypes, including triggers
---@class Charproto
Charproto = {}

---Gets the description for the mob prototype.
---@return string # the description value
function Charproto:getDescription () end

---Gets the name for the mob prototype.
---@return string # the name value
function Charproto:getName () end

---registers a function to run when the given action message is shown to the mob.
---
---Usage:
---```
---    self:onAct("begins drawing a bead on you!", function(self, actor, fullText)
---    actor:echoAt("You can't aim at me!")
---    end)
---```
---@param message string the message to trigger on
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Character who did the action 3. the full text of the action message       
function Charproto:onAct (message, callback) end

---registers a function to run when the given number of credits is given to the character.
---
---Usage:
---```
---    self:onBribe(10000, function(self, ch)
---    self:sayTo(ch, "Thank you for your patronage.")
---    self:awardCredits(-10000) -- Clean up the credits
---    end)
---```
---@param amount integer the number of credits required to trigger the bribe, exact match only
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Character who gave the credits       
function Charproto:onBribe (amount, callback) end

---registers a function to run each time the mob is damaged.
---This is called after the damage is applied.
---
---Usage:
---```
---    self:onDamage(function(self, ch, amount)
---    self:sayTo(ch, "You hit me for "..amount.." damage")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Character doing the damage (can be nil) 3. the amount of damage done (integer)       
function Charproto:onDamage (callback) end

---registers a function to run when a mob is killed.
---This is run while the mob technically still exists in the room where it died, so it can
---still interact with players and objects there.
---
---Usage:
---```
---    self:onDeath(function(self, byChar)
---    if not byChar then
---    return
---    end
---    byChar:echoAt("Good job, you killed "..self:getShortDescription().."!")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Character being killed 2. the Character who killed it (can be nil)       
function Charproto:onDeath (callback) end

---registers a function to run whenever the mob itself enters a new room.
---
---Usage:
---```
---    self:onEnter(function(self, oldRoom)
---    -- Do stuff
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Room it came from       
function Charproto:onEnter (callback) end

---registers a function to run during each combat round the mob is in.
---This runs every single round, so use math.rand in the function if you don't need it to happen every time.
---
---Usage:
---```
---    self:onFight(function(self, target)
---    target:echoAt("I'll win this fight yet!")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Character it's fighting       
function Charproto:onFight (callback) end

---registers a function to run every time any object is given to this character.
---
---Usage:
---```
---    self:onGive(function(self, obj, ch)
---    if obj:getVNum() == 1000 then
---    self:sayTo(ch, "Great, this is what I needed.")
---    else
---    self:sayTo(ch, "Huh? I don't want that.")
---    self:emote("returns "..obj:getShortDescription()..".")
---    obj:toChar(ch)
---    end
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Object given to the character 3. the Character who gave the object       
function Charproto:onGive (callback) end

---registers a function to run when another character enters the room.
---
---Usage:
---```
---    self:onGreet(function(self, target, fromRoom)
---    target:echoAt("You notice "..self:getShortDescription().." waving at you.")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Character who entered 3. the Room they came from       
function Charproto:onGreet (callback) end

---registers a function to run when a character looks at this one.
---
---Usage:
---```
---    self:onLook(function(self, ch)
---    self:sayTo(ch, "What are you looking at?")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Character who looked at this one       
function Charproto:onLook (callback) end

---registers a function with a chance to run every mob tick (10 seconds).
---
---Usage:
---```
---    self:onRandom(25, function(self)
---    -- Do stuff
---    end)
---```
---@param chance integer the chance, 1-100, that the trigger will fire on a given tick
---@param callback function  the function to run, taking arguments: 1. this Character       
function Charproto:onRandom (chance, callback) end

---registers a function to run when something is said to a mob using sayto
---
---Usage:
---```
---    self:onSayto(function(self, speaker, text)
---    self:force("say You said "..text.." to me!")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. the Character being said to 2. the Character doing the speaking 2. a string of what was said       
function Charproto:onSayto (callback) end

---registers a function to run when a mob is spawned via reset.
---Does not apply when it is invoked manually or via progs.
---
---Usage:
---```
---    self:onSpawned(function(self)
---    Object.invoke(170050):toChar(self)
---    self:force("wield sword")
---    end)
---```
---@param callback function  the function to run, taking arguments: 1. this Character       
function Charproto:onSpawned (callback) end

---registers a function to run when the given text is spoken in the room.
---
---Usage:
---```
---    self:onSpeech("assistance", function(self, speaker, fullText)
---    speaker:echoAt("Yeah, sure, I need some help with the womp rats in the warehouse.")
---    end)
---```
---@param message string the message to trigger on
---@param callback function  the function to run, taking arguments: 1. this Character 2. the Character who spoke 3. the full text spoken       
function Charproto:onSpeech (message, callback) end

---registers a function to run every time the hour changes to a certain value.
---
---Usage:
---```
---    self:onTime(6, function(self)
---    self:say("Good morning!")
---    end)
---```
---@param hour integer the hour of day to trigger at, 0-23
---@param callback function  the function to run, taking arguments: 1. this Character       
function Charproto:onTime (hour, callback) end

---set the name for a mob prototype.
---@param name string the new name
function Charproto:setName (name) end

---set the full description for a mob prototype.
---@param desc string the new description
function Charproto:setDescription (desc) end

