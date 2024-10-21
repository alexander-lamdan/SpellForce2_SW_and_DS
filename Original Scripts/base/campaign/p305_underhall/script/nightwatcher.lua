--Schutzkreisstandorte
Laterne01StandortX = 118
Laterne01StandortY = 214
Laterne02StandortX = 107
Laterne02StandortY = 204 
Laterne03StandortX = 87
Laterne03StandortY = 200
Laterne04StandortX = 76
Laterne04StandortY = 190
Laterne05StandortX = 43
Laterne05StandortY = 189    
Laterne06StandortX = 89
Laterne06StandortY = 238 
Laterne07StandortX = 131
Laterne07StandortY = 251
Laterne08StandortX = 85.5
Laterne08StandortY = 177
Laterne09StandortX = 98
Laterne09StandortY = 146
Laterne10StandortX = 68
Laterne10StandortY = 142    
Laterne11StandortX = 144
Laterne11StandortY = 137 
Laterne12StandortX = 181
Laterne12StandortY = 109
Laterne13StandortX = 167
Laterne13StandortY = 141
Laterne14StandortX = 159
Laterne14StandortY = 174
Laterne15StandortX = 125
Laterne15StandortY = 169
Laterne16StandortX = 141
Laterne16StandortY = 189
Laterne17StandortX = 157
Laterne17StandortY = 201
Laterne18StandortX = 122
Laterne18StandortY = 193
Laterne19StandortX = 134
Laterne19StandortY = 214


HomePositionX = GetEntityX()
HomePositionY = GetEntityY()

--Doppelkopf Laterne
LaterneAn = 1558
LaterneAus = 1456
--Einfache Laterne
Laterne02An = 1560
Laterne02Aus = 1458



