--BlackPouderPosition
BarrelPosition01X = 579.6
BarrelPosition01Y = 550.2
BombJack = 1061

--*******************************************************
--***                                                 ***
--***               InitState   		          	  ***
--***                                                 ***
--*******************************************************		

State
{	
	StateName = "InitState",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_PowderReady"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 283, Amount = 1},
			QuestIsActive	{Quest = "SevenkeepsA1_GetToTown"},
		},
		Actions =
		{
			
		},
		GotoState = "ActivateState",	
	},	

};


	
--*******************************************************
--***                                                 ***
--***                ActivateState		              ***
--***                                                 ***
--*******************************************************	
		
State
{	
	StateName = "ActivateState",	
	--Zielfeld wird eingeblendet
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 2253, X = BarrelPosition01X, Y = BarrelPosition01Y, Direction = 0, Tag = "Barrel04"},
			FogOfWarReveal	{X = BarrelPosition01X, Y = BarrelPosition01Y, Range = 15, Height = 140},
			
		},	
	
	},	
	--Bombenleger befindet sich in Range
	OnOneTimeEvent
	{
		Conditions =
		{
			
			MapFlagIsFalse{Name = "mf_Bomb01set"},
			MapFlagIsFalse{Name = "mf_Bomb02set"},
			MapFlagIsFalse{Name = "mf_Bomb03set"},
			MapFlagIsFalse{Name = "mf_Bomb04set"},
			MapFlagIsFalse{Name = "mf_Bomb05set"},
			MapFlagIsFalse{Name = "mf_Bomb06set"},
			MapFlagIsFalse{Name = "mf_Bomb07set"},
			MapFlagIsFalse{Name = "mf_Bomb08set"},
			MapFlagIsFalse{Name = "mf_Bomb09set"},
			MapFlagIsFalse{Name = "mf_Bomb10set"},
			MapFlagIsFalse{Name = "mf_Bomb11set"},
			OR
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 3, X = BarrelPosition01X, Y = BarrelPosition01Y},
				FigureUnitNpcIsInRange	{UnitId = BombJack, Range = 3, X = BarrelPosition01X, Y = BarrelPosition01Y},
			},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_BombActivate"},
			
		},	
	
	},	
	--Bombe wird nach 2 Sec. platziert
	OnOneTimeEvent
	{
		Conditions =
		{
			
			EntityTimerIsElapsed	{Name = "et_BombActivate", Seconds = 2},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 2213, X = BarrelPosition01X, Y = BarrelPosition01Y, Direction = 30, Tag = "Bomb04"},
			EntityFlagSetTrue {Name = "ef_BombPlaced"},
			VisualTimerStart	{Seconds = 4},
			AvatarItemMiscTake	{Player = "pl_Human", ItemId = 283, Amount = 1},
			MapFlagSetTrue{Name = "mf_Bomb04set"},
		},	
	
	},	
	--Bombe explodiert nach 5 Sec.
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_BombPlaced"},
			VisualTimerIsNotActive	{},
		},
		Actions =
		{
			ObjectChange	{Tag = "Bomb04", ObjectId = 2212, X = BarrelPosition01X, Y = BarrelPosition01Y, Direction = 30},
			
		},	
	
	},	
	--Bombe explodiert nach 5 Sec.
	OnOneTimeEvent
	{
		Conditions =
		{
	
			EntityTimerIsElapsed	{Name = "et_BombActivate", Seconds = 6.7},
		},
		Actions =
		{
			BuildingDestroy	{Tag = "Tower06"},
			BuildingDestroy	{Tag = "Tower07"},
			PlayerRtsUnitKillInRange	{Player = "pl_Pact01", X = BarrelPosition01X, Y = BarrelPosition01Y, Range = 6},
			PlayerRtsUnitKillInRange	{Player = "pl_Human", X = BarrelPosition01X, Y = BarrelPosition01Y, Range = 6},
			MapFlagSetFalse{Name = "mf_Bomb04set"},
		},	
		GotoState = "AbfrageState",
	
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasNotItemMisc	{Player = "pl_Human", ItemId = 283, Amount = 1},
				QuestIsSolved	{Quest = "SevenkeepsA1_GetToTown"},
				AND
				{
					BuildingIsDead	{Tag = "Tower06"},	
					BuildingIsDead	{Tag = "Tower07"},	
					EntityTimerIsElapsed	{Name = "et_BombActivate", Seconds = 7},
				}
			},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_BombActivate"},
		},	
		GotoState = "EndState",
	},	
	
};

--*******************************************************
--***                                                 ***
--***                HeldenAbfrageState		          ***
--***                                                 ***
--*******************************************************	
		
State
{	
	StateName = "AbfrageState",	
	--Avatar steht im Explosionsbereich
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "pl_HumanAvatar"},
		},	
		
	},	
	--Held steht im Explosionsbereich
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanHeroWhisper", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "pl_HumanHeroWhisper"},
		},	
		
	},	
	--Held steht im Explosionsbereich
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "pl_HumanHeroWind", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "pl_HumanHeroWind"},
		},	
		
	},	
	--SpezialUnit steht im Explosionsbereich
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "BombJackUnit", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "BombJackUnit"},
		},	
		
	},	
	--SpezialUnit des Pactes steht im Explosionsbereich
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "Pact01Pat1_Lead", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "Pact01Pat1_Lead"},
		},	
		
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "Pact01Pat1_01", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "Pact01Pat1_01"},
		},	
		
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "Pact01Pat1_02", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "Pact01Pat1_02"},
		},	
		
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "Pact01Pat1_03", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "Pact01Pat1_03"},
		},	
		
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRange	{Tag = "ChefCamp1", Range = 6, X = BarrelPosition01X, Y = BarrelPosition01Y},
		},
		Actions =
		{
			FigureKill	{Tag = "ChefCamp1"},
		},	
		
	},	
	--Event springt zurück in den DeactiveState
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			
		},	
		GotoState = "EndState",
	},	
	
};

--*******************************************************
--***                                                 ***
--***               	EndState   		          	  ***
--***                                                 ***
--*******************************************************		

State
{	
	StateName = "EndState",
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			ObjectVanish	{Tag = "Barrel04"},
		},	
		
	},	
};