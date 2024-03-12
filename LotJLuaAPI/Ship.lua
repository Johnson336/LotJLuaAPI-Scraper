---@meta Ship
---
---Functions for ship instances
---@class Ship
Ship = {}
Ship.prototype = {}

---finds any ship by name
---@param name string the ship name, either the part in quotes or the whole thing
---@return Ship # the ship, or nil if not found
function Ship.getFromName (name) end

---Utility function to find a ship by name, or create one with the given template and owner if it's not found.
---Templates used in this function must have a basename set. All ships will be set to nodelete on the assumption
---that they may be reused and we don't want to waste vnums.
---@param templateName string The ship template name to create if the ship isn't found
---@param name string The ship name, not including model name
---@param owner string The ship owner to set if the ship needs to be created
---@return Ship # the ship
function Ship.getOrCreate (templateName, name, owner) end

---using the rooms iterator, generate an iterator for all the
---characters in a ship
function Ship.prototype.characters (self) end

---damage the ship with conventional damage (not ion).
---@param damage integer the amount of ion damage to do (affects shields 2x this much)
---@param byCharacter Character the character to attribute the damage to (optional)
---@return Ship # this ship, for call chaining
function Ship:damageIon (damage, byCharacter) end

---damage the ship with conventional damage (not ion).
---@param damage integer the amount of damage to do
---@param byCharacter Character the character to attribute the damage to (optional)
---@param byShip Ship the ship to attribute the damage to (optional)
---@return Ship # this ship, for call chaining
function Ship:damage (damage, byCharacter, byShip) end

---immediately destroy this ship.
---@param byCharacter Character the character to attribute the destruction to (optional)
---@param byShip Ship the ship to attribute the destruction to (optional)
function Ship:destroy (byCharacter, byShip) end

---create a ship from a ship template.
---The ship will be spawned in room 45 with no owner set, and should then be moved to the location you want
---@param template string the name of the template to use, as in xwing.img
---@param baseName string the base name of the ship ("X-Wing Starfighter"), optional if basename is set on the template.
---@return Ship # the created ship
function Ship.create (template, baseName) end

---echo to all ships in the system, visible to any players in cockpits/viewports/turrets/etc
---@param text string the text to echo
function Ship:echoToSystem (text) end

---disable a system on this ship.
---@param system string the system to disable (drive, ion, etc)
---@return Ship # this ship, for call chaining
function Ship:disableSystem (system) end

---echo a message to this ship, visible to any players in its cockpit/viewports/turrets/etc
---@param text string the text to echo
function Ship:echoAt (text) end

---get the ship's current autopilot status.
---@return boolean # true if autopilot is on
function Ship:getAutopilot () end

---returns current chaff.
---@return number # the current chaff
function Ship:getChaff () end

---get the ship's cockpit room
---@return Room # the ship's cockpit room
function Ship:getCockpit () end

---return the ship's blaster count
---@return number # the ship's blaster count
function Ship:getBlasters () end

---return the ship's comms
---@return number # the ship's comms
function Ship:getComms () end

---get the ship's class number, from 0 (fighter) to 10 (satellite)
---@return integer # the ship's class
function Ship:getClass () end

---get the ship's crew list
---@return string # the ship's current crew list, or empty string if none is set
function Ship:getCrew () end

---gets the ship (if any) docked to the ship
---@return Ship # the ship, or nil if not found
function Ship:getDockedShip () end

---get the ship's copilot name
---@return string # the ship's current copilot, or nil if none is set
function Ship:getCopilot () end

---get the ship's dock room
---@return Room # the ship's dock room
function Ship:getDockRoom () end

---Gets distance between this ship and another
---
---Usage:
---```
---    -- Go aggro on a ship if it's within 1000 prox
---    if self:distanceToShip(otherShip) < 1000 then
---    self:setTarget(otherShip)
---    end
---```
---@param other Ship The other ship to measure distance to
function Ship:distanceToShip (other) end

