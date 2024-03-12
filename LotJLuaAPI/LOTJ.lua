---@meta LOTJ
---
---Global utility and debugging functions
---@class LOTJ
LOTJ = {}

---send a message to the RPC channel
---
---Usage:
---```
---    LOTJ.councilnet("Nield", "Oopsy daisy. I think I need a restore.")
---```
---@param source string The source of the message, like Nield or The Galactic Empire
---@param message string The text of the message
function LOTJ.councilnet (source, message) end

---get the current date
---
function LOTJ.date () end

---send a message to the debug channel
---@param msg string the text to debug. Use chan +debug filter *keyword* to view, where keyword is a unique word included in your message.
function LOTJ.debug (msg) end

---produces an error, causing the current lua program to crash
---@param error string the text to include as the error message
function LOTJ.error (error) end

---get the current era number.
---@return integer # the current era number.
function LOTJ.getEra () end

---get a global variable by name
---@param varName string the name of the variable to get
---@param default any an optional default value (string, number, or boolean) to return if the variable is unset
---@return boolean|number|string|nil # the value, or the default or nil if it's not set. Can be a bool, number, or string.
function LOTJ.getGlobalVar (varName, default) end

---make a public broadcast
---
---Usage:
---```
---    LOTJ.broadcast("GNN", "Breaking news! Ewoks have stormed the capitol building on Corellia!")
---```
---@param source string The source of the broadcast, like GNN or Invisible Market
---@param message string The text of the broadcast
function LOTJ.broadcast (source, message) end

---send a message to immchat
---
---Usage:
---```
---    LOTJ.immchat("Nield", "How much wood could a wood chuck chuck if the wood chuck had 110 force levels?")
---```
---@param source string The source of the message, like Nield or The Galactic Empire
---@param message string The text of the message
function LOTJ.immchat (source, message) end

---checks if 256 color int value is mapped to a base color value
---@param number integer the color value
---@param color string the color name
---@return boolean # true if the color value is part of the base color, false otherwise
function LOTJ.isColor (number, color) end

---get a global variable by name
---@param varName string the name of the variable whose timer to get
---@return integer|nil # the integer value of seconds remaining in the timer, or 0 if it's expired, or nil if the variable is not set.
function LOTJ.getGlobalVarTimer (varName) end

---send a message to the log channel
---@param msg string the text to log
function LOTJ.log (msg) end

---check if the given arguments match a list of keywords
---
---Usage:
---```
---    if LOTJ.keywordCheck("imperial stormtrooper", otherCh:getName()) then
---    LOTJ.log("otherCh matched imperial stormtrooper")
---    end
---```
---@param args string the names to search for
---@param keywords string the keywords to look in, for example the name field on an object or character
---@return boolean # true if the args are found in the keywords, false otherwise
function LOTJ.keywordCheck (args, keywords) end

---callback when the mud boots up, or the script loads, whichever is later
---@param callback function  the function to call        
function LOTJ.onReady (callback) end

---takes a natural language date/time and returns an int value
---@param the string date/time
---@return integer # the time value (compatible with C-side functions)
function LOTJ.setDateTime (the) end

---set a global variable
---@param varName string the name of the variable to set. It must include a namespace, preferably the name of the area setting it, like "wroona.myVar"
---@param value any the value, a string, number, or boolean. Pass in nil here to remove a variable.
---@param ttl number the number of seconds to keep the variable, in seconds. (optional, if not specified it's kept indefinitely)
function LOTJ.setGlobalVar (varName, value, ttl) end

---remove all color codes from a string
---@param orig string the original text, with color codes
---@return string # the string with all color codes removed
function LOTJ.stripColor (orig) end

---get the current time
---
function LOTJ.time () end

---write to persistent logs (the logs/showlog system)
---
---Usage:
---```
---    LOTJ.writeToLog("hypermatter", "Spawned a new hypermatter ship!", 103)
---```
---@param keyword string the name of the keyword to log to
---@param content string the content to write to the log
---@param level number the minimum level to view the log (typically 103)
function LOTJ.writeToLog (keyword, content, level) end

