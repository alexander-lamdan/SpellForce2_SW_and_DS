-- Angriffstruppen, der Blades, die sich kleine Scharm�tzel in der Festung liefern

State
{
	StateName = "INIT",
	-- Nummer der Einheit in auswertbare Form bringen
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			EntityValueSet {Name = "ev_P407_MyNumber", Value = myNumber}
		},
	},
	-- Wenn der Spieler in der N�he ist oder das Spawngeb�ude platt, dann kein Respawn
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
-- 				PlayerHasNotBuildingAmount	{Player = "pl_Siege", Amount = 1},
-- 				--PlayerFigureIsInRangeToEntity {Range = 20, TargetTag = "FortressFightBad" .. myNumber},
-- 				FigureIsDead {Tag = "GateBoss"},
-- 				MapTimerIsElapsed {Name = "mt_P407_TrapItemCarrier", Seconds = 1},
			},

		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P407_NoRespawn"},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 8, -- NOTE HOLGER: HIER STAND VORHER 6
					  -- ICH SOLLTE ES AUF QA-WUNSCH F�R DIE BETA �NDERN
		X = 462,
		Y = 378,

		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P407_NoRespawn"},
			MapTimerIsNotElapsed {Name = "mt_P407_SlowerSpawning", Seconds = 1},
		},
		Actions =
		{
			EntityValueSet {Name = "ev_P407_FirstStepFurther", Value = 0},
		},
	},
	-- Das Spawning der Gegner wird langsamer, umso weiter die Dunkelelfen in der Festung sind
	OnFigureRespawnEvent
	{
		WaitTime = 7, -- NOTE HOLGER: HIER STAND VORHER 10
					   -- ICH SOLLTE ES AUF QA-WUNSCH F�R DIE BETA �NDERN
		X = 462,
		Y = 378,

		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P407_NoRespawn"},
			FigureIsAlive {Tag = "GateBoss"},
			EntityFlagIsFalse {Name = "ef_P407_SlowestRespawning"},
		},
		Actions =
		{
			EntityValueSet {Name = "ev_P407_FirstStepFurther", Value = 0},
		},
		DeathActions =
		{
			EntityValueAdd {Name = "ev_P407_HowManyTimesDidIDie", Value = 1},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 6, -- NOTE HOLGER: HIER STAND VORHER 10
					   -- ICH SOLLTE ES AUF QA-WUNSCH F�R DIE BETA �NDERN
		X = 462,
		Y = 378,

		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P407_NoRespawn"},
			MapTimerIsElapsed {Name = "mt_P407_SlowerSpawning", Seconds = 1},
			FigureIsAlive {Tag = "GateBoss"},
			EntityFlagIsFalse {Name = "ef_P407_SlowestRespawning"},
		},
		Actions =
		{
			EntityValueSet {Name = "ev_P407_FirstStepFurther", Value = 0},
		},
		DeathActions =
		{
			EntityValueAdd {Name = "ev_P407_HowManyTimesDidIDie", Value = 1},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 7,  -- NOTE HOLGER: HIER STAND VORHER 45
						-- ICH SOLLTE ES AUF QA-WUNSCH F�R DIE BETA �NDERN
		X = 462,
		Y = 378,

		Conditions =
		{
			EntityFlagIsFalse {Name = "ef_P407_NoRespawn"},
-- 			FigureIsAlive {Tag = "GateBoss"},
			EntityFlagIsTrue {Name = "ef_P407_SlowestRespawning"},
		},
		Actions =
		{
			EntityValueSet {Name = "ev_P407_FirstStepFurther", Value = 0},
		},
		DeathActions =
		{
			EntityValueAdd {Name = "ev_P407_HowManyTimesDidIDie", Value = 1},
		},
	},
	OnIdleRunHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		GotoForced = false,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P407_FirstStepFurther", Value = 0},
		},
		Actions =
		{
		},
	},
	-- Wenn der Spieler lang genug unten ist wird f�r den obersten Trupp das Spawning ganz ausgeschaltet
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityValueIsLess {Name = "ev_P407_MyNumber", Value = 13},
			MapTimerIsElapsed {Name = "mt_P407_SlowerSpawning", Seconds = 90},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P407_NoRespawn"},
		},
	},
	-- SInd die Dunkelelfen weit in der Festung h�ren Einheiten auf zu spawnen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P407_OnlyLastBladeGroupKeepsOnSpawning"},
			EntityValueIsLess {Name = "ev_P407_MyNumber", Value = 20},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P407_NoRespawn"},
		},
	},
	-- Sind die Dunkelelfen des letzten Trupps zweimal get�tet, werden sie lansamer spawnen
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityValueIsGreater {Name = "ev_P407_MyNumber", Value = 19},
			EntityValueIsGreater {Name = "ev_P407_HowManyTimesDidIDie", Value = 2},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P407_SlowestRespawning"},
		},
	},
	-- Desto weiter der SPieler ist, desto langsamer spawnen die Einheiten

	--OnIdleRunHomeFake
	--{
	--	X = 347+offSetX,
	--	Y = 532+offSetY,
	--	GotoForced = false,
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P407_FirstGateFree"}   ,
	--		EntityValueIsEqual {Name = "ev_P407_FirstStepFurther", Value = 0},
	--	},
	--	Actions =
	--	{
	--	},
	--},

	-- Der oberer Trupp geht weiter, wenn er das Tor freigek�mpft hat
	OnIdleRunHomeFake
	{
		X = 373+offSetX,
		Y = 603+offSetY,
		GotoForced = false,
		Conditions =
		{
			EntityValueIsLess {Name = "ev_P407_MyNumber", Value = 13},
			EntityValueIsEqual {Name = "ev_P407_FirstStepFurther", Value = 0},
		},
		Actions =
		{
			EntityValueSet {Name = "ev_P407_FirstStepFurther", Value = 1},
		},
		HomeActions =
		{
			FigureLookAtDirection {Direction = 286},
			EntityTimerStart {Name = "et_P407_AttackFurtherOn"},
		},
	},
	OnIdleRunHomeFake
	{
		X = 380+offSetX,
		Y = 653+offSetY,
		GotoForced = false,
		Conditions =
		{
			EntityValueIsLess {Name = "ev_P407_MyNumber", Value = 13},
			EntityValueIsEqual {Name = "ev_P407_FirstStepFurther", Value = 1},
			EntityTimerIsElapsed {Name = "et_P407_AttackFurtherOn", Seconds = 15},
		},
		Actions =
		{
			EntityValueSet {Name = "ev_P407_FirstStepFurther", Value = 2},
		},
		HomeActions =
		{
			FigureLookAtDirection {Direction = 120},
			EntityTimerStart {Name = "et_P407_AttackFurtherOn"},
		},
	},

}