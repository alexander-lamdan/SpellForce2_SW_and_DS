

State
{
	StateName = "ThurState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P302_ThurNotKilled"},
			
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_ThurAlive"},
		},
	},
	--Thur Dialog wird Disabled
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_BookQuestStart"}, 
			AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 158, Amount = 1},
			AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 159, Amount = 1},
		},
		Actions =
		{
			DialogTypeSetSideQuest	{Tag = "Thur"},
			DialogSetEnabled	{Tag = "Thur"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_CultisAttack"}, 
			MapFlagIsTrue{Name = "mf_Cultist01Alive"},
			MapFlagIsTrue{Name = "mf_Cultist02Alive"},
			MapFlagIsTrue{Name = "mf_Cultist03Alive"},
			MapFlagIsTrue{Name = "mf_Cultist04Alive"},
			FigureIsDead{Tag = "Cultist"},
			FigureIsDead{Tag = "Cultist01"},
			FigureIsDead{Tag = "Cultist02"},
			FigureIsDead{Tag = "Cultist03"},
			FigureIsDead{Tag = "Cultist04"},
			MapFlagIsFalse{Name = "mf_ThurAttack"}, 
		},
		Actions =
		{
			MapFlagSetTrue{Name = "mf_ThurDialogOn"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_ThurDialogOn"},
		},
		Actions =
		{
			DialogTypeSetSideQuest	{Tag = "Thur"},
			DialogSetEnabled	{Tag = "Thur"},
		},
		
	},
	--Hauptmann beteiligt sich beim Gemezel wenn er noch lebt.
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			MapFlagIsTrue {Name = "mf_CultistAlive"},
			FigureIsAlive	{Tag = "Cultist"},
			OR
			{
				MapFlagIsTrue{Name = "mf_ThurAttack"}, 
				MapFlagIsTrue {Name = "mf_SummonDemonAttack"},	
			},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Cultist", Team = "tm_Untote"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
			MapFlagIsTrue{Name = "mf_ThurAttack"}, 
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Thur"},
			FigureTeamTransfer	{Team = "tm_Untote"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_SummonDemon"}, 
		},
		Actions =
		{
			FigureOutcry	{TextTag = "DemonSummoned1", Tag = "Thur"},
			MapTimerStart	{Name = "mt_OutcryTimerThur01"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SummonDemonAlive"},	
			MapTimerIsElapsed	{Name = "mt_OutcryTimerThur01", Seconds = 5},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "DemonSummoned2", Tag = "SummonDemon"},
			FigureOutcry	{TextTag = "DemonSummoned3", Tag = "Thur"},
		},
		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_SummonDemonAlive"},	
			FigureHasNotHealth	{Percent = 100},
		},
		Actions =
		{
			FigureKill	{Tag = "Thur"},
		},
		
	},

};