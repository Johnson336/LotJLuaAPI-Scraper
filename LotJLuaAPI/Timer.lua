---@meta Timer
---
---Functions for handling timers (running code after a delay)
---@class Timer
Timer = {}

---register a new timer.
---This returns a timer object which must the be started.
---For most usage in lua progs, Timer.run will be simpler to use.
---
---Usage:
---```
---    Timer.registerTimer(1000, false, function()
---    self:sayTo(ch, "Hello there, welcome to the room.")
---    end):start()
---```
---@param delayMs number the number of milliseconds to wait
---@param Repeat boolean if true, the timer will continue firing every delayMs. If false, it will fire only once.
---@param fn function  the function to run when the timer fires.    
---@return Timer # the newly registered timer
function Timer.registerTimer (delayMs, Repeat, fn) end

---Runs a function once after some delay.
---
---Usage:
---```
---    self:onSpeech("help", function(self, ch)
---    -- Wait 3 seconds, then respond to the character.
---    Timer.run(3000, function()
---    self:sayTo(ch, "Oh, you can help me?")
---    self:sayTo(ch, "I need ten pieces of nerf meat.")
---    end)
---    end)
---```
---@param delayMs number The number of milliseconds to wait
---@param fn function  The function to run    
---@return Timer # The timer object, in case you need to cancel it
function Timer.run (delayMs, fn) end

---start a timer object.
---
function Timer:start () end

---cancel a timer object.
---
function Timer:cancel () end

