---@meta Objproto
---
---Functions for object prototypes, including triggers
---@class Objproto
Objproto = {}

---registers a function to run when the given action message is shown in the object's room.
---
function Objproto:onAct (message, callback) end

---registers a function to run when a character (player or NPC) enters a custom command.
---
function Objproto:onCommand (command, callback) end

---registers a function to run after a character drops this object.
---
function Objproto:onDrop (callback) end

---registers a function to run after an object gets damaged.
---
function Objproto:onDamage (callback) end

---registers a function to run after a character gets this object from the room.
---
function Objproto:onGet (room, callback) end

---registers a function to run when a character enters the room.
---
function Objproto:onGreet (callback) end

---registers a function to run after a button object is pulled.
---
function Objproto:onPull (callback) end

---registers a function to run after a character examines this object.
---
function Objproto:onExamine (callback) end

---registers a function with a chance to run every main tick (52-87 seconds, random).
---
function Objproto:onRandom (chance, callback) end

---registers a function to run after a button object is pushed.
---
function Objproto:onPush (callback) end

---registers a function to run when the given text is spoken in the room.
---
function Objproto:onSpeech (message, callback) end

---registers a function to run after a character unequips this object.
---
function Objproto:onRemove (callback) end

---registers a function to run after an object is used.
---
function Objproto:onUse (callback) end

---registers a function to run every time the hour changes to a certain value.
---
function Objproto:onTime (hour, callback) end

---registers a function to run after a character equips this object.
---
function Objproto:onWear (callback) end

