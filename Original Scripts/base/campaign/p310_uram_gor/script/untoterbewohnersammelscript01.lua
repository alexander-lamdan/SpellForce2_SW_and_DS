local randomvalue = math.random(7, 9)

 -- Wenn UntoterBewohner in die Nähe eines Schutzkreises kommt, Bekommt ewr ein Force Go zu seinem Ausgangspunkt. 

State
{
	StateName = "SchutzkreisVerhalten01",
   	OnEvent
	{
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},	
			EntityFlagIsFalse	{Name = "ef_EinmalSchalter"},
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
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter"},
			FigureForcedWalk {X = GetEntityX(), Y = GetEntityY()},
		},
	},

 -- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, erlischt das Force Goto nach einer kurzen Zeit wieder.	
	
	OnEvent
	{
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			EntityFlagIsTrue	{Name = "ef_EinmalSchalter"},
			FigureIsNotInRange {Range = 25, X = Schutzkreis01X, Y = Schutzkreis01Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis02X, Y = Schutzkreis02Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis03X, Y = Schutzkreis03Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis04X, Y = Schutzkreis04Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis05X, Y = Schutzkreis05Y},
		},
		Actions = 
		{
			--EntityFlagSetFalse {Name = "ef_ForceGotoAnschalten"},
			FigureWalk {X = GetEntityX(), Y = GetEntityY()},
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter"},
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
		},
		Actions = 
		{
			
		},
		DeathActions = 
		{
			
		},
	},
 
 

};
