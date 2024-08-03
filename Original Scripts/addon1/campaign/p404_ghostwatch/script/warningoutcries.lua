State
{	
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_CS03Ended"},
			OR
			{
				BuildingHasNotHealth	{Tag = "OwnBuildCastle", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildOrderStronghold", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildDwarvenForge", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildBlacksmith", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildWarriorGuild", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildStonemason", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildElenShrine", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildFarm", Percent = 80},
				BuildingHasNotHealth	{Tag = "OwnBuildElvenFortress", Percent = 80},
			},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Alarm06", Tag = "Commander"},	
		},	
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_CS03Ended"},
			OR
			{
				BuildingHasNotHealth	{Tag = "OwnBuildCastle", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildOrderStronghold", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildDwarvenForge", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildBlacksmith", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildWarriorGuild", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildStonemason", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildElenShrine", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildFarm", Percent = 15},
				BuildingHasNotHealth	{Tag = "OwnBuildElvenFortress", Percent = 15},
			},
		},
		Actions =
		{
			FigureOutcry {TextTag = "Alarm07", Tag = "Commander"},		
		},	
	},
	
}