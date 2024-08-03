State
{
	StateName = "INIT",
	
	
	-------------------------------------------------------------------------------
	--------------------------------Dialogmanager----------------------------------
	-------------------------------------------------------------------------------
	--Dialog an, nach CS intro
	OnOneTimeEvent
	{
		
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_GhostSpawn"},
			--MapFlagIsFalse	{Name = "mf_AllGhostsUnbanned"},
			MapFlagIsTrue	{Name = "mf_CS_IntroDone"},	
		},
		Actions =
		{
			DialogSetEnabled	{},
			DialogTypeSetMainQuest	{},
		},
	},
	
	
	--Dialog wieder an, wenn Quest Botschaft aktiv
	OnOneTimeEvent
	{
		
		Conditions =
		{
			QuestIsActive	{Player = "default", Quest = "Befreie_vierten_Geist"},
			AvatarHasItemMisc	{Player = "default", ItemId = 79, Amount = 1},	
		},
		Actions =
		{
			DialogSetEnabled	{},
			DialogTypeSetMainQuest	{},
		},
	},
	
	
	-- Dialog aus, wenn beide Teile geführt
	OnOneTimeEvent
	{
		
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_SanshaHasForgiven"},
			MapFlagIsTrue	{Name = "mf_DialogSanshaPart1Done"},
		},
		Actions =
		{
			
			DialogSetDisabled	{Tag = "Sansha"},
			
		},
	},
}