---get the ship's engine room
---@return Room # the ship's engine room
function Ship:getEngineRoom () end

---returns current energy.
---@return number # the current energy
function Ship:getEnergy () end

---get the vnum of the ship's first room
---@return number # the vnum of the ship's first room
function Ship:getFirstVNum () end

---get the ship's full name, including model name
---@return string # the ship's full name, for example X-Wing Starfighter 'Red 5'
function Ship:getFullName () end

---returns current hull.
---@return number # the current hull
function Ship:getHull () end

---get the ship's flags
---@return table # an table of all ship flag names to a boolean for this ship's value for it
function Ship:getFlags () end

---get the ship's gun seat room
---@return Room # the ship's gun seat room
function Ship:getGunSeat () end

---get the ship's entrance room
---@return Room # the ship's entrance room
function Ship:getEntrance () end

---return the ship's hyperspeed
---@return number # the ship's hyperspeed
function Ship:getHyperspeed () end

---get the ship's leader, either in battlegroups or for a squadron fighter.
---@return Ship # the ship's battlegroup or squadron leader
function Ship:getLeader () end

---return the ship's laser count
---@return number # the ship's laser count
function Ship:getLasers () end

---get room where the ship is located
---@return Room # the room the ship is in, or nil if it's in space or hyperspace
function Ship:getLocation () end

---get the vnum of the ship's last room
---@return number # the vnum of the ship's last room
function Ship:getLastVNum () end

---return the ship's ion count
---@return number # the ship's ion count
function Ship:getIons () end

---Utility function to find/create an available ship given a template and list of names.
---This will randomly pick from the list of names. If it finds a ship from the same template matching the
---name and that ship is in its shipyard (typically 45), it'll use it. If it doesn't exist, it'll create it.
---If all names are taken by instances of the template but none are in its shipyard, this will cause an error.
---All ships will be set to nodelete on the assumption that they may be reused and we don't want to waste vnums.
---
---Usage:
---```
---    -- Randomly create or get an available x-wing
---    local shipNameOptions = {"Red1", "Red2", "Red3", "Red4", "Red5"}
---    local shipForLuke = Ship.createOrReuseFromList("xwing.img", shipNameOptions, "Luke Skywalker")
---```
---@param templateName string The ship template name to create if the ship isn't found
---@param names string[] The table of ship name options
---@param owner string The ship owner to set if the ship needs to be created
---@return Ship # the resulting ship
function Ship.createOrReuseFromList (templateName, names, owner) end

---return the ship's max missiles
---@return number # the ship's max missiles
function Ship:getMaxMissiles () end

---return the ship's maneuver value
---@return number # the ship's maneuver value
function Ship:getManeuver () end

---return the ship's max energy
---@return number # the ship's max energy
function Ship:getMaxEnergy () end

---return the ship's max chaff
---@return number # the ship's max chaff
function Ship:getMaxChaff () end

---return the ship's max hull
---@return number # the ship's max hull
function Ship:getMaxHull () end

---return the ship's max torpedos
---@return number # the ship's max torpedos
function Ship:getMaxTorpedoes () end

---return the ship's max speed
---@return number # the ship's max speed
function Ship:getMaxSpeed () end

---return the ship's max rockets
---@return number # the ship's max rockets
function Ship:getMaxRockets () end

---return the ship's max pulses
---@return number # the ship's max pulses
function Ship:getMaxPulses () end

---return the ship's max shield
---@return number # the ship's max shield
function Ship:getMaxShield () end

---return the ship's missile tubes
---@return number # the ship's missile tubes
function Ship:getMissileTubes () end

---returns current missiles.
---@return number # the current missiles
function Ship:getMissiles () end

---get the ship's owner name
---@return string # the ship's current owner, or nil if none is set
function Ship:getOwner () end

---get the ship's name
---@return string # the ship's name, for example Red 5
function Ship:getName () end

