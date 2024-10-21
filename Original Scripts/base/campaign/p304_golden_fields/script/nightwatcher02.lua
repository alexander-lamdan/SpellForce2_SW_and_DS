--Laternenstandorte
LanternPriest01StandortX = 326.5
LanternPriest01StandortY = 427
LanternPriest02StandortX = 335.5
LanternPriest02StandortY = 425 
LanternPriest03StandortX = 336
LanternPriest03StandortY = 445
LanternPriest04StandortX = 336
LanternPriest04StandortY = 451.5
LanternPriest05StandortX = 324
LanternPriest05StandortY = 468    
LanternPriest06StandortX = 343
LanternPriest06StandortY = 479.5 
LanternPriest07StandortX = 350
LanternPriest07StandortY = 488
LanternPriest08StandortX = 358.5
LanternPriest08StandortY = 488
LanternPriest09StandortX = 386
LanternPriest09StandortY = 469.5
LanternPriest10StandortX = 392
LanternPriest10StandortY = 448   



HomePositionPriestX = 342
HomePositionPriestY = 420

LaterneAn = 1547
LaterneAus = 1484



State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 2, X = HomePositionPriestX, Y = HomePositionPriestY},
			--TimeIsBetween	{StartHour = 20, EndHour = 20.15},
		},
		Actions =
		{
		
		},
		GotoState = "Lantern01",
	},
};

--*******************************************************
--***                                                 ***
--***         Nachtwächterrundgang Part I             ***
--***                                                 ***
--*******************************************************

State
{
	StateName = "Lantern01",
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest01"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "LanternPriest01", Range = 2},
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange {Tag = "LanternPriest01", ObjectId = LaterneAn, X = LanternPriest01StandortX, Y = LanternPriest01StandortY, Direction = 0},	
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
			
		},
		GotoState = "Lantern02",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange {Tag = "LanternPriest01", ObjectId = LaterneAus, X = LanternPriest01StandortX, Y = LanternPriest01StandortY, Direction = 0},	
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
			
		},
		GotoState = "Lantern02",
	},
	
};

State
{
	StateName = "Lantern02",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest02"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "LanternPriest02", Range = 2},
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest02", ObjectId = LaterneAn, X = LanternPriest02StandortX, Y = LanternPriest02StandortY, Direction = 180},	
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern03",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange {Tag = "LanternPriest02", ObjectId = LaterneAus, X = LanternPriest02StandortX, Y = LanternPriest02StandortY, Direction = 180},	
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern03",
	},
	
};

State
{
	StateName = "Lantern03",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest03"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest03", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest03", ObjectId = LaterneAn, X = LanternPriest03StandortX, Y = LanternPriest03StandortY, Direction = 90},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern04",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			ObjectChange	{Tag = "LanternPriest03", ObjectId = LaterneAus, X = LanternPriest03StandortX, Y = LanternPriest03StandortY, Direction = 90},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern04",
	},
	
};

State
{
	StateName = "Lantern04",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest04"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest04", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest04", ObjectId = LaterneAn, X = LanternPriest04StandortX, Y = LanternPriest04StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern05",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest04", ObjectId = LaterneAus, X = LanternPriest04StandortX, Y = LanternPriest04StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern05",
	},
	
};

State
{
	StateName = "Lantern05",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest05"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest05", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest05", ObjectId = LaterneAn, X = LanternPriest05StandortX, Y = LanternPriest05StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern06",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest05", ObjectId = LaterneAus, X = LanternPriest05StandortX, Y = LanternPriest05StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern06",
	},
};

State
{
	StateName = "Lantern06",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest06"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest06", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest06", ObjectId = LaterneAn, X = LanternPriest06StandortX, Y = LanternPriest06StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern07",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest06", ObjectId = LaterneAus, X = LanternPriest06StandortX, Y = LanternPriest06StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern07",
	},
};

State
{
	StateName = "Lantern07",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest07"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest07", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest07", ObjectId = LaterneAn, X = LanternPriest07StandortX, Y = LanternPriest07StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern08",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest07", ObjectId = LaterneAus, X = LanternPriest07StandortX, Y = LanternPriest07StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern08",
	},
};

State
{
	StateName = "Lantern08",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest08"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest08", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest08", ObjectId = LaterneAn, X = LanternPriest08StandortX, Y = LanternPriest08StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern09",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			ObjectChange	{Tag = "LanternPriest08", ObjectId = LaterneAus, X = LanternPriest08StandortX, Y = LanternPriest08StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern09",
	},
};

State
{
	StateName = "Lantern09",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest09"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest09", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest09", ObjectId = LaterneAn, X = LanternPriest09StandortX, Y = LanternPriest09StandortY, Direction = 225},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern10",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest09", ObjectId = LaterneAus, X = LanternPriest09StandortX, Y = LanternPriest09StandortY, Direction = 225},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern10",
	},
	
};

State
{
	StateName = "Lantern10",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LanternPriest10"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInEntityRange	{TargetTag = "LanternPriest10", Range = 2},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_LanternOnWaitingTimer"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsFalse {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest10", ObjectId = LaterneAn, X = LanternPriest10StandortX, Y = LanternPriest10StandortY, Direction = 180},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "WaitingPosition",
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter3"},
			EntityTimerIsElapsed	{Name = "et_LanternOnWaitingTimer", Seconds = 2},
			MapFlagIsTrue {Name = "mf_LanternOn"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_EinmalSchalter3"},
			EntityTimerStop	{Name = "et_LanternOnWaitingTimer"},
			ObjectChange	{Tag = "LanternPriest10", ObjectId = LaterneAus, X = LanternPriest10StandortX, Y = LanternPriest10StandortY, Direction = 180},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "WaitingPosition",
	},
	
};



State
{
	StateName = "WaitingPosition",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalk	{X = HomePositionPriestX, Y = HomePositionPriestY},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter2"},
			FigureIsInRange	{Range = 2, X = HomePositionPriestX, Y = HomePositionPriestY},
		},
		Actions =
		{
			FigureHoldPosition	{},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter2"},
			EntityFlagSetTrue{Name = "ef_AimReached"},
		},	
		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue{Name = "ef_AimReached"},
			TimeIsBetween	{StartHour = 6, EndHour = 6.15},
			MapFlagIsFalse {Name = "mf_LanternOn"},
			
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
			MapFlagSetTrue {Name = "mf_LanternOn"},
		},	
		GotoState = "Lantern01",
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_LanternOn"},
			EntityFlagIsTrue{Name = "ef_AimReached"},
			TimeIsBetween	{StartHour = 20, EndHour = 20.15},
		},
		Actions =
		{
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
			MapFlagSetFalse {Name = "mf_LanternOn"},
		},	
		GotoState = "Lantern01",
	},	
};


