State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			TimeIsBetween	{StartHour = 20, EndHour = 20.15},
		},
		Actions =
		{
		
		},
		GotoState = "Lantern01",
	},
}
	
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
			FigureWalkToEntity	{TargetTag = "Laterne01"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "Laterne01", Range = 2},
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
			ObjectChange {Tag = "Laterne01", ObjectId = LaterneAn, X = Laterne01StandortX, Y = Laterne01StandortY, Direction = 0},	
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
			ObjectChange {Tag = "Laterne01", ObjectId = LaterneAus, X = Laterne01StandortX, Y = Laterne01StandortY, Direction = 0},	
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
			FigureWalkToEntity	{TargetTag = "Laterne02"},
			EntityFlagSetTrue {Name = "ef_EinmalSchalter"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter2"},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter3"},
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{TargetTag = "Laterne02", Range = 2},
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
			ObjectChange	{Tag = "Laterne02", ObjectId = Laterne02An, X = Laterne02StandortX, Y = Laterne02StandortY, Direction = 0},	
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
			ObjectChange {Tag = "Laterne02", ObjectId = Laterne02Aus, X = Laterne02StandortX, Y = Laterne02StandortY, Direction = 0},	
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
			FigureWalkToEntity	{TargetTag = "Laterne03"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne03", Range = 2},
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
			ObjectChange	{Tag = "Laterne03", ObjectId = Laterne02An, X = Laterne03StandortX, Y = Laterne03StandortY, Direction = 45},
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
			ObjectChange	{Tag = "Laterne03", ObjectId = Laterne02Aus, X = Laterne03StandortX, Y = Laterne03StandortY, Direction = 45},
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
			FigureWalkToEntity	{TargetTag = "Laterne04"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne04", Range = 2},
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
			ObjectChange	{Tag = "Laterne04", ObjectId = Laterne02An, X = Laterne04StandortX, Y = Laterne04StandortY, Direction = 45},
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
			ObjectChange	{Tag = "Laterne04", ObjectId = Laterne02Aus, X = Laterne04StandortX, Y = Laterne04StandortY, Direction = 45},
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
			FigureWalkToEntity	{TargetTag = "Laterne05"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne05", Range = 2},
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
			ObjectChange	{Tag = "Laterne05", ObjectId = LaterneAn, X = Laterne05StandortX, Y = Laterne05StandortY, Direction = 90},
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
			ObjectChange	{Tag = "Laterne05", ObjectId = LaterneAus, X = Laterne05StandortX, Y = Laterne05StandortY, Direction = 90},
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
			FigureWalkToEntity	{TargetTag = "Laterne06"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne06", Range = 2},
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
			ObjectChange	{Tag = "Laterne06", ObjectId = LaterneAn, X = Laterne06StandortX, Y = Laterne06StandortY, Direction = 315},
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
			ObjectChange	{Tag = "Laterne06", ObjectId = LaterneAus, X = Laterne06StandortX, Y = Laterne06StandortY, Direction = 315},
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
			FigureWalkToEntity	{TargetTag = "Laterne07"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne07", Range = 2},
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
			ObjectChange	{Tag = "Laterne07", ObjectId = LaterneAn, X = Laterne07StandortX, Y = Laterne07StandortY, Direction = 90},
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
			ObjectChange	{Tag = "Laterne07", ObjectId = LaterneAus, X = Laterne07StandortX, Y = Laterne07StandortY, Direction = 90},
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
			FigureWalkToEntity	{TargetTag = "Laterne08"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne08", Range = 2},
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
			ObjectChange	{Tag = "Laterne08", ObjectId = Laterne02An, X = Laterne08StandortX, Y = Laterne08StandortY, Direction = 315},
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
			ObjectChange	{Tag = "Laterne08", ObjectId = Laterne02Aus, X = Laterne08StandortX, Y = Laterne08StandortY, Direction = 315},
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
			FigureWalkToEntity	{TargetTag = "Laterne09"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne09", Range = 2},
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
			ObjectChange	{Tag = "Laterne09", ObjectId = LaterneAn, X = Laterne09StandortX, Y = Laterne09StandortY, Direction = 35},
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
			ObjectChange	{Tag = "Laterne09", ObjectId = LaterneAus, X = Laterne09StandortX, Y = Laterne09StandortY, Direction = 35},
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
			FigureWalkToEntity	{TargetTag = "Laterne10"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne10", Range = 2},
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
			ObjectChange	{Tag = "Laterne10", ObjectId = LaterneAn, X = Laterne10StandortX, Y = Laterne10StandortY, Direction = 135},
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
			ObjectChange	{Tag = "Laterne10", ObjectId = LaterneAus, X = Laterne10StandortX, Y = Laterne10StandortY, Direction = 135},
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
			FigureWalkToEntity	{TargetTag = "Laterne11"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne11", Range = 2},
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
			ObjectChange	{Tag = "Laterne11", ObjectId = LaterneAn, X = Laterne11StandortX, Y = Laterne11StandortY, Direction = 225},
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
			ObjectChange	{Tag = "Laterne11", ObjectId = LaterneAus, X = Laterne11StandortX, Y = Laterne11StandortY, Direction = 225},
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
			FigureWalkToEntity	{TargetTag = "Laterne12"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne12", Range = 2},
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
			ObjectChange	{Tag = "Laterne12", ObjectId = LaterneAn, X = Laterne12StandortX, Y = Laterne12StandortY, Direction = 180},
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
			ObjectChange	{Tag = "Laterne12", ObjectId = LaterneAus, X = Laterne12StandortX, Y = Laterne12StandortY, Direction = 180},
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
			FigureWalkToEntity	{TargetTag = "Laterne13"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne13", Range = 2},
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
			ObjectChange	{Tag = "Laterne13", ObjectId = LaterneAn, X = Laterne13StandortX, Y = Laterne13StandortY, Direction = 140},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern14",
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
			ObjectChange	{Tag = "Laterne13", ObjectId = LaterneAus, X = Laterne13StandortX, Y = Laterne13StandortY, Direction = 140},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern14",
	},
	
};

State
{
	StateName = "Lantern14",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "Laterne14"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne14", Range = 2},
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
			ObjectChange	{Tag = "Laterne14", ObjectId = LaterneAn, X = Laterne14StandortX, Y = Laterne14StandortY, Direction = 45},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern15",
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
			ObjectChange	{Tag = "Laterne14", ObjectId = LaterneAus, X = Laterne14StandortX, Y = Laterne14StandortY, Direction = 45},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern15",
	},
	
};

State
{
	StateName = "Lantern15",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "Laterne15"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne15", Range = 2},
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
			ObjectChange	{Tag = "Laterne15", ObjectId = LaterneAn, X = Laterne15StandortX, Y = Laterne15StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern16",
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
			ObjectChange	{Tag = "Laterne15", ObjectId = LaterneAus, X = Laterne15StandortX, Y = Laterne15StandortY, Direction = 0},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern16",
	},
	
};

State
{
	StateName = "Lantern16",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "Laterne16"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne16", Range = 2},
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
			ObjectChange	{Tag = "Laterne16", ObjectId = LaterneAn, X = Laterne16StandortX, Y = Laterne16StandortY, Direction = 45},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern17",
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
			ObjectChange	{Tag = "Laterne16", ObjectId = LaterneAus, X = Laterne16StandortX, Y = Laterne16StandortY, Direction = 45},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern17",
	},
	
};


State
{
	StateName = "Lantern17",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "Laterne17"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne17", Range = 2},
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
			ObjectChange	{Tag = "Laterne17", ObjectId = LaterneAn, X = Laterne17StandortX, Y = Laterne17StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern18",
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
			ObjectChange	{Tag = "Laterne17", ObjectId = LaterneAus, X = Laterne17StandortX, Y = Laterne17StandortY, Direction = 270},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern18",
	},
	
};


State
{
	StateName = "Lantern18",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "Laterne18"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne18", Range = 2},
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
			ObjectChange	{Tag = "Laterne18", ObjectId = LaterneAn, X = Laterne18StandortX, Y = Laterne18StandortY, Direction = 315},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern19",
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
			ObjectChange	{Tag = "Laterne18", ObjectId = LaterneAus, X = Laterne18StandortX, Y = Laterne18StandortY, Direction = 315},
			EntityFlagSetFalse {Name = "ef_EinmalSchalter"},
		},
		GotoState = "Lantern19",
	},
	
};


State
{
	StateName = "Lantern19",
	
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter"},
		},
		Actions =
		{
			FigureWalkToEntity	{TargetTag = "Laterne19"},
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
			FigureIsInEntityRange	{TargetTag = "Laterne19", Range = 2},
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
			ObjectChange	{Tag = "Laterne19", ObjectId = LaterneAn, X = Laterne19StandortX, Y = Laterne19StandortY, Direction = 0},
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
			ObjectChange	{Tag = "Laterne19", ObjectId = LaterneAus, X = Laterne19StandortX, Y = Laterne19StandortY, Direction = 0},
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


















