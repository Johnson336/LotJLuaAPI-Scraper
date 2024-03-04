---@meta LOTJ
---
---Global utility and debugging functions
---@class LOTJ
LOTJ = {}

---make a public broadcast
---
function LOTJ.broadcast (source, message) end

---get the current date
---
function LOTJ.date () end

---send a message to the debug channel
---
function LOTJ.debug (msg) end

---send a message to the RPC channel
---
function LOTJ.councilnet (source, message) end

---get the current era number.
---
function LOTJ.getEra () end

---produces an error, causing the current lua program to crash
---
function LOTJ.error (error) end

---get a global variable by name
---
function LOTJ.getGlobalVar (varName, default) end

---get a global variable by name
---
function LOTJ.getGlobalVarTimer (varName) end

---checks if 256 color int value is mapped to a base color value
---
function LOTJ.isColor (number, color) end

---check if the given arguments match a list of keywords
---
function LOTJ.keywordCheck (args, keywords) end

---send a message to the log channel
---
function LOTJ.log (msg) end

---takes a natural language date/time and returns an int value
---
function LOTJ.setDateTime (the) end

---callback when the mud boots up, or the script loads, whichever is later
---
function LOTJ.onReady (callback) end

---remove all color codes from a string
---
function LOTJ.stripColor (orig) end

---set a global variable
---
function LOTJ.setGlobalVar (varName, value, ttl) end

---get the current time
---
function LOTJ.time () end

---write to persistent logs (the logs/showlog system)
---
function LOTJ.writeToLog (keyword, content, level) end

---send a message to immchat
---
function LOTJ.immchat (source, message) end

