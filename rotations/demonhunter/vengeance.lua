local _, Xeer = ...

local GUI = {

} 

local exeOnLoad = function()
	-- Xeer.ExeOnLoad()
	print('|cff0070de ----------------------------------------------------------------------|r')
	print('|cff0070de --- |rDemon Hunter: |cff0070deHAVOC|r')
	print('|cff0070de --- |rTalents: 1/2 - 2/2 - 3/2 - 4/3 - 5/2 - 6/1 - 7/2')
	print('|cff0070de ----------------------------------------------------------------------|r')
	print('|cffff0000 Fel Rush manually |r')
	print('|cffff0000 Metamorphosis = left-control |r')
	print('|cffff0000 Cooldowns: Chaos Blades / Nemesis |r')

end

local Survival = {
	{'Blur', 'player.health <= 40'},

}

local Interrupts = {
	{'Arcane Torrent', 'target.range<=8&spell(Consume Magic).cooldown>gcd&!prev_gcd(Consume Magic)'},
	{'Consume Magic'}
}
local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2'},
}
local Keybinds = {
	{'!Metamorphosis', 'keybind(lcontrol)', 'cursor.ground'},

}

local Cooldowns = {
	{'Chaos Blades','talent(7,1)'},
	{'Nemesis','talent(5,3)'},
}

local inCombat = {
	{Keybinds},
	{Survival, 'player.health < 100'},
	{Interrupts, 'target.interruptAt(85)'},
	{Cooldowns, 'toggle(cooldowns)'},
	-- {Trinkets, '{!moving||moving}'},


	-- Fel Rush (manually)
	-- Vengeful Retreat If talented into Prepared and/or Momentum (manually)

	-- Fel Barrage if talented and at 5 charges.
	{'Fel Barrage','talent(7,2)&spell(Fel Barrage).charges=5'},
	
	-- Throw Glaive if talented into Bloodlet and Master of the Glaive.
	{'Throw Glaive','talent(3,3)&talent(6,1)'},
	
	-- Fel Eruption if talented.
	{'Fel Eruption','talent(5,2)'},
	
	-- Fury of the Illidari.
	{'Fury of the Illidari','target.range<=5'},
	
	
	-- Eye Beam if talented into Demonic
	{'Eye Beam','talent(7,3)&target.range<=8'},
	
	
	-- Use Blade Dance / Death Sweep on 3+ targets
	{'Blade Dance', '!talent(3,1)&player.area(20).enemies>2'},
	{'Death Sweep', '!talent(3,1)&player.area(20).enemies>2'},
	
	-- or On cooldown if talented into First Blood
	{'Blade Dance', 'talent(3,2)&target.range<=5'},
	{'Death Sweep', 'talent(3,2)&target.range<=5'},	

	-- or On 4+ targets if talented into Chaos Cleave.
	{'Blade Dance', 'talent(3,1)&player.area(20).enemies>3'},
	{'Death Sweep', 'talent(3,1)&player.area(20).enemies>3'},
	
	-- Throw Glaive if talented into Bloodlet and 2+ targets
	{'Throw Glaive','talent(3,3)&player.area(30).enemies>1'},

	-- Felblade if talented.
	{'Felblade','talent(1,2)'},

	--Eye Beam if talented into Blind Fury.
	{'Eye Beam','talent(1,3)&target.range<=8'},
	
	-- Annihilation (if in metamorph)
	{'Annihilation'},

	-- Throw Glaive if talented into Bloodlet
	{'Throw Glaive','talent(3,3)'},
	
	--Eye Beam if Metamorphosis is not active and you will hit 2+ targets
	-- and NOT talented into Blind Fury, Chaos Cleave or Demonic.
	{'Eye Beam','!talent(1,3)&!talent(3,1)&!talent(7,3)&target.range<=10&player.area(20).enemies>1&!player.buff(Metamorphosis)'},	
	
	--Throw Glaive if Metamorphosis is not active and you will hit 2+ targets.
	{'Throw Glaive','player.area(20).enemies>1&!player.buff(Metamorphosis)'},	
	
	-- Chaos Strike.
	{'Chaos Strike', 'player.fury >= 40'},

	-- Demon's Bite.
	{'Demon\'s Bite','!talent(2,2)'},
	
	--Throw Glaive if talented into Demon Blades and not talented into Bloodlet.
	{'Throw Glaive','talent(2,2)&!talent(3,3)'},		
	
}

local outCombat = {
	{Keybinds}
}

NeP.CR:Add(577, {
	name = '[|cff'..Xeer.addonColor..'Xeer|r] Demon Hunter - Havoc',
	  ic = inCombat,
	 ooc = outCombat,
	 gui = GUI,
	load = exeOnLoad
})
