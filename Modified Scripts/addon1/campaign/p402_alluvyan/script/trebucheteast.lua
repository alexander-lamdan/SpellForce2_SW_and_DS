
State
{	
	StateName = "INIT",
	--Trebuchet schießt gegen das MainGate
	OnEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
				MapFlagIsTrue {Name = "mf_DestroyMagicDefense"},
				EntityFlagIsFalse	{Name = "ef_OneTimeTrebuchetFire"},
		},
		Actions =
		{
				FigureAttackEntity	{TargetTag = "MainGate"},
				EntityTimerStart	{Name = "et_TrebuchetFire"},
				EntityFlagSetTrue	{Name = "ef_OneTimeTrebuchetFire"},
		},
		
	},
	OnEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
				EntityTimerIsElapsed	{Name = "et_TrebuchetFire", Seconds = 5},
				EntityFlagIsTrue	{Name = "ef_OneTimeTrebuchetFire"},
		},
		Actions =
		{
				EntityTimerStop	{Name = "et_TrebuchetFire"},
				FigureAttackEntity	{TargetTag = "MainGate"},
				EntityFlagSetFalse	{Name = "ef_OneTimeTrebuchetFire"},
		},
		
	},
	
	--Trebuchet schießt gegen die Katapulte
	OnEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
				MapFlagIsTrue {Name = "mf_StartTrebuchetEastCatapult2"},
				
				OR
				{
					MapFlagIsFalse {Name = "mf_DestroyMagicDefense"},
					BuildingIsDead	{Tag = "MainGate"},
				},
				
				EntityFlagIsFalse	{Name = "ef_OneTimeTrebuchetFireCatapult"},
				FigureIsAlive	{Tag = "CatapultOrc01"},
		},
		Actions =
		{
				FigureAttackEntity	{TargetTag = "CatapultOrc01"},
				EntityTimerStart	{Name = "et_TrebuchetFireCatapult"},
				EntityFlagSetTrue	{Name = "ef_OneTimeTrebuchetFireCatapult"},
		},
		
	},
	OnEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
				EntityTimerIsElapsed	{Name = "et_TrebuchetFireCatapult", Seconds = 5},
				EntityFlagIsTrue	{Name = "ef_OneTimeTrebuchetFireCatapult"},
				FigureIsAlive	{Tag = "CatapultOrc01"},
				OR
				{
					MapFlagIsFalse {Name = "mf_DestroyMagicDefense"},
					BuildingIsDead	{Tag = "MainGate"},
				},
				
		},
		Actions =
		{
				EntityTimerStop	{Name = "et_TrebuchetFireCatapult"},
				FigureAttackEntity	{TargetTag = "CatapultOrc01"},
				EntityFlagSetFalse	{Name = "ef_OneTimeTrebuchetFireCatapult"},
		},
		
	},
	
	--Trebuchet schießt gegen die Katapulte
	OnEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
				MapFlagIsTrue {Name = "mf_StartTrebuchetWestCatapult1"},
				EntityFlagIsFalse	{Name = "ef_OneTimeTrebuchetFireCatapult2"},
				FigureIsDead	{Tag = "CatapultOrc01"},
				FigureIsAlive	{Tag = "CatapultOrc02"},
				OR
				{
					MapFlagIsFalse {Name = "mf_DestroyMagicDefense"},
					BuildingIsDead	{Tag = "MainGate"},
				},
		},
		Actions =
		{
				FigureAttackEntity	{TargetTag = "CatapultOrc02"},
				EntityTimerStart	{Name = "et_TrebuchetFireCatapult2"},
				EntityFlagSetTrue	{Name = "ef_OneTimeTrebuchetFireCatapult2"},
		},
		
	},
	OnEvent
	{
    	-- das Flag "AlwaysTrue" ist immer true sein
    	-- ist als Default-Abfragewert für Sammelscripte gedacht (Spawning etc.)
		Conditions =
		{
				EntityTimerIsElapsed	{Name = "et_TrebuchetFireCatapult2", Seconds = 5},
				EntityFlagIsTrue	{Name = "ef_OneTimeTrebuchetFireCatapult2"},
				FigureIsDead	{Tag = "CatapultOrc01"},
				FigureIsAlive	{Tag = "CatapultOrc02"},
				OR
				{
					MapFlagIsFalse {Name = "mf_DestroyMagicDefense"},
					BuildingIsDead	{Tag = "MainGate"},
				},
		},
		Actions =
		{
				EntityTimerStop	{Name = "et_TrebuchetFireCatapult2"},
				FigureAttackEntity	{TargetTag = "CatapultOrc02"},
				EntityFlagSetFalse	{Name = "ef_OneTimeTrebuchetFireCatapult2"},
		},
		
	},
};
