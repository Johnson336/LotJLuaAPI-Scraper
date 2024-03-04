---@meta Ship
---
---Functions for ship instances
---@class Ship
Ship = {}
Ship.prototype = {}

---create a ship from a ship template.
---
function Ship.create (template, baseName) end

---finds any ship by name
---
function Ship.getFromName (name) end

---Utility function to find/create an available ship given a template and list of names.
---
function Ship.createOrReuseFromList (templateName, names, owner) end

---using the rooms iterator, generate an iterator for all the characters in a ship
---
function Ship.prototype.characters (self) end

---damage the ship with conventional damage (not ion).
---
function Ship:damage (damage, byCharacter, byShip) end

---Utility function to find a ship by name, or create one with the given template and owner if it's not found.
---
function Ship.getOrCreate (templateName, name, owner) end

---damage the ship with conventional damage (not ion).
---
function Ship:damageIon (damage, byCharacter) end

---disable a system on this ship.
---
function Ship:disableSystem (system) end

---immediately destroy this ship.
---
function Ship:destroy (byCharacter, byShip) end

---Gets distance between this ship and another
---
function Ship:distanceToShip (other) end

---echo a message to this ship, visible to any players in its cockpit/viewports/turrets/etc
---
function Ship:echoAt (text) end

---echo to all ships in the system, visible to any players in cockpits/viewports/turrets/etc
---
function Ship:echoToSystem (text) end

---get the ship's current autopilot status.
---
function Ship:getAutopilot () end

---return the ship's blaster count
---
function Ship:getBlasters () end

---returns current chaff.
---
function Ship:getChaff () end

---get the ship's class number, from 0 (fighter) to 10 (satellite)
---
function Ship:getClass () end

---get the ship's cockpit room
---
function Ship:getCockpit () end

---return the ship's comms
---
function Ship:getComms () end

---get the ship's copilot name
---
function Ship:getCopilot () end

---get the ship's crew list
---
function Ship:getCrew () end

---gets the ship (if any) docked to the ship
---
function Ship:getDockedShip () end

---get the ship's dock room
---
function Ship:getDockRoom () end

---get the ship's engine room
---
function Ship:getEngineRoom () end

---returns current energy.
---
function Ship:getEnergy () end

---get the ship's entrance room
---
function Ship:getEntrance () end

---get the vnum of the ship's first room
---
function Ship:getFirstVNum () end

---get the ship's full name, including model name
---
function Ship:getFullName () end

---return the ship's ion count
---
function Ship:getIons () end

---get the ship's gun seat room
---
function Ship:getGunSeat () end

---get the ship's flags
---
function Ship:getFlags () end

---return the ship's laser count
---
function Ship:getLasers () end

---get room where the ship is located
---
function Ship:getLocation () end

---return the ship's max chaff
---
function Ship:getMaxChaff () end

---returns current hull.
---
function Ship:getHull () end

---get the vnum of the ship's last room
---
function Ship:getLastVNum () end

---get the ship's leader, either in battlegroups or for a squadron fighter.
---
function Ship:getLeader () end

---return the ship's max hull
---
function Ship:getMaxHull () end

---return the ship's max pulses
---
function Ship:getMaxPulses () end

---return the ship's max energy
---
function Ship:getMaxEnergy () end

---return the ship's max missiles
---
function Ship:getMaxMissiles () end

---return the ship's max rockets
---
function Ship:getMaxRockets () end

---return the ship's max torpedos
---
function Ship:getMaxTorpedoes () end

---return the ship's max shield
---
function Ship:getMaxShield () end

---return the ship's missile tubes
---
function Ship:getMissileTubes () end

---return the ship's max speed
---
function Ship:getMaxSpeed () end

---get the ship's name
---
function Ship:getName () end

---get the ship's owner name
---
function Ship:getOwner () end

---returns current missiles.
---
function Ship:getMissiles () end

---get the ship's nav seat room
---
function Ship:getNavSeat () end

---return the ship's maneuver value
---
function Ship:getManeuver () end

---get the ship's pilot name
---
function Ship:getPilot () end

---get current position within system
---
function Ship:getPosition () end

---gets the character piloting the ship
---
function Ship:getPilotBy () end

---get the ship's pilot seat room
---
function Ship:getPilotSeat () end

---returns current pulses.
---
function Ship:getPulses () end

---returns current self destruct status
---
function Ship:getSelfDestruct () end

---get a room within the ship by its offset
---
function Ship:getRoomByOffset (offset) end

---return the ship's sensors
---
function Ship:getSensors () end

---returns current shield.
---
function Ship:getShield () end

---return the ship's hyperspeed
---
function Ship:getHyperspeed () end

---returns current shipyard.
---
function Ship:getShipyard () end

---return the ship's shield boosters
---
function Ship:getShieldBoosters () end

---returns current speed.
---
function Ship:getSpeed () end

