---@meta Planet
---
---Functions for planets
---@class Planet
Planet = {}

---returns an iterator over all planets (including stars and moons, so check for flags).
---
function Planet.all () end

---finds any planet by name
---
function Planet.getFromName (name) end

---modifies (up or down) military presence for clan.
---
function Planet:addMilitaryPresence (clan, diff) end

---get an iterator over areas on the planet.
---
function Planet:areas () end

---returns the description of the planet.
---
function Planet:getDescription () end

---returns the crime level of the planet.
---
function Planet:getCrime () end

---returns the clan currently governing the planet.
---
function Planet:getGovernedBy () end

---returns the current military funding level of the planet.
---
function Planet:getMilitary () end

---returns the current military presence of the given clan on this planet.
---
function Planet:getMilitaryPresence (clan) end

---returns the name of the planet.
---
function Planet:getName () end

---modifies (up or down) public opinion of a clan.
---
function Planet:addPublicOpinion (clan, diff) end

---returns the current population of the planet.
---
function Planet:getPopulation () end

---tries to find a random public room on this planet.
---
function Planet:getRandomPublicRoom () end

---get the planet's position within system
---
function Planet:getPosition () end

---get the settings for a given resource on this planet.
---
function Planet:getResource (resource) end

---get the price history for a given resource on this planet.
---
function Planet:getResourcePriceHistory (resource) end

---get the list of resource names bought or sold on this planet.
---
function Planet:getResourceNames () end

---returns the current public opinion of the given clan on this planet.
---
function Planet:getPublicOpinion (clan) end

---get the planet's starsystem
---
function Planet:getStarsystem () end

---returns the tax rate percentage of the planet (0-100).
---
function Planet:getTaxRate () end

---returns the police alert level of the planet.
---
function Planet:getPoliceAlert () end

---get whether a flag is set on this planet.
---
function Planet:hasFlag (flag) end

---set the crime level of the planet.
---
function Planet:setCrime (number) end

---returns whether the planet currently has the given event running.
---
function Planet:hasActiveEvent (eventType) end

---set a flag on this planet.
---
function Planet:setFlag (flag, value) end

---sets military funding level of the planet.
---
function Planet:setMilitary (level) end

---sets the military presence for a clan.
---
function Planet:setMilitaryPresence (clan, diff) end

---set the price of a resource on this planet.
---
function Planet:setResourcePrice (resource, curPrice) end

---sets the 'special events' public opinion effect for a clan.
---
function Planet:setPublicOpinion (clan, diff) end

