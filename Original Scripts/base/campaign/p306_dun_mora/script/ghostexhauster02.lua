--Ghost02: hasst alle Menschen, Geist muss getoetet werden

State
{
	StateName = "INIT",
	--Spawnt, wenn Shae sie sichtbar macht
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GhostSpawn"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "GhostExhauster02"},
			DialogTypeSetMainQuest	{Tag = "GhostExhauster02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster2GiveQuest"},
		},
		Actions = 
		{
			QuestSetActive	{Player = "default", Quest = "Befreie_zweiten_Geist"},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Exhauster2DialogEnded"}, 
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Ghost"},
			--FigureAttackEntity	{Tag = "default", TargetTag = "pl_HumanAvatar"},
		},
	},
};


		