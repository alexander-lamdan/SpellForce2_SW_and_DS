local randomvalue = math.random(7, 9)

HomePointHexer04X = 116
HomePointHexer04Y = 313

TargetPointX = 93
TargetPointY = 287

--*******************************************************
--***                                                 ***
--***         			Hexer04		       	          ***
--***                                                 ***
--*******************************************************  

State
{
	StateName = "INIT",
	OnEvent
	{
		Conditions =
		{

		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave01", Level = SklavenLevel, UnitId = SklavenID01, TargetTag = "Hexer04", Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave02", Level = SklavenLevel, UnitId = SklavenID02, TargetTag = "Hexer04", Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave03", Level = SklavenLevel, UnitId = SklavenID03, TargetTag = "Hexer04", Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave04", Level = SklavenLevel, UnitId = SklavenID04, TargetTag = "Hexer04", Team = "tm_Creep"},
			EntityTimerStart	{Name = "et_SpawnTimer"},
		},
		GotoState = "Hexer04",
	},
};
   
State
{
	StateName = "Hexer04",

	OnEvent
	{
		Conditions =
		{
			SetUpdateInterval {Steps = randomvalue},
			EntityTimerIsElapsed	{Name = "et_SpawnTimer", Seconds = 5},
		},
		Actions =
		{
			FigureRun	{Tag = "Hexer04", X = TargetPointX, Y = TargetPointY},
			EntityTimerStop	{Name = "et_SpawnTimer"},
			FigureRun	{Tag = "Hexer04Sklave01", X = TargetPointX, Y = TargetPointY},
			FigureRun	{Tag = "Hexer04Sklave02", X = TargetPointX, Y = TargetPointY},
			FigureRun	{Tag = "Hexer04Sklave03", X = TargetPointX, Y = TargetPointY},
			FigureRun	{Tag = "Hexer04Sklave04", X = TargetPointX, Y = TargetPointY},
		},
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			BuildingIsAlive	{Tag = "SpawnBuilding11"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave01", Level = SklavenLevel, UnitId = SklavenID01, TargetTag = "Hexer04", Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave02", Level = SklavenLevel, UnitId = SklavenID02, TargetTag = "Hexer04", Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave03", Level = SklavenLevel, UnitId = SklavenID03, TargetTag = "Hexer04", Team = "tm_Creep"},
			FigureNpcSpawnToEntity	{Tag = "Hexer04Sklave04", Level = SklavenLevel, UnitId = SklavenID04, TargetTag = "Hexer04", Team = "tm_Creep"},
			EntityTimerStart	{Name = "et_SpawnTimer"},
		},
		DeathActions = 
		{
			FigureKill	{Tag = "Hexer04Sklave01"},
			FigureKill	{Tag = "Hexer04Sklave02"},
			FigureKill	{Tag = "Hexer04Sklave03"},
			FigureKill	{Tag = "Hexer04Sklave04"},
		},
	},
	
	--**********************************************************************************************
	--*****																					   *****
	--*****								SchutzkreisLogik									   *****
	--****																					   *****
	--**********************************************************************************************
	SchutzkreisVerhaltenEvent{Tag = GetScriptTag(), X = TargetPointX, Y = TargetPointY},
	SchutzkreisVerhaltenEvent{Tag = GetScriptTag() .. "Sklave01", X = TargetPointX, Y = TargetPointY},
	SchutzkreisVerhaltenEvent{Tag = GetScriptTag() .. "Sklave02", X = TargetPointX, Y = TargetPointY},
	SchutzkreisVerhaltenEvent{Tag = GetScriptTag() .. "Sklave03", X = TargetPointX, Y = TargetPointY},
	SchutzkreisVerhaltenEvent{Tag = GetScriptTag() .. "Sklave04", X = TargetPointX, Y = TargetPointY},
--	--Hexer04
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},	
--			EntityFlagIsFalse	{Name = "ef_EinmalSchalter"},
--			OR	
--			{
--				FigureIsInRange	{Range = 10, X = Schutzkreis01X, Y = Schutzkreis01Y},
--				FigureIsInRange	{Range = 10, X = Schutzkreis02X, Y = Schutzkreis02Y},
--				FigureIsInRange	{Range = 10, X = Schutzkreis03X, Y = Schutzkreis03Y},
--				FigureIsInRange	{Range = 10, X = Schutzkreis04X, Y = Schutzkreis04Y},
--				FigureIsInRange	{Range = 10, X = Schutzkreis05X, Y = Schutzkreis05Y},
--			},
--		},
--		Actions = 
--		{
--			EntityFlagSetTrue	{Name = "ef_EinmalSchalter"},
--			FigureForcedWalk {X = GetEntityX(), Y = GetEntityY()},
--		},
--	},
--
-- -- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, erlischt das Force Goto nach einer kurzen Zeit wieder.	
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			EntityFlagIsTrue	{Name = "ef_EinmalSchalter"},
--			FigureIsInRange {Range = 5, X = GetEntityX(), Y = GetEntityY()},
--			
--		},
--		Actions = 
--		{
--			EntityFlagSetFalse	{Name = "ef_EinmalSchalter"},
--			FigureRun	{Tag = "Hexer04", X = TargetPointX, Y = TargetPointY},
--		},
--	},
--	
--	--Sklave01
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},	
--			EntityFlagIsFalse	{Name = "ef_EinmalSchalter1"},
--			OR	
--			{
--				FigureIsInRange	{Tag = "Hexer04Sklave01",Range = 10, X = Schutzkreis01X, Y = Schutzkreis01Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave01",Range = 10, X = Schutzkreis02X, Y = Schutzkreis02Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave01",Range = 10, X = Schutzkreis03X, Y = Schutzkreis03Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave01",Range = 10, X = Schutzkreis04X, Y = Schutzkreis04Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave01",Range = 10, X = Schutzkreis05X, Y = Schutzkreis05Y},
--			},
--		},
--		Actions = 
--		{
--			EntityFlagSetTrue	{Name = "ef_EinmalSchalter1"},
--			FigureForcedWalk {Tag = "Hexer04Sklave01",X = HomePointHexer04X, Y = HomePointHexer04Y},
--		},
--	},
--
-- -- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, erlischt das Force Goto nach einer kurzen Zeit wieder.	
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			EntityFlagIsTrue	{Name = "ef_EinmalSchalter1"},
--			FigureIsInRange {Tag = "Hexer04Sklave01", Range = 5, X = HomePointHexer04X, Y = HomePointHexer04Y},
--			
--		},
--		Actions = 
--		{
--			EntityFlagSetFalse	{Name = "ef_EinmalSchalter1"},
--			FigureRun	{Tag = "Hexer04Sklave01", X = TargetPointX, Y = TargetPointY},
--		},
--	},
--
--	--Sklave02
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},	
--			EntityFlagIsFalse	{Name = "ef_EinmalSchalter2"},
--			OR	
--			{
--				FigureIsInRange	{Tag = "Hexer04Sklave02",Range = 10, X = Schutzkreis01X, Y = Schutzkreis01Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave02",Range = 10, X = Schutzkreis02X, Y = Schutzkreis02Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave02",Range = 10, X = Schutzkreis03X, Y = Schutzkreis03Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave02",Range = 10, X = Schutzkreis04X, Y = Schutzkreis04Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave02",Range = 10, X = Schutzkreis05X, Y = Schutzkreis05Y},
--			},
--		},
--		Actions = 
--		{
--			EntityFlagSetTrue	{Name = "ef_EinmalSchalter2"},
--			FigureForcedWalk {Tag = "Hexer04Sklave02",X = HomePointHexer04X, Y = HomePointHexer04Y},
--		},
--	},
--
-- -- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, erlischt das Force Goto nach einer kurzen Zeit wieder.	
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			EntityFlagIsTrue	{Name = "ef_EinmalSchalter2"},
--			FigureIsInRange {Tag = "Hexer04Sklave02", Range = 5, X = HomePointHexer04X, Y = HomePointHexer04Y},
--			
--		},
--		Actions = 
--		{
--			EntityFlagSetFalse	{Name = "ef_EinmalSchalter2"},
--			FigureRun	{Tag = "Hexer04Sklave02", X = TargetPointX, Y = TargetPointY},
--		},
--	},
--
--	--Sklave03
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},	
--			EntityFlagIsFalse	{Name = "ef_EinmalSchalter3"},
--			OR	
--			{
--				FigureIsInRange	{Tag = "Hexer04Sklave03",Range = 10, X = Schutzkreis01X, Y = Schutzkreis01Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave03",Range = 10, X = Schutzkreis02X, Y = Schutzkreis02Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave03",Range = 10, X = Schutzkreis03X, Y = Schutzkreis03Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave03",Range = 10, X = Schutzkreis04X, Y = Schutzkreis04Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave03",Range = 10, X = Schutzkreis05X, Y = Schutzkreis05Y},
--			},
--		},
--		Actions = 
--		{
--			EntityFlagSetTrue	{Name = "ef_EinmalSchalter3"},
--			FigureForcedWalk {Tag = "Hexer04Sklave03",X = HomePointHexer04X, Y = HomePointHexer04Y},
--		},
--	},
--
-- -- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, erlischt das Force Goto nach einer kurzen Zeit wieder.	
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			EntityFlagIsTrue	{Name = "ef_EinmalSchalter3"},
--			FigureIsInRange {Tag = "Hexer04Sklave03", Range = 5, X = HomePointHexer04X, Y = HomePointHexer04Y},
--			
--		},
--		Actions = 
--		{
--			EntityFlagSetFalse	{Name = "ef_EinmalSchalter3"},
--			FigureRun	{Tag = "Hexer04Sklave03", X = TargetPointX, Y = TargetPointY},
--		},
--	},
--
--	--Sklave04
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},	
--			EntityFlagIsFalse	{Name = "ef_EinmalSchalter4"},
--			OR	
--			{
--				FigureIsInRange	{Tag = "Hexer04Sklave04",Range = 10, X = Schutzkreis01X, Y = Schutzkreis01Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave04",Range = 10, X = Schutzkreis02X, Y = Schutzkreis02Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave04",Range = 10, X = Schutzkreis03X, Y = Schutzkreis03Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave04",Range = 10, X = Schutzkreis04X, Y = Schutzkreis04Y},
--				FigureIsInRange	{Tag = "Hexer04Sklave04",Range = 10, X = Schutzkreis05X, Y = Schutzkreis05Y},
--			},
--		},
--		Actions = 
--		{
--			EntityFlagSetTrue	{Name = "ef_EinmalSchalter4"},
--			FigureForcedWalk {Tag = "Hexer04Sklave04",X = HomePointHexer04X, Y = HomePointHexer04Y},
--		},
--	},
--
-- -- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, erlischt das Force Goto nach einer kurzen Zeit wieder.	
--	OnEvent
--	{
--		Conditions = 
--		{
--			SetUpdateInterval {Steps = randomvalue},
--			EntityFlagIsTrue	{Name = "ef_EinmalSchalter4"},
--			FigureIsInRange {Tag = "Hexer04Sklave04", Range = 25, X = HomePointHexer04X, Y = HomePointHexer04Y},
--			
--		},
--		Actions = 
--		{
--			EntityFlagSetFalse	{Name = "ef_EinmalSchalter4"},
--			FigureRun	{Tag = "Hexer04Sklave04", X = TargetPointX, Y = TargetPointY},
--		},
--	},

};
