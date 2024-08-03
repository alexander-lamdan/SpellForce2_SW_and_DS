WaitPointX = 232.809
WaitPointY = 263.98

HomeCampX = 262
HomeCampY = 144


State
{
	StateName = "MainState",
	
	
	OnIdleGoHomeFake
	{
		X = WaitPointX,
		Y = WaitPointY,
		Conditions = 
		{
			--AvatarFlagIsFalse { Name = "af_P307_KaranTacticDone"},
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
--			AvatarFlagIsTrue { Name = "af_P307_KaranTacticDone"}, 
--		},
--		Actions = 
--		{
--		},
--	};
--
--
--	
--	OnToggleEvent
--	{
--		EventName = "OnOffDialog",
--		OnConditions = 
--		{
--			AvatarFlagIsTrue {Name = "af_P307_CS02Finished"},
--			AvatarFlagIsFalse { Name = "af_P307_KaranTacticDone"}, 
--		},
--		OnActions = 
--		{
--			DialogTypeSetMainQuest{},
--    		DialogSetEnabled{},
--		},
--		OffConditions = 
--		{
--			AvatarFlagIsTrue { Name = "af_P307_KaranTacticDone"}, 
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
--			AvatarFlagIsTrue { Name = "af_P307_KaranTacticDone"}, 
--			AvatarFlagIsFalse { Name = "af_P307_KaranGiveRessource"},
--			AvatarFlagIsFalse {Name = "af_P307_KaranAttack01"},
--  			AvatarFlagIsFalse {Name = "af_P307_KaranAttack02"},
--  			AvatarFlagIsFalse {Name = "af_P307_KaranAttack03"},
--  			AvatarFlagIsFalse {Name = "af_P307_KaranAttackBulwark"},
--		},
--		Actions =
--		{
--			AvatarFlagSetFalse { Name = "af_P307_KaranTacticDone"}, 
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
				AvatarFlagSetTrue { Name = "af_P307_KaranTacticDone"},
				-- zu Sicherheit wird TacticDone auf true gesetzt (damit es im Questbook weitergeht)
				DialogSetDisabled{},
			},
	};
                                                       
};                                                                            