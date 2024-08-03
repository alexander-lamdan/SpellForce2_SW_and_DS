--print("Meine Nummer: Slave".. groupnumber.."  ".. groupmember)

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		EventName = "SlaveInit",
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {},
			MapFlagSetTrue {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "MyNumber"},
			EntityFlagSetFalse {Name = "ef_P309_Blocker"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "SlaveGotoStateFight",
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
	OnFigureRespawnEvent
	{
		X = positionx,
		Y = positiony,
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
			--MapFlagSetFalse {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "_HasNotDiedInFight"},
			EntityFlagSetTrue {Name = "ef_P309_StepOn"},
			EntityFlagSetTrue {Name = "ef_P309_FightRunning"},
		}
	}
}

-- SI: respawn nur für groupmembers 6 & 7, selektion schon auf lua ebene
if (groupnumber > 4) and (groupmember >= 6) then

	OnFigureRespawnEvent
	{
		X = positionx,
		Y = positiony,
		WaitTime = 30,
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = fightnumber},
			--MapFlagIsFalse {Name = "mf_P309_"..fightnumber.."_PitFightWon"},
			MapFlagIsTrue {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "_HasDiedInFight"},
			FigureIsInRange {X = 574, Y = 340, Range = 12, Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "_HasDiedInFight"},
			EntityFlagSetTrue {Name = "ef_P309_FightRunning"},
			EntityFlagSetFalse {Name = "ef_P309_Blocker"},
		},
	}
end


State
{
	StateName = "Fight",
	OnFigureRespawnEvent
	{
		X = positionx,
		Y = positiony,
		WaitTime = 1,
		Conditions =
		{
			-- Nur im betreffenden Kampf wird auch gespawnt
			MapValueIsEqual {Name = "mv_P309_FightNumber", Value = fightnumber},
			MapFlagIsTrue {Name = "mf_P309_BeginFight"},
			FigureIsInRange {X = 574, Y = 340, Range = 12, Tag = "pl_HumanAvatar"},
			EntityFlagIsFalse {Name = "ef_P309_FightRunning"},
		},
		Actions =
		{
			-- Der Spieler hat wieder eine Chance die Figur "ehrlich" zu töten
			MapFlagSetFalse {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "_HasDiedInFight"},
			EntityFlagSetTrue {Name = "ef_P309_FightRunning"},
			EntityFlagSetFalse {Name = "ef_P309_Blocker"},
		},
	},
	-- Wenn der Spieler in der zweiten Stufe (Zyklus des Aufstiegs) ist, die Runde läuft und nicht alle rechtzeitig tot sind werden zwei Figuren respawnt
	
	OnEvent
	{
		EventName = "SlaveNotInArenaStopFightForEntity",
		Conditions =
		{
			OR
			{
				-- Wenn self nicht in Arena
				FigureIsNotInRange {X = 574, Y = 340, Range = 12, Tag = "PitFighter".. groupnumber .. "_" .. groupmember},
				-- Wenn Spieler nicht in Arena
				FigureIsNotInRange {X = 574, Y = 340, Range = 12, Tag = "pl_HumanAvatar"},
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
			--MapFlagSetTrue {Name = "mf_P309_PitFighter".. groupnumber.. "_".. groupmember .. "_HasNotDiedInFight"},
			EntityFlagSetFalse {Name = "ef_P309_FightRunning"},
			MapFlagSetFalse {Name = "mf_P309_FightRunnning"},
			MapFlagSetTrue {Name = "mf_P309_FightLost"},
		},
	},
	OnDeadEvent
	{
		EventName = "SlaveDeadEvent",
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
	
	-- SI: siehe comment beim master
	--OnOneTimeEvent
	--{
	--	EventName = "SlaveGotoStateEndOfFight",
	--	GotoState = "EndOfFight",
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P309_" .. fightnumber .. "_PitFightWon"}
	--	},
	--	Actions =
	--	{
	--	}
	--}
}

--State
--{
--	StateName = "EndOfFight"
--}