---get current starsystem
---
function Ship:getStarsystem () end

---returns current torpedoes.
---
function Ship:getTorpedoes () end

---get the ship's primary target
---
function Ship:getTarget () end

---get the ship's template
---
function Ship:getTemplate () end

---return the ship's tractorbeam count
---
function Ship:getTractorbeams () end

---determine whether a flag is set on a ship
---
function Ship:hasFlag (flagName) end

---return the ship's turbolasers count
---
function Ship:getTurbolasers () end

---determine whether an autopilot config is set on a ship
---
function Ship:hasAutoFlag (flagName) end

---radios a message to the system originating from this ship, always in basic
---
function Ship:radio (text) end

---set an autopilot config on this ship.
---
function Ship:setAutoFlag (flag, value) end

---repair a system on this ship.
---
function Ship:repairSystem (system) end

---Restores this ship, raising all consumables to max
---
function Ship:restore () end

---set the ship's current autopilot status.
---
function Ship:setAutopilot (autopilot) end

---sets the open/close status of a hangar bay.
---
function Ship:setBayOpen (hangar, state) end

---set the ship's current chaff
---
function Ship:setChaff (chaff) end

---set the ship's blaster count.
---
function Ship:setBlasters (blasters) end

---set the ship's battlegroup leader to add or remove it from a battlegroup.
---
function Ship:setBattlegroupLeader (leader) end

---set the ship's comms.
---
function Ship:setComms (comm) end

---set the ship's current crew list
---
function Ship:setCrew (crew) end

---set a flag on this ship.
---
function Ship:setFlag (flag, value) end

---set the ship's current copilot
---
function Ship:setCopilot (copilot) end

---set the ship's position for battlegroup/squadron protection.
---
function Ship:setFleetPosition (position) end

---set the ship's current energy
---
function Ship:setEnergy (energy) end

---set the ship's full name, including model name
---
function Ship:setFullName (name) end

---set this ship to serve as an interceptor for another ship.
---
function Ship:setInterceptor (leader) end

---set the ship's current hull
---
function Ship:setHull (hull) end

---set the ship's ion count.
---
function Ship:setIons (ion) end

---set the ship's laser count.
---
function Ship:setLasers (lasers) end

---set the ship's max chaff.
---
function Ship:setMaxChaff (maxchaff) end

---set the ship's max energy.
---
function Ship:setMaxEnergy (maxenergy) end

---set the ship's maneuver value.
---
function Ship:setManeuver (maneuver) end

---set the ship's max hull.
---
function Ship:setMaxHull (maxhull) end

---set the ship's max pulses.
---
function Ship:setMaxPulses (maxpulses) end

---set the ship's max missiles.
---
function Ship:setMaxMissiles (maxmissiles) end

---set the ship's max rockets.
---
function Ship:setMaxRockets (maxrockets) end

---set the ship's max speed.
---
function Ship:setMaxSpeed (maxspeed) end

---set the ship's max torpedos.
---
function Ship:setMaxTorpedoes (maxtorpedos) end

---set the ship's max shield.
---
function Ship:setMaxShield (maxshield) end

---set the ship's missile tubes.
---
function Ship:setMissileTubes (missiletubes) end

---set the ship's name
---
function Ship:setName (name) end

---set the ship's current missiles
---
function Ship:setMissiles (missiles) end

---set the ship's current owner
---
function Ship:setOwner (owner) end

---set the ship's current pilot
---
function Ship:setPilot (pilot) end

---set the ship's current rockets
---
function Ship:setRockets (rockets) end

---set the ship's current pulses
---
function Ship:setPulses (pulses) end

---sets or clears self destruct.
---
function Ship:setSelfDestruct (delay) end

---set the ship's current shield
---
function Ship:setShield (shield) end

---set the ship's sensors.
---
function Ship:setSensors (sensor) end

---set the ship's shield boosters.
---
function Ship:setShieldBoosters (shieldboosters) end

---sets the target for an autopiloted ship.
---
function Ship:setTarget (target) end

---set the ship's current speed
---
function Ship:setSpeed (speed) end

---set the ship's turbolaser count.
---
function Ship:setTurbolasers (turbolasers) end

---set the ship's tractorbeam count.
---
function Ship:setTractorbeams (tractorbeam) end

---set the ship's squadron leader to add or remove it from squadrons.
---
function Ship:setSquadronLeader (leader) end

---set the ship's current torpedoes
---
function Ship:setTorpedoes (torpedoes) end

---moves this ship to the given room as if landed there.
---
function Ship:toRoom (room) end

---set the ship's hyperspeed.
---
function Ship:setHyperspeed (hyperspeed) end

---returns current rockets.
---
function Ship:getRockets () end

---moves this ship to the given system and coordinates.
---
function Ship:toStarsystem (starsystem, x, y, z) end

