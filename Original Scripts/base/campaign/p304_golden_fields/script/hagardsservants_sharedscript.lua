
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue{Name ="af_P314_HagardSummonsSverants"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_Spawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_Spawned"},
		},
		Actions =
		{
			MapFlagSetTrue{ Name = MySpawnMapFlag},
			FigureAbilityAdd{Tag = "default", AbilityId = Ability.Immortal},
		},
		GotoState = "MainScript"
	},
}

State
{
	StateName = "MainScript",
   	
   	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P304_GiveSoldierTroops"},
			AvatarFlagIsTrue{Name = "af_P304_GiveMageTroops"},
		},
		Actions = 
		{
			FigureAbilityRemove{Tag = "default", AbilityId = Ability.Immortal},
		},
	},		
};
