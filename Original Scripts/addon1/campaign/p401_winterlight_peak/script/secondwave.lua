Portal = 0
FirstBooth = 1
SecondBooth = 2
ThirdBooth = 3
TargetAvatar = 4
TargetWind = 5
TargetWisper = 6

myDivide = math.random(1,10)
mySpawnTime = math.floor((myWait/myDivide))

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P401_Spawn", Seconds = mySpawnTime},
			MapFlagIsTrue {Name = "mf_P401_PlayerIsOnPass"}
		},
		Actions =
		{
			EntityValueRandomize {Name = "ev_P401_WhereToGo", MinValue = 0, MaxValue = 6},
			EntityTimerStart {Name = "et_P401_Bored"},
			EntityFlagSetTrue {Name = "ef_P401_Action"},
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = myWait,
		X = myHomeX,
		Y = myHomeY,
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P401_StartEndCS"},
			MapFlagIsFalse {Name = "mf_P401_EndEndCS"},
		},
		Actions =
		{
			EntityValueRandomize {Name = "ev_P401_WhereToGo", MinValue = 0, MaxValue = 6},
			EntityTimerStart {Name = "et_P401_Bored"}
		},
		
	},
	OnIdleRunHomeFake
	{
		X = 190,
		Y = 316,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P401_WhereToGo", Value = Portal},
			EntityFlagIsTrue {Name = "ef_P401_Action"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityTimerStart {Name = "et_P401_Bored"}
		}
	},
	OnIdleRunHomeFake
	{
		X = 117,
		Y = 207,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P401_WhereToGo", Value = FirstBooth},
			EntityFlagIsTrue {Name = "ef_P401_Action"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityTimerStart {Name = "et_P401_Bored"}
		},
	},
	OnIdleRunHomeFake
	{
		X = 156,
		Y = 238,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P401_WhereToGo", Value = SecondBooth},
			EntityFlagIsTrue {Name = "ef_P401_Action"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityTimerStart {Name = "et_P401_Bored"}
		},
	},
	OnIdleRunHomeFake
	{
		X = 212,
		Y = 268,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P401_WhereToGo", Value = ThirdBooth},
			EntityFlagIsTrue {Name = "ef_P401_Action"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			EntityTimerStart {Name = "et_P401_Bored"}
		},
	},
	OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P401_WhereToGo", Value = TargetAvatar},
			EntityFlagIsTrue {Name = "ef_P401_Action"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_P401_Bored"}
		},
	},
	OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P401_WhereToGo", Value = TargetWind},
			EntityFlagIsTrue {Name = "ef_P401_Action"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroWind"},
			EntityTimerStart {Name = "et_P401_Bored"}
		},
	},
	OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P401_WhereToGo", Value = TargetWisper},
			EntityFlagIsTrue {Name = "ef_P401_Action"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroWhisper"},
			EntityTimerStart {Name = "et_P401_Bored"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P401_Bored", Seconds = 90}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P401_Bored"},
			EntityValueRandomize {Name = "ev_P401_WhereToGo", MinValue = 0, MaxValue = 6},
		},
	},
	
}