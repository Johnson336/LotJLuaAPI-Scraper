---@meta Clan
---
---Functions for clans
---@class Clan
Clan = {}

---get a clan by name.
---@param name string the clan name
---@return Clan # the clan, or nil if not found
function Clan.getFromName (name) end

---send a message to all members of the clan.
---
---Usage:
---```
---    clan:echoToMembers("Attention: {1} has joined your clan.", newCh)
---```
---@param message string The message to echo.
function Clan:echoToMembers (message) end

---get the list of clans this clan is at war with
---@return string # the list of clans this clan is at war with
function Clan:getAtWar () end

---get the colored name of the clan.
---@return string # the colored name of the clan
function Clan:getColorname () end

---get the clan's description
---@return string # the clan's description
function Clan:getDescription () end

---get the name of the clan's first.
---@return string # clan first's name, or nil if not set
function Clan:getFirst () end

---get current clan funds.
---@return integer # the current clan funds
function Clan:getFunds () end

---get the name of the clan's leader.
---@return string # clan leader's name, or nil if not set
function Clan:getLeader () end

---get the clan's capital planet
---@return Planet # capital the clan's capital, or nil if not set
function Clan:getCapital () end

---add or substract from clan funds.
---@param amount integer the amount to add. Negative amounts will subtract from the balance.
---@param who string the name to use for a banklog entry. Optional; if not specified, no banklog entry will be made.
---@param reason string the reason to use for a banklog entry. Optional.
function Clan:addFunds (amount, who, reason) end

---get the name of the clan's second.
---@return string # clan second's name, or nil if not set
function Clan:getSecond () end

---get the name of the clan.
---@return string # the clan name
function Clan:getName () end

---get whether a flag is set on this clan.
---@param flag string The flag name to check for
---@return boolean # True if the flag is set, false otherwise
function Clan:hasFlag (flag) end

---get the clan type (e.g., government, engineering, etc.)
---@return string # the clan type
function Clan:getType () end

---set a flag on this clan.
---
---Usage:
---```
---    clan:setFlag("hidden", true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
function Clan:setFlag (flag, value) end

---get the shortname of the clan.
---@return string # the short clan name
function Clan:getShortname () end

