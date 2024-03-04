---@meta Clan
---
---Functions for clans
---@class Clan
Clan = {}

---get a clan by name.
---
function Clan.getFromName (name) end

---add or substract from clan funds.
---
function Clan:addFunds (amount, who, reason) end

---get the clan's capital planet
---
function Clan:getCapital () end

---get the colored name of the clan.
---
function Clan:getColorname () end

---get the name of the clan's first.
---
function Clan:getFirst () end

---send a message to all members of the clan.
---
function Clan:echoToMembers (message) end

---get current clan funds.
---
function Clan:getFunds () end

---get the clan's description
---
function Clan:getDescription () end

---get the name of the clan.
---
function Clan:getName () end

---get the name of the clan's leader.
---
function Clan:getLeader () end

---get the shortname of the clan.
---
function Clan:getShortname () end

---get the name of the clan's second.
---
function Clan:getSecond () end

---get the clan type (e.g., government, engineering, etc.)
---
function Clan:getType () end

---get the list of clans this clan is at war with
---
function Clan:getAtWar () end

---get whether a flag is set on this clan.
---
function Clan:hasFlag (flag) end

---set a flag on this clan.
---
function Clan:setFlag (flag, value) end

