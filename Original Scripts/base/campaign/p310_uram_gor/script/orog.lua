
 --Wenn einer der Dämonentürme zerstört wurde
State
{
	StateName = "InitState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_TzangAlive"},
		},
		Actions = 
		{
			 MapFlagSetTrue {Name = "mf_OrogAlive"},
		},
		
	}, 
	OnEvent
    {
    	
    	Conditions =
    	{
			MapFlagIsTrue {Name = "mf_OrogAlive"},
    	},
    	Actions =
    	{
 			
   		},
   		GotoState = "MainState",
    },   	

}

--*******************************************************
--***                                                 ***
--*** 				  Main State	 				  ***
--***												  ***
--******************************************************* 

State
{
	StateName = "MainState",

	OnEvent
    {
    	Conditions =
    	{
    		FigureIsDead	{},
    	},
    	Actions =
    	{
   		},
   		GotoState = "EndState",
    },   	

	OnEvent
    {
    	Conditions =
    	{
    		FigureHasNotHealth	{Percent = 60},	
    	},
    	Actions =
    	{
   		},
   		GotoState = "RandomCalculator",
    },   	
}
	
--*******************************************************
--***                                                 ***
--*** 				Random Calculator 				  ***
--***												  ***
--*******************************************************  

State
{		
	--RandomCalculator
	StateName = "RandomCalculator",
    OnEvent
    {
    	Conditions =
    	{
    	},
    	Actions =
    	{
 			MapValueRandomize	{Name = "mv_RandomOrogTeleporter", MinValue = 1, MaxValue = 5},
   		},
    }, 
    
    
    -- Ergebnis == 1
    OnEvent
    {
    	Conditions =
    	{
			MapValueIsEqual	{Name = "mv_RandomOrogTeleporter", Value = 1},
			BuildingIsAlive	{Tag = "OrogLight01"},
    	},
    	Actions =
    	{
   		},
   		GotoState = "RandomAuswertung01",
    }, 
    -- Ergebnis == 2
     OnEvent
    {
    	Conditions =
    	{
			MapValueIsEqual	{Name = "mv_RandomOrogTeleporter", Value = 2},
			BuildingIsAlive	{Tag = "OrogLight02"},
    	},
    	Actions =
    	{
   		},
   		GotoState = "RandomAuswertung02",
    }, 
    -- Ergebnis == 3
    OnEvent
    {
    	Conditions =
    	{
			MapValueIsEqual	{Name = "mv_RandomOrogTeleporter", Value = 3},
			BuildingIsAlive	{Tag = "OrogLight03"},
    	},
    	Actions =
    	{
   		},
   		GotoState = "RandomAuswertung03",
    }, 
     -- Ergebnis == 4
    OnEvent
    {
    	Conditions =
    	{
			MapValueIsEqual	{Name = "mv_RandomOrogTeleporter", Value = 4},
			BuildingIsAlive	{Tag = "OrogLight04"},
    	},
    	Actions =
    	{
   		},
   		GotoState = "RandomAuswertung04",
    }, 
    -- Ergebnis == 5
    OnEvent
    {
    	Conditions =
    	{
			MapValueIsEqual	{Name = "mv_RandomOrogTeleporter", Value = 5},
			BuildingIsAlive	{Tag = "OrogLight05"},
    	},
    	Actions =
    	{
   		},
   		GotoState = "RandomAuswertung05",
    }, 
     -- Alle Feuer sind gelöscht oder Orog tot.
    OnEvent
    {
    	Conditions =
    	{
    		OR
    		{
    			FigureIsDead	{},
    			AND
    			{
					BuildingIsDead	{Tag = "OrogLight01"},
					BuildingIsDead	{Tag = "OrogLight02"},
					BuildingIsDead	{Tag = "OrogLight03"},
					BuildingIsDead	{Tag = "OrogLight04"},
					BuildingIsDead	{Tag = "OrogLight05"},
				},
			},
    	},
    	Actions =
    	{
   		},
   		GotoState = "EndState",
    }, 
}	

--*******************************************************
--***                                                 ***
--*** 			Random Calculator End				  ***
--***												  ***
--*******************************************************  
--*******************************************************
--***                                                 ***
--*** 			Random Auswertung 01				  ***
--***												  ***
--*******************************************************  

State
{	
	-- Ergebnis == 1
	StateName = "RandomAuswertung01",
 	OnEvent
    {
    	Conditions =
    	{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter01"},
    	},
    	Actions =
    	{
 			EffectStartAtEntityPosition	{Tag = "Orog", File = "Effect_Spawn_Unit"},
 			EntityTimerStart	{Name = "et_OrogTeleport01"},
 			EntityFlagSetTrue {Name = "ef_EinmalSchalter01"},
   		},
    }, 
 	
 	--Teleport zur Fackel 01
	OnEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_OrogTeleport01", Seconds = 1},
    	},
    	Actions =
    	{
 			EntityTimerStop	{Name = "et_OrogTeleport01"},
 			EffectStop	{Tag = "Orog"},
 			FigureTeleport	{X = 425, Y = 654},
 			FigureHealthSet	{Percent = 100},
 			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
 			EntityFlagSetFalse {Name = "ef_EinmalSchalter01"},
   		},
   		GotoState = "MainState"
    },   
	
}

