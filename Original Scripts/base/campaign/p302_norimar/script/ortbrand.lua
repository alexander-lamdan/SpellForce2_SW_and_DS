State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "OrtbrandCutscene1",
		
		Conditions =
		{
		},
		Actions = 
		{
		},
		
		
	},
};

State 
{
	StateName = "OrtbrandCutscene1",
	
	
	OnOneTimeEvent
	{
		GotoState = "OrtbrandState2",
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_norimar_eyrie_end"},
		},
		Actions =
		{
			PlayerKitTransfer {Player = "pl_Human", PlayerKit = "pk_FalconHorseArchers"},	
			QuestSetActive {Quest = "NorimarMainPart3BlowTheHorn"},			
			QuestSetActive {Quest = "SaveTheHorn"},			
			QuestSetActive {Quest = "BlowTheHorn"},		
			
			FogOfWarRevealAtEntity {Tag = "DwarvenHorn", Range = 20, Height = default},			
		},
		
	},

	
	
};

State
{
	StateName = "OrtbrandState2",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "BlowTheHorn"},		
		},
		Actions = 
		{
			DialogSetEnabled{},
			DialogTypeSetMainQuest{},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ReturnQuestSolved"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "NorimarMainPart4ReturnCastle"},
			DialogSetDisabled {},
		},
	};


	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name  = "mf_EscortQuestActive"},
		},
		Actions = 
		{
			GateSetOpen	   		{Tag = "FalconGateWest"},
			QuestSetActive 		{Quest = "NorimarMainPart5Escort"},
			QuestSetActive 		{Quest = "TakeControlRTS"},	
			QuestSetActive		{Quest = "GuardKonvoi"},      
			
			FigureVanish		{Tag = "HorseArcher1" },
			FigureVanish		{Tag = "HorseArcher2" },
			FigureVanish		{Tag = "HorseArcher3" },
			FigureVanish		{Tag = "HorseArcher4" },
			FigureVanish		{Tag = "HorseArcher5" },
			FigureVanish		{Tag = "HorseArcher6" },
			FigureVanish		{Tag = "HorseArcher7" },
			FigureVanish		{Tag = "HorseArcher8" },
			
			FigureTeamTransfer  		{Tag = "Falkmar", Team = "tm_HumanTeam"},
			FigureForcedRunToEntity		{Tag = "Falkmar", TargetTag = "FalkmarWp1"},								
		},

	},
	
	
	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name  = "mf_EscortQuestActive"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			OR
			{
				QuestIsNotActive  {Quest = "NorimarArrestHedwig"},
				QuestIsSolved     {Quest = "NorimarArrestHedwig"},
				QuestIsActive     {Quest = "BringHedwigToBaron"},
			},
			OR
			{
--				QuestIsSolved  	  {Quest = "NorimarPostbote"},
				MapFlagIsTrue     {Name  = "mf_RottgarNotBlamed"},
				MapFlagIsTrue     {Name  = "mf_BlameRottgar"},
				MapFlagIsTrue     {Name  = "mf_RottgarPunished"},
--				AND
--				{
--					QuestIsNotActive {Quest = "NorimarPostbote"},
--					QuestIsNotSolved {Quest = "NorimarPostbote"},
--				},
			
			},
		},
		Actions = 
		{
			DialogSetDisabled {},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name  = "mf_EscortQuestActive"},
			MapFlagIsTrue	{Name  = "mf_BlameRottgarAtBaron"},
			MapFlagIsFalse	{Name  = "mf_RottgarPunished"},
		},
		Actions = 
		{
			DialogSetEnabled {},
			DialogTypeSetSideQuest{},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name  = "mf_EscortQuestActive"},
			QuestIsActive   {Quest = "NorimarArrestHedwig"},
		},
		Actions = 
		{
			DialogSetEnabled {},
			DialogTypeSetSideQuest{},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name  = "mf_EscortQuestActive"},
			QuestIsActive   {Quest = "BringNewsToBaron"},
		},
		Actions = 
		{
			DialogSetEnabled {},
			DialogTypeSetSideQuest{},
		},
	},
	-- Wenn man mit dem Baron gesprochen hat
	OnOneTimeEvent
	{
		
		Actions = 
		{
			QuestSetSolved    {Quest = "BringNewsToBaron"},
			QuestSetSolved    {Quest = "NorimarArrestHedwig"},
		},
		Conditions =
		{
			MapFlagIsTrue    {Name = "mf_HedwigQuestDone"},
		},
							
	},
};



--GuardKonvoi
--CloseCrypt
--ToRushwater