State
{
	StateName = "INIT",
	--Sobald die Wachen ausgeschaltet sind öffnet sich der Käfig
	OnOneTimeLeverEvent	
	{
		Lever = "LeverPrisoner1", 
		OnConditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "LeverPrisoner1", Range = 5},
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 10, X = 495, Y = 105},
			QuestIsActive	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GatePrisoner1"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_woodcage_open", X = 495, Y = 10, Z = 106, MaxRange = 20, FallOffRange = 5},
			DialogTypeSetSideQuest	{Tag = "Gefangener1"},
			DialogSetEnabled	{Tag = "Gefangener1"},
		},
	},
	
	--Sobald die Wachen ausgeschaltet sind öffnet sich der Käfig
	OnOneTimeLeverEvent	
	{
		Lever = "LeverPrisoner2", 
		OnConditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "LeverPrisoner2", Range = 5},
			FigureTeamIsNotInRange	{Team = "tm_Team2", Range = 10, X = 40, Y = 492},
			QuestIsActive	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "GatePrisoner2"},
			SoundAmbientPlayOnceAddon1	{File = "06_level/lvl_woodcage_open", X = 39, Y = 15, Z = 492, MaxRange = 20, FallOffRange = 5},
			DialogTypeSetSideQuest	{Tag = "Gefangener2"},
			DialogSetEnabled	{Tag = "Gefangener2"},
			
		},
	},


	OnFollowEvent
	{
		Tag = "Gefangener1",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
			MapFlagIsTrue{Name = "mf_FollowPrisoner1"},
		},
		Actions = 
		{
		
		},
	},
    
	OnFollowEvent
	{
		Tag = "Gefangener1_2",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
			MapFlagIsTrue{Name = "mf_FollowPrisoner1"},
		},
		Actions = 
		{
		
		},
	},

	OnFollowEvent
	{
		Tag = "Gefangener1_3",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
			MapFlagIsTrue{Name = "mf_FollowPrisoner1"},
		},
		Actions = 
		{
		
		},
	},

	OnFollowEvent
	{
		Tag = "Gefangener2",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
			MapFlagIsTrue{Name = "mf_FollowPrisoner2"},
		},
		Actions = 
		{
		
		},
	},
    
	OnFollowEvent
	{
		Tag = "Gefangener2_2",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
			MapFlagIsTrue{Name = "mf_FollowPrisoner2"},
		},
		Actions = 
		{
		
		},
	},

	OnFollowEvent
	{
		Tag = "Gefangener2_3",
		TargetTag = "pl_HumanAvatar",
		OnConditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
			MapFlagIsTrue{Name = "mf_FollowPrisoner2"},
		},
		Actions = 
		{
		
		},
	},

	--NQ Der Gefangenen1 wird gesolved sobald alle drei auf dem Marktplatz stehen.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "Gefangener1", TargetTag = "Prisoner1EndPoint", Range = 8},
			FigureIsInRangeToEntity	{Tag = "Gefangener1_2", TargetTag = "Prisoner1EndPoint", Range = 8},
			FigureIsInRangeToEntity	{Tag = "Gefangener1_3", TargetTag = "Prisoner1EndPoint", Range = 8},
		},
		Actions =
		{
			QuestSetSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
			DialogSetDisabled	{Tag = "Gefangener1" },
			ObjectVanish	{Tag = "AimPrisoners1"},
			FogOfWarCloak	{FogOfWarId = 10},
			
		},
		
	},
	--Prisoners walk home.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Gefangener1", X = 576, Y = 365},
		},
		
	},
	
	--Prisoners vanish.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Tag = "Gefangener1", Range = 2, X = 576, Y = 365},
		},
		Actions =
		{
			FigureVanish	{Tag = "Gefangener1"},
		},
		
	},
	--Prisoners walk home.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Gefangener1_2", X = 568, Y = 397},
		},
		
	},
	
	--Prisoners vanish.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Tag = "Gefangener1_2", Range = 2, X = 568, Y = 397},
		},
		Actions =
		{
			FigureVanish	{Tag = "Gefangener1_2"},
		},
		
	},
	--Prisoners walk home.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Gefangener1_3", X = 582, Y = 351},
		},
		
	},
	
	--Prisoners vanish.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Tag = "Gefangener1_3", Range = 2, X = 582, Y = 351},
		},
		Actions =
		{
			FigureVanish	{Tag = "Gefangener1_3"},
		},
		
	},
	--NQ Der Gefangenen2 wird gesolved sobald alle drei auf dem Marktplatz stehen.
    OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "Gefangener2", TargetTag = "Prisoner2EndPoint", Range = 8},
			FigureIsInRangeToEntity	{Tag = "Gefangener2_2", TargetTag = "Prisoner2EndPoint", Range = 8},
			FigureIsInRangeToEntity	{Tag = "Gefangener2_3", TargetTag = "Prisoner2EndPoint", Range = 8},
		},
		Actions =
		{
			QuestSetSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
			DialogSetDisabled	{Tag = "Gefangener2" },
			ObjectVanish	{Tag = "AimPrisoners2"},
			FogOfWarCloak	{FogOfWarId = 11},
		},
		
	},
	
	--Prisoners walk home.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Gefangener2", X = 581, Y = 333},
		},
		
	},
	
	--Prisoners vanish.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Tag = "Gefangener2", Range = 2, X = 581, Y = 333},
		},
		Actions =
		{
			FigureVanish	{Tag = "Gefangener2"},
		},
		
	},
	--Prisoners walk home.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Gefangener2_2", X = 604, Y = 319},
		},
		
	},
	
	--Prisoners vanish.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Tag = "Gefangener2_2", Range = 2, X = 604, Y = 319},
		},
		Actions =
		{
			FigureVanish	{Tag = "Gefangener2_2"},
		},
		
	},
	--Prisoners walk home.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
		},
		Actions =
		{
			FigureWalk	{Tag = "Gefangener2_3", X = 614, Y = 362},
		},
		
	},
	
	--Prisoners vanish.
	OnOneTimeEvent
	{
    	
		Conditions =
		{
			FigureIsInRange	{Tag = "Gefangener2_3", Range = 2, X = 614, Y = 362},
		},
		Actions =
		{
			FigureVanish	{Tag = "Gefangener2_3"},
		},
		
	},
	--Sobald der Spieler die Sachen des Bauern Locke hat wird der Dialog eingeschaltet
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsActive	{Player = "pl_Human", Quest = "Bring_back_Farmer_LockeGoods"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 398, Amount = 1},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "BauerLocke" },
			DialogTypeSetSideQuest	{Tag = "BauerLocke"},
		},
		
	},
	--Sobald der Spieler die Sachen des Bauern Salios hat wird der Dialog eingeschaltet
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsActive	{Player = "pl_Human", Quest = "Bring_back_Farmer_SaliosGoods"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 397, Amount = 1},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "BauerSalios" },
			DialogTypeSetSideQuest	{Tag = "BauerSalios"},
		},
		
	},
	--Sobald der Spieler die Sachen des Bauern Idling hat wird der Dialog eingeschaltet
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			QuestIsActive	{Player = "pl_Human", Quest = "Bring_back_Farmer_IdlingGoods"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 399, Amount = 1},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "BauerIdling" },
			DialogTypeSetSideQuest	{Tag = "BauerIdling"},
		},
		
	},
	
};


