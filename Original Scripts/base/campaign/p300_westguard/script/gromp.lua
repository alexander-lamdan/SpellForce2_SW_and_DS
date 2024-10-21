--Schutzkreisstandorte
Laterne01StandortX = 395
Laterne01StandortY = 395
Laterne02StandortX = 406
Laterne02StandortY = 377 
Laterne03StandortX = 408
Laterne03StandortY = 362
Laterne04StandortX = 397
Laterne04StandortY = 352
Laterne05StandortX = 420
Laterne05StandortY = 346    
Laterne06StandortX = 396
Laterne06StandortY = 338 
Laterne07StandortX = 406.8
Laterne07StandortY = 309.7
Laterne08StandortX = 378
Laterne08StandortY = 298
Laterne09StandortX = 357
Laterne09StandortY = 274
Laterne10StandortX = 376
Laterne10StandortY = 260    
Laterne11StandortX = 326
Laterne11StandortY = 267 
Laterne12StandortX = 288
Laterne12StandortY = 267
Laterne13StandortX = 349
Laterne13StandortY = 247
Laterne14StandortX = 337
Laterne14StandortY = 250

HomePositionX = 410
HomePositionY = 374

LaterneAn = 1547
LaterneAus = 1484



State
{
		StateName = "GrompState",
		--Wenn der Dialog mit Kara beendet wurde begibt sich Kara zu ihrem Vater und Gromp zu seinem Turm
	OnFigureSpawnOnlyWhenEvent
	{
		X = 396,
		Y = 397,
		Conditions = 
		{
			AvatarValueIsEqual{Name = "av_P300_WarradsDaughterQuest", Value = 3},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_GrompAlive"},
			FigureSwappingDisable {},
		},
	},
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_KaraSpawn"},
			AvatarFlagIsTrue{Name = "af_P307_KaraAndGrompGoHome"},
			QuestIsNotKnown	{Quest = "WestguardFindDaughter"},
		},
		Actions = 
		{
			EntityFlagSetTrue{Name = "ef_GrompAlive"},
			FigureSwappingDisable {},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_KaraWalkHome"},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Gromp", X = 397, Y = 388},
		},
	},
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsIdle {},
			FigureIsInRange	{Range = 1, X = 397, Y = 388},
		},
		Actions = 
		{
			FigureLookAtDirection	{Direction = 180},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue{Name = "af_P300_KaraDialogEnd"}, 
			EntityFlagIsTrue{Name = "ef_GrompAlive"}, 
		},
		Actions = 
		{
			FigureWalk	{Tag = "Gromp", X = HomePositionX, Y = HomePositionY},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Gromp", Range = 2, X = HomePositionX, Y = HomePositionY},
			TimeIsBetween	{StartHour = 20, EndHour = 20.15},
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
			ObjectChange {Tag = "Laterne01", ObjectId = LaterneAn, X = Laterne01StandortX, Y = Laterne01StandortY, Direction = 270},	
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
			ObjectChange {Tag = "Laterne01", ObjectId = LaterneAus, X = Laterne01StandortX, Y = Laterne01StandortY, Direction = 270},	
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
			ObjectChange	{Tag = "Laterne02", ObjectId = LaterneAn, X = Laterne02StandortX, Y = Laterne02StandortY, Direction = 180},	
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
			ObjectChange {Tag = "Laterne02", ObjectId = LaterneAus, X = Laterne02StandortX, Y = Laterne02StandortY, Direction = 180},	
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
			ObjectChange	{Tag = "Laterne03", ObjectId = LaterneAn, X = Laterne03StandortX, Y = Laterne03StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne03", ObjectId = LaterneAus, X = Laterne03StandortX, Y = Laterne03StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne04", ObjectId = LaterneAn, X = Laterne04StandortX, Y = Laterne04StandortY, Direction = 0},
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
			ObjectChange	{Tag = "Laterne04", ObjectId = LaterneAus, X = Laterne04StandortX, Y = Laterne04StandortY, Direction = 0},
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
			ObjectChange	{Tag = "Laterne05", ObjectId = LaterneAn, X = Laterne05StandortX, Y = Laterne05StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne05", ObjectId = LaterneAus, X = Laterne05StandortX, Y = Laterne05StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne06", ObjectId = LaterneAn, X = Laterne06StandortX, Y = Laterne06StandortY, Direction = 0},
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
			ObjectChange	{Tag = "Laterne06", ObjectId = LaterneAus, X = Laterne06StandortX, Y = Laterne06StandortY, Direction = 0},
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
			ObjectChange	{Tag = "Laterne07", ObjectId = LaterneAn, X = Laterne07StandortX, Y = Laterne07StandortY, Direction = 180},
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
			ObjectChange	{Tag = "Laterne07", ObjectId = LaterneAus, X = Laterne07StandortX, Y = Laterne07StandortY, Direction = 180},
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
			ObjectChange	{Tag = "Laterne08", ObjectId = LaterneAn, X = Laterne08StandortX, Y = Laterne08StandortY, Direction = 315},
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
			ObjectChange	{Tag = "Laterne08", ObjectId = LaterneAus, X = Laterne08StandortX, Y = Laterne08StandortY, Direction = 315},
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
			ObjectChange	{Tag = "Laterne09", ObjectId = LaterneAn, X = Laterne09StandortX, Y = Laterne09StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne09", ObjectId = LaterneAus, X = Laterne09StandortX, Y = Laterne09StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne10", ObjectId = LaterneAn, X = Laterne10StandortX, Y = Laterne10StandortY, Direction = 180},
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
			ObjectChange	{Tag = "Laterne10", ObjectId = LaterneAus, X = Laterne10StandortX, Y = Laterne10StandortY, Direction = 180},
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
			ObjectChange	{Tag = "Laterne11", ObjectId = LaterneAn, X = Laterne11StandortX, Y = Laterne11StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne11", ObjectId = LaterneAus, X = Laterne11StandortX, Y = Laterne11StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne12", ObjectId = LaterneAn, X = Laterne12StandortX, Y = Laterne12StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne12", ObjectId = LaterneAus, X = Laterne12StandortX, Y = Laterne12StandortY, Direction = 270},
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
			ObjectChange	{Tag = "Laterne13", ObjectId = LaterneAn, X = Laterne13StandortX, Y = Laterne13StandortY, Direction = 0},
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
			ObjectChange	{Tag = "Laterne13", ObjectId = LaterneAus, X = Laterne13StandortX, Y = Laterne13StandortY, Direction = 0},
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
			ObjectChange	{Tag = "Laterne14", ObjectId = LaterneAn, X = Laterne14StandortX, Y = Laterne14StandortY, Direction = 180},
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
			ObjectChange	{Tag = "Laterne14", ObjectId = LaterneAus, X = Laterne14StandortX, Y = Laterne14StandortY, Direction = 180},
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


















