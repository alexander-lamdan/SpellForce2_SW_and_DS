State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P309_TorHalicosIsOnWestguard"},
		
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_Halicos_Spawn"},
			AvatarFlagSetTrue {Name = "af_P300_TorHalicosOnWestguardArrived"},
			DialogTypeSetSideQuest	{Tag = "TorHalicos"},
			DialogSetEnabled	{Tag = "TorHalicos"},
			FigureSwappingDisable {},
		},
	},
	--Dialog Halicos Enabled und Disabled
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_TorHalicosFirstTime"}, 
			AvatarFlagIsFalse{Name = "af_P300_WestguardStartQuestBeastDefense"}, 
			MapFlagIsFalse{Name = "mf_AyaAngriffOnce"}, 
		
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "TorHalicos"},
		},
		
	},
	
	--Dialog Halicos Enabled und Disabled
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_TorHalicosFirstTime"}, 
			AvatarFlagIsTrue{Name = "af_P300_WestguardStartQuestBeastDefense"}, 
			MapFlagIsFalse{Name = "mf_AyaAngriffOnce"}, 
		
		},
		Actions =
		{
			DialogTypeSetSideQuest	{Tag = "TorHalicos"},
			DialogSetEnabled	{Tag = "TorHalicos"},
		},
		
	},
	--Dialog Halicos Enabled und Disabled
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_AyaAngriffOnce"},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "TorHalicos"},
		},
		
	},
	--Dialog Halicos Enabled und Disabled
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CutszeneAyaEnd"}, 
		},
		Actions =
		{
			DialogTypeSetSideQuest	{Tag = "TorHalicos"},
			DialogSetEnabled	{Tag = "TorHalicos"},
		},
		
	},
	--Dialog Halicos Enabled und Disabled
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_TorInfo01"}, 
			MapFlagIsTrue{Name = "mf_TorInfo02"},
			MapFlagIsTrue{Name = "mf_CutszeneAyaEnd"},  
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "TorHalicos"},
		},
		
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P300_CutszeneAyaEnd"}, 
			AvatarFlagIsTrue {Name = "af_P300_WestguardPlattformChange"},
		},
		Actions = 
		{
			DialogTypeSetSideQuest	{Tag = "TorHalicos"},
			DialogSetEnabled	{Tag = "TorHalicos"},
		},
		DeathActions = 
		{
			
		},
	},
			
}