

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DarkLegionTheCall"},
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
			DialogSetEnabled {},
		},
	},
	-- Der Spieler hat den Dialog geführt das Objekt wird getauscht
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_GhostChain"},
			GameInterfaceIsVisible {},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			ObjectChange {Tag = "SwordInStone",ObjectId = 1977, X = 609.073, Y = 176.353, Direction = 27}
		}
	},
	-- Erste Geisterwelle ist tot, also Flag für zweite setzen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_FirstWave"},
			FigureIsDead {Tag = "Wave1_1"},
			FigureIsDead {Tag = "Wave1_2"},
			FigureIsDead {Tag = "Wave1_3"},
			FigureIsDead {Tag = "Wave1_4"},
			FigureIsDead {Tag = "Wave1_5"},
			FigureIsDead {Tag = "Wave1_6"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P311_SecondWave"}
		}
	},
	-- Zweite Geisterwelle ist tot, also Flag für zweite setzen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_SecondWaveSpawned"},
			FigureIsDead {Tag = "Wave2_1"},
			FigureIsDead {Tag = "Wave2_2"},
			FigureIsDead {Tag = "Wave2_3"},
			FigureIsDead {Tag = "Wave2_4"},
			FigureIsDead {Tag = "Wave2_5"},
			FigureIsDead {Tag = "Wave2_6"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P311_ThirdWave"}
		}
	},
	-- Dritte Geisterwelle ist tot, also Flag für Bossdialog setzen
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P311_ThirdWaveSpawned"},
			FigureIsDead {Tag = "Wave3_1"},
			FigureIsDead {Tag = "Wave3_2"},
			FigureIsDead {Tag = "Wave3_3"},
			FigureIsDead {Tag = "Wave3_4"},
			FigureIsDead {Tag = "Wave3_5"},
			FigureIsDead {Tag = "Wave3_6"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P311_ThirdWaveDead"}
		}
	},
}