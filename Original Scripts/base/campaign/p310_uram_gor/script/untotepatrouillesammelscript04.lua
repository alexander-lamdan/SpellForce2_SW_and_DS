local randomvalue = math.random(7, 9)


State
{	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			EntityFlagSetTrue	{Name = "ef_Endpunkt"},
		},
		GotoState = "IdleGoHomeUntoter01"
	},
}

 -- Wenn UntoterBewohner in die Nähe eines Schutzkreises kommt, Bekommt ewr ein Force Go zu seinem Ausgangspunkt. 

State
{
	StateName = "IdleGoHomeUntoter01",
   	OnEvent
	{
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter01"},
			OR	
			{
				FigureIsInRange	{Range = 10, X = Schutzkreis01X, Y = Schutzkreis01Y},
				FigureIsInRange	{Range = 10, X = Schutzkreis02X, Y = Schutzkreis02Y},
				FigureIsInRange	{Range = 10, X = Schutzkreis03X, Y = Schutzkreis03Y},
				FigureIsInRange	{Range = 10, X = Schutzkreis04X, Y = Schutzkreis04Y},
				FigureIsInRange	{Range = 10, X = Schutzkreis05X, Y = Schutzkreis05Y},
			},
		},
		Actions = 
		{
			--EntityFlagSetTrue	{Name = "ef_ForceGotoAnschalten"},
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter01"},
			FigureForcedWalk {X = GetEntityX(), Y = GetEntityY()},
		},
	},
	

 -- Untoter begibt sich beim Kartenstart zum ersten Waypoint
	OnIdleGoHomeFake
	{
		UpdateInterval = 50,
		X = 54,
		Y = 374,
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			--MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},	
			EntityFlagIsTrue	{Name = "ef_Endpunkt"},
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter01"},
		},
		HomeActions = 
		{
			EntityFlagSetTrue	{Name = "ef_Startpunkt"},
			EntityFlagSetFalse	{Name = "ef_Endpunkt"},
		},
		OneTimeHomeActions = 
		{
		},
	},
	
	-- Untoter begibt sich zum zweiten Waypoint
	OnIdleGoHomeFake
	{
		UpdateInterval = 50,
		X = 189,
		Y = 373,
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			EntityFlagIsTrue	{Name = "ef_Startpunkt"},
		},
		Actions = 
		{
			
		},
		HomeActions = 
		{
			EntityFlagSetFalse	{Name = "ef_Startpunkt"},
			EntityFlagSetTrue	{Name = "ef_ZweiterPunkt"},
		},
		OneTimeHomeActions = 
		{
		},
	},



-- Untoter begibt sich zum dritt3n Waypoint
	OnIdleGoHomeFake
	{
		UpdateInterval = 50,
		X = 219,
		Y = 522,
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			EntityFlagIsTrue	{Name = "ef_ZweiterPunkt"},
		},
		Actions = 
		{
			
		},
		HomeActions = 
		{
			EntityFlagSetFalse	{Name = "ef_ZweiterPunkt"},
			EntityFlagSetTrue	{Name = "ef_DritterPunkt"},
		},
		OneTimeHomeActions = 
		{
		},
	},



-- Untoter begibt sich zum Ausgangspunkt
	OnIdleGoHomeFake
	{
		UpdateInterval = 50,
		X = 178,
		Y = 457,
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			EntityFlagIsTrue	{Name = "ef_DritterPunkt"},
		},
		Actions = 
		{
			
		},
		HomeActions = 
		{
			EntityFlagSetFalse	{Name = "ef_DritterPunkt"},
			EntityFlagSetTrue	{Name = "ef_Endpunkt"},
		},
		OneTimeHomeActions = 
		{
		},
	},
	-- Sobald die SideQuest AonirsAugen erfüllt wurde werden die Untote erlöst und sterben	
	OnOneTimeEvent
	{
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			QuestIsSolved	{Player = "pl_Human", Quest = "UramGorPart2EyesOfAonir"},
		},
		Actions =
		{
			FigureKill	{},
		},
	
	},
	--Respawn solange der Schutzkreis aktiviert ist	
		OnFigureRespawnEvent
	{
		WaitTime = 30,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},
			MapFlagIsFalse{Name = "mf_AonirsDialogEnded"},
			BuildingIsAlive	{Tag = "SpawnpointUndeadCitizen04"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			
		},
	},	
};