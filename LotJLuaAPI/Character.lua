---@meta Character
---
---Functions for mobs and players
---@class Character
Character = {}

---Underlying "act" mechanic in the mud core
---
function Character:act () end

---adjust a character's current movement.
---
function Character:adjustMove (amount) end

---increase or decrease a player's percentage in a skill.
---
function Character:adjustSkill (skill, adjustment) end

---make this character attack another.
---
function Character:attack (target) end

---award (or fine) credits.
---
function Character:awardCredits (amount) end

---begin a countdown for calling a mob vnum as a follower.
---
function Character:callMob (vnum, rounds) end

---whether this character can see the given object or character.
---
function Character:canSee (target) end

---get an iterator over objects in the character's inventory.
---
function Character:carrying () end

---damage a character.
---
function Character:damage (amount, byCh) end

---drop an object from the character's inventory.
---
function Character:drop (object) end

---send a message to everyone in the character's room except for them.
---
function Character:echo (message, args) end

---display some text to the character.
---
function Character:echoAt (text) end

---display some text to the character while applying the speaker's language for speech.
---
function Character:echoAtLang (speaker, text, args) end

---send a message to everyone in the character's room except for them, using the speaker's language for speech.
---
function Character:echoLang (speaker, message, args) end

---adjust a character's current force/mana.
---
function Character:adjustForce (amount) end

---perform the given emote.
---
function Character:emote (text) end

---change the current target of a mob in combat.
---
function Character:focus (target) end

---get an iterator for the character's current followers.
---
function Character:followers () end

---make the character enter the given command.
---
function Character:force (command, account, totp) end

---award levels to the player.
---
function Character:gainLevels (amount, ability) end

---award experience to the player.
---
function Character:gainExp (amount, ability, groupGain) end

---get the character's current alignment.
---
function Character:getAlignment () end

---get the character's current blood toxicity, 0 (good) - 100 (bad).
---
function Character:getBloodToxicity () end

---get the character's current carried weight.
---
function Character:getCarryWeight () end

---get the full bio for a player character (what you see when looking at them).
---
function Character:getBio () end

---get the character's current charisma attribute.
---
function Character:getCharisma () end

---get the character's clan division ID and name.
---
function Character:getClanDivision () end

---get the character's current clan.
---
function Character:getClan () end

---get the character's clan rank ID and name.
---
function Character:getClanRank () end

---get the character's current carried credits.
---
function Character:getCredits () end

---get the character's current constitution attribute.
---
function Character:getConstitution () end

---get the full description for a character (what you see when looking at them).
---
function Character:getDescription () end

---get the character this one is currently fighting.
---
function Character:getFighting () end

---get the character this one is currently following.
---
function Character:getFollowing () end

---get the character's current dexterity attribute.
---
function Character:getDexterity () end

---get the character's current force attribute.
---
function Character:getForce () end

---get the character's current force rank.
---
function Character:getForceRank () end

---get the character's current force class.
---
function Character:getForceClass () end

---get the character's current area.
---
function Character:getInArea () end

---get whether a character has a given cyber type installed, and if so what rating it is.
---
function Character:getInstalledCyber (cyberType) end

---get the character's current room.
---
function Character:getInRoom () end

---get the character's current intelligence attribute.
---
function Character:getIntelligence () end

---get the long description for a character (what you see when looking in the room).
---
function Character:getLongDescription () end

---get the character's level in the given class name.
---
function Character:getLevel () end

---get the character's current luck attribute.
---
function Character:getLuck () end

---get the character's current mana.
---
function Character:getMana () end

---get the character's maximum level in the given class name.
---
function Character:getMaxClassLevel () end

---get the character's main class name.
---
function Character:getMainAbility () end

---get the character's maximum hp.
---
function Character:getMaxHp () end

---get the character's maximum movement.
---
function Character:getMaxMove () end

---get the character's current mental state, 0 (good) - 100 (bad).
---
function Character:getMentalState () end

---get the character's maximum mana.
---
function Character:getMaxMana () end

---get the character's current movement.
---
function Character:getMove () end

---get the character's number of attacks
---
function Character:getNumAttacks () end

---get the name (keywords) for a character.
---
function Character:getName () end

---get the character's permanent charisma attribute.
---
function Character:getPermCharisma () end

---get the character's permanent dexterity attribute.
---
function Character:getPermDexterity () end

---get the character's permanent constitution attribute.
---
function Character:getPermConstitution () end

---get the character's permanent force attribute.
---
function Character:getPermForce () end

---get the character's permanent intelligence attribute.
---
function Character:getPermIntelligence () end

---get the character's current hp.
---
function Character:getHp () end

---get the character's permanent luck attribute.
---
function Character:getPermLuck () end

---get the character's permanent strength attribute.
---
function Character:getPermStrength () end

---get the character's race.
---
function Character:getRace () end

---get the character's current permanent attribute.
---
function Character:getPermWisdom () end

---get the sex of a character.
---
function Character:getSex () end

---get the character's percentage in a given skill.
---
function Character:getSkill () end

---get the short description for a character.
---
function Character:getShortDescription () end

---get the character's current strength attribute.
---
function Character:getStrength () end

---get a character's variable by name
---
function Character:getVar (varName, default) end

---get the remaining time on a character's variable, by name
---
function Character:getVarTimer (varName) end

---return the mob's vnum
---
function Character:getVNum () end

---get the character's race, or what they're disguised as.
---
function Character:getVisibleRace () end

---get the character's current wisdom attribute.
---
function Character:getWisdom () end

---get the character's previous room.
---
function Character:getWasInRoom () end