---get the ship's pilot name
---@return string # the ship's current pilot, or nil if none is set
function Ship:getPilot () end

---get the ship's nav seat room
---@return Room # the ship's nav seat room
function Ship:getNavSeat () end

---gets the character piloting the ship
---@return Character # the character piloting the ship, or nil if not found
function Ship:getPilotBy () end

---get the ship's pilot seat room
---@return Room # the ship's pilot seat room
function Ship:getPilotSeat () end

---get current position within system
---
---Usage:
---```
---    local x, y, z = self:getPosition()
---```
---@return number # the ship's x coordinate
---@return number # the ship's y coordinate
---@return number # the ship's z coordinate
function Ship:getPosition () end

---returns current rockets.
---@return number # the current rockets
function Ship:getRockets () end

---returns current pulses.
---@return number # the current pulses
function Ship:getPulses () end

---returns current shield.
---@return number # the current shield
function Ship:getShield () end

---get a room within the ship by its offset
---@param offset number the number to add to the ship's starting vnum
---@return Room # the room within the ship, or nil if it was an invalid offset
function Ship:getRoomByOffset (offset) end

---return the ship's sensors
---@return number # the ship's sensors
function Ship:getSensors () end

---return the ship's shield boosters
---@return number # the ship's shield boosters
function Ship:getShieldBoosters () end

---returns current self destruct status
---@return number # the countdown to self destruct, or nil if disabled
function Ship:getSelfDestruct () end

---get the ship's primary target
---@return Ship # the ship's current target, or nil if not targeting anything
function Ship:getTarget () end

---returns current speed.
---@return number # the current speed
function Ship:getSpeed () end

---get current starsystem
---@return Starsystem # the ship's current starsystem, or nil if it's landed or in hyperspace
function Ship:getStarsystem () end

---get the ship's template
---@return Shiptemplate # the ship's template or nil if it is not based on a template.
function Ship:getTemplate () end

---determine whether an autopilot config is set on a ship
---
---Usage:
---```
---    if self:hasAutoFlag("uselaser")
---    if not self:hasAutoFlag("sentinel")
---```
---@param flagName string the name of the flag to check
---@return boolean # true if the flag is set, false if not or it's an invalid flag
function Ship:hasAutoFlag (flagName) end

---determine whether a flag is set on a ship
---
---Usage:
---```
---    if self:hasFlag("spawned")
---    if not self:hasFlag("legendary")
---```
---@param flagName string the name of the flag to check
---@return boolean # true if the flag is set, false if not or it's an invalid flag
function Ship:hasFlag (flagName) end

---returns current torpedoes.
---@return number # the current torpedoes
function Ship:getTorpedoes () end

---returns current shipyard.
---@return number # the current shipyard
function Ship:getShipyard () end

---radios a message to the system originating from this ship, always in basic
---@param text string the text to radio
function Ship:radio (text) end

---return the ship's turbolasers count
---@return number # the ship's turbolasers count
function Ship:getTurbolasers () end

---return the ship's tractorbeam count
---@return number # the ship's tractorbeam count
function Ship:getTractorbeams () end

---Restores this ship, raising all consumables to max
---@return Ship # this ship, for call chaining
function Ship:restore () end

---set the ship's battlegroup leader to add or remove it from a battlegroup.
---@param leader Ship the lead ship for the battlegroup, or nil to remove this ship from a battlegroup.
---@return Ship # this ship, for call chaining
function Ship:setBattlegroupLeader (leader) end

