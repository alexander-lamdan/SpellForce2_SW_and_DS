
  
  

State
{	
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			AvatarValueIsGreaterOrEqual{Name = "av_P304_NesselQuestionCounter", Value = 4},
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
			MapFlagSetTrue {Name = "mf_Mugger01Spawned"},
		},
		-- Die Mugger spawnen, sobald man bei 4 oder mehr Guildmasters
		-- nach der Nessel gefragt hat
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
  			FigureIsInEntityRange{Tag = "default", TargetTag = "pl_HumanAvatar", Range = 10 },
  		},
  		Actions =
  		{
  			FigureOutcry{TextTag = "MuggersDelight01", Tag = "Mugger01"},
  			FigureOutcry{TextTag = "MuggersDelight02", Tag = "Mugger01"},
  			MapFlagSetTrue{Name = "mf_MuggersGetAggro"},
  		},
  	},
   
  	OnOneTimeEvent
  	{
  		Conditions =
  		{
  			MapFlagIsTrue{Name = "mf_MuggersGetAggro"},
  		},
  		Actions =
  		{
  			FigureTeamTransfer{Tag = "default", Team = "tm_Creep"},
  		},
  	},
  	
  	OnOneTimeEvent
  	{
  		Conditions =
  		{
  			AvatarValueIsEqual{Name = "av_P304_TalkWithHagard", Value = 2 },
  		},
  		Actions =
  		{
  			FigureVanish{Tag = "default"},
  		},
  		-- Sobald man zweimal mit Hagard gesprochen hat (und die Mugger nicht
  		-- ohnehin gekillt ist), werden die Mugger wieder gevanished
  	},
  	

  	
};
