---------------------
-- P406_The_Citadel
-- Outcries
---------------------

for i = 1, 10 do
	local sTextTag = "BirnbaumCreature0" .. i

	if i >= 6 then
		if i == 10 then
			sTextTag = "BirnbaumCreature" .. i
		end
		-- Birnbaum Kreaturen Outcries
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_SQCitadel_FoundCreature" .. (i - 5)},
				QuestIsNotKnown	{Quest = "CitadelBirnbaumCreatureCatalogue"},
				FigureIsAlive	{Tag = "pl_HumanAvatar"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = sTextTag, Tag = "pl_HumanAvatar"},
				MapFlagSetFalse	{Name = "mf_SQCitadel_FoundCreature" .. (i - 5)},
			},
		};
	else
		-- Birnbaum Kreaturen Outcries
		OnOneTimeEvent
		{
			Conditions = 
			{
				MapFlagIsTrue	{Name = "mf_SQCitadel_FoundCreature" .. i},
				QuestIsKnown	{Quest = "CitadelBirnbaumCreatureCatalogue"},
				FigureIsAlive	{Tag = "Birnbaum"},
			},
			Actions = 
			{
				FigureOutcry	{TextTag = sTextTag, Tag = "Birnbaum"},
				MapFlagSetFalse	{Name = "mf_SQCitadel_FoundCreature" .. i},
			},
		};
	end
end

State
{
	StateName = "Outcries_MAIN",
	
	-- nach Explorer Spawn die ersten Outcries absetzen
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_SpawnExplorerOutcries", Seconds = 0.2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ExplorerSpawn01", Tag = "Birnbaum"},
			FigureOutcry	{TextTag = "ExplorerSpawn02", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerSpawn03", Tag = "Birnbaum"},
			FigureOutcry	{TextTag = "ExplorerSpawn04", Tag = "JonJon"},
			FigureOutcry	{TextTag = "ExplorerSpawn05", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerSpawn06", Tag = "JonJon"},
			FigureOutcry	{TextTag = "ExplorerSpawn07", Tag = "Birnbaum"},
		},
	};


	-- gelegentliche Streitereien austragen ...
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_QuarrelExplorerOutcries", Seconds = 0.2},
			MapValueIsEqual	{Name = "mv_SQCitadel_QuarrelCount", Value = 1},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ExplorerQuarrel01", Tag = "Birnbaum"},
			FigureOutcry	{TextTag = "ExplorerQuarrel02", Tag = "Birnbaum"},
			FigureOutcry	{TextTag = "ExplorerQuarrel03", Tag = "Widegant"},
			MapTimerStop	{Name = "mt_SQCitadel_QuarrelExplorerOutcries"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_QuarrelExplorerOutcries", Seconds = 0.2},
			MapValueIsEqual	{Name = "mv_SQCitadel_QuarrelCount", Value = 2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ExplorerQuarrel04", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerQuarrel05", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerQuarrel06", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerQuarrel07", Tag = "Birnbaum"},
			MapTimerStop	{Name = "mt_SQCitadel_QuarrelExplorerOutcries"},
			MapValueSet	{Name = "mv_SQCitadel_QuarrelCount", Value = 0},
		},
	};

	-- nach Ende der Standardquesten die Aggro Outcries abspielen
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_AggroExplorerOutcries", Seconds = 0.2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ExplorerAggro01", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerAggro02", Tag = "Birnbaum"},
			FigureOutcry	{TextTag = "ExplorerAggro03", Tag = "Birnbaum"},
			FigureOutcry	{TextTag = "ExplorerAggro04", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerAggro05", Tag = "Birnbaum"},
			FigureOutcry	{TextTag = "ExplorerAggro06", Tag = "Widegant"},
			FigureOutcry	{TextTag = "ExplorerAggro07", Tag = "JonJon"},
		},
	};


	-- JonJon fordert die anderen zum Kampf
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_SQCitadel_ExplorerFight", Seconds = 0.2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "ExplorerFight01", Tag = "JonJon"},
		},
	};

	
	--Main Quest
	--Schatten greifen ein
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_Shadow1Alive"},
				MapFlagIsTrue {Name = "mf_Shadow2Alive"},
				MapFlagIsTrue {Name = "mf_Shadow3Alive"},
				MapFlagIsTrue {Name = "mf_Shadow4Alive"},
				MapFlagIsTrue {Name = "mf_Shadow5Alive"},
				MapFlagIsTrue {Name = "mf_Shadow6Alive"},
				MapFlagIsTrue {Name = "mf_Shadow7Alive"},
				MapFlagIsTrue {Name = "mf_Shadow8Alive"},
				MapFlagIsTrue {Name = "mf_Shadow9Alive"},
				MapFlagIsTrue {Name = "mf_Shadow10Alive"},
				MapFlagIsTrue {Name = "mf_Shadow11Alive"},
				MapFlagIsTrue {Name = "mf_Shadow12Alive"},
			},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Wind1", Tag = "pl_HumanHeroWind"},
			FigureOutcry	{TextTag = "Whisper1", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "Avatar1", Tag = "pl_HumanAvatar"},
			
		},
	},
	
	OnOneTimeEvent
	{
		--Spieler entdeckt das Monstrum, wenn er zum zweiten Mal auf die Karte kommt.
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "GateMonster", Range = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Schattenlied1", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Schattenlied2", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Schattenlied3", Tag = "pl_HumanNightsong"},
		
			
		},
	},
	
	OnOneTimeEvent
	{
		--Monster ist tot.
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
			FigureIsDead	{Tag = "GateMonster"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_OutcryConstructorStart"},
			FigureOutcry	{TextTag = "Schattenlied4", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Hinweis1", Tag = "Hinweis"},
			FigureOutcry	{TextTag = "Avatar2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar3", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar4", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Schattenlied5", Tag = "pl_HumanNightsong"},
			FigureOutcry	{TextTag = "Avatar5", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Caine1", Tag = "pl_HumanHeroCaine"},
			FigureOutcry	{TextTag = "Avatar6", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar7", Tag = "pl_HumanAvatar"},
			
		},
	},
	OnOneTimeEvent
	{
		--Avatar befindet sich in der Nähe des gegnerischen Aufbaulagers.
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Opponent1Base", Range = 15},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Whisper2", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "Avatar8", Tag = "pl_HumanAvatar"},
		},
	},
	OnOneTimeEvent
	{
		--Avatar befindet sich in der Bibliothek.
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "TeleportEndMarkerCitadel", Range = 2},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Whisper3", Tag = "pl_HumanHeroWhisper"},
			FigureOutcry	{TextTag = "Avatar9", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Avatar10", Tag = "pl_HumanAvatar"},
		},
	},
	OnOneTimeEvent
	{
		--Avatar in in MordecayRange
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Mordecay", Range = 10},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Mordecay1", Tag = "Mordecay"},
			FigureOutcry	{TextTag = "Mordecay2", Tag = "Mordecay"},
		},
	},
	
	OnOneTimeEvent
	{
		--Mordecay weniger als 50% Health
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitadelPart2"},
			FigureHasNotHealth	{Tag = "Mordecay", Percent = 50},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Mordecay3", Tag = "Mordecay"},
			FigureOutcry	{TextTag = "Avatar11", Tag = "pl_HumanAvatar"},
		},
	},
};
