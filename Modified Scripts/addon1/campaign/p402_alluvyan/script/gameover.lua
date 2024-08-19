--*******************************************************
--***                                                 ***
--***               Alluvyan Addon1					  ***
--***			Game Over Bedingungen                 ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	--Die Treants sterben, bevor der Magische Schild bezwungen wurde.
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Treant01"},
			FigureIsDead	{Tag = "Treant02"},
			FigureIsDead	{Tag = "Treant03"},
			QuestIsNotSolved	{Player = "pl_Human", Quest = "Alluvyan_ProtectTreants"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "GameOverA1TreantsDead"},
		},
		
	},
	--Eines der Haupthäuser des Spielers wurde zerstört (Sein Haupthaus oder eines der beiden befreundeten Military KI`s)
	OnOneTimeEvent
	{
		Conditions =
		{
			BuildingIsDead	{Tag = "Haupthaus01"},
			MapFlagIsTrue {Name = "mf_P402_StartIntroCS"},
			QuestIsNotKnown	{Quest = "Alluvyan_SearchOutOfTown"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "GameOverA1YourHeadquarterDestroyed"},
		},																			
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				BuildingIsDead	{Tag = "Haupthaus02"},
				BuildingIsDead	{Tag = "Haupthaus03"},
			},
			MapFlagIsTrue {Name = "mf_P402_StartIntroCS"},
			QuestIsNotKnown	{Quest = "Alluvyan_SearchOutOfTown"},
		},
		Actions =
		{
			PlayerGameOver	{Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "GameOverA1OtherHeadquarterDestroyed"},
		},
		
	},
	--Es wurden mehr als 5 Zwerge getötet
	 OnOneTimeEvent
	{
    	
		Conditions =
		{
			PlayerHasNotUnitAmount	{Player = "pl_Human", UnitId = 1060, Amount = 15},
			MapValueIsGreaterOrEqual	{Name = "mv_DwarfRespawn", Value = 19},
			QuestIsNotSolved  {Quest = "Alluvyan_KillEndboss"},
			QuestIsNotSolved  {Quest = "Alluvyan_SaveSatras"},
		},
		Actions =
		{
    		PlayerGameOver	{Player = "pl_Human", Tag = "pl_HumanAvatar", LocaTag = "GameOverA1DwarfsDead"},
		},
		
	},  
	
};