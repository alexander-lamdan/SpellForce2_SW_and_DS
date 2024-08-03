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
		X = 259,
		Y = 509,
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
		X = 263,
		Y = 609,
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
			BuildingIsAlive	{Tag = "SpawnpointUndeadCitizen05"},
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			
		},
	},
};