--*******************************************************
--***                                                 ***
--*** 			Random Auswertung 02				  ***
--***												  ***
--*******************************************************  

State
{	
	-- Ergebnis == 2
	StateName = "RandomAuswertung02",
 	OnEvent
    {
    	
    	Conditions =
    	{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter02"},
    	},
    	Actions =
    	{
 			EffectStartAtEntityPosition	{Tag = "Orog", File = "Effect_Spawn_Unit"},
 			EntityTimerStart	{Name = "et_OrogTeleport02"},
 			EntityFlagSetTrue {Name = "ef_EinmalSchalter02"},
   		},
    }, 
 	
 	--Teleport zur Fackel 02
	OnEvent
    {
    	
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_OrogTeleport02", Seconds = 1},
    	},
    	Actions =
    	{
 			EntityTimerStop	{Name = "et_OrogTeleport02"},
 			EffectStop	{Tag = "Orog"},
 			FigureTeleport	{X = 443, Y = 639},
 			FigureHealthSet	{Percent = 100},
 			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
 			EntityFlagSetFalse {Name = "ef_EinmalSchalter02"},
   		},
   		GotoState = "MainState"
    },   
	
}

--*******************************************************
--***                                                 ***
--*** 			Random Auswertung 03				  ***
--***												  ***
--*******************************************************  

State
{	
	-- Ergebnis == 3
	StateName = "RandomAuswertung03",
 	OnEvent
    {
    	Conditions =
    	{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter03"},
    	},
    	Actions =
    	{
 			EffectStartAtEntityPosition	{Tag = "Orog", File = "Effect_Spawn_Unit"},
 			EntityTimerStart	{Name = "et_OrogTeleport03"},
 			EntityFlagSetTrue {Name = "ef_EinmalSchalter03"},
   		},
    }, 
 	
 	--Teleport zur Fackel 03
	OnEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_OrogTeleport03", Seconds = 1},
    	},
    	Actions =
    	{
 			EntityTimerStop	{Name = "et_OrogTeleport03"},
 			EffectStop	{Tag = "Orog"},
 			FigureTeleport	{X = 443, Y = 617},
 			FigureHealthSet	{Percent = 100},
 			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
 			EntityFlagSetFalse {Name = "ef_EinmalSchalter03"},
   		},
   		GotoState = "MainState"
    },   
	
}

--*******************************************************
--***                                                 ***
--*** 			Random Auswertung 04				  ***
--***												  ***
--*******************************************************  

State
{	
	-- Ergebnis == 4
	StateName = "RandomAuswertung04",
 	OnEvent
    {
    	Conditions =
    	{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter04"},
    	},
    	Actions =
    	{
 			EffectStartAtEntityPosition	{Tag = "Orog", File = "Effect_Spawn_Unit"},
 			EntityTimerStart	{Name = "et_OrogTeleport04"},
 			EntityFlagSetTrue {Name = "ef_EinmalSchalter04"},
   		},
    }, 
 	
 	--Teleport zur Fackel 04
	OnEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_OrogTeleport04", Seconds = 1},
    	},
    	Actions =
    	{
 			EntityTimerStop	{Name = "et_OrogTeleport04"},
 			EffectStop	{Tag = "Orog"},
 			FigureTeleport	{X = 408, Y = 616},
 			FigureHealthSet	{Percent = 100},
 			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
 			EntityFlagSetFalse {Name = "ef_EinmalSchalter04"},
   		},
   		GotoState = "MainState"
    },   
	
}

--*******************************************************
--***                                                 ***
--*** 			Random Auswertung 05				  ***
--***												  ***
--*******************************************************  

State
{	
	-- Ergebnis == 5
	StateName = "RandomAuswertung05",
 	OnEvent
    {
    	Conditions =
    	{
			EntityFlagIsFalse {Name = "ef_EinmalSchalter05"},
    	},
    	Actions =
    	{
 			EffectStartAtEntityPosition	{Tag = "Orog", File = "Effect_Spawn_Unit"},
 			EntityTimerStart	{Name = "et_OrogTeleport05"},
 			EntityFlagSetTrue {Name = "ef_EinmalSchalter05"},
   		},
    }, 
 	
 	--Teleport zur Fackel 05
	OnEvent
    {
    	Conditions =
    	{
    		EntityTimerIsElapsed	{Name = "et_OrogTeleport05", Seconds = 1},
    	},
    	Actions =
    	{
 			EntityTimerStop	{Name = "et_OrogTeleport05"},
 			EffectStop	{Tag = "Orog"},
 			FigureTeleportToEntity	{TargetTag = "OrogLight05"},
 			FigureTeleport	{X = 408, Y = 639},
 			FigureHealthSet	{Percent = 100},
 			FigureRun	{X = GetEntityX(), Y = GetEntityY()},
 			EntityFlagSetFalse {Name = "ef_EinmalSchalter05"},
   		},
   		GotoState = "MainState"
    },   
}

    
--*******************************************************
--***                                                 ***
--*** 					EndState				 	  ***
--***												  ***
--******************************************************* 
State
{	   
    StateName = "EndState",
};
