--Laternenstandorte
LaterneHandwerk01StandortX = 434
LaterneHandwerk01StandortY = 119
LaterneHandwerk02StandortX = 412
LaterneHandwerk02StandortY = 126 
LaterneHandwerk03StandortX = 406.5
LaterneHandwerk03StandortY = 139.5
LaterneHandwerk04StandortX = 435.5
LaterneHandwerk04StandortY = 128
LaterneHandwerk05StandortX = 423.5
LaterneHandwerk05StandortY = 135.5    
LaterneHandwerk06StandortX = 427.5
LaterneHandwerk06StandortY = 150 
LaterneHandwerk07StandortX = 443.5
LaterneHandwerk07StandortY = 152.5
LaterneHandwerk08StandortX = 433
LaterneHandwerk08StandortY = 159
LaterneHandwerk09StandortX = 411
LaterneHandwerk09StandortY = 165
LaterneHandwerk10StandortX = 402.5
LaterneHandwerk10StandortY = 148   
LaterneHandwerk11StandortX = 390
LaterneHandwerk11StandortY = 152 
LaterneHandwerk12StandortX = 362.5
LaterneHandwerk12StandortY = 157
LaterneHandwerk13StandortX = 346
LaterneHandwerk13StandortY = 169


HomePositionHandwerkX = 435
HomePositionHandwerkY = 123.7

LaterneAn = 1547
LaterneAus = 1484



State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 2, X = HomePositionHandwerkX, Y = HomePositionHandwerkY},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk01"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk01", Range = 2},
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
			ObjectChange {Tag = "LaterneHandwerk01", ObjectId = LaterneAn, X = LaterneHandwerk01StandortX, Y = LaterneHandwerk01StandortY, Direction = 180},	
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
			ObjectChange {Tag = "LaterneHandwerk01", ObjectId = LaterneAus, X = LaterneHandwerk01StandortX, Y = LaterneHandwerk01StandortY, Direction = 180},	
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk02"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk02", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk02", ObjectId = LaterneAn, X = LaterneHandwerk02StandortX, Y = LaterneHandwerk02StandortY, Direction = 0},	
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
			ObjectChange {Tag = "LaterneHandwerk02", ObjectId = LaterneAus, X = LaterneHandwerk02StandortX, Y = LaterneHandwerk02StandortY, Direction = 0},	
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk03"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk03", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk03", ObjectId = LaterneAn, X = LaterneHandwerk03StandortX, Y = LaterneHandwerk03StandortY, Direction = 0},
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
			ObjectChange	{Tag = "LaterneHandwerk03", ObjectId = LaterneAus, X = LaterneHandwerk03StandortX, Y = LaterneHandwerk03StandortY, Direction = 0},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk04"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk04", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk04", ObjectId = LaterneAn, X = LaterneHandwerk04StandortX, Y = LaterneHandwerk04StandortY, Direction = 225},
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
			ObjectChange	{Tag = "LaterneHandwerk04", ObjectId = LaterneAus, X = LaterneHandwerk04StandortX, Y = LaterneHandwerk04StandortY, Direction = 225},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk05"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk05", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk05", ObjectId = LaterneAn, X = LaterneHandwerk05StandortX, Y = LaterneHandwerk05StandortY, Direction = 180},
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
			ObjectChange	{Tag = "LaterneHandwerk05", ObjectId = LaterneAus, X = LaterneHandwerk05StandortX, Y = LaterneHandwerk05StandortY, Direction = 180},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk06"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk06", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk06", ObjectId = LaterneAn, X = LaterneHandwerk06StandortX, Y = LaterneHandwerk06StandortY, Direction = 90},
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
			ObjectChange	{Tag = "LaterneHandwerk06", ObjectId = LaterneAus, X = LaterneHandwerk06StandortX, Y = LaterneHandwerk06StandortY, Direction = 90},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk07"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk07", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk07", ObjectId = LaterneAn, X = LaterneHandwerk07StandortX, Y = LaterneHandwerk07StandortY, Direction = 90},
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
			ObjectChange	{Tag = "LaterneHandwerk07", ObjectId = LaterneAus, X = LaterneHandwerk07StandortX, Y = LaterneHandwerk07StandortY, Direction = 90},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk08"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk08", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk08", ObjectId = LaterneAn, X = LaterneHandwerk08StandortX, Y = LaterneHandwerk08StandortY, Direction = 270},
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
			ObjectChange	{Tag = "LaterneHandwerk08", ObjectId = LaterneAus, X = LaterneHandwerk08StandortX, Y = LaterneHandwerk08StandortY, Direction = 270},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk09"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk09", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk09", ObjectId = LaterneAn, X = LaterneHandwerk09StandortX, Y = LaterneHandwerk09StandortY, Direction = 0},
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
			ObjectChange	{Tag = "LaterneHandwerk09", ObjectId = LaterneAus, X = LaterneHandwerk09StandortX, Y = LaterneHandwerk09StandortY, Direction = 0},
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
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk10"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk10", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk10", ObjectId = LaterneAn, X = LaterneHandwerk10StandortX, Y = LaterneHandwerk10StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern11",
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
			ObjectChange	{Tag = "LaterneHandwerk10", ObjectId = LaterneAus, X = LaterneHandwerk10StandortX, Y = LaterneHandwerk10StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern11",
	},
	
};

State
{
	StateName = "Lantern11",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk11"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk11", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk11", ObjectId = LaterneAn, X = LaterneHandwerk11StandortX, Y = LaterneHandwerk11StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern12",
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
			ObjectChange	{Tag = "LaterneHandwerk11", ObjectId = LaterneAus, X = LaterneHandwerk11StandortX, Y = LaterneHandwerk11StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern12",
	},
	
};

State
{
	StateName = "Lantern12",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk12"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk12", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk12", ObjectId = LaterneAn, X = LaterneHandwerk12StandortX, Y = LaterneHandwerk12StandortY, Direction = 225},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern13",
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
			ObjectChange	{Tag = "LaterneHandwerk12", ObjectId = LaterneAus, X = LaterneHandwerk12StandortX, Y = LaterneHandwerk12StandortY, Direction = 225},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern13",
	},
	
};

State
{
	StateName = "Lantern13",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "LaterneHandwerk13"},
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
			FigureIsInEntityRange	{TargetTag = "LaterneHandwerk13", Range = 2},
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
			ObjectChange	{Tag = "LaterneHandwerk13", ObjectId = LaterneAn, X = LaterneHandwerk13StandortX, Y = LaterneHandwerk13StandortY, Direction = 225},
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
			ObjectChange	{Tag = "LaterneHandwerk13", ObjectId = LaterneAus, X = LaterneHandwerk13StandortX, Y = LaterneHandwerk13StandortY, Direction = 225},
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
			FigureWalk	{X = HomePositionHandwerkX, Y = HomePositionHandwerkY},
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
			FigureIsInRange	{Range = 2, X = HomePositionHandwerkX, Y = HomePositionHandwerkY},
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


















