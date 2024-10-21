WaitPointX = 230.008
WaitPointY = 274.624

HomeCampX = 173
HomeCampY = 376


State
{
	StateName = "MainState",
	
	
	OnIdleGoHomeFake
	{
		X = WaitPointX,
		Y = WaitPointY,
		Conditions = 
		{
			--AvatarFlagIsFalse { Name = "af_P307_EinarTacticDone"},
			AvatarFlagIsTrue {Name = "af_P307_CS02Finished"},
		},
		Actions = 
		{
		},
	};
	
--	OnIdleGoHomeFake
--	{
--		X = HomeCampX,
--		Y = HomeCampY,
--		Conditions = 
--		{
--			AvatarFlagIsTrue { Name = "af_P307_EinarTacticDone"}, 
--		},
--		Actions = 
--		{
--		},
--	};
	
	
--	
--	OnToggleEvent
--	{
--		EventName = "OnOffDialog",
--		OnConditions = 
--		{
--			AvatarFlagIsTrue {Name = "af_P307_CS02Finished"},
--			AvatarFlagIsFalse { Name = "af_P307_EinarTacticDone"}, 
--		},
--		OnActions = 
--		{
--			DialogTypeSetMainQuest{},
--    		DialogSetEnabled{},
--		},
--		OffConditions = 
--		{
--			AvatarFlagIsTrue { Name = "af_P307_EinarTacticDone"}, 
--		},
--		OffActions = 
--		{
--			DialogSetDisabled{},
--		},
--	};
--
--	OnEvent
--	{
--		Conditions =
--		{
--			AvatarFlagIsTrue { Name = "af_P307_EinarTacticDone"},
--			AvatarFlagIsFalse { Name = "af_P307_EinarGiveRessource"}, 
--			AvatarFlagIsFalse {Name = "af_P307_EinarAttack01"},
--  			AvatarFlagIsFalse {Name = "af_P307_EinarAttack02"},
--  			AvatarFlagIsFalse {Name = "af_P307_EinarAttack03"},
--  			AvatarFlagIsFalse {Name = "af_P307_EinarAttackBulwark"},
--		},
--		Actions =
--		{
--			AvatarFlagSetFalse { Name = "af_P307_EinarTacticDone"}, 
--		},
--	};

	OnOneTimeEvent
	{
			Conditions = 
			{
				AvatarFlagIsTrue {Name = "af_P307_CS02Finished"},
			},
			Actions = 
			{
				DialogTypeSetMainQuest{},
	 			DialogSetEnabled{},
			},
	};

	OnOneTimeEvent
	{
			Conditions = 
			{
				AvatarFlagIsTrue{Name = "af_P307_CampBulwarkBusted"},
			},
			Actions = 
			{
				AvatarFlagSetTrue { Name = "af_P307_EinarTacticDone"},
				-- zu Sicherheit wird TacticDone auf true gesetzt (damit es im Questbook weitergeht)
				DialogSetDisabled{},
			},
	};


                                                    
};                                                                            