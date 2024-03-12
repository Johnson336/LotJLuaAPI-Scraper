---@meta Character
---
---Functions for mobs and players
---@class Character
Character = {}

---adjust a character's current force/mana.
---
---Usage:
---```
---    ch:echoAt("You feel a sudden burst of the force!")
---    ch:adjustForce(500)
---```
---@param amount number of force to add. Negative amounts take it away.
function Character:adjustForce (amount) end

---make this character attack another.
---Does nothing if the mob is already in combat.
---
---Usage:
---```
---    ch:attack(otherPerson)
---```
---@param target Character the character to attack.
function Character:attack (target) end

---Underlying "act" mechanic in the mud core
---
function Character:act () end

---adjust a character's current movement.
---
---Usage:
---```
---    ch:echoAt("You get tired!")
---    ch:adjustMove(-100)
---```
---@param amount number of movement to add. Negative amounts take it away.
function Character:adjustMove (amount) end

---award (or fine) credits.
---If the number is negative, it will remove that many credits.
---If that would take the player below 0, the amount is adjusted to leave them with exactly 0.
---This function doesn't echo anything to the player on its own, so you may want to add an echoAt.
---
---Usage:
---```
---    ch:echoAt("Good job! Here are 5000 credits.")
---    ch:awardCredits(5000)
---    ch:echoAt("Uh oh! The pirate takes a lot of your credits.")
---    ch:awardCredits(-50000)
---```
---@param amount number the number of credits to award or remove
function Character:awardCredits (amount) end

---begin a countdown for calling a mob vnum as a follower.
---Returns false if the call failed. This happens if a call timer was already active for another mob.
---
---Usage:
---```
---    -- Load mob #40051 as a follower after waiting for 10 rounds
---    ch:callMob(40051, 10)
---```
---@param vnum number the mob vnum to call
---@param rounds number the number of rounds to wait before the mob appears
---@return boolean # true if the call was started successfully, false if not.
function Character:callMob (vnum, rounds) end

---damage a character.
---
---Usage:
---```
---    ch:damage(1000)
---```
---@param amount number of damage to do.
---@param byCh Character the character doing the damage, if applicable. Can be omitted or set to nil.
function Character:damage (amount, byCh) end

---drop an object from the character's inventory.
---
---Usage:
---```
---    ch:drop(something)
---```
---@param object Object the object to drop
function Character:drop (object) end

---increase or decrease a player's percentage in a skill.
---
---Usage:
---```
---    ch:adjustSkill("kick", 2)
---```
---@param skill string the name of the skill or force ability
---@param adjustment number the amount to adjust it by, -100 - 100
function Character:adjustSkill (skill, adjustment) end

