
State
{
	StateName = "INIT",
	
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue{Name = "af_P304_BannerQuestGiven"},
				QuestIsActive{Quest = "HouseOfGreyLethosApology2"},
			}, 
			-- Eremit spawnt sowohl, wenn man Bannerquest hat als auch bei Familie-Grau-Quest
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_Spawned"},
		},
	};


	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_Spawned"},
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
}


State
{
	StateName = "MainState",
	
	OnToggleEvent
	{
		EventName = "OnOffDialog",
		OnConditions = 
		{
			--EntityFlagIsFalse {Name ="ef_DialogOff"},
			OR
			{
				AND
				{
					AvatarFlagIsTrue{Name = "af_P304_BannerQuestGiven"},
					AvatarValueIsNotEqual{Name = "av_P304_DialogWithHermit", Value = 2},
				},
				QuestIsActive{Quest = "HouseOfGreyLethosApology2"},
			},
			
		},
		OnActions = 
		{
			DialogTypeSetSideQuest{},
    		DialogSetEnabled{},
		},
		OffConditions = 
		{
			--EntityFlagIsTrue {Name ="ef_DialogOff"},
			OR
			{
				AND
				{	
					QuestIsSolved{Quest = "HouseOfGreyLethosApology2"},
					AvatarFlagIsFalse{Name = "af_P304_BannerQuestGiven"},
				},
				-- wenn Spieler Letho-Quest gesolved hat und Banner noch nicht kennt
				AND
				{
					QuestIsSolved{Quest = "HouseOfGreyLethosApology2"},
					AvatarFlagIsTrue{Name = "af_P304_BannerQuestGiven"},
					AvatarValueIsEqual{Name = "av_P304_DialogWithHermit", Value = 2},
				},
				-- wenn Spieler Lehto-Quest gesolved hat und Banner gelöst
				AND
				{
					QuestIsNotKnown{Quest = "HouseOfGreyLethosApology2"},
					AvatarFlagIsTrue{Name = "af_P304_BannerQuestGiven"},
					AvatarValueIsEqual{Name = "av_P304_DialogWithHermit", Value = 2},
				},
				-- wenn Spieler Lehto-Quest noch nicht hat und Banner gelöst
			},
		},
		OffActions = 
		{
			DialogSetDisabled{},
		},
	};

	
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--			AvatarValueIsEqual{Name = "av_P304_DialogWithHermit", Value = 2},
--		},
--		Actions = 
--		{
--			EntityFlagSetTrue {Name ="ef_DialogOff"},
--		}, -- Sobald Dialog fertig abschalten
--	};
    
   
                                                                      
};                                                                            