---get whether an act flag is set on this character.
---
function Character:hasActFlag (flag) end

---checks if the character has an attack
---
function Character:hasAttack (the) end

---get whether a player has a given bestowment/empowerment
---
function Character:hasBestowment (bestowment) end

---checks if the character has an affect
---
function Character:hasAffect (the) end

---checks if the character has a defense
---
function Character:hasDefense (the) end

---get whether a player flag is set on this character.
---
function Character:hasPlrFlag (flag) end

---checks if the character has an immunity
---
function Character:hasImmune (the) end

---checks if the character has a resistance
---
function Character:hasResistant (the) end

---interrupt any timed action the character is doing.
---
function Character:interrupt () end

---whether this player is AFK.
---
function Character:isAFK () end

---whether this character is affected by the given effect name.
---
function Character:isAffected (effectName) end

---whether this player is botting.
---
function Character:isBotting () end

---whether this character is a droid.
---
function Character:isDroid () end

---whether this character is fighting.
---
function Character:isFighting () end

---whether this character is an immortal (RPC or higher).
---
function Character:isImmortal () end

---whether this character is immune to the given attack type.
---
function Character:isImmune (risName) end

---checks if the character has a susceptibility
---
function Character:hasSusceptible (the) end

---heal a character.
---
function Character:heal (amount) end

---whether this character is an NPC.
---
function Character:isNPC () end

---whether this character is a player.
---
function Character:isPC () end

---whether this character is resistant to the given attack type.
---
function Character:isResistant (risName) end

---whether this character is susceptible to the given attack type.
---
function Character:isSusceptible (risName) end

---restore a character.
---
function Character:restore () end

---say some text.
---
function Character:say (text) end

---say some text to a target.
---
function Character:sayTo (target, text) end

---set a flag on this character.
---
function Character:setActFlag (flag, value) end

---whether this character is presently jailed.
---
function Character:isJailed () end

---sets an affect for a character
---
function Character:setAffect (the, to) end

---set the character's current alignment, -1000 (evil) - 1000 (good).
---
function Character:setAlignment (alignment) end

---set the full bio for a PC.
---
function Character:setBio (bio) end

---sets an attack for a character
---
function Character:setAttack (the, to) end

---set the character's current mental state, 0 (good) - 100 (bad).
---
function Character:setBloodToxicity (bloodToxicity) end

---set the character's current clan division
---
function Character:setClanDiv (the) end

---set the character's current clan rank
---
function Character:setClanRank (the) end

---set the character's current clan
---
function Character:setClan (clan) end

---sets a defense for a character
---
function Character:setDefense (the, to) end

---set the full description for an NPC (what you see when looking at them).
---
function Character:setDescription (desc) end

---set the character's current force class, 0 - 8
---
function Character:setForceClass (class) end

---set the character's current force rank, 0 - 3
---
function Character:setForceRank (rank) end

---sets an immunity for a character
---
function Character:setImmune (the, to) end

---set whether a character has a given cyber type installed.
---
function Character:setInstalledCyber (cyberType, installed, the) end

---set the date/time the character was jailed.
---
function Character:setJailed (the) end

---sets a player's ability class level.
---
function Character:setLevel (the, ability) end

---set the long description for an NPC (what you see when looking in the room).
---
function Character:setLongDescription (desc) end

---sets the character's maximum hp.
---
function Character:setMaxHp (the) end

---sets the character's maximum mana.
---
function Character:setMaxMana (the) end

---sets the character's maximum movement.
---
function Character:setMaxMove (the) end

---sets the character's main ability class
---
function Character:setMainAbility (the) end

---set the character's current mental state, 0 (good) - 100 (bad).
---
function Character:setMentalState (mentalState) end

---set the name (keywords) for a character.
---
function Character:setName (desc) end

---sets the character's number of attacks
---
function Character:setNumAttacks (the) end

---sets the character's permanent constitution attribute.
---
function Character:setPermConstitution (the) end

---sets the character's permanent dexterity attribute.
---
function Character:setPermDexterity (the) end

---sets the character's permanent charisma attribute.
---
function Character:setPermCharisma (the) end

---sets the character's permanent force attribute.
---
function Character:setPermForce (the) end

---sets the character's permanent luck attribute.
---
function Character:setPermLuck (the) end

---sets the character's permanent strength attribute.
---
function Character:setPermStrength (the) end

---sets the character's permanent intelligence attribute.
---
function Character:setPermIntelligence (the) end

---sets the character's permanent wisdom attribute.
---
function Character:setPermWisdom (the) end

---sets the character's race
---
function Character:setRace (the) end

---sets a resistance for a character
---
function Character:setResistant (the, to) end

---set the sex for an NPC.
---
function Character:setSex (sex) end

---set the short description for an NPC.
---
function Character:setShortDescription (desc) end

---sets a susceptibility for a character
---
function Character:setSusceptible (the, to) end

---set a variable on a character
---
function Character:setVar (varName, value, ttl) end

---set a character's skill percentage
---
function Character:setSkill (skill, val) end

---instantly kill a character.
---
function Character:slay (byCh) end

---stun (lag) a player for a given number of seconds.
---
function Character:stun (seconds) end

---transfer the character to the given room.
---
function Character:toRoom (room) end

---get an iterator over objects the character is wearing.
---
function Character:wearing () end

---the date/time the character was jailed
---
function Character:whenJailed () end

---get an iterator over all connected players.
---
function Character.connected () end

---get a list of objects worn on a given location
---
function Character:wornOnLocation (wearflag) end

---get any character in the world by name.
---
function Character.getFromName (name) end

---create an instance of a mob.
---
function Character.invoke (vnum) end

