---@meta Planet
---
---Functions for planets
---@class Planet
Planet = {}

---finds any planet by name
---@param name string the planet name.
---@return Planet # the planet, or nil if not found
function Planet.getFromName (name) end

---modifies (up or down) military presence for clan.
---@param clan Clan the clan to modify military presence for.
---@param diff number the amount to add. Use a negative number to lower presence.
function Planet:addMilitaryPresence (clan, diff) end

---get an iterator over areas on the planet.
---
---Usage:
---```
---    for area in planet:areas() do
---    -- do something
---    end
---```
---@return Area # an iterator of Area
function Planet:areas () end

---returns the description of the planet.
---@return string # the planet description
function Planet:getDescription () end

---returns the clan currently governing the planet.
---@return Clan # the clan who owns the planet, or nil if none is set.
function Planet:getGovernedBy () end

---returns the current military funding level of the planet.
---@return number # the planet's current military funding level.
function Planet:getMilitary () end

---modifies (up or down) public opinion of a clan.
---This always shows in smalltalk under the "Special Events" category.
---@param clan Clan the clan to modify opinion of.
---@param diff number the amount to add. Use a negative number to lower opinion.
function Planet:addPublicOpinion (clan, diff) end

---returns the crime level of the planet.
---@return number # the planet's crime level
function Planet:getCrime () end

---returns the current military presence of the given clan on this planet.
---@param clan Clan the clan to get military presence for.
---@return number # the clan's current military presence here.
function Planet:getMilitaryPresence (clan) end

---returns the police alert level of the planet.
---@return number # the planet's police alert level
function Planet:getPoliceAlert () end

---get the planet's position within system
---
---Usage:
---```
---    local x, y, z = planet:getPosition()
---```
---@return number # the planet's x coordinate
---@return number # the planet's y coordinate
---@return number # the planet's z coordinate
function Planet:getPosition () end

---returns the name of the planet.
---@return string # the planet name
function Planet:getName () end

---returns the current public opinion of the given clan on this planet.
---@param clan Clan the clan to get opinion of.
---@return number # the clan's current public opinion here.
function Planet:getPublicOpinion (clan) end

---returns the current population of the planet.
---@return number # the planet's current population
function Planet:getPopulation () end

---tries to find a random public room on this planet.
---This can return any room in any area on the planet which is pathable to a public landing pad or hail point.
---@return Room # a room if found, or nil if none could be found after 100 attempts
function Planet:getRandomPublicRoom () end

---get the list of resource names bought or sold on this planet.
---
---Usage:
---```
---    for _, resName in ipairs(planet:getResourceNames()) do
---    -- do stuff
---    end
---```
---@return table # A table of resource name strings
function Planet:getResourceNames () end

---get the price history for a given resource on this planet.
---The output is a table which indicates the price over each recorded price tick, about 30
---minutes apart on average.
---
---Usage:
---```
---    for _, price in ipairs(planet:getResourcePriceHistory("goods")) do
---    -- do stuff
---    end
---```
---@param resource string The name of the resource.
---@return table # A table of resource prices over each recorded price tick
function Planet:getResourcePriceHistory (resource) end

---get the settings for a given resource on this planet.
---
---Usage:
---```
---    local mode, current, min, max = planet:getResource("goods")
---```
---@param resource string The name of the resource.
---@return number # The mode for the resource: "none", "import", or "export"
---@return number # The current price
---@return number # The minimum natural price
---@return number # The maximum natural price
function Planet:getResource (resource) end

---get the planet's starsystem
---@return Starsystem # the planet's starsystem
function Planet:getStarsystem () end

---returns an iterator over all planets (including stars and moons, so check for flags).
---
---Usage:
---```
---    for planet in Planet:all() do
---    -- do something
---    end
---```
---@return Planet # an iterator of Planet
function Planet.all () end

---returns whether the planet currently has the given event running.
---
---Usage:
---```
---    if planet:hasActiveEvent("holiday") do 
---    ch:say("We're on holiday!") 
---    end
---```
---@param eventType string The type of event, as a string.
---@return boolean # True if the event is active, false otherwise.
function Planet:hasActiveEvent (eventType) end

---get whether a flag is set on this planet.
---
---Usage:
---```
---    if planet:hasFlag("freeport") do
---    ch:echoAt("You can trade cargo here.")
---    end
---```
---@param flag string The flag to check for
---@return boolean # True if the flag is set, false otherwise
function Planet:hasFlag (flag) end

---returns the tax rate percentage of the planet (0-100).
---@return number # the planet's tax rate
function Planet:getTaxRate () end

---set the crime level of the planet.
---
---Usage:
---```
---    planet:setCrime(planet:getCrime()+10)
---```
---@param number any the new crime level
function Planet:setCrime (number) end

---sets military funding level of the planet.
---@param level number the new military funding level to set.
function Planet:setMilitary (level) end

---sets the military presence for a clan.
---@param clan Clan the clan to set military presence for.
---@param diff number the new military presence.
function Planet:setMilitaryPresence (clan, diff) end

---set a flag on this planet.
---
---Usage:
---```
---    planet:setFlag("freeport", true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
function Planet:setFlag (flag, value) end

---sets the 'special events' public opinion effect for a clan.
---This always shows in smalltalk under the "Special Events" category.
---Note that the value set here won't be their final opinion.
---It will still be modified up or down by other effects on the planet.
---@param clan Clan the clan to set opinion of.
---@param diff number the new special events effect amount.
function Planet:setPublicOpinion (clan, diff) end

---set the price of a resource on this planet.
---
---Usage:
---```
---    -- Set the price of goods to 12.5 and to randomly float around between 10 and 15 over time
---    planet:setResource("goods", 10, 12.5, 15)
---```
---@param resource string The name of the resource.
---@param curPrice number The minimum price
function Planet:setResourcePrice (resource, curPrice) end

