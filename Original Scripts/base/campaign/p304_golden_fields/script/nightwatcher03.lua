--Laternenstandorte
Laterne01StandortX = 550
Laterne01StandortY = 347.5
Laterne02StandortX = 536.5
Laterne02StandortY = 358.5 
Laterne03StandortX = 530
Laterne03StandortY = 369.5
Laterne04StandortX = 523
Laterne04StandortY = 381.5
Laterne05StandortX = 518
Laterne05StandortY = 360    
Laterne06StandortX = 522
Laterne06StandortY = 346 
Laterne07StandortX = 525
Laterne07StandortY = 320.5
Laterne08StandortX = 554.5
Laterne08StandortY = 321.5
Laterne09StandortX = 576.5
Laterne09StandortY = 319
Laterne10StandortX = 592
Laterne10StandortY = 313.5   
Laterne11StandortX = 605
Laterne11StandortY = 334
Laterne12StandortX = 615.5
Laterne12StandortY = 346 
Laterne13StandortX = 615.5
Laterne13StandortY = 363.5
Laterne14StandortX = 589.5
Laterne14StandortY = 363.5
Laterne15StandortX = 573.5
Laterne15StandortY = 396  
Laterne16StandortX = 568
Laterne16StandortY = 378.5 
Laterne17StandortX = 581
Laterne17StandortY = 335
Laterne18StandortX = 581.5
Laterne18StandortY = 334.5


HomePositionX = 546
HomePositionY = 337.5

LaterneAn = 1547
LaterneAus = 1484

Laterne01 = "LanternMarketplace01"
Laterne02 = "LanternMarketplace02"
Laterne03 = "LanternMarketplace03"
Laterne04 = "LanternMarketplace04"
Laterne05 = "LanternMarketplace05"
Laterne06 = "LanternMarketplace06"
Laterne07 = "LanternMarketplace07"
Laterne08 = "LanternMarketplace08"
Laterne09 = "LanternMarketplace09"
Laterne10 = "LanternMarketplace10"

Lantern11 = "LanternMarketplace11"
Lantern12 = "LanternMarketplace12"
Lantern13 = "LanternMarketplace13"
Lantern14 = "LanternMarketplace14"
Lantern15 = "LanternMarketplace15"
Lantern16 = "LanternMarketplace16"
Lantern17 = "LanternMarketplace17"
Lantern18 = "LanternMarketplace18"



State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Range = 2, X = HomePositionX, Y = HomePositionY},
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
			FigureWalkToEntity	{TargetTag = Laterne01},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = Laterne01, Range = 2},
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
			ObjectChange {Tag = Laterne01, ObjectId = LaterneAn, X = Laterne01StandortX, Y = Laterne01StandortY, Direction = 180},	
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
			ObjectChange {Tag = Laterne01, ObjectId = LaterneAus, X = Laterne01StandortX, Y = Laterne01StandortY, Direction = 180},	
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
			FigureWalkToEntity	{TargetTag = Laterne02},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = Laterne02, Range = 2},
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
			ObjectChange	{Tag = Laterne02, ObjectId = LaterneAn, X = Laterne02StandortX, Y = Laterne02StandortY, Direction = 270},	
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
			ObjectChange {Tag = Laterne02, ObjectId = LaterneAus, X = Laterne02StandortX, Y = Laterne02StandortY, Direction = 270},	
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
			FigureWalkToEntity	{TargetTag = Laterne03},
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
			FigureIsInEntityRange	{TargetTag = Laterne03, Range = 2},
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
			ObjectChange	{Tag = Laterne03, ObjectId = LaterneAn, X = Laterne03StandortX, Y = Laterne03StandortY, Direction = 90},
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
			ObjectChange	{Tag = Laterne03, ObjectId = LaterneAus, X = Laterne03StandortX, Y = Laterne03StandortY, Direction = 90},
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
			FigureWalkToEntity	{TargetTag = Laterne04},
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
			FigureIsInEntityRange	{TargetTag = Laterne04, Range = 2},
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
			ObjectChange	{Tag = Laterne04, ObjectId = LaterneAn, X = Laterne04StandortX, Y = Laterne04StandortY, Direction = 180},
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
			ObjectChange	{Tag = Laterne04, ObjectId = LaterneAus, X = Laterne04StandortX, Y = Laterne04StandortY, Direction = 180},
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
			FigureWalkToEntity	{TargetTag = Laterne05},
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
			FigureIsInEntityRange	{TargetTag = Laterne05, Range = 2},
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
			ObjectChange	{Tag = Laterne05, ObjectId = LaterneAn, X = Laterne05StandortX, Y = Laterne05StandortY, Direction = 0},
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
			ObjectChange	{Tag = Laterne05, ObjectId = LaterneAus, X = Laterne05StandortX, Y = Laterne05StandortY, Direction = 0},
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
			FigureWalkToEntity	{TargetTag = Laterne06},
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
			FigureIsInEntityRange	{TargetTag = Laterne06, Range = 2},
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
			ObjectChange	{Tag = Laterne06, ObjectId = LaterneAn, X = Laterne06StandortX, Y = Laterne06StandortY, Direction = 0},
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
			ObjectChange	{Tag = Laterne06, ObjectId = LaterneAus, X = Laterne06StandortX, Y = Laterne06StandortY, Direction = 0},
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
			FigureWalkToEntity	{TargetTag = Laterne07},
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
			FigureIsInEntityRange	{TargetTag = Laterne07, Range = 2},
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
			ObjectChange	{Tag = Laterne07, ObjectId = LaterneAn, X = Laterne07StandortX, Y = Laterne07StandortY, Direction = 45},
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
			ObjectChange	{Tag = Laterne07, ObjectId = LaterneAus, X = Laterne07StandortX, Y = Laterne07StandortY, Direction = 45},
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
			FigureWalkToEntity	{TargetTag = Laterne08},
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
			FigureIsInEntityRange	{TargetTag = Laterne08, Range = 2},
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
			ObjectChange	{Tag = Laterne08, ObjectId = LaterneAn, X = Laterne08StandortX, Y = Laterne08StandortY, Direction = 90},
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
			ObjectChange	{Tag = Laterne08, ObjectId = LaterneAus, X = Laterne08StandortX, Y = Laterne08StandortY, Direction = 90},
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
			FigureWalkToEntity	{TargetTag = Laterne09},
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
			FigureIsInEntityRange	{TargetTag = Laterne09, Range = 2},
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
			ObjectChange	{Tag = Laterne09, ObjectId = LaterneAn, X = Laterne09StandortX, Y = Laterne09StandortY, Direction = 270},
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
			ObjectChange	{Tag = Laterne09, ObjectId = LaterneAus, X = Laterne09StandortX, Y = Laterne09StandortY, Direction = 270},
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
			FigureWalkToEntity	{TargetTag = Laterne10},
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
			FigureIsInEntityRange	{TargetTag = Laterne10, Range = 2},
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
			ObjectChange	{Tag = Laterne10, ObjectId = LaterneAn, X = Laterne10StandortX, Y = Laterne10StandortY, Direction = 135},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern11,
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
			ObjectChange	{Tag = Laterne10, ObjectId = LaterneAus, X = Laterne10StandortX, Y = Laterne10StandortY, Direction = 135},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern11,
	},
	
};

