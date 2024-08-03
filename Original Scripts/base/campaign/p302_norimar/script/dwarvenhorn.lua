

State
{
	StateName = "INIT",	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},		
		Actions  =
		{
			LeverSetDisabled    {Tag = "HornActivator"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Troeroe",
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_norimar_eyrie_end" },
		},		
		Actions  =
		{
			--ObjectChange	{Tag = "default", , X = default, Y = default, Direction = default},
			--LeverSetEnabled		{Tag = "HornActivator"},
		},
	},
};

State
{
	StateName = "Troeroe",

	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "pl_HumanAvatar", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "Shadowsong", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "pl_HumanHeroLya", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "pl_HumanHeroBor", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher1", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher2", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher3", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher4", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher5", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher6", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher7", Range = 10},
				FigureIsInEntityRange	{TargetTag = "DwarvenHorn", Tag = "HorseArcher8", Range = 10},
			}
		},
		Actions =
		{
			QuestSetSolved {Quest = "SaveTheHorn"},	
		},
	},

	OnOneTimeLeverEvent
	{
		Lever = "HornActivator",
		OnConditions = 
		{
			--FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "DwarvenHorn", Range = 5},
		},
		Actions = 
		{
			
			SoundGlobalPlayOnce		{File = "06_level/map_no_01_horn"},
			EntityTimerStart 		{Name = "et_HornTimer"},
			MapFlagSetTrue {Name = "mf_P302_Horn_Activated"},

		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_HornTimer", Seconds = 2},
		},
		Actions =
		{
			SoundGlobalPlayOnce			{File = "06_level/map_no_02_stonesfall"},
			ObjectChange				{Tag = "NorimarPass", ObjectId = 1996, X = 572.698, Y = 454.441,  Direction = 0},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_HornTimer", Seconds = 10},
			
		},
		Actions =
		{
		   	ObjectSpawn	{ObjectId = 465 , X = 567, Y = 454, Tag = "Rock1", Direction = 245},
        	ObjectSpawn	{ObjectId = 468 , X = 568, Y = 451, Tag = "Rock2", Direction = 96},
        	ObjectSpawn	{ObjectId = 467 , X = 569, Y = 448, Tag = "Rock3", Direction = 90},
         	ObjectSpawn	{ObjectId = 446 , X = 570, Y = 454, Tag = "Rock4", Direction = 251},
        	ObjectSpawn	{ObjectId = 469 , X = 566, Y = 449, Tag = "Rock5", Direction = 0},
        	ObjectSpawn	{ObjectId = 447 , X = 571, Y = 452, Tag = "Rock6", Direction = 0},
        	ObjectSpawn	{ObjectId = 468 , X = 567, Y = 445, Tag = "Rock7", Direction = 0},
        	ObjectSpawn	{ObjectId = 468 , X = 566, Y = 456, Tag = "Rock8", Direction = 0},

			PlayerRtsUnitKillInRange	{Player = "pl_Human", X = 568, Y = 450, Range = 7},
			PlayerRtsUnitKillInRange	{Player = "pl_Pact",  X = 568, Y = 450, Range = 7},

			PlayerRtsUnitKillInRange	{Player = "pl_Human", X = 562, Y = 438, Range = 7},
			PlayerRtsUnitKillInRange	{Player = "pl_Pact",  X = 562, Y = 438, Range = 7},
			
			PlayerRtsUnitKillInRange	{Player = "pl_Human", X = 560, Y = 449, Range = 5},            
            PlayerRtsUnitKillInRange	{Player = "pl_Pact",  X = 560, Y = 449, Range = 5},
            
	    	ObjectVanish {Tag = "TorchPass1"},
        	ObjectVanish {Tag = "TorchPass2"},

      },
	},	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_HornTimer", Seconds = 13},
		},
		Actions =
		{
			ObjectChange				{Tag = "NorimarPass", ObjectId = 2042, X = 572.698, Y = 454.441,  Direction = 0},
        	
        	QuestSetSolved {Quest = "BlowTheHorn"},
			QuestSetSolved {Quest = "NorimarMainPart3BlowTheHorn"},
			QuestSetActive {Quest = "NorimarMainPart4ReturnCastle"},		    
			

		},
	},
	
};
