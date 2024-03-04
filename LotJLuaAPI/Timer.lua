---@meta Timer
---
---Functions for handling timers (running code after a delay)
---@class Timer
Timer = {}

---register a new timer.
---
function Timer.registerTimer (delayMs, Repeat, fn) end

---Runs a function once after some delay.
---
function Timer.run (delayMs, fn) end

---start a timer object.
---
function Timer:start () end

---cancel a timer object.
---
function Timer:cancel () end