---set an autopilot config on this ship.
---
---Usage:
---```
---    ship:setAutoFlag("uselaser", true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
---@return Ship # this ship, for call chaining
function Ship:setAutoFlag (flag, value) end

---set the ship's current autopilot status.
---@param autopilot boolean the new autopilot value
---@return Ship # this ship, for call chaining
function Ship:setAutopilot (autopilot) end

---set the ship's blaster count.
---@param blasters number the new blasters value
---@return Ship # this ship, for call chaining
function Ship:setBlasters (blasters) end

---sets the open/close status of a hangar bay.
---@param hangar number the hangar bay number
---@param state boolean true for open, false for closed
---@return Ship # this ship, for call chaining
function Ship:setBayOpen (hangar, state) end

---set the ship's current copilot
---@param copilot string the ship's new copilot, or nil to clear
---@return Ship # this ship, for call chaining
function Ship:setCopilot (copilot) end

---set the ship's comms.
---@param comm number the new comm value
---@return Ship # this ship, for call chaining
function Ship:setComms (comm) end

---set the ship's current chaff
---@param chaff number the new chaff
---@return Ship # this ship, for call chaining
function Ship:setChaff (chaff) end

---set the ship's current energy
---@param energy number the new energy
---@return Ship # this ship, for call chaining
function Ship:setEnergy (energy) end

---set the ship's current crew list
---@param crew string the ship's new crew list, a space-separated list of character names, or empty string to clear
---@return Ship # this ship, for call chaining
function Ship:setCrew (crew) end

---set the ship's full name, including model name
---@param name string the ship's full name, for example X-Wing Starfighter 'Red 5'
---@return Ship # this ship, for call chaining
function Ship:setFullName (name) end

---set a flag on this ship.
---
---Usage:
---```
---    ship:setFlag("legendary", true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
---@return Ship # this ship, for call chaining
function Ship:setFlag (flag, value) end

---set the ship's current hull
---@param hull number the new hull
---@return Ship # this ship, for call chaining
function Ship:setHull (hull) end

---set the ship's hyperspeed.
---@param hyperspeed number the new hyperspeed value
---@return Ship # this ship, for call chaining
function Ship:setHyperspeed (hyperspeed) end

---set the ship's laser count.
---@param lasers number the new lasers value
---@return Ship # this ship, for call chaining
function Ship:setLasers (lasers) end

---repair a system on this ship.
---@param system string the system to repair (drive, ion, etc)
---@return Ship # this ship, for call chaining
function Ship:repairSystem (system) end

---set the ship's ion count.
---@param ion number the new ion value
---@return Ship # this ship, for call chaining
function Ship:setIons (ion) end

---set this ship to serve as an interceptor for another ship.
---Also handles the interceptor flag, adding or removing as necessary.
---@param leader Ship the home ship for the fighter, or nil to make this stop being an interceptor.
---@return Ship # this ship, for call chaining
function Ship:setInterceptor (leader) end

---set the ship's max chaff.
---@param maxchaff number the new max_chaff value
---@return Ship # this ship, for call chaining
function Ship:setMaxChaff (maxchaff) end

---set the ship's position for battlegroup/squadron protection.
---@param position integer the position number: 1 = outer, 2 = mid, 3 = central
---@return Ship # this ship, for call chaining
function Ship:setFleetPosition (position) end

---set the ship's maneuver value.
---@param maneuver number the new maneuver value
---@return Ship # this ship, for call chaining
function Ship:setManeuver (maneuver) end

---set the ship's max pulses.
---@param maxpulses number the new max_pulses value
---@return Ship # this ship, for call chaining
function Ship:setMaxPulses (maxpulses) end

---set the ship's max energy.
---@param maxenergy number the new max_energy value
---@return Ship # this ship, for call chaining
function Ship:setMaxEnergy (maxenergy) end

---set the ship's max hull.
---@param maxhull number the new max_hull value
---@return Ship # this ship, for call chaining
function Ship:setMaxHull (maxhull) end

---set the ship's max rockets.
---@param maxrockets number the new max_rockets value
---@return Ship # this ship, for call chaining
function Ship:setMaxRockets (maxrockets) end

---set the ship's max missiles.
---@param maxmissiles number the new max_missiles value
---@return Ship # this ship, for call chaining
function Ship:setMaxMissiles (maxmissiles) end

---set the ship's max speed.
---@param maxspeed number the new max_speed value
---@return Ship # this ship, for call chaining
function Ship:setMaxSpeed (maxspeed) end

---set the ship's current missiles
---@param missiles number the new missiles
---@return Ship # this ship, for call chaining
function Ship:setMissiles (missiles) end

---set the ship's max torpedos.
---@param maxtorpedos number the new max_torpedos value
---@return Ship # this ship, for call chaining
function Ship:setMaxTorpedoes (maxtorpedos) end

---set the ship's missile tubes.
---@param missiletubes number the new missile_tubes value
---@return Ship # this ship, for call chaining
function Ship:setMissileTubes (missiletubes) end

---set the ship's max shield.
---@param maxshield number the new max_shield value
---@return Ship # this ship, for call chaining
function Ship:setMaxShield (maxshield) end

---set the ship's current rockets
---@param rockets number the new rockets
---@return Ship # this ship, for call chaining
function Ship:setRockets (rockets) end

---set the ship's current pilot
---@param pilot string the ship's new pilot, or nil to clear
---@return Ship # this ship, for call chaining
function Ship:setPilot (pilot) end

---set the ship's current pulses
---@param pulses number the new pulses
---@return Ship # this ship, for call chaining
function Ship:setPulses (pulses) end

---sets or clears self destruct.
---@param delay number the countdown to self destruct, or nil or 0 to disable it
---@return Ship # this ship, for call chaining
function Ship:setSelfDestruct (delay) end

---set the ship's name
---@param name string the ship's new name, for example Red 5
---@return Ship # this ship, for call chaining
function Ship:setName (name) end

---set the ship's current owner
---@param owner string the ship's new owner, or nil to clear ownership
---@return Ship # this ship, for call chaining
function Ship:setOwner (owner) end

---set the ship's sensors.
---@param sensor number the new sensor value
---@return Ship # this ship, for call chaining
function Ship:setSensors (sensor) end

---set the ship's shield boosters.
---@param shieldboosters number the new shield boosters count
---@return Ship # this ship, for call chaining
function Ship:setShieldBoosters (shieldboosters) end

---set the ship's current shield
---@param shield number the new shield
---@return Ship # this ship, for call chaining
function Ship:setShield (shield) end

---sets the target for an autopiloted ship.
---Ship will immediately aggro on the target if possible. This ship must be on autopilot for this to work.
---@param target Ship the ship to target
---@return Ship # this ship, for call chaining
function Ship:setTarget (target) end

---set the ship's tractorbeam count.
---@param tractorbeam number the new tractorbeam value
---@return Ship # this ship, for call chaining
function Ship:setTractorbeams (tractorbeam) end

---set the ship's current torpedoes
---@param torpedoes number the new torpedoes
---@return Ship # this ship, for call chaining
function Ship:setTorpedoes (torpedoes) end

---set the ship's turbolaser count.
---@param turbolasers number the new turbolasers value
---@return Ship # this ship, for call chaining
function Ship:setTurbolasers (turbolasers) end

---moves this ship to the given room as if landed there.
---@param room Room the room to move the ship to
---@return Ship # this ship, for call chaining
function Ship:toRoom (room) end

---moves this ship to the given system and coordinates.
---@param starsystem Starsystem the system to move the ship to
---@param x number the x-coordinate to move the ship to
---@param y number the y-coordinate to move the ship to
---@param z number the z-coordinate to move the ship to
---@return Ship # this ship, for call chaining
function Ship:toStarsystem (starsystem, x, y, z) end

---set the ship's current speed
---@param speed number the new speed
---@return Ship # this ship, for call chaining
function Ship:setSpeed (speed) end

---set the ship's squadron leader to add or remove it from squadrons.
---
---Usage:
---```
---    xwing:setSquadronLeader(redLeader)
---```
---@param leader Ship the ship to add this one to a squadron on, or nil to remove it from any squadrons.
---@return Ship # this ship, for call chaining
function Ship:setSquadronLeader (leader) end

