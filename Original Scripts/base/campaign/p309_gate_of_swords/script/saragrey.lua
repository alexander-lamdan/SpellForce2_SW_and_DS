State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsKnown {Quest = "HouseOfGreyLethosApology1"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {Tag = "SaraGrey"},
			DialogSetEnabled {},
		},
	},
	OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "GoSTheHouseOfGreySara"},
    		QuestIsActive {Quest = "HouseOfGreyFindMagneticShard"},
    		-- hat der Spieler Item.Misc.MagnetStone
    		AvatarHasItemMisc {ItemId = 199, Amount = 1}
    	},
    	Actions =
    	{
    		QuestSetSolved {Quest = "HouseOfGreyFindMagneticShard"},
    		QuestSetActive {Quest = "HouseOfGreyReturnToSara"},
    		
    	}
    },
    OnOneTimeEvent
    {
    	Conditions =
    	{
    		QuestIsActive {Quest = "HouseOfGreyReturnToSara"},
    	},
    	Actions =
    	{
    		DialogSetEnabled {Tag = "SaraGrey"},
    	}
    },
    
}