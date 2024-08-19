--BlackPouderPosition
BombJack = 1061
BarrelPosition01X = 621.6
BarrelPosition01Y = 567
BarrelPosition02X = 581
BarrelPosition02Y = 525
BarrelPosition03X = 562.8
BarrelPosition03Y = 532
BarrelPosition04X = 579.6
BarrelPosition04Y = 550.2
BarrelPosition05X = 582.4
BarrelPosition05Y = 505.4
BarrelPosition06X = 607.6
BarrelPosition06Y = 520.8
BarrelPosition07X = 553
BarrelPosition07Y = 504
BarrelPosition08X = 613.2
BarrelPosition08Y = 498.4
BarrelPosition09X = 572.6
BarrelPosition09Y = 483
BarrelPosition10X = 544.6
BarrelPosition10Y = 483
BarrelPosition11X = 547.4
BarrelPosition11Y = 516.6

State
{
	StateName = "OutcriesMainQuest",
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_BombJackOutcryStart"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave01"},
			FigureOutcry	{Tag = "Haldor", TextTag = "Haldor01"},
			FigureOutcry	{Tag = "Haldor", TextTag = "Haldor02"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb01set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave02"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb02set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition02X, Y = BarrelPosition02Y},

		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave03"},
			
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb03set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition03X, Y = BarrelPosition03Y},

		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave04"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb04set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition04X, Y = BarrelPosition04Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave02"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb05set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition05X, Y = BarrelPosition05Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave03"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb06set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition06X, Y = BarrelPosition06Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave04"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb07set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition07X, Y = BarrelPosition07Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave02"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb08set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition08X, Y = BarrelPosition08Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave03"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb09set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition09X, Y = BarrelPosition09Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave04"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb10set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition10X, Y = BarrelPosition10Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave02"},
		},
	},
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Bomb11set"},
			FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition11X, Y = BarrelPosition11Y},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "BombJackUnit", TextTag = "Slave04"},
		},
	},
	
	--Spieler hat das erste Tor geöffnet.
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			EntityIsNotExisting	{Tag = "MainGateDwarf"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Skjadir", TextTag = "Skjadir02"},
		},
	},
	
	--Avatar befindet sich im Zwergentor bereich.
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			GateIsClosed	{Tag = "DwarfGate02"},
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 501, Y = 477},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Skjadir", TextTag = "Skjadir03"},
		},
	},
	
	
	
	--Das DwarfGate öffnet sich sobald sich ein Zwerg in Reichweite befindet.
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			SetUpdateInterval	{Steps = 20},
			OR
			{
				FigureIsInRange	{Tag = "Dwarf01", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf02", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf03", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf04", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf05", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf06", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf07", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf08", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf09", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf10", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf11", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf12", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf13", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf14", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf15", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf16", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf17", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf18", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf19", Range = 5, X = 497, Y = 477},
				FigureIsInRange	{Tag = "Dwarf20", Range = 5, X = 497, Y = 477},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Skjadir", TextTag = "Skjadir01"},
			MapTimerStart	{Name = "mt_GateDwarfOpenTimer"},
		},
	},
	--Redmund, erstes Mal Truppen übergeben:
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Warenaustausch"},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Redmund", TextTag = "General_Redmund01"},
			MapTimerStart	{Name = "mt_ClanAttackTimer"},
		},
	},
	
	--Redmund, nach einer Weile keine Lager zerstört:
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			MapTimerIsElapsed	{Name = "mt_ClanAttackTimer", Seconds = 300},
			PlayerHasBuildingAmount	{Player = "pl_Pact02", Amount = 1, OnlyCompleted = true},	
			PlayerHasBuildingAmount	{Player = "pl_Pact03", Amount = 1, OnlyCompleted = true},	
			PlayerHasBuildingAmount	{Player = "pl_Pact04", Amount = 1, OnlyCompleted = true},	
			PlayerHasBuildingAmount	{Player = "pl_Pact05", Amount = 1, OnlyCompleted = true},	
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Redmund", TextTag = "General_Redmund02"},
		},
	},
	
	--Redmund, erstes Lager zerstört (cheering):
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 1},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Redmund", TextTag = "General_Redmund03"},
			FigureOutcry	{Tag = "Ulf", TextTag = "King_Ulf01"},
			FigureOutcry	{Tag = "Riddengard", TextTag = "Riddengard01"},
			
		},
	},
	--Redmund, zweites Lager zerstört(cheering):
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 2},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Redmund", TextTag = "General_Redmund04"},
			FigureOutcry	{Tag = "Riddengard", TextTag = "Riddengard02"},
			
		},
	},
	--Redmund, drittes Lager zerstört(cheering):
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 3},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Redmund", TextTag = "General_Redmund05"},
			FigureOutcry	{Tag = "Riddengard", TextTag = "Riddengard03"},
			
		},
	},
	
	--Redmund, letztes Lager wird zerstört (silent, commanding):
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			SetUpdateInterval	{Steps = 10},
			MapValueIsEqual	{Name = "mv_DestroyedPactCamps", Value = 3},
			OR
			{
				MapFlagIsTrue	{Name = "mf_SpawnGeweihteCamp02"},
				MapFlagIsTrue	{Name = "mf_SpawnGeweihteCamp03"},
				MapFlagIsTrue	{Name = "mf_SpawnGeweihteCamp04"},
				MapFlagIsTrue	{Name = "mf_SpawnGeweihteCamp05"},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Riddengard", TextTag = "Riddengard04"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar01"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar02"},
			FigureOutcry	{Tag = "pl_HumanHeroWhisper", TextTag = "Wisper01"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "Avatar03"},
			
		},
	},

	--Outcries Prisoners
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene1"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Gefangener1", TextTag = "SQPrisoners1"},
			FigureOutcry	{Tag = "Hinweis", TextTag = "GoldMessage01"},
		},
	},
	
	--Outcries Prisoners
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			QuestIsSolved	{Player = "pl_Human", Quest = "Bring_back_Farmers_Gefangene2"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Gefangener2", TextTag = "SQPrisoners2"},
			FigureOutcry	{Tag = "Hinweis", TextTag = "GoldMessage01"},
		},
	},

	OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_P403_SaliosGoodsReward"},
    	},
    	Actions =
    	{
			FigureOutcry	{Tag = "Hinweis", TextTag = "GoldMessage01"},
       	},
    },
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_P403_LockesGoodsReward"},
    	},
    	Actions =
    	{
			FigureOutcry	{Tag = "Hinweis", TextTag = "GoldMessage01"},
       	},
    },
    OnOneTimeEvent
  	{
      	Conditions =
    	{
    		MapFlagIsTrue  {Name = "mf_P403_IdlingsGoodsReward"},
    	},
    	Actions =
    	{
			FigureOutcry	{Tag = "Hinweis", TextTag = "GoldMessage01"},
       	},
    },

	------------------------------------------------------------------------
	-- HeroQuest Caine
	------------------------------------------------------------------------
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim1",
		Conditions = 
		{
			QuestIsActive	{Quest = "HeroCaineVictim1Evidence"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "SQCaine13"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine14"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine15"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim1Dead",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CaineHasKilled_Ainur"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine16"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "SQCaine17"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine18"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim1Paroled",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCaine_GotParoled_Ainur"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine16"},
			FigureOutcry	{Tag = "pl_HumanAvatar", TextTag = "SQCaine17"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine18"},
		},
	};


	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim2",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCaine_PlayOutcriesAfterSephis"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			--FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine27"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine28"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim2",
		Conditions = 
		{
			QuestIsActive	{Quest = "HeroCaineVictim2Evidence"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine23"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine24"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim2",
		Conditions = 
		{
			QuestIsActive	{Quest = "HeroCaineVictim2Lure"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine25"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine26"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim2Lure",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EisenbauchTalkingWithAssistant"},
		},
		Actions = 
		{
			FigureOutcryImmediate	{Tag = "SQCaine_Eisen", TextTag = "SQCaineEisen"},
		},
	};


	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim3",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCaine_PlayOutcriesAfterUnaDoc1"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine35"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine36"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine37"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine38"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim3",
		Conditions = 
		{
			QuestIsActive	{Quest = "HeroCaineVictim3Lure"},
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine33"},
			FigureOutcry	{Tag = "pl_HumanHeroCaine", TextTag = "SQCaine34"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "HeroQuestCaineVictim3Lure",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SQCaine_Luring_Una"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			FigureOutcryImmediate	{Tag = "SQCaine_Una", TextTag = "SQCaineUna"},
		},
	};
}