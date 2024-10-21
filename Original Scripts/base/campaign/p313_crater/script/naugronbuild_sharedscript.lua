delay = 30


State
{
	StateName = "Desctruct01",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_BoneRain"},
			MapTimerIsElapsed{Name = "mt_BoneRainDelay", Seconds = 3},
			OR
			{  
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 1},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 2},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 3},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 4},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 5},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 6},
				},
			},
		},
		Actions = 
		{
			BuildingHealthSubtract{Percent = 33},
			EffectStart	{Tag = "default", File = "Effect_Misc_BoneHit"},
			EntityTimerStart{Name = "et_WaitBetweenDestructionPhases"},
			MapFlagSetTrue{Name ="mf_AnyTowerDamaged"},
		},
		GotoState = "Desctruct02",
	},
	
	
}

State
{
	StateName = "Desctruct02",
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_WaitBetweenDestructionPhases", Seconds = 7},
			MapFlagIsTrue{Name = "mf_BoneRain"},
			MapTimerIsElapsed{Name = "mt_BoneRainDelay", Seconds = 3},
			OR
			{  
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 1},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 2},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 3},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 4},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 5},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 6},
				},
			},
		},
		Actions = 
		{
			BuildingHealthSubtract{Percent = 33},
			EffectStart	{Tag = "default", File = "Effect_Misc_BoneHit"},
			EntityTimerStart{Name = "et_WaitBetweenDestructionPhases"},
		},
		GotoState = "Desctruct04",
	},
	
}


State
{
	StateName = "Desctruct04",
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_WaitBetweenDestructionPhases", Seconds = 7},
			MapFlagIsTrue{Name = "mf_BoneRain"},
			MapTimerIsElapsed{Name = "mt_BoneRainDelay", Seconds = 3},
			OR
			{  
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 1},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroBor", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 2},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroJared", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 3},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroLya", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 4},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroMordecay", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 5},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_HumanHeroShae", Range = 7, X = GetEntityX(), Y = GetEntityY()},
					MapValueIsEqual {Name = "mv_BoneRainTarget", Value = 6},
				},
			},
		},
		Actions = 
		{
			EffectStart	{Tag = "default", File = "Effect_Misc_BoneHit"},
			AvatarValueAdd{Name = "av_P313_NaugronBuildsSmashed", Value = 1},
			BuildingDestroy{Tag = "default"},
		},
	},
	
}