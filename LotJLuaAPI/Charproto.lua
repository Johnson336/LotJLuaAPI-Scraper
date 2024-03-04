---@meta Charproto
---
---Functions for mob prototypes, including triggers
---@class Charproto
Charproto = {}

---Gets the description for the mob prototype.
---
function Charproto:getDescription () end

---registers a function to run when the given action message is shown to the mob.
---
function Charproto:onAct (message, callback) end

---Gets the name for the mob prototype.
---
function Charproto:getName () end

---registers a function to run each time the mob is damaged.
---
function Charproto:onDamage (callback) end

---registers a function to run when a mob is killed.
---
function Charproto:onDeath (callback) end

---registers a function to run whenever the mob itself enters a new room.
---
function Charproto:onEnter (callback) end

---registers a function to run during each combat round the mob is in.
---
function Charproto:onFight (callback) end

---registers a function to run every time any object is given to this character.
---
function Charproto:onGive (callback) end

---registers a function to run when another character enters the room.
---
function Charproto:onGreet (callback) end

---registers a function to run when a character looks at this one.
---
function Charproto:onLook (callback) end

---registers a function with a chance to run every mob tick (10 seconds).
---
function Charproto:onRandom (chance, callback) end

---registers a function to run when something is said to a mob using sayto
---
function Charproto:onSayto (callback) end

---registers a function to run when a mob is spawned via reset.
---
function Charproto:onSpawned (callback) end

---registers a function to run when the given number of credits is given to the character.
---
function Charproto:onBribe (amount, callback) end

---registers a function to run every time the hour changes to a certain value.
---
function Charproto:onTime (hour, callback) end

---set the full description for a mob prototype.
---
function Charproto:setDescription (desc) end

---set the name for a mob prototype.
---
function Charproto:setName (name) end

---registers a function to run when the given text is spoken in the room.
---
function Charproto:onSpeech (message, callback) end

