---@meta Area
---
---Functions for areas
---@class Area
Area = {}

---Saves the area, useful after changing room flags or variables.
---
function Area:fold () end

---Get the area's display name
---
function Area:getName () end

---returns the clan currently assigned to the area.
---
function Area:getClan () end

---Get a map of hail names to their rooms
---
function Area:hails () end

---Get the area's filename
---
function Area:getFilename () end

---get an iterator over rooms in the area.
---
function Area:rooms () end

