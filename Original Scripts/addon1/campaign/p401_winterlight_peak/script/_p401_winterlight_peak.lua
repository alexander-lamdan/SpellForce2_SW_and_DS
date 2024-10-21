------------------------------------------------------------------------
--
--	Platformskript Winterlichtspitze
--
----------------------------------------------------------------------------

-- für copy&paste:
-- SingleMapLoadEvent einladen

-- Wenn ein Zwerg regulär stirbt wird er gezählt, damit man wenn es knapp wird eine Warnung rausballern kann
for i = 1, 40 do
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Worker" .. i},
   			MapFlagIsFalse {Name = "mf_Worker" .. i .. "TeleportedAway"}, -- auf true setzen wenn wegteleportiert
  		},
  		Actions =
  		{
  			 -- value increase
  		 	MapValueIncrease {Name = "mv_P465_RegularDiedDwarfes"},
  		},
 	};
end

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
			CutscenePlayBinkVideo{File = "Addon1/video/intro_1.bik"},
			EntityTimerStart {Name = "et_P401_Delay"},
			-- Testweise mal den Startplatz aufdecken, damit man die stretchenden Texturen nicht mehr sieht
			FogOfWarReveal {FogOfWarId = 1, X = 91.7592, Y = 21.5563, Height = 26, Range = 5},
			FogOfWarReveal {FogOfWarId = 1, X = 102.762, Y = 26.7558, Height = 26, Range = 5},
			FogOfWarReveal {FogOfWarId = 1, X = 81.3603, Y = 27.119, Height = 26, Range = 5},
			FogOfWarReveal {FogOfWarId = 1, X = 120.885, Y = 32.0686, Height = 26, Range = 5},
			FogOfWarReveal {FogOfWarId = 1, X = 74.7337, Y = 61.6319, Height = 26, Range = 10},
			FogOfWarReveal {FogOfWarId = 1, X = 76.193, Y = 43.8644, Height = 26, Range = 10},
			
			-- den Händler Steingrimm verstecken ...
			FigureTeleportToEntity	{Tag = "Steingrimm", TargetTag = "SteingrimmHidingPlace"},
		},
	},
	--  Mit etwas Verzögerung die Katapulte blockieren und Reisen auch
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P401_Delay", Seconds = 2}
		},
		Actions =
		{
			PlayerTravelDisable {},
			PortalDisable {Tag = "Winterlight_Alluvyan"},
			FigureOutcry {Tag = "Yasha", TextTag = "Start1"},
			FigureOutcry {Tag = "HeroWhisper", TextTag = "Start2"},
			FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "Start3"},
			MapFlagSetTrue {Name = "mf_P401_StartMainQuest"}
		},
	},
	-- Wenn der Spieler nach einigerzeit noch Skillpoints hat muss er nochmal darauf hingewiesen werden, dass er sie verteilen soll
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P401_Delay", Seconds = 180},
			HeroHasSkillPointsLeft {Hero = 0, Player = "pl_Human"},
			MapFlagIsFalse {Name = "mf_P401_StartIntroCS"},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_P401_Delay"},
   			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "_OutrcyNoteNpc", Level = 30, UnitId = 1448, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
    		FigureOutcry {Tag = "_OutrcyNoteNpc", TextTag = "HelpText"},
    		FigureVanish {Tag = "_OutrcyNoteNpc"},
		}
	},
	-- Sind Wind und Wisper zusammen gibt es einen Text
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndIntroCS"},
			FigureIsInRangeToEntity {Tag = "pl_HumanHeroWind", TargetTag = "HeroWhisper", Range = 10}
		},
		Actions =
		{
			FigureOutcry {Tag = "Wind", TextTag = "TheParts03"},
		},
	},
	-- Ist der DIalog mit WInd durch kommen Outcries
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_EndWindCS"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroWind", TextTag = "Reunion01"},
			FigureOutcry {Tag = "pl_HumanHeroWhisper", TextTag = "Reunion02"},
			MapFlagSetTrue {Name = "mf_P401_ReunionOutcriesPartOne"},
		},
	},
	-- Damit ich weiß, welche Feder der Spieler zuerst geholt hat
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P401_EndWindCS"},
			AvatarHasItemMisc {ItemId = 293, Amount = 1},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P401_CrateLootedFirst"},
		},
	},
	-- Hat der Spieler die Federn und die Reunion hat stattgefunden kommt noch ein Extraoutcry
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_ReunionOutcriesPartOne"},
			MapFlagIsTrue {Name = "mf_P401_CrateLootedFirst"},
		},
		Actions =
		{
			FigureOutcry {Tag = "pl_HumanHeroWhisper", TextTag = "Reunion03"},
		},
	},
	-- Wenn der Spieler die Tore schließen kann, dann soll er es auch machen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P401_SparePartTwoGiven"},
			MapFlagIsFalse {Name = "mf_P401_StartGateCS"},
		},
		Actions =
		{
			FigureOutcryImmediate {Tag = "Skjardir", TextTag = "CloseGate01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P401_GateOutcries", Seconds = 120},
			MapFlagIsTrue {Name = "mf_P401_SparePartTwoGiven"},
			MapFlagIsFalse {Name = "mf_P401_EndGateCS"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Skjardir", TextTag = "CloseGate02"},
		},
	},
	-- Wenn der Spieler doch durchs Tor läuft wird er gewarnt
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "SF2A1_1_Akt_Kapitel1"},
			OR
			{
				PlayerFigureIsInRange {X = 161, Y = 92, Range = 9},
				PlayerFigureIsInRange {X = 140, Y = 70, Range = 9},
			},
		},
		Actions =
		{
			FigureOutcry {Tag = "Skjardir", TextTag = "Start4"},
		},
		
	},
	-- Hat der Spieler noch nicht alle Hebelteile und ist in der Nähe des Hebel, kommt eine Warnung
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotKnown {Quest = "WinterlightPeak_FinallyCloseGate"},
			MapTimerIsElapsed {Name = "mt_P401_SpringNotBeast", Seconds = 180},
		},
		Actions =
		{
			FigureOutcry {Tag = "Skjardir", TextTag = "Start5"}
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "LeverGates", Range = 3},
			QuestIsNotKnown {Quest = "WinterlightPeak_FinallyCloseGate"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Skjardir", TextTag = "Lever1"}
		}
	},
	
	-- Sind nur noch wenige Zwerge übrig wird der Spieler gewarnt
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
		},
	},
	-- Um das Spawning der Beastmen auf dem Pass ein wenig zu verzögern, werden sie erst gespawnt, wenn der Spieler einmal auf dem Pass war
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerFigureIsInRange {X = 112, Y = 166, Range = 10}
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P401_Spawn"},
			MapFlagSetTrue {Name = "mf_P401_PlayerIsOnPass"},
		},
	},
	
	-- Game over Events
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsGreater {Name = "mv_P401_DwarfsDiedInTheCold", Value = 20},
		},
		Actions =
		{
			PlayerGameOver {LocaTag = "GameOverA1DwarfsDead"},
		}
	},
	
	-- Die Feinde kommen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P401_EnemyAtTheGates", Seconds = 720},
			MapFlagIsFalse {Name = "mf_P401_StartEndCS"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "EnemyAtTheGates01", Tag = "Skjardir"},
			MapFlagSetTrue {Name = "mf_P401_AttackGateGroup1"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P401_EnemyAtTheGates", Seconds = 900},
			MapFlagIsFalse {Name = "mf_P401_StartEndCS"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "EnemyAtTheGates02", Tag = "Skjardir"},
			MapFlagSetTrue {Name = "mf_P401_AttackGateGroup2"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P401_EnemyAtTheGates", Seconds = 1150},
			MapFlagIsFalse {Name = "mf_P401_StartEndCS"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "EnemyAtTheGates03", Tag = "Skjardir"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P401_EnemyAtTheGates", Seconds = 1200},
			MapFlagIsFalse {Name = "mf_P401_StartEndCS"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "EnemyAtTheGates04", Tag = "Skjardir"},
			FigureOutcry {TextTag = "EnemyAtTheGates05", Tag = "Skjardir"},
			GateSetOpen {Tag = "MainGate1"},
			GateSetOpen {Tag = "MainGate2"},
			MapFlagSetTrue {Name = "mf_P401_ThroughGates"},
		},
	},
	
}