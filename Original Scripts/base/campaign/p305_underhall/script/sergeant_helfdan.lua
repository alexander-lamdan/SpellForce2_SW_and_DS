


State
{
	StateName = "UgnathStart",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_HelfdanDefenderSpawn"},	
		},
		Actions = 
		{
			FigureAbilityAdd {AbilityId = Ability.Immortal},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_HelfanTalked"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_HelfanDialogEnded"},
			DialogSetDisabled	{Tag = "Sergeant_Helfdan"},
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_Zwerge1"}, 
			PlayerResourceSilverGive	{Player = "pl_Human", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Human", Amount = 300},
			PlayerResourceLenyaGive	{Player = "pl_Human", Amount = 300}, 
			FigureWalk	{X = 660, Y = 182},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 2, X = 660, Y = 182},
			MapFlagIsTrue {Name = "mf_HelfanDialogEnded"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_HelfdanSpawnTimer"},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_HelfdanSpawnTimer", Seconds = 1},
		},
		Actions =
		{
			EffectStartAtEntityPosition	{File = "Effect_Spawn_Unit"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_HelfdanSpawnTimer", Seconds = 3.5},
		},
		Actions =
		{
			FigureVanish	{Tag = "default"},
			EffectStop	{Tag = "default"},
		},
	},
	

};
