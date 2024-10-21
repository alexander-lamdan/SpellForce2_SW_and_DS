SAMMELSCRIPT = true

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P303_BowMen"},
		},
	},
	OnFigureSpawnOnlyWhenEvent
	{
		X = 249 + offsetX,
		Y = 230 + offsetY,
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P303_BowMen"},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P303_BowMenSpawned"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Ambush",
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P303_BowMenSpawned"},
		},
		Actions =
		{
		}
	}
}

State
{
	StateName = "Ambush",
	OnIdleRunHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			-- Entweder sind die Pferde weit genug oder der Spieler ist soweit vorgeprescht, dass ide Bogenschützen auf den Hügel müssen, da sie sonst aggro ziehen
			OR
			{
				MapFlagIsTrue {Name = "mf_P303_BowmenTakePositions"},
				PlayerFigureIsInRange {X = 212, Y = 215, Range = 7, Player = "pl_Human"},
			}
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			FigureHoldPosition {},
		},
	};


}