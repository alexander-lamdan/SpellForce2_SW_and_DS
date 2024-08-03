
-- oben
spot1X = 177.8
spot1Y = 658
-- rechts oben
spot2X = 193.2 
spot2Y = 646.8
-- rechts unten
spot3X = 187.6
spot3Y = 627.2
-- links unten
spot4X = 166.6
spot4Y = 627.2
--links oben
spot5X = 161
spot5Y = 648.8

-- oben 
decalspot1X = 177.823
decalspot1Y = 651.507
decaldirection1 = 270.046
--rechts oben
decalspot2X = 186.893
decalspot2Y = 644.914
decaldirection2 = 197.853
-- rechts unten
decalspot3X = 183.539 
decalspot3Y = 634.271
decaldirection3 = 127.769
-- links unten
decalspot4X = 172.2
decalspot4Y = 634.231
decaldirection4 = 54.431
-- links oben
decalspot5X = 168.699
decalspot5Y = 644.886
decaldirection5 = 342.238






State
{
	StateName = "Start",
	OnOneTimeEvent
	{
		GotoState = "EndFight",
		Conditions =
		{
			FigureIsInRange {X = 176, Y = 658, Range = 5, Tag = "Sorvina"},
			MapFlagIsTrue {Name = "mf_P319_RiddleSolved"},
		},
		Actions =
		{
		},
	},	
}