State
{
	StateName = Lantern11,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern11},
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
			FigureIsInEntityRange	{TargetTag = Lantern11, Range = 2},
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
			ObjectChange	{Tag = Lantern11, ObjectId = LaterneAn, X = Laterne11StandortX, Y = Laterne11StandortY, Direction = 135},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern12,
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
			ObjectChange	{Tag = Lantern11, ObjectId = LaterneAus, X = Laterne11StandortX, Y = Laterne11StandortY, Direction = 135},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern12,
	},
	
};

State
{
	StateName = Lantern12,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern12},
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
			FigureIsInEntityRange	{TargetTag = Lantern12, Range = 2},
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
			ObjectChange	{Tag = Lantern12, ObjectId = LaterneAn, X = Laterne12StandortX, Y = Laterne12StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern13,
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
			ObjectChange	{Tag = Lantern12, ObjectId = LaterneAus, X = Laterne12StandortX, Y = Laterne12StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern13,
	},
	
};

State
{
	StateName = Lantern13,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern13},
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
			FigureIsInEntityRange	{TargetTag = Lantern13, Range = 2},
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
			ObjectChange	{Tag = Lantern13, ObjectId = LaterneAn, X = Laterne13StandortX, Y = Laterne13StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern14,
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
			ObjectChange	{Tag = Lantern13, ObjectId = LaterneAus, X = Laterne13StandortX, Y = Laterne13StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern14,
	},
	
};

State
{
	StateName = Lantern14,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern14},
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
			FigureIsInEntityRange	{TargetTag = Lantern14, Range = 2},
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
			ObjectChange	{Tag = Lantern14, ObjectId = LaterneAn, X = Laterne14StandortX, Y = Laterne14StandortY, Direction = 225},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern15,
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
			ObjectChange	{Tag = Lantern14, ObjectId = LaterneAus, X = Laterne14StandortX, Y = Laterne14StandortY, Direction = 225},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern15,
	},
	
};

State
{
	StateName = Lantern15,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern15},
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
			FigureIsInEntityRange	{TargetTag = Lantern15, Range = 2},
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
			ObjectChange	{Tag = Lantern15, ObjectId = LaterneAn, X = Laterne15StandortX, Y = Laterne15StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern16,
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
			ObjectChange	{Tag = Lantern15, ObjectId = LaterneAus, X = Laterne15StandortX, Y = Laterne15StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern16,
	},
	
};

State
{
	StateName = Lantern16,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern16},
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
			FigureIsInEntityRange	{TargetTag = Lantern16, Range = 2},
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
			ObjectChange	{Tag = Lantern16, ObjectId = LaterneAn, X = Laterne16StandortX, Y = Laterne16StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern17,
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
			ObjectChange	{Tag = Lantern16, ObjectId = LaterneAus, X = Laterne16StandortX, Y = Laterne16StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern17,
	},
	
};

State
{
	StateName = Lantern17,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern17},
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
			FigureIsInEntityRange	{TargetTag = Lantern17, Range = 2},
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
			ObjectChange	{Tag = Lantern17, ObjectId = LaterneAn, X = Laterne17StandortX, Y = Laterne17StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern18,
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
			ObjectChange	{Tag = Lantern17, ObjectId = LaterneAus, X = Laterne17StandortX, Y = Laterne17StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = Lantern18,
	},
	
};

State
{
	StateName = Lantern18,
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = Lantern18},
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
			FigureIsInEntityRange	{TargetTag = Lantern18, Range = 2},
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
			ObjectChange	{Tag = Lantern18, ObjectId = LaterneAn, X = Laterne18StandortX, Y = Laterne18StandortY, Direction = 0},
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
			ObjectChange	{Tag = Lantern18, ObjectId = LaterneAus, X = Laterne18StandortX, Y = Laterne18StandortY, Direction = 0},
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
			FigureWalk	{X = HomePositionX, Y = HomePositionY},
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
			FigureIsInRange	{Range = 2, X = HomePositionX, Y = HomePositionY},
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


















