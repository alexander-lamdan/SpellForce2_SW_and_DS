State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "beginCutscene",
		Actions = 
		{
		},
		
		Conditions = 
		{
		},
		
	},
	
};

State
{
	
	
	StateName = "beginCutscene",

--OnIdleGoHomeFake
--	{
--		X = 443,
--		Y = 158,
--		Conditions = 
--		{
--			
--		},
--		Actions = 
--		{
--			
--		},
--	};
		
		
	OnOneTimeEvent
	{
		
		-- Rottgar ist ein Questgiver und darf nicht sterben..
		Conditions = 
		{
		},
		
		Actions =
		{
			FigureAbilityAdd	{Tag = "Rottgar", AbilityId = Ability.Immortal},
		},
	},
		
	OnOneTimeEvent
	{
		GotoState = "GiveQuest",
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_norimar_meet_guard_end"},
		},
		
		Actions = 
		{
			QuestSetActive {Quest = "Wachfeuer1"},
			MapFlagSetTrue {Name = "mf_GotoStateLMF"},
		},
		
	},
	
};

State
{
	StateName = "GiveQuest",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FirstFlameLit"},
			FigureIsDead  {Tag  = "Flame1Defender1"},
			FigureIsDead  {Tag  = "Flame1Defender2"},
			FigureIsDead  {Tag  = "Flame1Defender3"},
			FigureIsDead  {Tag  = "Flame1Defender4"},			
		},
		Actions = 
		{
			DialogSetEnabled {},
			DialogTypeSetMainQuest {},
		},
	};


	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CheckRottgarDialog"},
			MapFlagIsTrue	{Name = "mf_ActivateFireQuest"},
			OR
			{
				MapFlagIsTrue	{Name = "mf_LetterQuestDeclined"},
				MapFlagIsTrue	{Name = "mf_ActivateLetterQuest"},
			},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Rottgar"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SolveFirstFireQuest" },
		},
		Actions = 
		{
			QuestSetSolved {Quest = "Wachfeuer1"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ActivateFireQuest"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "NorimarWachfeuerRest"},
			QuestSetActive	{Quest = "NorimarWachfeuerRest2"},
			QuestSetActive	{Quest = "NorimarWachfeuerRest3"},
			
			FogOfWarRevealAtEntity {Tag = "HolyFlame1", Range = 15, Height = default},
			FogOfWarRevealAtEntity {Tag = "HolyFlame2", Range = 15, Height = default},
			FogOfWarRevealAtEntity {Tag = "HolyFlame3", Range = 15, Height = default},
			FogOfWarRevealAtEntity {Tag = "HolyFlame4", Range = 15, Height = default},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ActivateLetterQuest"},
		},
		Actions =
		{
			QuestSetActive	{Quest = "NorimarPostbote"},
		},
	},		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive { Quest = "NorimarWachfeuerRest"},
		},
		Actions =
		{
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_RottgarsGuards"}, -- Die kriegt er aber nur, wenn er die Quest annimmt
			MapFlagSetTrue		{Name   = "mf_GotRottgarGuys"},
		},
	},
	OnOneTimeEvent
	{
		
		GotoState = "AtTheCastle",
	
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_AvaAtCastle" },
		},
		Actions = 
		{
			FigureVanish	{Tag = "Rottgar"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarIsNotTalking {},
			GameInterfaceIsVisible {},
			
			MapFlagIsTrue  {Name = "mf_ActivateFireQuest"},
			
			OR
			{
				MapFlagIsTrue    {Name = "mf_LetterQuestDeclined"},
				MapFlagIsTrue    {Name = "mf_ActivateLetterQuest"},
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
			AvatarIsNotTalking      {},
			GameInterfaceIsVisible  {},
			MapFlagIsTrue  			{Name = "mf_ActivateFireQuest"},
			MapFlagIsFalse  		{Name = "mf_LetterQuestDeclined"},
			MapFlagIsFalse  		{Name = "mf_ActivateLetterQuest"},
			
		},
		Actions =
		{
			DialogTypeSetSideQuest {},
		},
	},
	
};

State
{
	StateName = "AtTheCastle",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved 	{Quest = "NorimarMainPart1ToCastle"},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
	
	
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 430,
		Y = 621 ,
		Conditions = 
		{
			QuestIsSolved {Quest = "BlowTheHorn"},
			OR 
			{
				MapFlagIsTrue {Name  = "mf_BlameRottgar"},
				MapFlagIsTrue {Name  = "mf_BlameRottgarAtBaron"},
			},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_HasRespawned"},
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 1,
		X = 532,
		Y = 550 ,
		Conditions = 
		{
			MapFlagIsTrue 		{Name  = "mf_RottgarNotBlamed"},
			QuestIsSolved 		{Quest = "BlowTheHorn"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_HasRespawned"},
			FigureWalkToEntity {Tag = "default", TargetTag = "Solveig"},
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "IDLE",
		Conditions = 
		{
			EntityFlagIsTrue  {Name  = "ef_HasRespawned"},	
		},
		Actions =
		{
		},
	},
	
	

};
State
{
	StateName = "IDLE",
};