State
{   
	StateName = "EndFight",
	-- Spieler hält Spitze oben in der Mitte besetzt
	OnToggleEvent
	{
		OnConditions =
		{
			OR
			{
				PlayerFigureIsInRange {X = spot1X, Y = spot1Y, Range = 3},
				FigureIsInRange {X = spot1X, Y = spot1Y, Range = 3, Tag = "Sorvina"}
			},
			MapFlagIsFalse {Name = "mf_P319_FasterPussicatKillKill"},
		},
		OnActions =
		{
			ObjectSpawn {X = decalspot1X, Y = decalspot1Y, ObjectId = 2061, Direction = decaldirection1, Tag = "Lilac"},
			MapFlagSetTrue {Name = "mf_Lilac"},
			
			-- Punkt besetzt also Immunität aus
			FigureAbilityRemove {Tag = "Sorvina", AbilityId = Ability.ImmuneBlack},
			
		},
		OffConditions =
		{
			PlayerFigureIsNotInRange {X = spot1X, Y = spot1Y, Range = 3},
			FigureIsNotInRange {X = spot1X, Y = spot1Y, Range = 3, Tag = "Sorvina"}
		},
		OffActions =
		{
			ObjectVanish {Tag = "Lilac"},
			MapFlagSetFalse {Name = "mf_Lilac"},
			
			-- keiner da also immunität wieder an
			FigureAbilityAdd {Tag = "Sorvina", AbilityId = Ability.ImmuneBlack},
		},
	},
	-- Spieler hält Spitze oben rechts besetzt
	OnToggleEvent
	{
		OnConditions =
		{
			OR
			{
				PlayerFigureIsInRange {X = spot2X, Y = spot2Y, Range = 3},
				FigureIsInRange {X = spot2X, Y = spot2Y, Range = 3, Tag = "Sorvina"}
			},
			MapFlagIsFalse {Name = "mf_P319_FasterPussicatKillKill"},
		},
		OnActions =
		{
			ObjectSpawn {X = decalspot2X, Y = decalspot2Y, ObjectId = 2062, Direction = decaldirection2, Tag = "Yellow"},
			MapFlagSetTrue {Name = "mf_Yellow"},
			
			-- Feuerresi weg
			FigureAbilityRemove {Tag = "Sorvina", AbilityId = Ability.ImmuneFire},
		},
		OffConditions =
		{
			PlayerFigureIsNotInRange {X = spot2X, Y = spot2Y, Range = 3},
			FigureIsNotInRange {X = spot2X, Y = spot2Y, Range = 3, Tag = "Sorvina"}
		},
		OffActions =
		{
			ObjectVanish {Tag = "Yellow"},
			MapFlagSetFalse {Name = "mf_Yellow"},
			
			-- Feuerresie wieder da
			FigureAbilityAdd {Tag = "Sorvina", AbilityId = Ability.ImmuneFire},
		},
	},
	-- Spieler hält Spitze unten rechts besetzt
	OnToggleEvent
	{
		OnConditions =
		{
			OR
			{
				PlayerFigureIsInRange {X = spot3X, Y = spot3Y, Range = 3},
				FigureIsInRange {X = spot3X, Y = spot3Y, Range = 3, Tag = "Sorvina"}
			},
			MapFlagIsFalse {Name = "mf_P319_FasterPussicatKillKill"},
		},
		OnActions =
		{
			ObjectSpawn {X = decalspot3X, Y = decalspot3Y, ObjectId = 2058, Direction = decaldirection3, Tag = "Blue"},
			MapFlagSetTrue {Name = "mf_Blue"},
			
			-- Eis weg
			FigureAbilityRemove {Tag = "Sorvina", AbilityId = Ability.ImmuneIce},
		},
		OffConditions =
		{
			FigureIsNotInRange {X = spot3X, Y = spot3Y, Range = 3, Tag = "Sorvina"},
			PlayerFigureIsNotInRange {X = spot3X, Y = spot3Y, Range = 3}
		},
		OffActions =
		{
			ObjectVanish {Tag = "Blue"},
			MapFlagSetFalse {Name = "mf_Blue"},
			
			-- Eis wieder da
			FigureAbilityAdd {Tag = "Sorvina", AbilityId = Ability.ImmuneIce},

		},
	},
	-- Spieler hält Spitze unten links besetzt
	OnToggleEvent
	{
		OnConditions =
		{
			OR
			{
				PlayerFigureIsInRange {X = spot4X, Y = spot4Y, Range = 3},
				FigureIsInRange {X = spot4X, Y = spot4Y, Range = 3, Tag = "Sorvina"}
			},
			MapFlagIsFalse {Name = "mf_P319_FasterPussicatKillKill"},
		},
		OnActions =
		{
			ObjectSpawn {X = decalspot4X, Y = decalspot4Y, ObjectId = 2060, Direction = decaldirection4, Tag = "Red"},
			MapFlagSetTrue {Name = "mf_Red"},
			
			-- Sollte Phyisch sein, ist aber zur Zeit Projektil
			FigureAbilityRemove {Tag = "Sorvina", AbilityId = Ability.ImmuneProjectile},
			FigureAbilityRemove {Tag = "Sorvina", AbilityId = 438},

		},
		OffConditions =
		{
			PlayerFigureIsNotInRange {X = spot4X, Y = spot4Y, Range = 3},
			FigureIsNotInRange {X = spot4X, Y = spot4Y, Range = 3, Tag = "Sorvina"}
		},
		OffActions =
		{
			ObjectVanish {Tag = "Red"},
			MapFlagSetFalse {Name = "mf_Red"},
			
			-- Projektilschaden wieder möglich
			FigureAbilityAdd {Tag = "Sorvina", AbilityId = Ability.ImmuneProjectile},
			FigureAbilityAdd {Tag = "Sorvina", AbilityId = 438},
		},
	},
	-- Spieler hält Spitze oben links besetzt
	OnToggleEvent
	{
		OnConditions =
		{
			OR
			{
				PlayerFigureIsInRange {X = spot5X, Y = spot5Y, Range = 3},
				FigureIsInRange {X = spot5X, Y = spot5Y, Range = 3, Tag = "Sorvina"}
			},
			MapFlagIsFalse {Name = "mf_P319_FasterPussicatKillKill"},
		},
		OnActions =
		{
			ObjectSpawn {X = decalspot5X, Y = decalspot5Y, ObjectId = 2059, Direction = decaldirection5, Tag = "Green"},
			MapFlagSetTrue {Name = "mf_Green"},
			
			-- Mental aus
			FigureAbilityRemove {Tag = "Sorvina", AbilityId = Ability.ImmuneMental},
		},
		OffConditions =
		{
			PlayerFigureIsNotInRange {X = spot5X, Y = spot5Y, Range = 3},
			FigureIsNotInRange {X = spot5X, Y = spot5Y, Range = 3, Tag = "Sorvina"}
		},
		OffActions =
		{
			ObjectVanish {Tag = "Green"},
			MapFlagSetFalse {Name = "mf_Green"},
			
			-- Mental wieder an
			FigureAbilityAdd {Tag = "Sorvina", Tag = "Sorvina", AbilityId = Ability.ImmuneMental},

		},
	},
}