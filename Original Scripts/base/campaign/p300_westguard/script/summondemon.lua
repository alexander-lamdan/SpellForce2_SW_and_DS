

State
{
	StateName = "SummonDemonState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_SummonDemon"}, 
			MapTimerIsElapsed	{Name = "mt_OutcryTimerThur01", Seconds = 5},
			AvatarIsNotTalking{}, GameInterfaceIsVisible{}, -- die beiden gehören zusammen, deswegen beide in einer zeile!
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_SummonDemonAlive"},	
			DialogSetDisabled	{Tag = "Thur"},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_OutcryTimerThur01", Seconds = 10},
		},
		Actions =
		{
			FigureTeamTransfer	{Team = "tm_Siebenburg"},
			FigureTeamTransfer	{Tag = "Thur",Team = "tm_Untote"},
		},
		
	},
		OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_OutcryTimerThur01", Seconds = 11},
		},
		Actions =
		{
			FigureAttackEntity	{Tag = "SummonDemon", TargetTag = "Thur"},
			QuestSetActive	{Player = "pl_Human", Quest = "CultKillStewart"},
		},
		
	},
		OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_OutcryTimerThur01", Seconds = 12},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_SummonDemonAttack"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_OutcryTimerThur01", Seconds = 13},
			MapFlagIsTrue {Name = "mf_CultistAlive"},
			FigureIsAlive	{Tag = "Cultist"},
			FigureIsAlive	{Tag = "SummonDemon"},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "Cultist", TargetTag = "SummonDemon"},
		},
		
	},
		OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_ThurAlive"},
			FigureIsDead	{Tag = "Thur"},
			MapFlagIsTrue {Name = "mf_HedwigAlive"},
		},
		Actions =
		{
			FigureAttackEntity	{Tag = "SummonDemon", TargetTag = "Hedwig"},
		},
		
	},

	
};
