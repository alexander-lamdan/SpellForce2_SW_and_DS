-- SI: hatte in Runde 2 den Fall, das ich Arena verliess und die Gegner despawned sind
-- das war ein Blocker, da der Battlemaster seinen Dialog nicht wieder angeschaltet hat
-- und durch betreten der Arena liess sich der Kampf auch nicht neu starten...

--print("Meine Nummer".. groupnumber.."  ".. groupmember)

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		EventName = "MasterInit",
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {},
			--MapFlagSetTrue {Name = "mf_P309_PitFighter1_1_HasNotDiedInFight"},
		},
	},
	OnFigureRespawnEvent
	{
		X = 569,
		Y = 342,
		WaitTime = 1,
		Conditions =
		{
			-- Nur im betreffenden Kampf wird auch gespawnt
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = fightnumber},
			MapFlagIsTrue {Name = "mf_P309_BeginFight"},
			FigureIsInRange {X = 574, Y = 340, Range = 12, Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			-- Der Spieler hat wieder eine Chance die Figur "ehrlich" zu töten
			--MapFlagSetFalse {Name = "mf_P309_PitFighter1_1_HasNotDiedInFight"},
			EntityFlagSetTrue {Name = "ef_P309_StepOn"},
			EntityFlagSetTrue {Name = "ef_P309_FightRunning"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "MasterGotoStateFight",
		GotoState = "Fight",
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_P309_Talked"},
			EntityFlagIsTrue {Name = "ef_P309_StepOn"},
		},
		Actions =
		{
		},
	},
}

State
{
	StateName = "Fight",
	OnFigureRespawnEvent
	{
		X = 569,
		Y = 342,
		WaitTime = 1,
		Conditions =
		{
			-- Nur im betreffenden Kampf wird auch gespawnt
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = fightnumber},
			MapFlagIsTrue {Name = "mf_P309_BeginFight"},
			FigureIsInRange {X = 574, Y = 340, Range = 12, Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			-- Der Spieler hat wieder eine Chance die Figur "ehrlich" zu töten
			MapFlagSetFalse {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "_HasDiedInFight"},
			EntityFlagSetTrue {Name = "ef_P309_FightRunning"},
			EntityFlagSetFalse {Name = "ef_P309_Blocker"},
		},
	},
	-- Die Steuerung darf nur eine Figur machen
	OnEvent
	{
		EventName = "MasterPitFightersAliveAndAvatarInArena",
		Conditions =
		{
			FigureIsAlive {Tag = "PitFighter"..fightnumber.."_1"},
			FigureIsAlive {Tag = "PitFighter"..fightnumber.."_2"},
			FigureIsAlive {Tag = "PitFighter"..fightnumber.."_3"},
			FigureIsAlive {Tag = "PitFighter"..fightnumber.."_4"},
			FigureIsAlive {Tag = "PitFighter"..fightnumber.."_5"},
			FigureIsAlive {Tag = "PitFighter"..fightnumber.."_6"},
			FigureIsAlive {Tag = "PitFighter"..fightnumber.."_7"},
			FigureIsInRange {X = 574, Y = 340, Range = 12, Tag = "pl_HumanAvatar"},
			MapFlagIsTrue {Name = "mf_P309_BeginFight"},
		},
		Actions =
		{
			-- Erst wenn alle Figuren leben wird ihr Team gewechselt
			-- Außerdem wird dann das Kampfflag für den Dialog zurück gesetzt
			FigureTeamTransfer {Team = "tm_PitFighter", Tag = "PitFighter"..fightnumber.."_1"},
			FigureTeamTransfer {Team = "tm_PitFighter", Tag = "PitFighter"..fightnumber.."_2"},
			FigureTeamTransfer {Team = "tm_PitFighter", Tag = "PitFighter"..fightnumber.."_3"},
			FigureTeamTransfer {Team = "tm_PitFighter", Tag = "PitFighter"..fightnumber.."_4"},
			FigureTeamTransfer {Team = "tm_PitFighter", Tag = "PitFighter"..fightnumber.."_5"},
			FigureTeamTransfer {Team = "tm_PitFighter", Tag = "PitFighter"..fightnumber.."_6"},
			FigureTeamTransfer {Team = "tm_PitFighter", Tag = "PitFighter"..fightnumber.."_7"},
			
			MapFlagSetFalse {Name = "mf_P309_BeginFight"},
		},
	},
	OnEvent
	{
		EventName = "MasterNotInArenaStopFight",
		Conditions =
		{
			OR
			{
				-- Wenn self nicht in Arena
				FigureIsNotInRange {X = 574, Y = 340, Range = 20, Tag = "PitFighter".. groupnumber .. "_" .. groupmember},
				-- Wenn Spieler nicht in Arena
				FigureIsNotInRange {X = 574, Y = 340, Range = 20, Tag = "pl_HumanAvatar"},
				-- zur Sicherheit: wenn eine Einheit aus der Arena rausläuft, despawnen alle
				-- hat ausserdem den positiven Nebeneffekt, das man den Kampf nicht zu Ende führen muss
				-- um zu merken das man ihn eigentlich schon verloren hat
				MapFlagIsTrue {Name = "mf_P309_FightLost"},
				-- wenn der Avatar stirbt, ists auch aus und vorbei!
				FigureIsDead {Tag = "pl_HumanAvatar"},
			},
			EntityFlagIsTrue {Name = "ef_P309_FightRunning"},
			FigureIsAlive {Tag = "PitFighter".. groupnumber .. "_" .. groupmember},
		},
		Actions =
		{
			FigureVanish {},
			-- Flag für die Einheit, die nicht im Kampf gestorben ist.
			--MapFlagSetTrue {Name = "mf_P309_PitFighter".. groupnumber .. "_" ..groupmember .. "_HasNotDiedInFight"},
			EntityFlagSetFalse {Name = "ef_P309_FightRunning"},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapFlagSetTrue {Name = "mf_P309_FightLost"},
		},
	},
	OnDeadEvent
	{
		EventName = "MasterDeadEvent",
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P309_FightRunning"},
			EntityFlagIsFalse {Name = "ef_P309_Blocker"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "_HasDiedInFight"},
			EntityFlagSetFalse {Name = "ef_P309_FightRunning"},
			EntityFlagSetTrue {Name = "ef_P309_Blocker"},
		},
	},
	
	-- SI: wofür soll das gut sein? wenn der SPieler den Kampf gewonnen hat, 
	-- dann ist der Master doch sowieso tot und bereits nicht mehr in diesem State
	
	--OnOneTimeEvent
	--{
	--	EventName = "MasterGotoStateEndOfFight",
	--	GotoState = "EndOfFight",
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P309_" .. fightnumber .. "_PitFightWon"},
	--	},
	--	Actions =
	--	{
	--	},
	--},
}

--State
--{
--	StateName = "EndOfFight"
--}