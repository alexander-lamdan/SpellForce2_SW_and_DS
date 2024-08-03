
State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			OR
			{
				EntityValueIsEqual{Name = "ev_IHide", Value = IHide}, 
				
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = GetEntityX(), Y = GetEntityY()},
				FigureIsInRange	{Tag = "pl_HumanHeroCaine", Range = 10, X = GetEntityX(), Y = GetEntityY()},
				FigureIsInRange	{Tag = "pl_HumanHeroWhisper", Range = 10, X = GetEntityX(), Y = GetEntityY()},
				FigureIsInRange	{Tag = "pl_HumanHeroWind", Range = 10, X = GetEntityX(), Y = GetEntityY()},
			},
			MapFlagIsFalse{Name = "mf_KillAllCreeps"},
		},
		NoSpawnEffect = false,
	};	
	
	OnEvent
	{
		Conditions =
		{
			-- wenn Spieler Geisterrassel hat
			AND
			{
				FigureIsInRangeToEntity	{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 8},
				AvatarHasItemMisc{Player = "pl_Human", ItemId = 327, Amount = 1},
			},
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_AvatarDoesRattling"},
			MapValueAdd{Name = "mv_RattlingCounter", Value = 1},
			FigureKill	{Tag = "default"},
		},
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 1200 + math.random(1200),
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsFalse{Name = "mf_KillAllCreeps"},
		},
		Actions = 
		{
		},
		NoSpawnEffect = false,
	};
	
	
	-- Im 3. Teil sterben alle Creeps
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_KillAllCreeps"},
		},
		Actions =
		{
			FigureKill	{Tag = "default"},
		},
	},


}