--*******************************************************
--***                                                 ***
--***               Palace Addon1					  ***
--***			    NecromantFight	                  ***
--***                                                 ***
--*******************************************************


State
{	
	StateName = "InitState",
	OnEvent
	{
		Conditions =
		{
			PlayerHasNotUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
			OR
			{
				FigureIsAlive	{Tag = "NecroGuard1"},
				FigureIsAlive	{Tag = "NecroGuard2"},
				FigureIsAlive	{Tag = "NecroGuard3"},
				FigureIsAlive	{Tag = "NecroGuard4"},
				FigureIsAlive	{Tag = "NecroGuard5"},
				FigureIsAlive	{Tag = "NecroGuard6"},
			},
		},
		Actions =
		{
			
		},
		GotoState = "FigureChangeState",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasNotUnitAmount	{Player = "pl_Player3", UnitId = 1207, Amount = 1},
			FigureIsDead	{Tag = "NecroGuard1"},
			FigureIsDead	{Tag = "NecroGuard2"},
			FigureIsDead	{Tag = "NecroGuard3"},
			FigureIsDead	{Tag = "NecroGuard4"},
			FigureIsDead	{Tag = "NecroGuard5"},
			FigureIsDead	{Tag = "NecroGuard6"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_NecromantIsDead"},
		},
		GotoState = "EndState",
	},
	
};

State
{	
	StateName = "FigureChangeState",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "NecroGuard1"},
		},
		Actions =
		{
			EffectStart	{Tag = "NecroGuard1", File = "Effect_Charm_Cast"},
			FigureUnitChange	{Tag = "NecroGuard1", UnitId = 1207, Level = 26},
		},
		GotoState = "InitState",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "NecroGuard1"},
			FigureIsAlive	{Tag = "NecroGuard2"},
		},
		Actions =
		{
			EffectStart	{Tag = "NecroGuard2", File = "Effect_Charm_Cast"},
			FigureUnitChange	{Tag = "NecroGuard2", UnitId = 1207, Level = 26},
		},
		GotoState = "InitState",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "NecroGuard1"},
			FigureIsDead	{Tag = "NecroGuard2"},
			FigureIsAlive	{Tag = "NecroGuard3"},
		},
		Actions =
		{
			EffectStart	{Tag = "NecroGuard3", File = "Effect_Charm_Cast"},
			FigureUnitChange	{Tag = "NecroGuard3", UnitId = 1207, Level = 26},
		},
		GotoState = "InitState",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "NecroGuard1"},
			FigureIsDead	{Tag = "NecroGuard2"},
			FigureIsDead	{Tag = "NecroGuard3"},
			FigureIsAlive	{Tag = "NecroGuard4"},
		},
		Actions =
		{
			EffectStart	{Tag = "NecroGuard4", File = "Effect_Charm_Cast"},
			FigureUnitChange	{Tag = "NecroGuard4", UnitId = 1207, Level = 26},
		},
		GotoState = "InitState",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "NecroGuard1"},
			FigureIsDead	{Tag = "NecroGuard2"},
			FigureIsDead	{Tag = "NecroGuard3"},
			FigureIsDead	{Tag = "NecroGuard4"},
			FigureIsAlive	{Tag = "NecroGuard5"},
		},
		Actions =
		{
			EffectStart	{Tag = "NecroGuard5", File = "Effect_Charm_Cast"},
			FigureUnitChange	{Tag = "NecroGuard5", UnitId = 1207, Level = 26},
		},
		GotoState = "InitState",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "NecroGuard1"},
			FigureIsDead	{Tag = "NecroGuard2"},
			FigureIsDead	{Tag = "NecroGuard3"},
			FigureIsDead	{Tag = "NecroGuard4"},
			FigureIsDead	{Tag = "NecroGuard5"},
			FigureIsAlive	{Tag = "NecroGuard6"},
		},
		Actions =
		{
			EffectStart	{Tag = "NecroGuard6", File = "Effect_Charm_Cast"},
			FigureUnitChange	{Tag = "NecroGuard6", UnitId = 1207, Level = 26},
		},
		GotoState = "InitState",
	},
	
};

State
{	
	StateName = "EndState",
	
	
};