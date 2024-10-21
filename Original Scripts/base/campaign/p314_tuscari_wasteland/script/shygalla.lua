
  
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarFlagIsTrue{Name = "af_P314_ShygallaAppear"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_ShygallaSpawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ShygallaSpawned"},
		},
		Actions =
		{
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
  			OR
  			{
  				FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 10},
  				FigureHasNotHealth{Tag = "default", Percent = 90},
  			},
  		},
  		Actions =
  		{
  			MapFlagSetTrue{Name = "mf_SpawnShygallasServants"},
  		},
  	},
  	
};
