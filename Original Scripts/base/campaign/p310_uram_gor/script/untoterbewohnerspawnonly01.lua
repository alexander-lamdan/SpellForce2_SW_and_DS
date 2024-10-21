local randomvalue = math.random(7, 9)

 -- Wenn UntoterBewohner in die Nähe eines Schutzkreises kommt, Bekommt ewr ein Force Go zu seinem Ausgangspunkt. 

State
{
	StateName = "SchutzkreisVerhalten01",
	--SteinsäulenUntote erwachen wenn der Spieler durch die Säulen wandert
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 4, X = 68, Y = 137},
			MapFlagIsTrue {Name = "mf_DecalDead01Aktiv"},
		},
		Actions = 
		{
			--EffectStart	{File = "EffectMichaTest"},   
		},
	},


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
			EntityFlagSetTrue	{Name = "ef_EinmalSchalter01"},
			FigureForcedWalk {X = GetEntityX(), Y = GetEntityY()},
		},
	},

 -- Damit sich die Untoten auf dem Rückzug nicht abschlachten lassen, erlischt das Force Goto nach einer kurzen Zeit wieder.	
	
	OnEvent
	{
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			EntityFlagIsTrue	{Name = "ef_EinmalSchalter01"},
			FigureIsNotInRange {Range = 25, X = Schutzkreis01X, Y = Schutzkreis01Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis02X, Y = Schutzkreis02Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis03X, Y = Schutzkreis03Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis04X, Y = Schutzkreis04Y},
			FigureIsNotInRange {Range = 25, X = Schutzkreis05X, Y = Schutzkreis05Y},
		},
		Actions = 
		{
			FigureWalk {X = GetEntityX(), Y = GetEntityY()},
			EntityFlagSetFalse	{Name = "ef_EinmalSchalter01"},
		},
	},
  	
  	--Respawn solange der Schutzkreis aktiviert ist	
		OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			SetUpdateInterval {Steps = randomvalue},
			MapFlagIsTrue	{Name = "mf_SchutzkreiseAktiviert"},
			MapFlagIsFalse{Name = "mf_AonirsDialogEnded"},
			PlayerFigureIsInRange	{Player = "pl_Human", Range = 4, X = 68, Y = 137},
		},
		Actions = 
		{
			
		},
		DeathActions = 
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
 

};
