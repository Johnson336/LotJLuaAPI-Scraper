---@meta Shiptemplate
---
---Functions for ship templates, including triggers
---@class Shiptemplate
Shiptemplate = {}

---returns the basename for this ship template.
---
function Shiptemplate:getBaseName () end

---registers a function to run when a ship is placed in a system via a space spawn.
---
function Shiptemplate:onSpawned (callback) end

---returns the filename for this ship template
---
function Shiptemplate:getFilename () end

---registers a function to run when a ship is destroyed.
---
function Shiptemplate:onDestroyed (callback) end

---registers a function to run when a ship is first built or created.
---
function Shiptemplate:onCreate (callback) end

---registers a function to run every space tick (20 seconds, when the space prompt shows).
---
function Shiptemplate:onTick (callback) end

---registers a function to run when a ship is targeted by another ship.
---
function Shiptemplate:onTargeted (callback) end