---send a message to everyone in the character's room except for them.
---
---Usage:
---```
---    ch:echo("{1} lashes out violently with a tentacle, hitting {2} in the face!", ch, target)
---```
---@param message string the message to send. Can contain tokens referring to subsequent arguments, substituted appropriately for viewers.
---@param args any any number of arguments corresponding to the {#} tokens in the message. {1} will refer to the first arg, etc.
function Character:echo (message, args) end

---whether this character can see the given object or character.
---
---Usage:
---```
---    if not self:canSee(ch) then
---    self:force("say I can't see you!")
---    end
---```
---@param target any a Character or Object
---@return boolean # true if the character can see the given thing, false otherwise
function Character:canSee (target) end

---get an iterator over objects in the character's inventory.
---Any objects they're wearing are ignored, as our items inside containers.
---
---Usage:
---```
---    for obj in ch:carrying() do
---    -- do something
---    end
---```
---@return Object # an iterator of Object
function Character:carrying () end

---send a message to everyone in the character's room except for them, using the speaker's language for speech.
---
---Usage:
---```
---    ch:echoLang(self, "{1} chortles gleefully and says \"I am a glorious Hutt\" before hitting {2} in the face with his tail!", self, ch)
---```
---@param speaker Character the character speaking in this echo, for purposes of adding a language filter.
---@param message string the message to send. Can contain tokens referring to subsequent arguments, substituted appropriately for viewers.
---@param args any any number of arguments corresponding to the {#} tokens in the message. {1} will refer to the first arg, etc.
function Character:echoLang (speaker, message, args) end

---change the current target of a mob in combat.
---Does nothing if the mob is not in combat.
---
---Usage:
---```
---    ch:focus(otherPerson)
---```
---@param target Character the character to switch focus to.
function Character:focus (target) end

---display some text to the character.
---
---Usage:
---```
---    ch:echoAt("You hear a strange sound in the distance...")
---```
---@param text string the message to show
function Character:echoAt (text) end

---award experience to the player.
---
---Usage:
---```
---    ch:gainExp(10000, "combat")
---```
---@param amount number the amount of experience to award
---@param ability string the class name (bounty hunting, combat, etc)
---@param groupGain? boolean whether to give the same experience to a leader main's group (optional, defaults to false)
function Character:gainExp (amount, ability, groupGain) end

---perform the given emote.
---Convenience alias for self:force("emote "..text)
---@param text string the action to emote
function Character:emote (text) end

---get an iterator for the character's current followers.
---
---Usage:
---```
---    for follower in ch:followers() do
---    follower:toRoom(somewhere)
---    end
---```
function Character:followers () end

---award levels to the player.
---
---Usage:
---```
---    ch:gainLevels(1, "combat")
---```
---@param amount number the number of levels to award (1 to 149)
---@param ability string the class name (bounty hunting, combat, etc)
function Character:gainLevels (amount, ability) end

---make the character enter the given command.
---
---Usage:
---```
---    ch:force("say Hello there!")
---```
---@param command string the command to run
---@param account? string (optional) The account to use to elevate privileges of the force (to 103, or the top level of the account, whichever is less).
---@param totp? string (optional, required with account) the totp code for the specified account. If not valid, the force will still happen just without elevated privileges.
function Character:force (command, account, totp) end

---get the character's current carried weight.
---@return number # the combined weight of all items the character is carrying
function Character:getCarryWeight () end

---display some text to the character while applying the speaker's language for speech.
---
---Usage:
---```
---    ch:echoAtLang(self, "Everything goes black as you lose consciousness. The last thing you remember is {1} saying \"Never underestimate the Hutts.\" over your body.", self)
---```
---@param speaker Character the character speaking in this echo, for purposes of adding a language filter.
---@param text string the message to show
---@param args any any number of arguments corresponding to the {#} tokens in the message. {1} will refer to the first arg, etc.
function Character:echoAtLang (speaker, text, args) end

---get the character's current alignment.
---@return integer # the character's current alignment
function Character:getAlignment () end

---get the character's current blood toxicity, 0 (good) - 100 (bad).
---@return number # the character's blood toxicity
function Character:getBloodToxicity () end

---get the character's current clan.
---@return Clan # the character's current clan, or nil if they're not in one
function Character:getClan () end

---get the character's current constitution attribute.
---@return number # the character's current constitution, including worn items and effects
function Character:getConstitution () end

---get the full bio for a player character (what you see when looking at them).
---@return string # the bio for this character
function Character:getBio () end

---get the character's current charisma attribute.
---@return number # the character's current charisma, including worn items and effects
function Character:getCharisma () end

---get the character's current carried credits.
---@return number # the character's carried credit balance
function Character:getCredits () end

---get the character's current dexterity attribute.
---@return number # the character's current dexterity, including worn items and effects
function Character:getDexterity () end

---get the character this one is currently fighting.
---@return Character # the character they're fighting, or nil if not fighting anyone
function Character:getFighting () end

---get the character's current force class.
---@return number # the character's current force class for players, or 0 for NPCs
function Character:getForceClass () end

---get the full description for a character (what you see when looking at them).
---@return string # the description for this character
function Character:getDescription () end

---get the character's current force attribute.
---@return number # the character's current force, including worn items and effects
function Character:getForce () end

---get the character's clan division ID and name.
---
---Usage:
---```
---    local divNum, divName = ch:getClanDivision()
---```
---@return number # the division number, or nil if not in a clan
---@return string # the division name, or nil if not in a clan
function Character:getClanDivision () end

---get the character this one is currently following.
---@return Character # the character they're following, or nil if not following anyone
function Character:getFollowing () end

---get the character's current hp.
---@return integer # the character's current hp
function Character:getHp () end

---get the character's current room.
---@return Room # the room
function Character:getInRoom () end

---get whether a character has a given cyber type installed, and if so what rating it is.
---@param cyberType number the type of cybernetic to check for (see builder guide for cybernetic values)
---@return boolean # true if cyber is installed, false otherwise
---@return integer # rating the class/rating of the installed cybernetic, if applicable (like the amount of strength bonus, etc)
function Character:getInstalledCyber (cyberType) end

---get the character's current force rank.
---@return number # the character's current force rank for players, or 0 for NPCs
function Character:getForceRank () end

---get the character's current intelligence attribute.
---@return number # the character's current intelligence, including worn items and effects
function Character:getIntelligence () end

---get the character's current area.
---@return Area # the area
function Character:getInArea () end

---get the character's current luck attribute.
---@return number # the character's current luck, including worn items and effects
function Character:getLuck () end

---get the long description for a character (what you see when looking in the room).
---@return string # the long description for this character
function Character:getLongDescription () end

---get the character's main class name.
---
---Usage:
---```
---    if ch:getMainAbility() == "bounty hunting" then
---    -- do stuff
---    end
---```
---@return string # character's main class
function Character:getMainAbility () end

---get the character's clan rank ID and name.
---
---Usage:
---```
---    local rankNum, rankName = ch:getClanRank()
---```
---@return number # the rank number, or nil if not in a clan
---@return string # the rank name, or nil if not in a clan
function Character:getClanRank () end

---get the character's level in the given class name.
---
---Usage:
---```
---    if ch:getLevel("combat") >= 100 then
---    -- do stuff
---    end
---```
---@return integer # the character's level in this class
function Character:getLevel () end

---get the character's current mana.
---@return integer # the character's current mana
function Character:getMana () end

---get the character's maximum hp.
---@return integer # the character's maximum hp
function Character:getMaxHp () end

---get the character's maximum level in the given class name.
---
---Usage:
---```
---    if ch:getMaxClassLevel("force") > 1 then
---    -- do stuff
---    end
---```
---@return integer # the character's maximum level in this class
function Character:getMaxClassLevel () end

---get the character's current movement.
---@return integer # the character's current movement
function Character:getMove () end

---get the character's maximum movement.
---@return integer # the character's maximum movement
function Character:getMaxMove () end

---get the character's current mental state, 0 (good) - 100 (bad).
---@return number # the character's mental state
function Character:getMentalState () end

---get the character's maximum mana.
---@return integer # the character's maximum mana
function Character:getMaxMana () end

---get the character's permanent dexterity attribute.
---@return number # the character's permanent dexterity
function Character:getPermDexterity () end

---get the character's number of attacks
---@return integer # the number of attacks
function Character:getNumAttacks () end

---get the name (keywords) for a character.
---@return string # the keyword(s) for this character
function Character:getName () end

---get the character's permanent force attribute.
---@return number # the character's permanent force
function Character:getPermForce () end

---get the character's permanent constitution attribute.
---@return number # the character's permanent constitution
function Character:getPermConstitution () end

---get the character's permanent intelligence attribute.
---@return number # the character's permanent intelligence
function Character:getPermIntelligence () end

---get the character's permanent strength attribute.
---@return number # the character's permanent strength
function Character:getPermStrength () end

---get the character's race.
---Note that return values will be uppercased as shown in showrace. Sees through disguises.
---
---Usage:
---```
---    if ch:getRace() == "Corellian" then
---    -- do stuff
---    end
---```
---@return string # character's race name
function Character:getRace () end

---get the character's current permanent attribute.
---@return number # the character's permanent wisdom
function Character:getPermWisdom () end

---get the sex of a character.
---@return string # the sex string (male, female, or neutral)
function Character:getSex () end

---get the character's permanent luck attribute.
---@return number # the character's permanent luck
function Character:getPermLuck () end

---get the short description for a character.
---@return string # the short description for this character
function Character:getShortDescription () end

---get the character's current strength attribute.
---@return number # the character's current strength, including worn items and effects
function Character:getStrength () end

---get the character's percentage in a given skill.
---
---Usage:
---```
---    if ch:getSkill("dodge") >= 50 then
---    -- do stuff
---    end
---```
---@return integer # the character's percent in this skill, or 0 if they don't know it
function Character:getSkill () end

---get the remaining time on a character's variable, by name
---
---Usage:
---```
---    if ch:getVarTimer("wroona.onQuest") > 10 then
---    -- do stuff
---    end
---    ch:echoAt("You have "..ch:getVarTimer("wroona.timesMetMob").." seconds left.")
---```
---@param varName string the name of the variable whose timer you want to get
---@return integer|nil # the integer value of seconds remaining in the timer, or 0 if it's expired, or nil if the variable is not set.
function Character:getVarTimer (varName) end

---get a character's variable by name
---
---Usage:
---```
---    if ch:getVar("wroona.onQuest") then
---    -- do stuff
---    end
---    ch:echoAt("I have met you "..ch:getVar("wroona.timesMetMob", 1).." times.")
---```
---@param varName string the name of the variable to get
---@param default? any an optional default value (string, number, or boolean) to return if the variable is unset
---@return boolean|number|string|nil # the value, or the default or nil if it's not set. Can be a bool, number, or string.
function Character:getVar (varName, default) end

---return the mob's vnum
---@return integer # the mob's vnum, or -1 if it's a player
function Character:getVNum () end

---get the character's previous room.
---@return Room # the room
function Character:getWasInRoom () end

---get the character's current wisdom attribute.
---@return number # the character's current wisdom, including worn items and effects
function Character:getWisdom () end

---get whether an act flag is set on this character.
---
---Usage:
---```
---    if ch:hasActFlag("sentinel") do
---    ch:echoAt("You don't feel like walking.")
---    end
---```
---@param flag string The flag to check for
---@return boolean # True if the flag is set, false otherwise
function Character:hasActFlag (flag) end

---checks if the character has an affect
---@param the string affect to look for
---@return boolean # true if the char has the affect, false if not
function Character:hasAffect (the) end

---get the character's race, or what they're disguised as.
---Note that return values will be uppercased as shown in showrace.
---
---Usage:
---```
---    if ch:getVisibleRace() == "Corellian" then
---    -- do stuff
---    end
---```
---@return string # race which the character currently appears as
function Character:getVisibleRace () end

---checks if the character has a defense
---@param the string defense to look for
---@return boolean # true if the char has the defense, false if not
function Character:hasDefense (the) end

---get the character's permanent charisma attribute.
---@return number # the character's permanent charisma
function Character:getPermCharisma () end

---checks if the character has an attack
---@param the string attack to look for
---@return boolean # true if the char has the attack, false if not
function Character:hasAttack (the) end

---get whether a player has a given bestowment/empowerment
---@param bestowment string the bestowment/empowerment to check for
---@return boolean # true if the player has that bestowment, false otherwise
function Character:hasBestowment (bestowment) end

---get whether a player flag is set on this character.
---
---Usage:
---```
---    if ch:hasActFlag("autoexits") do
---    ch:echoAt("You just saw the exits.")
---    end
---```
---@param flag string The flag to check for
---@return boolean # True if the flag is set, false otherwise
function Character:hasPlrFlag (flag) end

---checks if the character has an immunity
---@param the string immunity to look for
---@return boolean # true if the char has the immunity, false if not
function Character:hasImmune (the) end

---heal a character.
---
---Usage:
---```
---    ch:heal(1000)
---```
---@param amount number of hp to restore.
function Character:heal (amount) end

---checks if the character has a susceptibility
---@param the string susceptibility to look for
---@return boolean # true if the char has the susceptibility, false if not
function Character:hasSusceptible (the) end

---checks if the character has a resistance
---@param the string resistance to look for
---@return boolean # true if the char has the resistance, false if not
function Character:hasResistant (the) end

---interrupt any timed action the character is doing.
---
---Usage:
---```
---    self:onAct("begins drawing a bead on you!", function(self, ch)
---    self:emote("hides behind a rock!")
---    ch:interrupt()
---    end)
---```
function Character:interrupt () end

---whether this player is AFK.
---@return boolean # true if the player is AFK, false otherwise
function Character:isAFK () end

---whether this character is fighting.
---@return boolean # true if the character is fighting, false otherwise
function Character:isFighting () end

---whether this character is an immortal (RPC or higher).
---@return boolean # true if the character is an immortal.
function Character:isImmortal () end

---whether this character is immune to the given attack type.
---
---Usage:
---```
---    if ch:isImmune("fire") then
---    ch:echoAt("You're protected from the fire.")
---    end
---```
---@param risName string the type of attack to check (energy, slash, cold, etc)
---@return boolean # true if the character is immune, false otherwise.
function Character:isImmune (risName) end

---whether this character is presently jailed.
---
---Usage:
---```
---    if ch:isJailed() then
---    ch:echoAt("You're currently in jail.")
---    end
---```
---@return boolean # true if the character is in jail, false otherwise.
function Character:isJailed () end

---whether this character is an NPC.
---
---Usage:
---```
---    if not ch:isNPC() then
---    ch:echoAt("You're a player!")
---    end
---```
---@return boolean # true if the character is an NPC, false if they're a player
function Character:isNPC () end

---whether this character is a player.
---@return boolean # true if the character is a player, false otherwise
function Character:isPC () end

---whether this character is a droid.
---
---Usage:
---```
---    if not ch:isDroid() then
---    ch:echoAt("You're a droid, beep boop!")
---    end
---```
---@return boolean # true if the character is a droid, false otherwise
function Character:isDroid () end

---whether this character is resistant to the given attack type.
---
---Usage:
---```
---    if ch:isResistant("fire") then
---    ch:echoAt("You're slightly protected from the fire.")
---    end
---```
---@param risName string the type of attack to check (energy, slash, cold, etc)
---@return boolean # true if the character is resistant, false otherwise.
function Character:isResistant (risName) end

---whether this character is susceptible to the given attack type.
---
---Usage:
---```
---    if ch:isSusceptible("fire") then
---    ch:echoAt("You're burning up from the fire!")
---    end
---```
---@param risName string the type of attack to check (energy, slash, cold, etc)
---@return boolean # true if the character is susceptible, false otherwise.
function Character:isSusceptible (risName) end

---restore a character.
---
---Usage:
---```
---    ch:restore()
---```
function Character:restore () end

---say some text.
---Convenience alias for self:force("say "..text)
---@param text string the text to speak
function Character:say (text) end

---whether this character is affected by the given effect name.
---
---Usage:
---```
---    if ch:isAffected("sneak") then
---    self:force("say I didn't see you come in!")
---    end
---```
---@param effectName string the name of the effect to check for.
---@return boolean # true if the character is affected by it, false otherwise.
function Character:isAffected (effectName) end

---set a flag on this character.
---
---Usage:
---```
---    ch:setActFlag("deadly", true)
---```
---@param flag string The flag to set
---@param value boolean The new value to set
function Character:setActFlag (flag, value) end

---whether this player is botting.
---@return boolean # true if the player is botting, false otherwise
function Character:isBotting () end

---sets an affect for a character
---@param the string affect to set
---@param to boolean enable or disable the affect
---@return Character # this character, for call chaining.
function Character:setAffect (the, to) end

---say some text to a target.
---Convenience alias for self:force("sayto \""..target:getName().."\"" "..text)
---@param target Character the person to speak to
---@param text string the text to speak
function Character:sayTo (target, text) end

---sets an attack for a character
---@param the string attack to set
---@param to boolean enable or disable the attack
---@return Character # this character, for call chaining.
function Character:setAttack (the, to) end

---set the character's current alignment, -1000 (evil) - 1000 (good).
---@param alignment integer the new alignment
---@return Character # this character, for call chaining.
function Character:setAlignment (alignment) end

---set the character's current clan
---@param clan Clan the clan to set the character to
---@return Character # this character, for call chaining.
function Character:setClan (clan) end

---set the character's current mental state, 0 (good) - 100 (bad).
---@param bloodToxicity number the new blood toxicity
---@return Character # this character, for call chaining.
function Character:setBloodToxicity (bloodToxicity) end

---set the character's current clan division
---@param the integer division number
---@return Character # this character, for call chaining.
function Character:setClanDiv (the) end

---set the character's current clan rank
---@param the integer rank number
---@return Character # this character, for call chaining.
function Character:setClanRank (the) end

---sets a defense for a character
---@param the string defense to set
---@param to boolean enable or disable the defense
---@return Character # this character, for call chaining.
function Character:setDefense (the, to) end

---set the full description for an NPC (what you see when looking at them).
---@param desc string the new description
function Character:setDescription (desc) end

---set the character's current force rank, 0 - 3
---@param rank integer the new rank
---@return Character # this character, for call chaining.
function Character:setForceRank (rank) end

---set whether a character has a given cyber type installed.
---@param cyberType number the type of cybernetic to check for (see builder guide for cybernetic values)
---@param installed boolean whether they should have the cybernetic installed. true = install, false = uninstall
---@param the number class/rating of the cybernetic, if installing and applicable (for cybernetics with a variable effect like str, hp)
function Character:setInstalledCyber (cyberType, installed, the) end

---sets an immunity for a character
---@param the string immunity to set
---@param to boolean enable or disable the immunity
---@return Character # this character, for call chaining.
function Character:setImmune (the, to) end

---set the date/time the character was jailed.
---@param the integer date/time the character was jailed, or 0 if the character is no longer in jail.
---@return Character # this character, for call chaining.
function Character:setJailed (the) end

---sets a player's ability class level.
---
---Usage:
---```
---    ch:setLevel(150, "combat")
---```
---@param the number level to set (1 to 150)
---@param ability string the class name (bounty hunting, combat, etc)
function Character:setLevel (the, ability) end

---set the long description for an NPC (what you see when looking in the room).
---
---Usage:
---```
---    ch:setLongDescription("An angry pirate captain stands here drinking ale.")
---```
---@param desc string the new long description
function Character:setLongDescription (desc) end

---sets the character's maximum hp.
---@param the integer new value (between 1 and 1,000,000)
---@return Character # this character, for call chaining.
function Character:setMaxHp (the) end

---sets the character's main ability class
---@param the string new ability class
---@return Character # this character, for call chaining.
function Character:setMainAbility (the) end

---set the full bio for a PC.
---@param bio string the new bio
function Character:setBio (bio) end

---set the character's current force class, 0 - 8
---@param class integer the new class
---@return Character # this character, for call chaining.
function Character:setForceClass (class) end

---sets the character's maximum movement.
---@param the integer new value (between 1 and 1,000,000)
---@return Character # this character, for call chaining.
function Character:setMaxMove (the) end

---set the character's current mental state, 0 (good) - 100 (bad).
---@param mentalState integer the new mental state
---@return Character # this character, for call chaining.
function Character:setMentalState (mentalState) end

---set the name (keywords) for a character.
---
---Usage:
---```
---    ch:setName("pirate captain angry")
---```
---@param desc string the new name (keywords)
function Character:setName (desc) end

---sets the character's number of attacks
---@param the integer new value (between 0 and 20)
---@return Character # this character, for call chaining.
function Character:setNumAttacks (the) end

---sets the character's permanent constitution attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermConstitution (the) end

---sets the character's permanent dexterity attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermDexterity (the) end

---sets the character's permanent intelligence attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermIntelligence (the) end

---sets the character's maximum mana.
---@param the integer new value (between 1 and 1,000,000)
---@return Character # this character, for call chaining.
function Character:setMaxMana (the) end

---sets the character's permanent luck attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermLuck (the) end

---sets the character's permanent wisdom attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermWisdom (the) end

---sets the character's race
---@param the string new race
---@return Character # this character, for call chaining.
function Character:setRace (the) end

---sets the character's permanent charisma attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermCharisma (the) end

---sets the character's permanent force attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermForce (the) end

---sets a resistance for a character
---@param the string resistance to set
---@param to boolean enable or disable the resistance
---@return Character # this character, for call chaining.
function Character:setResistant (the, to) end

---set the sex for an NPC.
---
---Usage:
---```
---    ch:setSex("female")
---```
---@param sex string the new sex (male, female, or neutral)
function Character:setSex (sex) end

---set the short description for an NPC.
---
---Usage:
---```
---    ch:setShortDescription("an angry pirate captain")
---```
---@param desc string the new short description
function Character:setShortDescription (desc) end

---set a character's skill percentage
---@param skill string the skill name
---@param val integer the new value (between 0 and 100)
---@return Character # this character, for call chaining.
function Character:setSkill (skill, val) end

---sets a susceptibility for a character
---@param the string susceptibility to set
---@param to boolean enable or disable the susceptibility
---@return Character # this character, for call chaining.
function Character:setSusceptible (the, to) end

---set a variable on a character
---
---Usage:
---```
---    -- remove the wroona.onQuest variable
---    ch:setVar("wroona.onQuest", nil)
---    -- set the wroona.didQuest variable and keep it for 24 hours
---    ch:setVar("wroona.didQuest", true, 24*60*60)
---```
---@param varName string the name of the variable to set
---@param value any the value, a string, number, or boolean. Pass in nil here to remove a variable.
---@param ttl? number the number of seconds to keep the variable, in seconds. (optional, if not specified it's kept indefinitely)
function Character:setVar (varName, value, ttl) end

---instantly kill a character.
---(Or hospitalize them, if eligible)
---
---Usage:
---```
---    ch:slay(dragonMob)
---```
---@param byCh Character the character doing the slaying, if applicable. Can be omitted or set to nil.
function Character:slay (byCh) end

---sets the character's permanent strength attribute.
---@param the integer new value (between 1 and 25)
---@return Character # this character, for call chaining.
function Character:setPermStrength (the) end

---transfer the character to the given room.
---This does not show the character the room contents, so you may wish to ch:force("look") afterward.
---
---Usage:
---```
---    ch:toRoom(12345)
---    ch:force("look")
---```
---@param room any the room to send them to, either a Room object or vnum
function Character:toRoom (room) end

---get an iterator over objects the character is wearing.
---
---Usage:
---```
---    for obj in ch:wearing() do
---    -- do something
---    end
---```
---@return Object # an iterator of Object
function Character:wearing () end

---the date/time the character was jailed
---@return integer # the time the character was jailed, or 0 if the character isn't in jail.
function Character:whenJailed () end

---get a list of objects worn on a given location
---
---Usage:
---```
---    wornOnLocation("head")
---```
---@param wearflag string of the location to check
---@return table # a list of objects worn on the given location
function Character:wornOnLocation (wearflag) end

---get an iterator over all connected players.
---
---Usage:
---```
---    -- Move all players to room 10
---    local room = Room.getFromVNum(10)
---    for ch in Character.connected() do
---    ch:toRoom(room)
---    ch:echoAt("You've been transferred!")
---    end
---```
---@return Character # an iterator of Character
function Character.connected () end

---get any character in the world by name.
---
---Usage:
---```
---    -- Find player "Puff"
---    local puff = Character.getFromName("Puff")
---    if not puff then
---    LOTJ.log("Couldn't find Puff.")
---    end
---```
---@param name string the mob name
---@return Character # the character, or nil if not found
function Character.getFromName (name) end

---create an instance of a mob.
---
---Usage:
---```
---    -- invoke mob 10000 and put it in a room
---    Character.invoke(10000):toRoom(someRoom)
---    -- invoke mob 1234 and do a few things with it
---    local newCh = Character.invoke(1234)
---    newCh:toRoom(someRoom)
---    newCh:say("Hello, I'm here!")
---```
---@param vnum number the mob vnum
---@return Character # the new character
function Character.invoke (vnum) end

---stun (lag) a player for a given number of seconds.
---Stuns can overlap, but do not stack, so if you apply a 5-second stun on top of a 10-second
---stun, they will still only be stunned for 10 seconds.
---
---Usage:
---```
---    -- Lag for 5 seconds
---    ch:stun(5)
---```
---@param seconds integer the number of seconds to stun this character for.
function Character:stun (seconds) end

